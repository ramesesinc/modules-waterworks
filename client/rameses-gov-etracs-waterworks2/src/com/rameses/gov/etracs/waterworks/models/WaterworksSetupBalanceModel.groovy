package com.rameses.gov.etracs.waterworks.models;

import com.rameses.rcp.annotations.*;
import com.rameses.rcp.common.*;
import com.rameses.osiris2.client.*;
import com.rameses.osiris2.common.*;
import com.rameses.seti2.models.*;
import com.rameses.util.*;
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
    
    @Service("WaterworksBeginBalanceService")
    def beginBalSvc;

    int year;
    int month;
    String monthname;

    def account;
    def saveItemHandler;
    boolean fromBill = false;
    def billid;
    
    String title = "Setup Begin Balance";
    
    void init() {
        account = caller.entity;
        
        def f = [
            [name: "year", caption: "Year", type:"integer"],
            [name: "month", caption: "Month", type:"monthlist"],
        ];
        def z = [_schemaname: "waterworks_subarea"];
        z.select = "year,month,schedulegroupid";
        z.findBy = [objid: account.subarea.objid];
        def d = queryService.findFirst(z);
        d.month = d.month - 1;
        if( d.month <= 0 ) {
            d.month = 12;
            d.year = d.year - 1;
        }
        
        boolean pass = false;
        def h = { o->
            this.year = o.year;
            this.month = o.month;
            this.monthname = ["JAN","FEB","MAR","APR","MAY","JUN","JUL","AUG","SEP","OCT","NOV","DEC"][this.month-1];            
            pass = true;
        }
        Modal.show("dynamic:form", [fields: f, data:d, handler: h], [title: 'Specify Bill Year/Month']);
        if(!pass) throw new BreakException();        
        buildItemList();
    }

    void initFromBill() {
        fromBill = true;
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
        if( fromBill == false ) {
            def m = [_schemaname: "waterworks_billitem"];
            m.findBy = [acctid: account.objid ];
            m.where = "billid IS NULL";
            m.orderBy = "year DESC, month DESC, item.sortorder";
            itemList = queryService.getList( m ).collect{
                def p = it.year + " " + it.monthname + " - " + it.item.title;
                if(it.particulars) p = p +  " (" + it.particulars + ") ";
                [ objid:it.objid, particulars: p, amount: it.amount, balance: it.balance ]
            };

            //check first if there are credits and add also to the list;
            m = [_schemaname:"waterworks_credit"];
            m.findBy = [acctid: account.objid];
            m.select = "amount:{SUM(cr-dr)}";
            def dec = queryService.findFirst( m );
            if(dec?.amount) {
                itemList.add( [particulars:'WATER CREDIT', amount: dec.amount, balance: dec.amount] );
            }        
        }
        else {
            def m = [_schemaname: "waterworks_billitem"];
            m.findBy = [acctid: account.objid ];
            m.where = [ " ((year*12)+month) <= :ym" , [ym: (year*12)+month ] ];
            itemList = queryService.getList( m ).collect {
                def p = it.year + " " + it.monthname + " - " + it.item.title;
                if(it.particulars) p = p +  " (" + it.particulars + ") ";
                [ objid:it.objid, particulars: p, amount: it.amount, balance: it.balance, billno: it.bill.billno, billid: it.billid ]
            };
        }
    }

    def listHandler = [
        fetchList: { o->
            return itemList;
        }
    ] as BasicListModel;
    
    def addItem() {
        def p = [:];
        p.saveHandler = { o->
            o.billid = billid;
            beginBalSvc.addItem( o );
            refreshTotals();
            saveItemHandler();
        };
        p.account = account;
        p.year = year;
        p.month = month;
        return Inv.lookupOpener("waterworks_billitem:create", p);
    }
    
    def openItem() {
        if(!selectedItem) throw new Exception("Please select item");
        def p = [:];
        p.saveHandler = { o->
            o.billid = billid;
            beginBalSvc.updateItem( o );
            refreshTotals();
            saveItemHandler();
        }
        p.account = account;
        p.entity = [objid: selectedItem.objid];
        p.year = year;
        p.month = month;
        return Inv.lookupOpener("waterworks_billitem:open", p);        
    }

    void removeItem() {
        if(!selectedItem) throw new Exception("Please select item");
        if( selectedItem.billid ) throw new Exception("Cannot delete item that has bill");
        beginBalSvc.removeItem( [objid: selectedItem.objid, billid: billid ] );
        refreshTotals();
        saveItemHandler();
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