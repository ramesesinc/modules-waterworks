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
    
    @Service("DateService")
    def dateSvc;
    
    def meterStates = ["ACTIVE","DISCONNECTED","DEFECTIVE"];
    
    def handler;
    
    def prev;
    
    @FormTitle
    String title = "Monthly Consumption";

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
    
    @PropertyChangeListener
    def listener = [
        "entity.reading" : { o->
            if(entity.prevreading ) {
                def z = [:];
                z.acctid = entity.acctid;
                z.prevreading = entity.prevreading;
                z.reading = o;
                def res = compSvc.compute(z);
                
                //we cannot use putAll bec. entity is a datamap
                if(res.volume) entity.volume = res.volume;
                if(res.amount) entity.amount = res.amount;
                binding.refresh();
            }
        }
    ];
    
    boolean isEditAllowed() {
        if( entity.batchid !=null) {
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
        entity.account = account;
        entity.acctinfoid = account.acctinfoid;
        entity.meterid = account.meterid;
        entity.meterstate = account.meter.state;
        entity.reading = 0;
        entity.volume = 0;
        entity.txnmode = "CAPTURE";
        entity.amount = 0;
        entity.amtpaid = 0;
        entity.discount = 0;
        
        //find prev reading...locate the latest entry for adding new entry
        def m = [_schemaname:entitySchemaName];
        m.findBy = [acctid: entity.acctid, meterid: entity.meterid];
        m.where = ["batchid IS NULL"];
        m.orderBy = "year DESC, month DESC";
        prev = queryService.findFirst(m);
        if(prev) {
            entity.prevreading = prev.reading;
            entity.reading = prev.reading;
            entity.prevmonth = prev.month;
            entity.prevyear = prev.year;
            def ym = addYearMonth( prev.year, prev.month, 1);
            entity.year = ym.year;
            entity.month = ym.month;    
            entity.hold = prev.hold;
        }  
    }
    
    void afterSave() {
        if(handler) 
            handler();
        else 
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
    
}