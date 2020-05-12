package com.rameses.gov.etracs.waterworks.models;

import com.rameses.rcp.annotations.*;
import com.rameses.rcp.common.*;
import com.rameses.osiris2.client.*;
import com.rameses.osiris2.common.*;
import com.rameses.rcp.annotations.*;
import com.rameses.seti2.models.*;
import java.util.concurrent.*;

public class WaterworksBatchPrintModel {

    @Service("WaterworksBatchBillPrintingService")
    def printingSvc;

    def reportOpener;
    def startno;
    def batchid;
    boolean showPreview = false;

    def printItems = [];
    def counter = 0;

    void initReportOpener() {
        def p = [:];
        p.headers = [ORGNAME: 'WATERWORKS'];
        reportOpener = Inv.lookupOpener("waterworks_batch:print", p );
        if(!reportOpener) 
            throw new Exception("Report handler waterworks_batch:print not found");
        if(!(reportOpener.handle instanceof WaterworksBillFormReportModel)) {
            throw new Exception("Report must extend com.rameses.gov.etracs.waterworks.models.WaterworksBillFormReportModel");            
        }
    }

    public def init() {
        def info = printingSvc.getBatchPrintInfo( [batchid: batchid ] );
        if( !info ) throw new Exception("Nothing to print. All bills are already printed");
        printItems.clear();
        boolean pass = false;
        def m = [:];
        m.fields = [
            [name:'startno', caption:'Enter Start Bill No', type:'integer'],
            [name:'showpreview', caption:'Show Preview', type:'checkbox', checkedValue: true, uncheckedValue:false]           
        ];
        m.data = [showpreview:false];
        m.handler = { o->
            pass = true;
            startno = o.startno; 
            showPreview = o.showpreview;
        }
        Modal.show("dynamic:form", m, [title: 'Print Batch'] );
        if( !pass ) return null;
        initReportOpener();
        return info;
    }

    int sendPrint(  def o ) {
        o.batchid = batchid;
        def items = printingSvc.getPrintList(o);
        if(items) {
            //if showPreview is false we will print in batches and send directly to the printer
            //if showPreview is true we will hold data first in a list and send to preview after
            if(startno!=null) {
                items.each {
                    it.billrefno = startno++;
                }                
            }
            if(!showPreview) {
                initReportOpener();
                reportOpener.handle.sendBatchPrint( printItems );   
                reportOpener.print(true);
                //rm.printNoDialog();
            }                   
            else {
                printItems.addAll( items );
            }
            printingSvc.updateBillPrinted( [items:items] );                
            return items.size();
        }
        return 0;
    }

    def previewReport() {
        if( !showPreview ) return; 
        reportOpener.handle.sendBatchPrint( printItems );     
        reportOpener.outcome = "preview";
        return reportOpener;
    }

    public def initReprint() {
        def info = printingSvc.getBatchReprintInfo( [batchid: batchid ] );
        if( !info ) throw new Exception("No bills marked as printed. Please run print first");
        printItems.clear();
        counter = 0;
        showPreview = true;        
        initReportOpener();
        return info;
    }    

    int sendReprint(  def o ) {
        o.batchid = batchid;
        o.start = counter;
        def items = printingSvc.getReprintList(o);
        if(items) {
            printItems.addAll( items );
            counter = counter + items.size();
            return items.size();
        }
        else {
            return 0;
        }
    }

    public getPrintStatus() {
        return printingSvc.getBatchPrintStatus( [batchid: batchid] );
    }


}	