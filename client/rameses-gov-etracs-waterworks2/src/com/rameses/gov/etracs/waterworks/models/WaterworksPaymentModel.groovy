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
    
    def refTypes = ["cashreceipt", "credit"];
    def entity;
    def mode;
    def selectedItem;
    
    void init() {
        entity = [:];
        def bill = caller.entity;
        entity.year = bill.period.year;
        entity.month = bill.period.month;
        entity.billid = bill.objid;
        entity.acctid = bill.acctid;
        mode = "initial";
    }
    
    void loadItems() {
        mode = "view";
        def b = pmtSvc.getPaymentItems( [acctid: entity.acctid, amtpaid: entity.amount, billid: entity.billid ] );
        entity.billitems = b.billitems;
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
    
}