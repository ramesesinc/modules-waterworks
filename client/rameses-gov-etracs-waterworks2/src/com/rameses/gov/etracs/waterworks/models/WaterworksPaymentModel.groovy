package com.rameses.gov.etracs.waterworks.models;

import com.rameses.rcp.annotations.*;
import com.rameses.rcp.common.*;
import com.rameses.osiris2.client.*;
import com.rameses.osiris2.common.*;
import com.rameses.seti2.models.*;
import com.rameses.util.*;
import java.text.*;

class WaterworksPaymentModel extends PageFlowController  {

    @Caller
    def caller;

    @Service("WaterworksPaymentService")
    def pmtSvc;
    
    def entity;
    def mode;
    def selectedItem;

    def reftype;  //must be passed from the outside
    def refno;
    def amtpaid;
    def saveHandler;
    def amtapplied = 0;

    void init() {
        if(reftype == null) throw new Exception("Reftype is required");
        entity = [:];
        def bill = caller.entity;
        entity.year = bill.period.year;
        entity.month = bill.period.month;
        entity.billid = bill.objid;
        entity.acctid = bill.acctid;
        entity.reftype = reftype;
        entity.refno = refno;
        if( amtpaid !=null ) entity.amount = amtpaid;
        mode = "initial";
    }
    
    void loadItems() {
        mode = "view";
        def pp = [acctid: entity.acctid, amtpaid: entity.amount, billid: entity.billid, txndate: entity.refdate, paymentreftype: entity.reftype ];
        def b = pmtSvc.getBillPaymentItems( pp );
        entity.billitems = b.billitems;
        entity.amount = b.amount;
        entity.items = b.items;
        itemHandler.reload();
    }
    
    def itemHandler = [
        fetchList: { o->
            return entity.billitems;
        },
        onColumnUpdate: {v, colName ->
            println " col:" + colName + "val:" + v;
        }        
    ] as EditorListModel;

    public def postPayment() {
        if(!MsgBox.confirm("You are about this payment. Proceed?")) return null;
        pmtSvc.postPayment( entity );
        if(saveHandler) saveHandler();
        return "_close";
    }

    public def viewReceipt() {
        return Inv.lookupOpener( "cashreceipt_preview", [entity: entity ] );
    }


    
}