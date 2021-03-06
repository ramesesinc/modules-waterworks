package com.rameses.gov.etracs.waterworks.models;

import com.rameses.rcp.annotations.*;
import com.rameses.rcp.common.*;
import com.rameses.osiris2.client.*;
import com.rameses.osiris2.common.*;
import com.rameses.seti2.models.*;
import com.rameses.osiris2.report.*;
import com.rameses.rcp.framework.*;


public class WaterworksBillItemModel {
   
    
    @Service("PersistenceService")
    def persistenceSvc;
    
    //the ff. are passed by the caller
    def account;
    def saveHandler;

    def billid;
    def entity;
    def year;
    def month;
    def mode = "create";
    
    void checkRequired() {
        if(!account) throw new Exception("account is required");
        if(!year) throw new Exception("year is required");
        if(!month) throw new Exception("month is required");
    }

    void create() {
        checkRequired();
        mode = "create";
        entity = [:];
        entity.system = 0;
        entity.billed = 0;
        entity.amount = 0;
        entity.amtpaid = 0;
        entity.discount = 0;
        entity.acctid = account.objid;
        entity.year = year;
        entity.month = month;
        if(billid) entity.billid = billid;
    }
    
    void open() {
        checkRequired();
        entity = persistenceSvc.read( [_schemaname:"waterworks_billitem", objid: entity.objid ]);
        if( entity.billid!=billid ) {
            mode = "view"; 
        }
        else if( entity.amtpaid > 0 ) {
            mode = "view";
        }
        else {
            mode = "update";
        }
    }
    
    def doOk() {
        if(entity.amount<=0)
            throw new Exception("Amount must be greater than zero");
            
        //year and month must not be greater than bill year and month    
        int ym1 = ((year*12)+month);
        int ym2 = ((entity.year*12 )+entity.month);
        if(ym2 > ym1)
            throw new Exception("Year and month must not be greater than the account period year and month")

        saveHandler( entity );
        return "_close";
    }
    
    def doCancel() {
        return "_close";
    }
    
   

}