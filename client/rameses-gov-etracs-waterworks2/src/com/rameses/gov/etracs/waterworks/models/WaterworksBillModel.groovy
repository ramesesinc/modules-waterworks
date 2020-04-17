package com.rameses.gov.etracs.waterworks.models;

import com.rameses.rcp.annotations.*;
import com.rameses.rcp.common.*;
import com.rameses.osiris2.client.*;
import com.rameses.osiris2.common.*;
import com.rameses.seti2.models.*;
import java.text.*;

public class WaterworksBillModel {
    
    @Caller
    def caller;
    
    @Service("WaterworksBillService")
    def billSvc;
    
    def mode;
    
    def entity;
    String errmsg;
    
    //this is called from account
    def createInitial() {
        def acctid = caller.entity.objid;
        entity = billSvc.getInfoForInitialBill( [acctid: acctid ] );
        mode = "initial";
        return mode;
    }
    
    /*
    
    void afterInit() {
        if( entity.acctstate == "DRAFT") {
            errmsg = "Account is still not active"
        }
    }
    
    def addPrevEntry() {
        def m = [:];
        m.account = [objid: entity.acctid];
        return Inv.lookupOpener("vw_waterworks_consumption:create", m);
    }
    
    void updateBillStatus() {
        
    }
    
    def viewAccount() {
        def op = Inv.lookupOpener( "vw_waterworks_account:open", [entity: [objid: entity.acctid ]]);
        op.target = "popup";
        return op;
    }
    
    void moveUp() {
        caller.itemHandler.moveBackRecord();
        reloadEntity();
    }

    void moveDown() {
        caller.itemHandler.moveNextRecord();
        reloadEntity();
    }
    
    void rebill() {
        def bill = billProcessor.process( entity );
        if(bill) entity.putAll( bill );
        binding.refresh();
    }

    def printBill() {
        
        MsgBox.alert("print Bill");
    }
    */
    
}