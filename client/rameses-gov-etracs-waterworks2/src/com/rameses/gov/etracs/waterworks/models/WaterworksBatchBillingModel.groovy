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

    public def create() {
        mode = "create";
        entity = [:];
        title = "Batch Billing Initial";
        return null;
    }
    
    boolean getShowFormActions() {
        if( entity.processing != null ) {
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

    public void afterOpen() {
        hasErrors = true;     
        errListHandler.reload();
        title = "Batch " + entity.objid + " " + task.title;
        if( entity.processing !=null ) {
            startProcess();
        }
    }

    public void afterSignal( def trans, def task) {
        title = "Batch " + entity.objid + " " + task.title;
        def proc = batchSvc.getProcessInfo( [ objid: entity.objid, taskstate: task.state ] );
        if(proc!=null) {
            entity.processing = proc;
            startProcess();
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
            return (task.state == "for-reading");        
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

    //run the billing processes, create, build bill and post.
    void startProcess() {
        def h = { o->
            def res = batchSvc.processBatch( o );
            return res.count;
        }
        runProcess( h );
    }

     //run the billing processes, create, build bill and post.
    public void printBatch() {
        boolean pass = batchPrinter.init(entity.objid);
        if(!pass) return;

        //set the entity processing to signal change screen to processing page
        entity.processing = batchPrinter.info;
        def h = { o->
            return batchPrinter.sendPrint( o );
        }
        runProcess( h );
    }

    /**************************************************
    * Main processor that provides UI feedback
    ***************************************************/
    def stat;
    def currentProcessor;
    def label;
    boolean processing = false;

    void cancelProcess() {
        if(!MsgBox.confirm("Cancel process?")) return;
        currentProcessor.cancel();
    }

    void resumeProcess() {
        currentProcessor.start();
        processing = true;
    }

    def progressBar = [
        getMaxValue: {
            return (stat==null) ? 0 : stat.totalcount;
        },
        getValue: {
            return (stat==null) ? 0 : stat.counter;
        }
    ] as ProgressModel;

    void runProcess(def _handler) {
        stat = entity.processing;                
        processing = true;
        currentProcessor = [
            getTotalCount: {
                return stat.totalcount;
            },
            fetchList: { o->
                //returns the processed count.
                int processedCount = _handler(o);
                Thread.sleep(500); //this was added so it will not hog the resources
                if( processedCount == 0 ) {
                    return null;
                }
                else {
                    if(stat.counter==null) stat.counter = 0;
                    stat.counter = stat.counter + processedCount;
                    return [stat];                    
                }
            },
            processItem: { o->
                label =  "processing " + stat.counter +" of "+stat.totalcount;
                progressBar.refresh();
                binding.refresh('label');
            },
            afterCancel: {
                processing = false;
            },
            onFinished: {
                entity.remove("processing");
                binding.refresh();
            }
        ] as BatchProcessingModel;
        currentProcessor.start();        
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

}	