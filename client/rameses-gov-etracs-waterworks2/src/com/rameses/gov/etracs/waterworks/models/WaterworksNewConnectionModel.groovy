package com.rameses.gov.etracs.waterworks.models;

import com.rameses.rcp.annotations.*;
import com.rameses.rcp.common.*;
import com.rameses.osiris2.client.*;
import com.rameses.osiris2.common.*;
import com.rameses.rcp.annotations.*;
import com.rameses.seti2.models.*;
import com.rameses.util.*;

public class WaterworksNewConnectionModel extends WorkflowTaskModel {
    
	def classTypes;

    String title = "Application for New Connection";

    @PropertyChangeListener
    def listener = [
        "entity.account.owner" : { o->
            entity.account.acctname = o.name;
        }
    ]

    void afterInit() {
        def m = [_schemaname: "waterworks_classification"];
        m.select = "objid";
        m._limit = 100;
        classTypes = queryService.getList( m );        
    }

	public void afterCreate() {
        entity.account = [address:[:], attributes: [], units:1 ];
	}
    

	//related to attributes
	def selectedAttribute;

    void addAttribute() {
        def p = [:]
        p.onselect = { o->
            if( entity.account.attributes.contains(o.name) )
                throw new Exception("Attribute already added");
            entity.account.attributes << o.name;    
        }
        Modal.show( "waterworks_attribute:lookup", p );
    }
    
    void removeAttribute() {
        if(!selectedAttribute) throw new Exception("Please select an attribute");
        entity.account.attributes.remove(selectedAttribute);
    }

    def getLookupStubout() {
        if( !entity.account.subarea?.objid ) throw new Exception("Please select subarea first");
        def p = [:];
        p.put("query.subareaid", entity.account.subarea.objid);
        return Inv.lookupOpener("waterworks_stubout:lookup", p );
    }
    

}