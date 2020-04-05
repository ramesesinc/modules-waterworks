package com.rameses.gov.etracs.waterworks.models;

import com.rameses.rcp.annotations.*;
import com.rameses.rcp.common.*;
import com.rameses.osiris2.client.*;
import com.rameses.osiris2.common.*;
import com.rameses.rcp.annotations.*;
import com.rameses.seti2.models.*;
import java.text.*;
import com.rameses.functions.*;
import com.rameses.seti2.models.*;

public class WaterConsumptionModel extends CrudFormModel {
    
    @Service("WaterworksComputationService")
    def compSvc;
    
    @FormTitle
    String title = "Monthly Consumption";

    def meterStates = ["ACTIVE","DISCONNECTED","DEFECTIVE"];
    
    def _acct;
    public void setAccount( def acct ) {
        def m = [_schemaname:"waterworks_account"];
        m.objid = acct.objid;
        _acct = persistenceService.read( m );
    }
    
    public def getAccount() {
        if(!_acct) _acct = caller.entity;
        return _acct;
    }
    
    void calc() {
        def z = [:];
        z.acctid = entity.acctid;
        z.prevreading = entity.prevreading;
        z.reading = entity.reading;
        z.meterstate = entity.meterstate;
        def res = compSvc.compute(z);
        //we cannot use putAll bec. entity is a datamap
        if(res.volume) entity.volume = res.volume;
        if(res.amount) entity.amount = res.amount;
    }
    
    @PropertyChangeListener
    def listener = [
        "entity.reading" : { o->
            //calculate the volume. do not calculate yet the amount
            if( entity.prevreading == null ) {
                entity.volume = 0;
            }
            def capacity = entity.meter.capacity.toInteger();
            def prevreading = entity.prevreading.toInteger(); 
            if( o >= capacity ) {
                //this is error
                entity.volume = -1;
            }
            else if( o < prevreading ) {
                entity.volume = (o + capacity) - prevreading;
                entity.amount = 0;
                if( entity.posttoledger ==  1) calc();
            }
            else {
                entity.volume = o - prevreading;
                entity.amount = 0;
                if( entity.posttoledger ==  1) calc();
            }
            binding.refresh("entity.(volume|amount)");
        },
        "entity.posttoledger" : { o->
            if(o==1) {
                if( entity.volume > 0 ) calc();
            }
            else {
                entity.amount = 0;
            }
            binding.refresh("entity.amount");
        }
    ];
    
    boolean isEditAllowed() {
        if( entity.billid !=null) {
            return false;
        }
        else if(account.state != "DRAFT") {
            return false;
        }
        return super.isEditAllowed();
    }
    
    def addYearMonth(int y, int m, int num) {
        //if num is positive add ; if negative deduct 
        int ym = ((y*12)+m)+num;
        def res = [:];
        res.year = (int)(ym / 12);
        res.month = ym % 12;
        if( res.month == 0 ) {
            res.year = res.year - 1;
            res.month = 12;
        }
        return res;
    }
    
    void afterCreate() {
        entity.state = 'OPEN';
        entity.acctid = account.objid;
        entity.acctstate = account.state;
        entity.account = account;
        entity.acctinfoid = account.acctinfoid;
        entity.meter = account.meter;
        entity.meterid = account.meterid;
        entity.meterstate = account.meterstate;
        entity.reading = 0;
        entity.volume = 0;
        entity.txnmode = "CAPTURE";
        entity.amount = 0;
        entity.amtpaid = 0;
        entity.discount = 0;
        entity.posttoledger = 0;
        
        //find prev reading...locate the latest entry for adding new entry
        def m = [_schemaname:entitySchemaName];
        m.findBy = [acctid: entity.acctid, meterid: entity.meterid];
        m.orderBy = "year DESC, month DESC";
        def prev = queryService.findFirst(m);
        if(prev) {
            entity.prevreading = prev.reading;
            entity.prevmonth = prev.month;
            entity.prevyear = prev.year;
            def ym = addYearMonth( prev.year, prev.month, 1);
            entity.year = ym.year;
            entity.month = ym.month;    
            entity.hold = prev.hold;
        }  
    }
    
    void beforeSave(mode) {
        if( entity.prevreading!=null && entity.reading > 0 && entity.posttoledger == 1 && entity.amount == 0 ) {
            throw new Exception("Please run calculate first");
        }
        else if( entity.reading >= entity.meter.capacity ) {
            throw new Exception("Invalid reading. Reading must be less than or equal to the meter capacity")
        }
        else if( entity.volume < 0 )
            throw new Exception("Invalid reading. Please ensure reading is less than or equal to meter capacity");
    }
    
    
    void afterSave() {
        caller.reload();
    }
    
    def loadConsumption(def yearmonth) {
        def m = [_schemaname: schemaName ];
        m.findBy = [acctid: entity.acctid, meterid: entity.meterid, year:yearmonth.year, month: yearmonth.month ];
        def e = persistenceService.read( m );
        if(e) {
            entity = e;
        } 
    }
    
    void moveUp() {
        def ym = addYearMonth( entity.year, entity.month, 1);
        loadConsumption(ym);
        reloadEntity();
    }

    void moveDown() {
        def ym = addYearMonth( entity.year, entity.month, -1);
        loadConsumption(ym);
        reloadEntity();
    }
    
    void recalc() {
        calc();
        binding.refresh("entity.(volume|amount)");
    }
    
}