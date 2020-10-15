package com.rameses.gov.etracs.waterworks.models;

import com.rameses.rcp.annotations.*;
import com.rameses.rcp.common.*;
import com.rameses.osiris2.client.*;
import com.rameses.osiris2.common.*;
import com.rameses.seti2.models.*;
import com.rameses.osiris2.report.*;
import com.rameses.rcp.framework.*;


public class WaterworksRecurringFeeModel extends CrudFormModel {
   
    def types = ["once", "always" ];

    void afterCreate() {
        entity.amount = 0;
        entity.amtbilled = 0;
        entity.balance = 0;
        entity.acctid = caller.entity.objid;
        entity.state = "DRAFT";
    }

     boolean isEditAllowed() {
        if( entity.state != "DRAFT" ) {
            return false;
        }
        return super.isEditAllowed();
    }

    def getEntityQry() {
        return [objid: entity.objid];
    }

    

    void activate() {
        if(!MsgBox.confirm("You are about to activate this item. Updates cannot be made once activated. Proceed?")) return;
        def m = [_schemaname: schemaName];
        m.findBy = [objid: entity.objid ];
        m.state = "ACTIVE";
        persistenceService.update( m );
        entity.state = "ACTIVE";   
    }


}