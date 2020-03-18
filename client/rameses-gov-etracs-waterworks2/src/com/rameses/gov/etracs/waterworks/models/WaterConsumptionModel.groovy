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
    
    def dateFormatter = new java.text.SimpleDateFormat('yyyy-MM-dd'); 
    
    def handler;
    def hasErrs;
    
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
                z.consumptionid = entity.objid;
                z.prevreading = entity.prevreading;
                z.reading = o;
                def res = compSvc.compute(z);
                entity.putAll( res );
                binding.refresh();
            }
        }
    ];
    
    void afterCreate() {
        entity.state = 'OPEN';
        entity.acctid = account.objid;
        entity.account = account;
        entity.meterid = account.meterid;
        entity.meter = account.meter;
        entity.prevreading = 0;
        entity.reading = 0;
        entity.volume = 0;
        //find prev reading...locate the latest entry for adding new entry
        def m = [_schemaname:"waterworks_consumption"];
        m.debug = true;
        m.findBy = [acctid: account.objid];
        m.where = ["batchid IS NULL"];
        m.orderBy = "year DESC, month DESC";
        prev = queryService.findFirst(m);
        if(prev) {
            int ym = ((prev.year*12)+prev.month)+1;
            entity.prevreading = prev.reading;
            entity.reading = prev.reading;
            entity.year = (int)(ym / 12);
            entity.month = ym % 12;    
            entity.txnmode = "CAPTURE";
            entity.hold = prev.hold;
        }  
        else {
            entity.txnmode = "BEGIN_BALANCE";
        }
    }
    
    void afterOpen() {
        def m = [_schemaname:"waterworks_consumption"];
        m.findBy = [acctid: account.objid];
        m.where = [ "((year*12)+month) = :myear", [myear: ((entity.year*12)+entity.month) - 1 ] ];
        prev = queryService.findFirst(m);
        if(prev) entity.prevreading = prev.reading;
    }
    
    void afterSave() {
        if(handler) 
            handler();
        else 
            caller.reload();
    }
    
    boolean isEditAllowed() {
        if(entity.state != "DRAFT") {
            return false;
        }
        return super.isEditAllowed();
    }
    
    
}