package com.rameses.gov.etracs.waterworks.models;

import com.rameses.rcp.annotations.*;
import com.rameses.rcp.common.*;
import com.rameses.osiris2.client.*;
import com.rameses.osiris2.common.*;
import com.rameses.seti2.models.*;
import java.text.*;

/****
* The initial billing incoporates the ff steps:
* 1 = balance forward. encode past balances if any
* 2 = encode readings
* 3 = encode other charges
* 4 = apply credits and payments 
* 5 = final view
**/
public class WaterworksBillCaptureModel extends CrudFormModel {

    @Service("WaterworksBillService")
    def billSvc;

    @Service("WaterworksBillStatementService")
    def statementSvc;

    @Service("WaterworksPaymentService")
    def pmtSvc;
    
    def viewmode = 'edit';

    def titles = [
        "Step 1. Setup Begin Balance",
        "Step 2. Setup Readings",
        "Step 3. Setup Monthly Fees",
        "Step 4. Apply Payments",
        "Step 5. Confirm Bill"
    ];
    
    String getSubtitle() {
        String period =  " -"+entity.period.monthname + " " +entity.period.year; 
        return titles[ entity.step - 1 ] + period;
    }

    int getYearMonth() {
        return (entity.period.year *12)+entity.period.month;
    }
    
    void afterCreate() {
        //parent here is the customer account
        def parent = caller.entity;
        def period = parent.subarea?.period;
        if(period) {
            entity.year = period.year;
            entity.month = period.month;
            entity.acctid = parent.objid;
        }
        entity.initial = 1;
        entity.balanceforward = 0;
        entity.step = 0;
        viewmode = 'initial';
    }
    
    void afterSave() {
        caller.entity.bill = entity;
        caller.reloadEntity();
        openBill();
    }
    
    void openBill() {
        if( !caller.entity.bill?.objid )
            throw new Exception("billid is not specified in account");
        entity = [objid: caller.entity.bill.objid ];
        open();
        if( entity.state != 'DRAFT' ) {
            viewSummary();
        }
        else {
            viewmode = 'edit';
        }
        refreshView();
    }
    
    void refreshView() {
        if(entity.step == 1) buildItemList();
        else if(entity.step == 2) buildConsumptionList();
        else if(entity.step == 3) buildItemList();
        else if( entity.step == 4 ) updatePmtList();
    }

    public void updateStep( int s) {
        def newstep = entity.step + s;
        def m = [_schemaname: entitySchemaName];
        m.findBy = [objid: entity.objid]; 
        m.step = newstep;
        persistenceService.update( m );
        entity.step = newstep;
    }

    void viewSummary() {
        buildDetails();
        viewmode = "summary";
    }

    void viewEdit() {
        viewmode = "edit";
    }

    //submit will have different views depending on the viewmode
    void moveNextStep() {
        updateStep(1);        
        refreshView();
    }

    void moveBackStep() {
        updateStep(-1);        
        refreshView();
    }

    def cancelBill() {
        if(!MsgBox.confirm("This will cancel this bill. All data related to this bill will be lost. Proceed?")) return null;
        billSvc.cancelBill( [objid: entity.objid]);
        caller.entity.bill = null;
        caller.reloadEntity();
        return "_close";
    }

    void updateTotals() {
        def r = billSvc.getBillTotals( [objid: entity.objid ] );
        entity.putAll( r );
        binding.refresh();
    }

    /*********************************************
    * Details in the view page.
    **********************************************/
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

    /*********************************************
    * Adding credits
    **********************************************/
    public def addCredit() {
        def h = { o->
            def pmt = [:];
            pmt.billid = entity.objid;
            pmt.acctid = entity.acctid;
            pmt.refno = entity.billno;
            pmt.refdate = entity.period.fromdate;
            pmt.amount = o;
            billSvc.addBeginCredit( pmt );
            updateTotals();            
            buildItemList();
        }
        return Inv.lookupOpener("decimal:prompt", [handler: h, title: "Enter beginning balance" ]);        
    }

    public void removeCredit() {
        if(!MsgBox.confirm("You are about to remove the credit payment")) return;
        billSvc.removeBeginCredit( [billid: entity.objid ] );
        updateTotals();        
        buildItemList();
    }

    /*********************************************
    * Consumptions List
    **********************************************/
    def consumptionList;
    def consumptionListHandler = [
        fetchList: { o->
            return consumptionList;
        }
    ] as BasicListModel;

    void buildConsumptionList() {
        def m = [_schemaname: "waterworks_consumption"];
        m.findBy = [billid: entity.objid];
        m.orderBy = "year, month"; 
        consumptionList = queryService.getList(m);
        consumptionListHandler.reload();
    }
   
    def buildConsumption() {
        def pp = [bill: entity, meter: entity.meter];
        pp.defaultItems = consumptionList;
        pp.handler = {
            buildConsumptionList();
        }
        return Inv.lookupOpener( "waterworks_consumption_builder", pp );
    }
    
    /*********************************************
    * Handling for current and previous items
    **********************************************/
    def itemList;
    def selectedItem;   
    def listHandler = [
        fetchList: { o->
            return itemList;
        }
    ] as BasicListModel;
    
    void buildItemList() {
        if( entity.step ==1 ) {
            itemList = [];            
            if(entity.balanceforward < 0 ) {
                itemList << [particulars: "Forward Credits", amount: entity.balanceforward ];
            }
            else {
                def m = [_schemaname: "waterworks_billitem"];            
                m.findBy = [acctid: entity.acctid];
                m.where = ["((year*12)+month) < :yrmon", [ yrmon: yearMonth ] ];
                m.orderBy = "year DESC, month DESC";
                itemList = queryService.getList( m );
                itemList.each {
                    it.particulars = it.item.objid + " " + it.item.title;
                }
            }
        }
        else {
            def m = [_schemaname: "waterworks_billitem"];
            m.findBy = [billid: entity.objid ];
            m.where = ["((year*12)+month) = :yrmon", [ yrmon: yearMonth ] ];
            m.orderBy = "item.sortorder";
            itemList = queryService.getList( m );
        }
        listHandler.reload();
    }

    def addItem() {
        def p = [:];
        p.saveHandler = { o->
            billSvc.addBillItem( o );
            updateTotals();                        
            buildItemList();
        }
        if(entity.step!=1) p.current = true;
        p.bill = entity;
        return Inv.lookupOpener("waterworks_billitem:create", p);
    }
    
    def openItem() {
        if(!selectedItem) throw new Exception("Please select item");
        def p = [:];
        p.saveHandler = { o->
            billSvc.updateBillItem( o );
            updateTotals();   
            buildItemList();
        }
        if( entity.step!=1) p.current = true;
        p.bill = entity;
        p.entity = selectedItem;
        return Inv.lookupOpener("waterworks_billitem:open", p);        
    }

    void removeItem() {
        if(!selectedItem) throw new Exception("Please select item");
        billSvc.removeBillItem( [objid: selectedItem.objid ] );
        updateTotals();         
        buildItemList();
    }

    //rules for calculating other fees
    void updateBillFees() {
        billSvc.updateBillFees( [objid: entity.objid ]);
        updateTotals(); 
        buildItemList();
    }
    
    void updatePenaltyFees() {
        billSvc.updatePenaltyFees( [objid: entity.objid ]);
        updateTotals(); 
        buildItemList();
    }    

    /***************
     * Payments
     * *************/
    void applyCredits() {
         //if both credits and unpaid are greater than zero apply payment until one of it becomes zero
        if( entity.totalcredits == 0 || entity.totalunpaid == 0 ) 
            throw new Exception("credits cannot be applied");
        pmtSvc.applyCredits( [billid: entity.objid] );
        updateTotals();            
        updatePmtList();
    }

    def addPayment() {
        if( entity.totalcredits > 0 && entity.totalunpaid > 0 ) {
            throw new Exception("Please apply first all unapplied credits before proceeding")
        }
        def s  = { o->
            updateTotals();            
            updatePmtList();
        }
        return Inv.lookupOpener("waterworks_payment:capture", [saveHandler:s, reftype: "cashreceipt"])
    }
    
    def cancelPayment() {
        if(!selectedPayment) throw new Exception("Please select a payment item first");
        if(selectedPayment.reftype == "credit") {
        } 
        if(!MsgBox.confirm("You are about to cancel this payment. Proceed?")) return;
        pmtSvc.cancelPayment([refid: selectedPayment.objid ]);
        updateTotals();
        updatePmtList();
    }

    def selectedPayment;
    def pmtList;
    void updatePmtList() {
        def m = [_schemaname: "waterworks_payment"];
        m.findBy = [billid: entity.objid];
        m.where = [" NOT(reftype = 'beginbalance') "];
        pmtList = queryService.getList(m);
        pmtListHandler.reload();
    }

    def pmtListHandler = [
        fetchList: { o->
            return pmtList;
        }
    ] as BasicListModel;

    def approve() {
        if(!MsgBox.confirm("You are about to approve this bill. This will also active the account. Continue?")) return;
        billSvc.approve( [objid: entity.objid ]);
        entity.state ='POSTED';
        caller.entity.state = 'ACTIVE';
        caller.entity.billd = entity;
        caller.reloadEntity();
        return "_close";
    }

}