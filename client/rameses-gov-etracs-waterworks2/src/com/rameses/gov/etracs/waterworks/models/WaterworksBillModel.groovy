package com.rameses.gov.etracs.waterworks.models;

import com.rameses.rcp.annotations.*;
import com.rameses.rcp.common.*;
import com.rameses.osiris2.client.*;
import com.rameses.osiris2.common.*;
import com.rameses.seti2.models.*;
import java.text.*;

public class WaterworksBillModel extends CrudFormModel {
    
    @Service("WaterworksBillService")
    def billProcessor;
    
    @Service("WaterworksComputationService")
    def compSvc;
    
    String errmsg;
    
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
    
    void recalc() {
        def z = [:];
        z.acctid = entity.acctid;
        z.consumptionid = entity.consumptionid;
        z.prevreading = entity.prevreading;
        z.reading = entity.reading;
        z.meterstate = entity.meterstate;
        def res = compSvc.compute(z);
        //we cannot use putAll bec. entity is a datamap
        if(res.volume) entity.volume = res.volume;
        if(res.amount) entity.amount = res.amount;
        binding.refresh();
        MsgBox.alert("recalc");
    }
    
    def editReading() {
        def h = { o->
            entity.reading = o;
            recalc();
        }
        def d = [value: entity.reading];
        return Inv.lookupOpener("decimal:prompt", [data:d, handler: h]);
    }
    
    def printBill() {
        
        MsgBox.alert("print Bill");
    }
    
}