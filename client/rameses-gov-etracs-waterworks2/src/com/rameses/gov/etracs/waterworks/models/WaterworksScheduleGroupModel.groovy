package com.rameses.gov.etracs.waterworks.models;

import com.rameses.rcp.annotations.*;
import com.rameses.rcp.common.*;
import com.rameses.osiris2.client.*;
import com.rameses.osiris2.common.*;
import com.rameses.seti2.models.*;
import java.text.*;

public class WaterworksAccountModel extends CrudFormModel {
    
    def periodList;
    def addPeriod() {
        
        def h = { o->
            periodList.reload();
        }
        
        return Inv.lookupOpener("waterworks_billing_period:create", [onselect:h, scheduleid:entity.objid] );
    }
    
}