package com.rameses.gov.etracs.waterworks.models;

import com.rameses.rcp.annotations.*;
import com.rameses.rcp.common.*;
import com.rameses.osiris2.client.*;
import com.rameses.osiris2.common.*;
import com.rameses.seti2.models.*;
import java.text.*;
import com.rameses.treasury.common.models.*;
import com.rameses.util.BreakException

class WaterworksCashReceiptModel  extends CommonCashReceiptModel {
    
    @Service(value="WaterworksCashReceiptService", connection="waterworks")
    def cashRctSvc;
    
    def pmttxntype = "billing";
    def itemListModel = [
        fetchList: { o->
            return entity.items;
        }
    ] as BasicListModel;
    
    
    void loadBill( def p ) {
        if(p.action!="barcode") {
            query.txntype = pmttxntype;
        }
        p.collectiontype = entity.collectiontype;
        p.billdate = entity.receiptdate;
        
        //must replace the action so it will reflect the action passed;
        query.action = p.action;
        p.putAll( query );
        
        def pp = [ params: p ]; 
        try {
            info = cashRctSvc.getBilling( pp );
        }
        catch(serverErr) {
            if ( p.action == "barcode" ) super.doClose(); 
            //log the errors starting from here 
            new RuntimeException( serverErr ).printStackTrace(); 
            //throw the actual error
            throw serverErr; 
        } 
        if ( !info.billitems ) { 
            if(!MsgBox.confirm("There are no open bill items found. Continue?")) {
                throw new BreakException();
            }
        }
        entity.putAll( info ); 
        itemListModel.reload();
        updateBalances();
    }
    
    def viewStatement() {
        return Inv.lookupOpener("waterworks_cashreceipt_statement", [entity: [objid: entity.billid ]] ); 
    }
    
}    
