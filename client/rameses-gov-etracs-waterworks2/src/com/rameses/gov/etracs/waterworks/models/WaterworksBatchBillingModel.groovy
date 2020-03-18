package com.rameses.gov.etracs.waterworks.models;

import com.rameses.rcp.annotations.*;
import com.rameses.rcp.common.*;
import com.rameses.osiris2.client.*;
import com.rameses.osiris2.common.*;
import com.rameses.seti2.models.*;
import com.rameses.osiris2.report.*;
import com.rameses.rcp.framework.*;
import java.text.*;


public class WaterworksBatchBillingModel extends WorkflowTaskModel {
    
   @Service("WaterworksComputationService")
   def compSvc;
    
   @Service("WaterworksBatchBillProcessorService")
   def batchSvc;
    
   @Service("WaterworksBatchBillPrintingService")
   def printSvc;
   
   def billDispatcher = ManagedObjects.instance.create(BillDispatcherReceipt.class);
   
   def selectedItem;
   
   boolean hasDate = false; 
     
   def printerService = new PrinterService();
   
   /*
    *   This method is used in style rule condition and DataTable column expression 
    */
   def getRoot() { 
       return this; 
   }
   
   def getQuery() {
        return [batchid: entity.objid];
   } 
    
   public String getTitle() {
        return "Sub Area " + entity.subarea?.code + " " + entity.year + "-" + String.format('%02d', entity.month) + " (" + task.title + ")";
   } 
    
   def getViewtype() {
        if(task.state.matches("draft|for-review")) {
            return "billing";
        }
        else {
            return "reading";
        }
   }
   
   public void afterSignal(def transition, def task) {
       itemHandler.reloadAll();
   }

   def stat;
   def progress = [
        getTotalCount : {
            if(stat==null) stat = batchSvc.getBilledStatus([ objid: entity.objid ]);
            return stat.totalcount;
        },
        fetchList: { o->
            o.batchid = entity.objid; 
            return batchSvc.getForBillingList( o );
        },
        processItem: { o->
            o.year = entity.year;
            o.month = entity.month;
            batchSvc.processBilling( o );
            binding.refresh('progressLabel');
        },
        onFinished: {
            binding.refresh();
        }
    ] as BatchProcessingModel;
   
    def itemHandler = [
        getContextMenu: { item, name-> 
            return getContextMenuList(item);
        }, 
        callContextMenu: { item, menuitem-> 
            menuitem.func( item );
        },
        isColumnEditable: {item,colName->
            if(task?.state != "for-reading") return false;
            if (colName == "reading") {
                return true; 
            }
            else if (colName == "volume" && item.meterstate == 'DEFECTIVE') {
                return true; 
            }
            else {
                return false; 
            }
        },
        onColumnUpdate: { item,colName->
            if(colName.matches("reading|volume")) {
                def res = calcConsumption(item);
                item.putAll(res);
            }
        },
        isForceUpdate: {
            return true; 
        }    
    ];
   
   def getContextMenuList(def item) {
        def mnuList = [];

        if(item.state == 'ERR') mnuList << [value: 'Fix Error']

        mnuList << [value: 'View Account', func: viewAccount];
        if ( task?.state.toString().matches('for-review|for-reading')) {
            mnuList << [value: 'Recompute Bill', func:rebill];
            mnuList << [value: 'Begin Balance', func: beginBalance];
        } 
        mnuList << [value: 'View Bill', func: viewBilling];
        
        if ( task?.state.toString().matches('for-reading|for-approval|approved')) {
            mnuList << [value: 'Edit', func: editBillFunc];
        }

        def meterid = item.meterid; 
        if( task?.state.toString().matches("for-reading")) { 
            if( item.hold == 0 ) mnuList << [value: 'Hold', func:hold]; 
            if( item.hold == 1 ) mnuList << [value: 'Activate', func:hold]; 
            mnuList << [value: 'Recompute', func: recomputeConsumption]; 
            mnuList << [value: 'Reset', func: resetConsumption]; 
        }
        mnuList << [value: 'View Account', func:viewAccount]; 
        mnuList << [value: 'View Consumption History', func: viewConsumptionHistory]; 
        
        if ( task?.state == "approved" ) { 
            boolean allowed = ( 
                item.hold.toString() != '1' &&  
                item.acctstate.toString() == 'ACTIVE' &&  
                item.meterstate.toString() != 'DISCONNECTED'
            ); 
            if ( allowed ) { 
                mnuList << [value: 'View Bill Receipt', func: viewBillReceipt]; 
            }
        } 
        return  mnuList; 
    }
    
    
    
    def hold = { item->
        def i = item.hold ? 0 : 1;
        def h = [:];
        h.data = [hold: i, objid: item.consumptionid ];
        h.fields = [];
        h._schemaname = "waterworks_consumption";
        h._log_schemaname = "waterworks_changelog";
        h._bypass_check_diff = true;
        //h.beforeSave = { o-> }
        h.handler = {item.hold = i;}
        Modal.show("changeinfo", h, [title: "Change Hold Status"]);
    }
    
   
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
    
   void printBillDispatcherReceipt() {
       billDispatcher.buildReport([ batchid: entity.objid ]); 
   } 
   
    def showMenuActions( inv ) { 
        MsgBox.alert("show menu action");
        def selItem = null; 
        def menus = null; 
        def invtype = inv.properties.type;
        if ( invtype == 'readingMenu' ) {
            if ( hasCallerProperty('selectedItem')) {
                selItem = caller.selectedItem; 
                if ( hasCallerMethod('getReadingHandlerList')) { 
                    menus = caller.getReadingHandlerList( selItem ); 
                }
            }

        } else if ( invtype == 'billingMenu' ) {
            if ( hasCallerProperty('selectedItem')) { 
                selItem = caller.selectedItem; 
                if ( hasCallerMethod('getContextMenuList')) { 
                    menus = caller.getContextMenuList(); 
                }
           }
        } 
       
        if ( !menus ) return null; 
       
        def ops = new PopupMenuOpener(); 
        menus.each{ ops.add( createActionMenu( it, selItem )); }
        return ops;
    }
   
    def createActionMenu( final menu, final data ) {
        return [
            getCaption: {
                return menu?.value.toString(); 
            }, 
            execute: { 
                if ( menu?.func ) { 
                    menu.func( data ); 
                } 
                return null; 
            } 
        ] as com.rameses.rcp.common.Action; 
    }
   
    private void waitPrintProc() {
        try { 
            new java.util.concurrent.LinkedBlockingQueue().poll(1, java.util.concurrent.TimeUnit.SECONDS);
        } catch (Throwable t) {
        }
    }
    
   
   
}