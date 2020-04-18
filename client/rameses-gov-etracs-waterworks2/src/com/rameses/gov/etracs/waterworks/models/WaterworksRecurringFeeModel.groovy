package com.rameses.gov.etracs.waterworks.models;

import com.rameses.rcp.annotations.*;
import com.rameses.rcp.common.*;
import com.rameses.osiris2.client.*;
import com.rameses.osiris2.common.*;
import com.rameses.seti2.models.*;
import com.rameses.osiris2.report.*;
import com.rameses.rcp.framework.*;


public class WaterworksRecurringFeeModel extends CrudFormModel {
   
    def types = ["once", "installment", "always" ];

    void afterCreate() {
        entity.amount = 0;
        entity.amtbilled = 0;
        entity.balance = 0;
        entity.principal = 0;
        entity.term = 0;
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

    
    @PropertyChangeListener
    def listener = [
    	"entity.type" : { o->
    		if(o != "installment") {
    			entity.term = 0;
    			entity.installmentamount = 0;   
                entity.principal = entity.amount; 				
    		}		
    	},
    	"entity.(principal|term)" : { o->
    		if(!entity.term ) return;
            if(!entity.principal) return;
            entity.installmentamount = Math.round( (entity.principal * 100)/ entity.term  )/100;
    		binding.refresh("entity.installmentamount");
    	},
    	"entity.(amount|amtbilled)" : { amt ->
    		entity.balance = entity.amount - entity.amtbilled;
    		binding.refresh("entity.balance");
    	}   	
    ];

    void activate() {
        if(!MsgBox.confirm("You are about to activate this item. Updates cannot be made once activated. Proceed?")) return;
        def m = [_schemaname: schemaName];
        m.findBy = [objid: entity.objid ];
        m.state = "ACTIVE";
        persistenceService.update( m );
        entity.state = "ACTIVE";   
    }


}