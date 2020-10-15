package com.rameses.gov.etracs.waterworks.models;

import com.rameses.rcp.annotations.*;
import com.rameses.rcp.common.*;
import com.rameses.osiris2.client.*;
import com.rameses.osiris2.common.*;
import com.rameses.seti2.models.*;
import java.text.*;

public class WaterworksBillBeginBalanceModel  {

    @Binding
    def binding;
    
    @Service("WaterworksBeginBalanceService")
    def beginBalSvc;

    int year;
    int month;
    String monthname;

    def account;
    def saveItemHandler;
    def billid;
    def mode = "edit";
    
    String title = "Add Prev Balance Entries";
    
    def itemList;
    def selectedItem;   

    void init() {
        this.monthname = ["JAN","FEB","MAR","APR","MAY","JUN","JUL","AUG","SEP","OCT","NOV","DEC"][this.month-1]; 
        buildItemList();
    }
    
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
        itemList = beginBalSvc.getBillBeginBalanceItems([billid:billid]);
    }
    
    def listHandler = [
        fetchList: { o->
            return itemList;
        }
    ] as BasicListModel;
    
    def addItem() {
        def p = [:];
        p.saveHandler = { o->
            o.refbillid = billid;
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
            o.refbillid = billid;
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
        beginBalSvc.removeItem( [objid: selectedItem.objid, refbillid: billid ] );
        refreshTotals();
        saveItemHandler();
    }
    
    /*
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
    */
    
}