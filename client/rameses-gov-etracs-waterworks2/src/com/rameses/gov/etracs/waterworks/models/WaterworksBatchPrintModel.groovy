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
    def info;

    public boolean init(def batchid ) {
        info = printingSvc.getBatchPrintInfo( [batchid: batchid ] );
        if( !info ) throw new Exception("Nothing to print. All bills are already printed");

        boolean pass = false;
        def m = [:];
        m.fields = [
            [name:'startno', caption:'Enter Start Bill No', type:'integer']
        ];
        m.data = [:];
        m.handler = { o->
            pass = true;
            startno = o.startno; 
        }
        Modal.show("dynamic:form", m, [title: 'Print Batch'] );
        if( !pass ) return false;

        def p = [:];
        p.headers = [ORGNAME: 'WATERWORKS'];
        reportOpener = Inv.lookupOpener("waterworks_batch:print", p );
        if(!reportOpener) 
            throw new Exception("Report handler waterworks_batch:print not found");
        if(!(reportOpener.handle instanceof WaterworksBillFormReportModel)) {
            throw new Exception("Report must extend com.rameses.gov.etracs.waterworks.models.WaterworksBillFormReportModel");            
        }

        return true;
    }

    int sendPrint(  def o ) {
        o.batchid = info.batchid;
        def items = printingSvc.getPrintList(o);
        if(!items) return 0;
        if(startno!=null) {
            items.each {
                it.billrefno = startno++;
            }                
        }
        reportOpener.handle.sendBatchPrint( items );
        reportOpener.outcome = "preview";
        Modal.show( reportOpener );
        printingSvc.updateBillPrinted( [items:items] );        
        return items.size();
    }




}	