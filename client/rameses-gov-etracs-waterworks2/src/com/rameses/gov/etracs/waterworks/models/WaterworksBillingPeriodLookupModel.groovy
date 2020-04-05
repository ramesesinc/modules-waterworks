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

public class WaterworksBillingPeriodLookupModel  {
    
    @Caller
    def caller;
    
    @Service("WaterworksScheduleService")
    def schedSvc;

    def scheduleid;
    int year;
    int month;
    def onselect;

    void create() {
        scheduleid = "caller is " + caller.entity.objid;
        onselect = { o->
            caller.reload();
        }
    }
    
    def doOk() {
        def sked = schedSvc.getSchedule( [scheduleid: scheduleid, year: year, month: month ]  );
        if(!sked) throw new Exception("Schedule not defined. Please check the rules");
        if(onselect) {
            onselect( sked );
        }
        return "_close";
    }

    def doCancel() {
        return "_close";
    }
    
}
