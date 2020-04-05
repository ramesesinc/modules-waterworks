package com.rameses.gov.etracs.waterworks.models;

import com.rameses.rcp.annotations.*;
import com.rameses.rcp.common.*;
import com.rameses.osiris2.client.*;
import com.rameses.osiris2.common.*;
import com.rameses.seti2.models.*;
import com.rameses.osiris2.report.*;
import com.rameses.rcp.framework.*;


public class WaterworksLedgerModel extends CrudFormModel {
   
    boolean isEditAllowed() {
        if( entity.billed == 1 ) {
            return false;
        }
        return super.isEditAllowed();
    }
    
    void afterCreate() {
        def parent = caller.entity;
        entity.acctid = parent.objid;
        entity.system = 0;
    }
    
}