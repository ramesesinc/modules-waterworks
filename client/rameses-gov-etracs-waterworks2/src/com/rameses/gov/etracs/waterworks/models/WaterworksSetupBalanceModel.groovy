package com.rameses.gov.etracs.waterworks.models;

import com.rameses.rcp.annotations.*;
import com.rameses.rcp.common.*;
import com.rameses.osiris2.client.*;
import com.rameses.osiris2.common.*;
import com.rameses.seti2.models.*;
import java.text.*;

public class WaterworksSetupBalanceModel {

    @Caller
    def caller;

    @Binding
    def binding;

    @Service("QueryService")
    def queryService;

    @Service("PersistenceService")
    def persistenceService;

    @Service("WaterworksAccountService")
    def acctSvc;

    int year;
    int month;
    String monthname;

    def account;
    
    String title = "Setup Begin Balance";

    void init() {
        account = caller.entity;
        def subarea = account.subarea;
        if( !subarea )
            throw new Exception("Please specify the subarea and subarea in the account");
        this.year = subarea.year;
        this.month = subarea.month - 1;
        if( this.month <= 0 ) {
            this.month = 12;
            this.year = this.year - 1;
        }
        this.monthname = ["JAN","FEB","MAR","APR","MAY","JUN","JUL","AUG","SEP","OCT","NOV","DEC"][this.month-1];
        buildItemList();
    }

    /*********************************************
    * Consumptions List
    **********************************************/
    def consumptionList;
    def consumptionListHandler = [
        fetchList: { o->
            def m = [_schemaname: "waterworks_consumption"];
            m.findBy = [acctid: account.objid];
            m.orderBy = "year, month"; 
            consumptionList = queryService.getList(m);
            return consumptionList;
        }
    ] as BasicListModel;

    def buildConsumption() {
        def pp = [account:account, toyear: year, tomonth: month];
        pp.defaultItems = consumptionList;
        pp.handler = {
            consumptionListHandler.reload();
        }
        return Inv.lookupOpener( "waterworks_consumption_builder", pp );
    }

    def clearConsumptions() {
        if(!MsgBox.confirm("You are about to clear consumptions. Continue?")) return;
        def m = [_schemaname: "waterworks_consumption"];
        m.findBy = [acctid: account.objid];
        persistenceService.removeEntity( m );
        consumptionListHandler.reload();
    }

    /*********************************************
    * Handling for billitems
    **********************************************/
    def itemList;
    def selectedItem;   

    public def getTotalamount() {
        if(!itemList) 
            return 0;
        else     
            return itemList.sum{it.amount};
    }

    void refreshTotals() {
        buildItemList();
        listHandler.reload();
        binding.refresh(); 
    }

    void buildItemList() {
        def m = [_schemaname: "waterworks_billitem"];
        m.findBy = [acctid: account.objid ];
        m.where = "billid IS NULL";
        m.orderBy = "year DESC, month DESC, item.sortorder";
        itemList = queryService.getList( m ).collect{
            def p = it.year + " " + it.monthname + " - " + it.item.title;
            if(it.particulars) p = p +  " (" + it.particulars + ") ";
            [ objid:it.objid, particulars: p, amount: it.amount ]
        };

        //check first if there are credits and add also to the list;
        m = [_schemaname:"waterworks_credit"];
        m.findBy = [acctid: account.objid];
        m.select = "amount:{SUM(cr-dr)}";
        def dec = queryService.findFirst( m );
        if(dec?.amount) {
            itemList.add( [particulars:'WATER CREDIT', amount: dec.amount] );
        }        
    }

    def listHandler = [
        fetchList: { o->
            return itemList;
        }
    ] as BasicListModel;
    
    def addItem() {
        def p = [:];
        p.saveHandler = { 
            refreshTotals();
        };
        p.account = account;
        p.year = year;
        p.month = month;
        return Inv.lookupOpener("waterworks_billitem:create", p);
    }
    
    def openItem() {
        if(!selectedItem) throw new Exception("Please select item");
        def p = [:];
        p.saveHandler = { 
            refreshTotals();
        }
        p.account = account;
        p.entity = selectedItem;
        p.year = year;
        p.month = month;
        return Inv.lookupOpener("waterworks_billitem:open", p);        
    }

    void removeItem() {
        if(!selectedItem) throw new Exception("Please select item");
        def m = [_schemaname: "waterworks_billitem"];
        m.findBy = [objid: selectedItem.objid ];
        persistenceService.removeEntity( m );
        refreshTotals();
    }

    /*********************************************
    * Adding credits
    **********************************************/
    public def addCredit() {
        def h = { o->
            def m = [_schemaname: "waterworks_credit"];
            m.acctid = account.objid;
            m.dr = o;
            m.cr = 0;
            persistenceService.create( m );
            refreshTotals();
        }
        if(totalamount >0)
            throw new Exception("You cannot enter a beginning credit because there is unpaid amount");
        return Inv.lookupOpener("decimal:prompt", [handler: h, title: "Enter beginning credit" ]);        
    }

    public void removeCredit() {
        if(!MsgBox.confirm("You are about to remove the credit payment. Continue?")) return;
        def m = [_schemaname: "waterworks_credit"];
        m.findBy = [acctid :account.objid];
        persistenceService.removeEntity( m );
        refreshTotals();
    }

    //rules for calculating other fees
    def updateBillFees() {
        def h = { o->
            def m = [:];
            m.txndate = o;
            m.objid = entity.objid;
            billSvc.updateBillFees( m );
            refreshTotals(); 
            buildItemList();
        }
        return Inv.lookupOpener("date:prompt", [handler: h]);
    }

    def approve() {
        if(!MsgBox.confirm("You are about to approve this bill. This will also activate the account. Continue?")) return;
        acctSvc.approve( [acctid: account.objid ]);
        account.state = 'ACTIVE';
        caller.reloadEntity();
        return "_close";
    }

}