package com.rameses.gov.etracs.waterworks.models;

import com.rameses.rcp.annotations.*;
import com.rameses.rcp.common.*;
import com.rameses.osiris2.client.*;
import com.rameses.osiris2.common.*;
import com.rameses.rcp.annotations.*;
import com.rameses.seti2.models.*;
import com.rameses.util.*;

public class WaterworksDisconnectionModel extends WorkflowTaskModel {
   

	def viewStatement() {
            return Inv.lookupOpener("waterworks_cashreceipt_statement", [entity: [objid: entity.billid ]] ); 
	}

        def save() {
            super.save();
            def op = Inv.lookupOpener("waterworks_disconnection:open", [entity: entity]);
            op.target = "topwindow";
            return op;
        }
    
    
}