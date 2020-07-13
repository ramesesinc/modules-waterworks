package com.rameses.gov.etracs.waterworks.models;

import com.rameses.rcp.annotations.*;
import com.rameses.rcp.common.*;
import com.rameses.osiris2.client.*;
import com.rameses.osiris2.common.*;
import com.rameses.rcp.annotations.*;
import com.rameses.seti2.models.*;
import com.rameses.util.*;

public class WaterworksBillOfMaterialsModel  {

    @Service("QueryService")
    def queryService;
    
    @Service("PersistenceService")
    def persistenceService;

    def entity;
    
    def selectedBom;
    def bomList;
    
    def init() {
        bomList = [];
        /*
        def m = [_schemaname: "waterworks_bill_of_materials"];
        m.findBy = [appid: entity.objid];
        bomList = queryService.getList( m );
        */
    }
    
    def bomListModel = [
        fetchList: { o->
            return bomList;
        },
        afterColumnUpdate: { itm,colName->
            if(colName=="item") {
                itm.unit = itm.item.unit;
                itm.price = itm.item.price;
                itm.qty = 1;
                itm.amount = itm.qty * itm.price;
            }
            else if( colName == "qty") {
                itm.amount = itm.qty * itm.price;                
            }
        },
        onAddItem: { o->
            bomList.add( o );
        },
        onRemoveItem: { o->
            bomList.remove( o );
        }
    ] as EditorListModel;
    
    def doOk() {
        MsgBox.alert("save the materials");
        
    }
    
    def doCancel() {
        return "_close";
    }
    
}