package com.rameses.gov.etracs.waterworks.models;

import com.rameses.rcp.annotations.*;
import com.rameses.rcp.common.*;
import com.rameses.osiris2.client.*;
import com.rameses.osiris2.common.*;
import com.rameses.seti2.models.*;
import com.rameses.osiris2.report.*;
import com.rameses.rcp.framework.*;
import java.text.*;

public class WaterworksBillingPrinterModel  {
    
   @Service("WaterworksBatchBillPrintingService")
   def printSvc;
   
   boolean hasDate = false; 
     
   def printerService = new PrinterService();
    
    def getPrinterList() {
       return printerService.getPrinters(); 
   }
   
   def cancelPrint = false;
   
   public void printBill() {
       def onprint = { printerName, text -> 
           if ( text ) {
               printerService.printString(printerName, text.toString() );
           } 
       }
       printBillImpl( null, onprint ); 
   }
   
    public void printBillImpl( optionMap, onPrintHandler ) {
        boolean pass = false;
        def printerName = null;
        def startbillno = null;
        def startseqno = null;
        def acctno = optionMap?.acctno; 
        def previewOnly = (optionMap?.previewOnly ? true : false); 
        if ( previewOnly ) {
            startbillno = 1; 
        }
        else {
            def h = [data: [acctno: optionMap?.acctno]];
            h.handler = { v->
                if ( v.billno == null ) throw new Exception("Start Bill No. is required"); 
                if ( v.billno <= 0 ) throw new Exception("Start Bill No. must be greater than zero"); 

                printerName = v.printername; 
                startbillno = v.billno;
                startseqno = v.seqno;
                acctno = v.acctno;
                pass = true; 
            } 
            h.fields = [];
            h.fields << [name:"printername", caption:'Select Printer', type:'combo', required:true, itemsObject:getPrinterList() ];
            h.fields << [name:"billno", caption:'Start Bill No.', type:'integer', required:true ];
            h.fields << [name:"seqno", caption:'Start Seq No.', type:'integer', enabled:(acctno ? false : true)];
            h.fields << [name:"acctno", caption:'Account No.', type:'text', enabled:(acctno ? false : true)];
            Modal.show("dynamic:form", h, [title: 'Start Bill Printing'] );
            if ( !pass ) return; 
        }
       
        def counter = 0; 
        def parm = [ 
            batchid: entity.objid, refbillno: startbillno, 
            startseqno: startseqno, acctno: acctno, previewOnly: previewOnly
        ]; 
        while ( true ) { 
            if ( cancelPrint ) break;

            def res = printSvc.process( parm );
            def list = res.list; 
            if ( !list ) break; 
            if ( cancelPrint ) break; 

            if ( onPrintHandler ) { 
                list.each { 
                    onPrintHandler( printerName, it ); 
                } 
            } 

            counter++; 
            if ( previewOnly ) {
                break; 
            }
            else if ( acctno ) {
                break;
            }
            
            waitPrintProc(); 
            parm.refbillno = res.refbillno; 
            parm.printed_list = res.printed_list; 
        } 

        if ( cancelPrint ) { 
            MsgBox.alert("printing has been cancelled");
        } else if ( counter == 0 ) { 
            MsgBox.alert("No available records that matches the criteria for printing. Please verify");
        } else if ( !previewOnly ) { 
            MsgBox.alert("printing finished");
        } 
    } 
    
    private void waitPrintProc() {
        try { 
            new java.util.concurrent.LinkedBlockingQueue().poll(1, java.util.concurrent.TimeUnit.SECONDS);
        } catch (Throwable t) {
        }
    }
    
}