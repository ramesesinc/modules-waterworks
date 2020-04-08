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
   
   @Service("WaterworksBillService")
   def billSvc;
   
   def billDispatcher = ManagedObjects.instance.create(BillDispatcherReceipt.class);
   def billPrinter = ManagedObjects.instance.create(WaterworksBillingPrinterModel.class);
   
   def selectedItem;
   
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
        return "Sub Area " + entity.subarea?.code + " " + entity.year + "-" +  entity.monthname + " (" + task.title + ")";
   } 
    
   def getViewtype() {
        if(task.state.matches("draft|for-review")) {
            //return "billing";
            return "reading";
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
            billSvc.process( o );
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
            //if(task?.state != "for-reading") return false;
            if (colName == "reading" && item.meterid!=null) {
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
                itemHandler.refreshSelectedItem();
            }
        },
        isForceUpdate: {
            return true; 
        }    
    ] ;
   
   def calcConsumption( def item ) {
        def z = [:];
        z.acctid = item.acctid;
        z.consumptionid = item.consumptionid;
        z.meterstate = item.meterstate;
        z.prevreading = item.prevreading;
        z.reading = item.reading;
        z.volume = item.volume;
        return compSvc.compute(z);
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
    
    
    
   void printBillDispatcherReceipt() {
       billDispatcher.buildReport([ batchid: entity.objid ]); 
   } 
   
    def showMenuActions( inv ) { 
        def selItem = null; 
        def menus = null; 
        def invtype = inv.properties.type;
        if ( hasCallerProperty('selectedItem')) { 
            selItem = caller.selectedItem; 
            if ( hasCallerMethod('getContextMenuList')) { 
                menus = caller.getContextMenuList(); 
            }
        }
        if ( !menus ) return null; 
        def ops = new PopupMenuOpener(); 
        
        def createMenuAction = { menu, data ->
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
        };
       
        menus.each{ ops.add( createActionMenu( it, selItem )); }
        return ops;
    }
   
   
}