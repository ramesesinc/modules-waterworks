package com.rameses.gov.etracs.waterworks.models;

import com.rameses.rcp.annotations.*;
import com.rameses.rcp.common.*;
import com.rameses.osiris2.client.*;
import com.rameses.osiris2.common.*;
import com.rameses.rcp.annotations.*;
import com.rameses.seti2.models.*;

public class WaterworksBatchBillingModel extends WorkflowTaskModel {

    @Service("WaterworksBatchBillingService")
    def batchSvc;

    String title;
    def viewmode;

    boolean hasErrors = false;

    def acctHandler;

    public def create() {
        mode = "create";
        entity = [:];
        title = "Batch Billing Initial";
        return null;
    }

    @PropertyChangeListener
    def listener = [
        "entity.subarea" : { o->
            entity.period = o.period;
            binding.refresh();
        },
        "excludeinbatch" : { o->
            errListHandler.reload();
        },
        "showerronly": { o->
            errListHandler.reload();
        }
    ];

    public void saveNew() {
        if( !entity.period ) throw new Exception("Please specify a period. Check that the subarea must have a billing period");
        entity = batchSvc.create( entity );
        MsgBox.alert("Batch no. " + entity.objid + " is created");
        open();
    }

    public void afterOpen() {
        hasErrors = true;     
        errListHandler.reload();
        acctHandler = Inv.lookupOpener("vw_waterworks_account:exec", [:] );
    }

    public void afterSignal( def trans, def task) {
        if( task.state == 'processing' ) {
            MsgBox.alert("Start processing now...." );       
        }
    }


    /*************************
    * ACCOUNTS FOR PROCESSING
    **************************/
    boolean showerronly = false;
    def excludeinbatch = 0;
    def errList = [];
    def errListHandler = [
        isMultiSelect: {
            return true;        
        },
        fetchList: { o->
            o.objid = entity.objid;
            o.excludeinbatch = excludeinbatch;
            o.showerronly = showerronly;
            return batchSvc.getAccountsForBilling( o ); 
        },
        openItem: { o,col ->
            def op = Inv.lookupOpener("vw_waterworks_account:open", [entity:[objid: o.objid]]);
            op.target = "popup";
            return op;
        }
    ] as PageListModel;

    public void excludeFromBatch() {
        if(!errListHandler.selectedValue) throw new Exception("Please check an item to exclude");
        errListHandler.selectedValue.each {
            acctHandler.handle.entity = [objid:it.objid];
            acctHandler.handle.excludeFromBatch();            
        }
        errListHandler.reload();
    }

    public void includeInBatch() {
        if(!errListHandler.selectedValue) throw new Exception("Please check an item to exclude");
        errListHandler.selectedValue.each {
            acctHandler.handle.entity = [objid:it.objid];
            acctHandler.handle.includeInBatch();
        }
        errListHandler.reload();
    }

    public void refreshList() {
        errListHandler.reload();
    }

    public def viewItem() {
        if( !errListHandler.selectedItem?.item  )
            throw new Exception("Please select an item");
        def v = errListHandler.selectedItem.item;
        return errListHandler.openItem( v, null );
    }

    /*************************
    * READING ITEMS
    **************************/
    def searchReading;
    def doSearchReading() {
        readingListHandler.reload();
    }

    def readingListHandler = [
        fetchList: { o->
                
        },
        onUpdateColumn: { v, col ->
            MsgBox.alert("item " + v + col);
        }
    ] as BasicListModel;




}	