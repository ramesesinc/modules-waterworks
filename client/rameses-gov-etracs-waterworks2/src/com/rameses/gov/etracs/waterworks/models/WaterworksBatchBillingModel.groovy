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
        title = "Batch " + entity.objid + " " + task.title;
        startBatchProcess();
        loadPrintStatus();
    }

    public void afterSignal( def trans, def task) {
        title = "Batch " + entity.objid + " " + task.title;
        if( task.state == "end" ) {
            //do nothing
        }
        else {
            startBatchProcess();                    
            loadPrintStatus();            
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
                if(onFinish!=null) onFinish();
            }
        ];    
        def op = Inv.lookupOpener("batch_progress", m );
        op.target = "self";
        progressOpener = op;    
    }

    def selectedErr;
    def errListHandler = [
        onOpenItem: { o,col ->
            def op = Inv.lookupOpener("vw_waterworks_account:open", [entity:[objid: o.acctid]]);
            op.target = "popup";
            return op;
        }
    ];
    
    public def viewItem() {
        if( !selectedErr  )
            throw new Exception("Please select an item");
        return errListHandler.openItem( selectedErr, null );
    }

    public void rerunProcess() {
        batchSvc.clearErrors([objid: entity.objid ]);
        startBatchProcess(); 
        binding.refresh(); 
    }

    public void resolveError() {
        if(!selectedErr) throw new Exception("Please select an item");
        batchSvc.resolveError( [errorid: selectedErr.objid ] );
        errListHandler.reload();
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
                c.reader = entity.reader;
                c.readingdate = entity.readingdate;
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

    def changeReadingDate() {
        def h = { o->
            def m = [_schemaname:schemaName];
            m.findBy = [objid: entity.objid];
            m.readingdate = o;
            persistenceService.update( m );
            entity.readingdate = o;
            binding.refresh();            
        }
        def op = Inv.lookupOpener( "date:prompt", [handler: h, value: entity.readingdate ] );
        op.target = "popup";
        return op;
    }

    def changeReader() {
        def h = { o->
            def m = [_schemaname:schemaName];
            m.findBy = [objid: entity.objid];
            m.reader = o;
            persistenceService.update( m );
            entity.reader = o;
            binding.refresh();            
        }
        def op = Inv.lookupOpener( "waterworks_reader:lookup", [onselect: h] );
        op.target = "popup";
        return op;
    }


    /*************************
    * RELATED TO BATCH PROCESSING
    **************************/
    void startBatchProcess() {
        if(!task.state?.matches('draft|for-approval|approved')) return;
        hasErrors = false;
        def proc = batchSvc.getProcessInfo( [ objid: entity.objid, taskstate: task.state ] );
        if(proc==null) throw new Exception("Process is not found. Please check no process handler for task " + task.state );
        if( proc.totalerrors > 0 ) {
            hasErrors = true;
        }    
        
        if( proc.totalcount == 0 ) {
            return;
        }    

        def hdlr = { o->
            def c = batchSvc.processBatch( proc );
            return c.count;
        }
        def onEndProcess = {
            proc = batchSvc.getProcessInfo( [ objid: entity.objid, taskstate: task.state ] );
            if( proc.totalerrors > 0 ) {
                hasErrors = true;
            }    
            binding.refresh();   
        }
        launchProcess( hdlr, proc.totalcount, onEndProcess );
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

    public void loadPrintStatus() {
        if(!task.state?.matches('approved|end')) return; 
        batchPrinter.batchid = entity.objid;     
        entity.printstatus = batchPrinter.getPrintStatus();
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
            def op = batchPrinter.previewReport(); 
            binding.fireNavigation( op, "self", true );
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
        def preview = { 
            def op = batchPrinter.previewReport(); 
            binding.fireNavigation( op, "self", true );
        }
        launchProcess( handler , info.totalcount, preview );
    }



}	