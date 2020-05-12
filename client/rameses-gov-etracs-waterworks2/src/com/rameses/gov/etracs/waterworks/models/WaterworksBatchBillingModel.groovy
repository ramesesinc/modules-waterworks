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

    @Service("WaterworksConsumptionService")
    def consumptionSvc;

    def batchPrinter = ManagedObjects.instance.create(WaterworksBatchPrintModel.class);

    String title;
    def viewmode;

    boolean hasErrors = false;
    def progressOpener;     //for batch processing

    public def create() {
        mode = "create";
        entity = [:];
        title = "Batch Billing Initial";
        return null;
    }
    
    boolean getShowFormActions() {
        if( progressOpener != null ) {
            return false;
        }
        else {
            return true;
        } 
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

    //The procstatus and printstatus can be found during persistence read of the batch billing
    public void afterOpen() {
        hasErrors = true;     
        errListHandler.reload();
        title = "Batch " + entity.objid + " " + task.title;
        if( entity.printstatus !=null ) {
            batchPrinter.batchid = entity.objid;
        }
        if( entity.procstatus !=null ) {
            startBatchProcess();
        }
    }

    public void afterSignal( def trans, def task) {
        title = "Batch " + entity.objid + " " + task.title;
        if( task.state == "end" ) {
            //do nothing
        }
        else {
            if( task.state?.matches("approved|end") ) {
                batchPrinter.batchid = entity.objid;
                entity.printstatus = batchPrinter.getPrintStatus();
            }
            startBatchProcess();                    
        }
    }

    //Main Progress Monitor
    void launchProcess( def procHandler, def totalcount, onFinish ) {
        def m = [:];
        m.totalcount = totalcount;
        m.batchHandler = [
            process: procHandler,
            onFinish : {
                progressOpener = null;
                if(onFinish!=null) {
                    def op = onFinish();
                    binding.fireNavigation( op, "self", true );
                }
                else {
                    binding.refresh();  
                }    
            }
        ];    
        def op = Inv.lookupOpener("batch_progress", m );
        op.target = "self";
        progressOpener = op;    
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
        batchSvc.excludeAccountsInBatch( errListHandler.selectedValue*.objid ); 
        errListHandler.reload();
    }

    public void includeInBatch() {
        if(!errListHandler.selectedValue) throw new Exception("Please check an item to exclude");
        batchSvc.includeAccountsInBatch( errListHandler.selectedValue*.objid );         
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
    def billListHandler = [
        isColumnEditable: { item, colName->
            return (task.state == "for-reading" && entity.mobilereading != 1);        
        },
        onColumnUpdate: {v, colName ->
            if( colName == "consumption.reading") {
                def c = [:];
                c.acctid = v.acctid;
                c.meterstate = v.meterstate;
                c.consumptionid = v.consumptionid;
                c.prevreading = v.consumption.prev.reading;
                c.reading = v.consumption.reading;
                def u = consumptionSvc.calcAndUpdate( c );
                v.consumption.putAll( u );
                billListHandler.refreshSelectedItem();
            }
            else if( colName=="consumption.hold" ) {
                def c = [:];
                c.consumptionid = v.consumptionid;
                c.hold = v.consumption?.hold;
                if(c.hold==null) c.hold = 0;
                consumptionSvc.updateHold( c );
            }
        }  
    ];

    def getBatchQry() {
        [objid: entity.objid];
    }

    void startBatchProcess() {
        if(!task.state?.matches('for-reading|for-approval|approved')) return;
        def proc = batchSvc.getProcessInfo( [ objid: entity.objid, taskstate: task.state ] );
        if( proc==null || proc.totalcount == 0 ) return;
        def hdlr = { o->
            def c = batchSvc.processBatch( proc );
            return c.count;
        }
        launchProcess( hdlr, proc.totalcount, null );
    }

    void markMobileReading() {
        if(!MsgBox.confirm("You are about to mark this for mobile reading. Proceed?")) return;
        batchSvc.markForMobileReading( [objid: entity.objid, mobilereading: 1]);
        entity.mobilereading = 1; 
    }

    void unmarkMobileReading() {
        batchSvc.markForMobileReading( [objid: entity.objid, mobilereading: 0]);
        entity.mobilereading = 0; 
    }


    /*************************
    * RELATED TO PRINTING
    **************************/
    boolean getCanPrint() {
        if( entity.printstatus == null ) return false;
        return ( entity.printstatus.printedcount != entity.printstatus.totalcount ) 
    }

    boolean getCanReprint() {
        if( entity.printstatus == null ) return false;
        return ( entity.printstatus.printedcount == entity.printstatus.totalcount ) 
    }

    //run the billing processes, create, build bill and post.
    public void printBatch() {
        def info = batchPrinter.init();
        if(!info) return;
        def handler = { o-> 
            return batchPrinter.sendPrint( o ); 
        }
        def onFinish = { 
            //we need to update this so we can display the reprint button.
            entity.printstatus = batchPrinter.getPrintStatus();
            batchPrinter.previewReport(); 
        }
        launchProcess( handler , info.totalcount, onFinish );
    }

    //run the billing processes, create, build bill and post.
    public def reprintBatch() {
        def info = batchPrinter.initReprint();
        if(!info) return;
        def handler = { o-> 
            return batchPrinter.sendReprint( o ); 
        }
        def preview = { batchPrinter.previewReport(); }
        launchProcess( handler , info.totalcount, preview );
    }



}	