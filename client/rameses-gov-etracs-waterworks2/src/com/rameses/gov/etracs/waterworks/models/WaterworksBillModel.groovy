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

    @Service("WaterworksCapturePaymentService")
    def pmtSvc;
    
    @Service("WaterworksConsumptionService")
    def consumptionSvc;
    
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
        buildDetails();
        updatePmtList();
    }
    
    void reopenBill() {
        if(!MsgBox.confirm("You are about to reopen this bill. Make sure there are no payments made yet. Proceed?")) return;
        billSvc.reopen( [objid:entity.objid] );
        entity.state = 'OPEN';
        refreshTotals();
        buildDetails();
        updatePmtList();
    }
    
    void clearSurcharges() {
        if(!MsgBox.confirm("You are about to clear surcharges for this bill. Surcharges that are already paid will not be removed. Proceed?")) return;
        billSvc.clearSurcharges( [objid: entity.objid ]);
        buildDetails();
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
        },
        openItem: { itm, colName ->
            return Inv.lookupOpener("waterworks_payment:open", [entity: itm]);
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
        pmtSvc.cancelPayment([refid: selectedPayment.objid, pmttxntype: "billing" ]);
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

    //create bills
    void addNewBill() {
        def subareaid = caller.entity.subareaid;
        if(!subareaid) subareaid = caller.entity.subarea.objid;
        def f = [
            [name: "year", caption: "Year", type:"integer"],
            [name: "month", caption: "Month", type:"monthlist"],
            [name: "scheduleid", caption: "Schedule", editable:false],            
        ];
        def z = [_schemaname: "waterworks_subarea"];
        z.select = "year,month,scheduleid:{schedulegroupid}";
        z.findBy = [objid: subareaid];
        def d = queryService.findFirst(z);
        def b = [:];
        def h = { o->
            b.year = o.year;
            b.month = o.month;
            b.scheduleid = o.scheduleid;
        }
        Modal.show("dynamic:form", [fields: f, data:d, handler: h], [title: 'Specify Bill Year/Month']);
        if(!b) throw new BreakException();
        b.txnmode = "ONLINE";
        b.acctid = caller.entity.objid;       
        def newbill = billSvc.createBill( b );
        caller.entity.bill = newbill;
        caller.reloadEntity();
        entity = newbill;
        open();
    }
    void generateNextBill() {
        if(!MsgBox.confirm("You are about to create the next bill. Proceed?")) return;
        def b = [:];
        b.txnmode = "ONLINE";
        b.acctid = entity.acctid;
        b.year = entity.year;
        b.month = entity.month + 1;
        b.scheduleid = entity.scheduleid;
        if(b.month > 12) {
            b.month = 1;
            b.year = b.year + 1;
        }
        entity = billSvc.createBill( b );
        open();
    }

    
    
    //this is a workaround where you can setup begin balance in the bill
    def addPrevBalance() {
        def p = [:]
        p.acctid = entity.acctid;
        p.account = [objid: entity.acctid ];
        p.year = entity.year;
        p.month = entity.month - 1;
        if( p.month <= 0 ) {
            p.month = 12;
            p.year = p.year - 1;
        }
        p.saveItemHandler = {
            refreshTotals();                
            buildDetails();
        }
        p.billid = entity.objid; 
        //return Inv.lookupOpener("waterworks_bill_setup_balance", p );
        return Inv.lookupOpener("waterworks_bill_begin_balance", p );
    }
    
    def viewBalanceForward() {
        return Inv.lookupOpener("waterworks_bill_balance_forward_items", [billid: entity.objid] );
    }
    
    void addPrevReading() {
        def p = [:];
        p.fields = [
            [name:'reading', caption:'Enter Prev Reading', type:'integer']
        ];
        p.data = [:];
        p.handler = { o->
            o.year = entity.year;
            o.month = entity.month - 1;
            if( o.month <= 0 ) {
                o.month = 12;
                o.year = o.year - 1
            }
            o.acctid = entity.acctid;
            o.meterid = entity.meterid;
            o.txnmode = "CAPTURE";
            consumptionSvc.addConsumption( o );
            reloadEntity();
            binding.refresh();
        };
        Modal.show( "dynamic:form", p, [title:"Add Previous Reading" ] );
    }
    
    def viewAccount() {
        def op = Inv.lookupOpener("vw_waterworks_account:open", [entity: [objid: entity.acctid ]]);
        op.target = "windows";
        return op;
   }
    
   def cancelBill() {
       if(! MsgBox.confirm("This will clear the bill and remove associated items which cannot be recovered. Are you sure ") ) return null;
       billSvc.cancelBill( [objid: entity.objid] );
       return "_close";
   }

}