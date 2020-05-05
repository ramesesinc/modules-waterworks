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
        title = "Batch " + entity.objid + " " + task.title;
        if( task.state == 'processing' ) {
            //start process imeediately
            startProcess();
        }
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


    /**********************
    * Processors
    ***********************/
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

    void startProcess() {
        stat = batchSvc.getProcessInfo([ objid: entity.objid ]);
        processing = true;
        currentProcessor = [
            getTotalCount: {
                return stat.totalcount;
            },
            fetchList: { o->
                stat = batchSvc.processTest( stat );
                Thread.sleep(1000);
                if( stat.status == 0 ) 
                    return [ stat ];
                else 
                    return null;     
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
                binding.refresh();
            }
        ] as BatchProcessingModel;
        currentProcessor.start();
    }

    /*
    //for creating bills
    void startCreateBills() {
        stat = batchSvc.getAccountsForBatchBillingInfo([ objid: entity.objid ]);
        currentProcessor = [
            getTotalCount : {
                return stat.totalcount;
            },
            fetchList: { o->
                return batchSvc.createBatchBills( [objid: entity.objid] );
            },
            processItem: { o->
                binding.refresh('progressLabel');
            },
            onFinished: {
                binding.refresh();
            }
        ] as BatchProcessingModel;
        currentProcessor.start();
    }

    //this creates a billing process for each Item. indicator is totalbillamount
    void startProcessBills() {
        stat = batchSvc.getBatchBillsForProcessing([ objid: entity.objid ]);
        currentProcessor = [
            getTotalCount : {
                return stat.totalcount;
            },
            fetchList: { o->
                return batchSvc.processBills( [objid: entity.objid] );
            },
            processItem: { o->
                o.year = entity.year;
                o.month = entity.month;
                billSvc.process( o );
                binding.refresh('progressLabel');
            },
            onFinished: {
                binding.refresh();
            }
        ] as BatchProcessingModel;
    }

    def startPrintBills() {
        int seriesCounter;
        currentProcessor = [
            getTotalCount : {
                return stat.totalcount;
            },
            fetchList: { o->
                return batchSvc.getForPrintingList( [objid: entity.objid] );
            },
            processItem: { o->
                printerSvc.print( o );
                billSvc.savePrint( [objid: o.objid, printed:1, billrefno: o.billrefno] );
                seriesCounter++;
                binding.refresh('progressLabel');
            },
            onFinished: {
                binding.refresh();
            }
        ] as BatchProcessingModel;
        def pp = [:];
        pp.handler = { o->
            seriesCounter = o;
            stat = batchSvc.getBillsForPrinting([ objid: entity.objid ]);
            currentProcessor.start();
        }
        return Inv.lookupOpener("integer_prompt", "Enter Start Number Series");
    }

    void startApproveBills() {
        stat = batchSvc.getProcessInfo([ objid: entity.objid ]);
        currentProcessor = [
            getTotalCount : {
                return stat.totalcount;
            },
            fetchList: { o->
                return batchSvc.approveBills( [objid: entity.objid] );
            },
            processItem: { o->
                binding.refresh('progressLabel');
            },
            onFinished: {
                binding.refresh();
            }
        ] as BatchProcessingModel;
    }
    */

}	