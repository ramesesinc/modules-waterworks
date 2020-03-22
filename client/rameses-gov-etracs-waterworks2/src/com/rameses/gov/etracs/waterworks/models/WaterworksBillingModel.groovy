package com.rameses.gov.etracs.waterworks.models;

import com.rameses.rcp.annotations.*;
import com.rameses.rcp.common.*;
import com.rameses.osiris2.client.*;
import com.rameses.osiris2.common.*;
import com.rameses.seti2.models.*;
import java.text.*;

public class WaterworksBillingModel extends CrudFormModel {
    
    @Service("WaterworksBillProcessorService")
    def billProcessor;
    
    String errmsg;
    
    public boolean getAcctNotActivated() {
        return ((entity.errcode & 2)==2);
    }
    
    public boolean getHasNoPrevEntry() {
        return ((entity.errcode & 4)==4);
    }
    
    void afterInit() {
        def buff = [];
        if( acctNotActivated ) buff << "<div>Account is not yet activated. Click on Activate";
        if( hasNoPrevEntry ) buff << "<div>Please include a previous entry. Click on Add Prev Entry then click activate to complete";
        if(buff) {
            errmsg = "Please correct the ff. errors <br>" + buff.join("<br>");            
        }
    }
    
    void fixErrors() {
        def u = billProcessor.fixErrors( entity );
        if(u) entity.putAll( u );
    }
    
    def addPrevEntry() {
        def m = [:];
        m.account = [objid: entity.acctid];
        return Inv.lookupOpener("waterworks_consumption:create", m);
    }
    
    void updateBillStatus() {
        
    }
    
    def viewAccount() {
        def op = Inv.lookupOpener( "waterworks_account:open", [entity: [objid: entity.acctid ]], [width:300]);
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
}