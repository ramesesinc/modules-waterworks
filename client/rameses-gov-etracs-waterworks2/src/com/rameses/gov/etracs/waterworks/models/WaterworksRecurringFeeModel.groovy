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
        entity.amtpaid = 0;
        entity.balance = 0;
        entity.term = 0;
    }

    def getEntityQry() {
        return [objid: entity.objid];
    }

    void calcInstallmentAmt(term) {
    	if( !term ) return;
    	entity.installmentamount = Math.round( ((entity.amount-entity.amtpaid) * 100)/ term  )/100;
    }

    @PropertyChangeListener
    def listener = [
    	"entity.type" : { o->
    		if(o != "installment") {
    			entity.term = 0;
    			entity.installmentamount = 0;    				
    		}		
    	},
    	"entity.term" : { term->
    		calcInstallmentAmt(term);
    		binding.refresh("entity.installmentamount");
    	},
    	"entity.(amount|amtpaid)" : { amt ->
    		entity.balance = entity.amount - entity.amtpaid;
    		calcInstallmentAmt(entity.term);
    		binding.refresh("entity.(installmentamount|balance)");
    	}   	
    ]


}