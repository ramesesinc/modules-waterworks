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
public class WaterworksBillInitialModel extends CrudFormModel {

    @Service("WaterworksBillService")
    def billSvc;
    
    def viewmode;

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
        refreshView();
    }
    
    void refreshView() {
        if(entity.step == 1) updateItemList();
        else if(entity.step == 2) updateConsumptionList();
        else if(entity.step == 3) updateItemList();
    }

    public void updateStep( int s) {
        def newstep = entity.step + s;
        def m = [_schemaname: entitySchemaName];
        m.findBy = [objid: entity.objid]; 
        m.step = newstep;
        persistenceService.update( m );
        entity.step = newstep;
    }

    //submit will have different views depending on the viewmode
    void moveNextStep() {
        if( entity.step == 1 ) {
            if( entity.balanceforward != entity.balanceforwardcheck )  {
                throw new Exception("Balance forward and total unpaid balance must equal ");
            }
        }
        updateStep(1);        
        refreshView();
    }

    void moveBackStep() {
        updateStep(-1);        
        refreshView();
    }

    def cancelBill() {
        if(!MsgBox.confirm("This will cancel this bill. All data related to this bill will be lost. Proceed?")) return null;
        persistenceService.removeEntity( [_schemaname: "waterworks_bill", objid: entity.objid ] );
        caller.entity.bill = entity;
        caller.reloadEntity();
        return "_close";
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
    
    void updateDetails() {
        def b = billSvc.getBillDetails([objid: entity.objid]);
        entity.totalamount = b.totalamount;
        detailList = b.details;
        detailListHandler.reload();
    }
    
    private int getYearMonth() {
        return (entity.period.year *12)+entity.period.month;
    }
    
    /*********************************************
    * Consumptions List
    **********************************************/
    def selectedConsumption;
    def consumptionList;
    def consumptionListHandler = [
        fetchList: { o->
            return consumptionList;
        }
    ] as BasicListModel;
    
    void updateConsumptionList() {
        def m = [_schemaname: "waterworks_consumption"];
        m.findBy = [acctid: entity.acctid];
        m.where = ["((year*12)+month) < :yrmon AND meter.objid = :meterid", [yrmon: yearMonth, meterid: entity.meter?.objid]];
        m.orderBy = "year DESC, month DESC"; 
        consumptionList = queryService.getList(m);
        consumptionListHandler.reload();
    }
    def addPrevConsumption() {
        def p = [:];
        p.onSaveHandler = { o->
            updateConsumptionList();
        }
        if( consumptionList?.size() > 0 ) {
            p.prev = consumptionList[0]; 
        }
        p.bill = entity;
        return Inv.lookupOpener("waterworks_consumption:create", p);
    }
    def openPrevConsumption() {
        if(!selectedConsumption) throw new Exception("Please select a consumption first");
        def p = [:];
        p.onSaveHandler = { o->
            updateConsumptionList();
        }
        p.entity = selectedConsumption; 
        p.bill = entity;
        return Inv.lookupOpener("waterworks_consumption:open", p);
    }
    def removePrevConsumption() {
        if(!selectedConsumption) throw new Exception("Please select a consumption first");
        if(selectedConsumption.prevreading) throw new Exception("Cannot remove because there is previous reading");
        def m = [_schemaname: "waterworks_consumption"];
        m.objid = selectedConsumption.objid;
        persistenceService.removeEntity(m);
        updateConsumptionList();
    }
    def addCurrentConsumption() {
        if(!consumptionList) throw new Exception("Please add a previous reading");
        def prevReading = consumptionList[0];
        def p = [:];
        p.onSaveHandler = { o->
            entity.consumption = o;
            binding.refresh();
        }
        p.prev = prevReading; 
        p.bill = entity;
        p.current = true;
        return Inv.lookupOpener("waterworks_consumption:create", p);
    }
    def editCurrentConsumption() {
        if(!entity.consumption?.objid) throw new Exception("Please add consumption");
        def p = [:];
        p.onSaveHandler = { o->
            entity.consumption = o;
            binding.refresh("entity.consumption.*");
        }
        def prevReading = consumptionList[0];
        p.prev = prevReading; 
        p.bill = entity;
        p.current = true;
        p.entity = entity.consumption;
        return Inv.lookupOpener("waterworks_consumption:open", p);
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
    
    void updateItemList() {
        def m = [_schemaname: "waterworks_billitem"];
        if( entity.step ==1 ) {
            m.findBy = [acctid: entity.acctid];
            m.where = ["((year*12)+month) < :yrmon", [ yrmon: yearMonth ] ];
            m.orderBy = "year DESC, month DESC";
        }
        else {
            m.findBy = [billid: entity.objid ];
            m.orderBy = "item.sortorder";
        }
        itemList = queryService.getList( m );  
        def total = itemList.sum{ it.amount };
        if(total==null) total = 0;
        if( entity.step ==  1 ) {
            entity.balanceforwardcheck = total;
            binding?.refresh("entity.balanceforwardcheck");
        }
        else {
            //entity.totalunpaiditems = (total + entity.balanceforwardcheck);
            //binding.refresh("entity.totalunapiditems");            
        }
        listHandler.reload();
    }

    def addItem() {
        def p = [:];
        p.onSaveHandler = { o->
            updateItemList();
        }
        if(entity.step!=1) p.current = true;
        p.bill = entity;
        return Inv.lookupOpener("waterworks_billitem:create", p);
    }
    
    def openItem() {
        if(!selectedItem) throw new Exception("Please select item");
        def p = [:];
        p.onSaveHandler = { o->
            updateItemList();
        }
        if( entity.step!=1) p.current = true;
        p.bill = entity;
        p.entity = selectedItem;
        return Inv.lookupOpener("waterworks_billitem:open", p);        
    }

    void removeItem() {
        if(!selectedItem) throw new Exception("Please select item");
        def m = [_schemaname: "waterworks_billitem"];
        m.objid = selectedItem.objid;
        persistenceService.removeEntity(m);
        updateItemList();
    }

    //rules for calculating other fees
    void updateBillFees() {
        def dtxn = null;
        def h = { o->
            dtxn = o;
        }
        Modal.show( "date:prompt", [title: "Enter Txn Date", handler: h ] );
        if(!dtxn) return;
        billSvc.updateBillFees( [objid: entity.objid, txndate: dtxn ]);
        updateItemList();
    }
    
    void addConsumptionBill() {
        if( !MsgBox.confirm("Please make sure that there are no entries yet with item WATER_SALES. Proceed?")) return;
        billSvc.addConsumptionBill( [objid: entity.objid ]);
        updateItemList();
    }

    /****
     * Payments
     * ****/
    def selectedPayment;
    def addPayment() {
        if(entity.totalunpaiditems > 0 && entity.totalcredits > 0 ) {
            throw new Exception("Please apply first all unapplied credits before proceeding")
        }
        def s  = { o->
            pmtListHandler.reload();
        }
        return Inv.lookupOpener("waterworks_payment:capture", [saveHandler:s])
    }
    def cancelPayment() {
        if(!selectedPayment) throw new Exception("Please select a payment item first");
        MsgBox.alert("cancel payment " + selectedPayment);
    }
    
    def pmtListHandler = [
        fetchList: { o->
            if( entity.objid == null ) return [];
            def m = [_schemaname: "waterworks_payment"];
            m.findBy = [billid: entity.objid];
            return queryService.getList(m);
        }
    ] as BasicListModel;
   
}