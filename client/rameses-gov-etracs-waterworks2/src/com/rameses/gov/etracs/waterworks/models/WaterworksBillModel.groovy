package com.rameses.gov.etracs.waterworks.models;

import com.rameses.rcp.annotations.*;
import com.rameses.rcp.common.*;
import com.rameses.osiris2.client.*;
import com.rameses.osiris2.common.*;
import com.rameses.seti2.models.*;
import java.text.*;
import com.rameses.util.*;

public class WaterworksBillModel extends CrudFormModel {
    
    @Service("WaterworksBillStatementService")
    def statementSvc;

    @Service("WaterworksBillService")
    def billSvc;

    @Service("WaterworksBatchBillingService")
    def batchSvc;

    @Service("WaterworksPaymentService")
    def pmtSvc;
    
    //do not remove this. This is used to qualify the formActions
    def viewmode = "summary";

    void openBillFromAccount() {
        if(! caller.entity?.bill?.objid ) 
            throw new Exception("There is no bill id in account");
        entity = [objid: caller.entity.bill.objid ];
        open();
    }

    void afterOpen() {
        buildDetails();
        updatePmtList();
    }

    void createFromAccount() {
        def oldBill = caller.entity.bill;
        if(!oldBill) throw new Exception("There is no current bill available");

        if(!MsgBox.confirm("You are about to create the next bill. Proceed?")) {
            throw new BreakException();
        }
        def b = [:];
        b.txnmode = "ONLINE";
        b.acctid = caller.entity.objid;
        b.year = oldBill.period.year;
        b.month = oldBill.period.month + 1;
        if(b.month > 12) {
            b.month = 1;
            b.year = b.year + 1;
        }
        def newbill = billSvc.createBill( b );
        caller.entity.bill = newbill;
        caller.reloadEntity();
        entity = newbill;
        open();
    }

    def detailList;
    def detailListHandler = [
        fetchList: { o->
            return detailList;
        }
    ] as BasicListModel;

    void buildDetails() {
        def b = statementSvc.getBillDetails([objid: entity.objid]);
        detailList = b.details;
        detailListHandler.reload();
    }

    /*
    void applyCredits() {
         //if both credits and unpaid are greater than zero apply payment until one of it becomes zero
        if( entity.totalcredits == 0 || entity.totalunpaid == 0 ) 
            throw new Exception("credits cannot be applied");
        pmtSvc.applyCredits( [billid: entity.objid] );
        refreshTotals();            
    }
    */

    void refreshTotals() {
        def r = billSvc.getBillTotals( [objid: entity.objid ] );
        entity.putAll( r );
        binding.refresh();
    }

    boolean getReadingPosted() {
        if( detailList.find{ it.consumption_posted == true }) {
            return true;        
        }
        else {
            return false;
        }
    }

    def editReading() {
        def pp = [:];
        pp.bill = entity;
        pp.saveHandler = { o->
            def v = [:];
            v.readingdate = o.readingdate; 
            v.reader = o.reader; 
            v.reading = o.reading; 
            v.volume = o.volume; 
            v.amount = o.amount;   
            v.hold = o.hold;
            def m = [_schemaname: "waterworks_consumption"];
            m.findBy = [objid: o.objid];
            m.putAll(v);
            persistenceService.update(m);
            entity.consumption.putAll( v );
            binding.refresh();
        }
        return Inv.lookupOpener( "waterworks_consumption" , pp );
    }

    void processBill() {
        if( !MsgBox.confirm("You are about to add the consumption to the bill. You cannot edit this anymore once posted. Proceed?")) return;
        billSvc.updateBillFees( [objid: entity.objid ]);
        refreshTotals();                
        buildDetails();
    }

    void resetBill() {
        if( !MsgBox.confirm("You are about to clear the bill contents. Proceed?")) return;
        billSvc.resetBill( [objid: entity.objid ]);
        refreshTotals();                
        buildDetails();
    }

    void updateBillTotals() {
        billSvc.updateBillTotals([objid: entity.objid]);
        refreshTotals(); 
        buildDetails();
    }

    void approveBill() {
        if(!MsgBox.confirm("You are about to approve this bill. Information cannot be edited once posted. Proceed?")) return;
        billSvc.approve( [objid: entity.objid ] );
        entity.state = 'POSTED';
        refreshTotals();
    }
    
    /****************************************
    * payment specific functions
    *****************************************/
    def selectedPayment;
    def pmtList;
    void updatePmtList() {
        def m = [_schemaname: "waterworks_payment"];
        m.findBy = [billid: entity.objid];
        pmtList = queryService.getList(m);
        pmtListHandler.reload();
    }

    def pmtListHandler = [
        fetchList: { o->
            return pmtList;
        }
    ] as BasicListModel;


    def addPayment() {
        if( entity.totalcredits > 0 && entity.totalunpaid > 0 ) {
            throw new Exception("Please apply first all unapplied credits before proceeding")
        }
        def s  = { o->
            refreshTotals();           
            updatePmtList();
            buildDetails();
        }
        return Inv.lookupOpener("waterworks_payment:capture", [saveHandler:s, reftype: "cashreceipt"])
    }
    
    def cancelPayment() {
        if(!selectedPayment) throw new Exception("Please select a payment item first");
        if(!MsgBox.confirm("You are about to cancel this payment. Proceed?")) return;
        pmtSvc.cancelPayment([refid: selectedPayment.objid ]);
        refreshTotals();
        updatePmtList();
        buildDetails();
    }


    void rejoinBatch() {
        if(!MsgBox.confirm("You are about to join this batch. This process cannot be undone. Proceed?")) return;
        def bt = batchSvc.rejoinBatch( [billid: entity.objid ] );
        entity.batchid = bt.batchid;
        binding.refresh();
    }

    void generateNextBill() {
        if(!MsgBox.confirm("You are about to create the next bill. Proceed?")) return;
        def b = [:];
        b.txnmode = "ONLINE";
        b.acctid = entity.acctid;
        b.year = entity.period.year;
        b.month = entity.period.month + 1;
        if(b.month > 12) {
            b.month = 1;
            b.year = b.year + 1;
        }
        entity = billSvc.createBill( b );
        open();
    }


}