package com.rameses.gov.etracs.waterworks.models;

import com.rameses.rcp.annotations.*;
import com.rameses.rcp.common.*;
import com.rameses.osiris2.client.*;
import com.rameses.osiris2.common.*;
import com.rameses.seti2.models.*;
import java.text.*;

public class WaterworksItemAccountModel extends CrudFormModel {

    def selectedItem;
    def listHandler;
    
    def addMapping() {
        def h = { o->
            def m = [_schemaname: "waterworks_itemaccount_mapping"];
            m.itemacctid = entity.objid;
            m.item = o;
            persistenceService.create(m);
            listHandler.reload();
        }
        return Inv.lookupOpener("revenueitem:lookup", [onselect: h] );
    }
    
    def removeMapping() {
        if( !selectedItem ) throw new Exception("Please specify selected Item");
        def m = [_schemaname: "waterworks_itemaccount_mapping"];
        m.objid = selectedItem.objid;
        persistenceService.removeEntity(m);
        listHandler.reload();
    }

}