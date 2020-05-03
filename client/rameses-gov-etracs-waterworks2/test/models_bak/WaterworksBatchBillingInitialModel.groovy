package com.rameses.gov.etracs.waterworks.models;

import com.rameses.rcp.annotations.*;
import com.rameses.rcp.common.*;
import com.rameses.osiris2.client.*;
import com.rameses.osiris2.common.*;
import com.rameses.seti2.models.*;
import com.rameses.osiris2.report.*;
import com.rameses.rcp.framework.*;
import java.text.*;
import com.rameses.util.*;

public class WaterworksBatchBillingInitialModel extends CrudFormModel {
    
   @Service("DateService")
   def dateSvc;

   @Service("WaterworksScheduleService")
   def schedSvc;
    
   @FormTitle
   String title = "Batch Billing";

   def getLookupSubarea() {
       def h = { o->
            if( o.period?.year == null ) throw new Exception("Please specify next period year in subarea");
            if( o.period?.month == null ) throw new Exception("Please specify next period month in subarea");
            if( o.schedulegroup?.objid == null ) throw new Exception("Please specify schedule group in subarea");
            entity.subarea = o;
            entity.year = o.period.year;
            entity.month = o.period.month;
            def sked = schedSvc.getSchedule( [year:entity.year, month:entity.month, scheduleid: o.schedulegroup.objid] );
            if(sked) {
                entity.readingdate = sked.readingdate;
                entity.period = sked;
            }
            binding.refresh();
       }
       return Inv.lookupOpener("waterworks_subarea:lookup", [onselect:h]);
    } 
    
    def processBill() {
       def z = [_schemaname:schemaName];
       z.putAll( entity );
       z.objid = null;
       z = persistenceService.create(z);
       if( !z.objid  ) return;
       
       MsgBox.alert( "Batch " + z.objid +  " is created" );
       
       def op = Inv.lookupOpener("waterworks_batch_billing:open", [entity: [objid:z.objid]]); 
       op.target = "topwindow";
       return op;
   } 
    
    
}
