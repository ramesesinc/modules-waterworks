package com.rameses.gov.etracs.waterworks.models;

import com.rameses.rcp.annotations.*;
import com.rameses.rcp.common.*;
import com.rameses.osiris2.client.*;
import com.rameses.osiris2.common.*;
import com.rameses.rcp.annotations.*;
import com.rameses.seti2.models.*;
import com.rameses.util.*;

public class WaterworksChangeRequestModel extends WorkflowTaskModel {
    
	def meterStates = ["ACTIVE","DISCONNECTED","DEFECTIVE"];
	def classTypes;

        String getTitle() {
            return "Change Request - " + entity.apptype; 
        }
    
    
	@PropertyChangeListener
	def propListener = [
            "entity.account" : { o->
                entity.acctid = o.objid;
                entity.acctinfoid = o.acctinfoid;

                def m = [_schemaname: "vw_waterworks_account_info" ];
                m.findBy = [objid: entity.acctinfoid ];
                entity.account = queryService.findFirst( m );
                entity.account.acctno = o.acctno;
                //entity.account.meterid = entity.account.meter?.objid;

                if(entity.apptype == "CHANGE_ATTRIBUTES" && entity.account.attributes) {
                        entity.newaccount.attributes.addAll( entity.account.attributes );		
                };
                else if(entity.apptype == "CHANGE_CLASSIFICATION") {
                        entity.account.classificationid = entity.account.classification.objid		
                };
                else if(entity.apptype == "CHANGE_CONTACT") {
                        entity.newaccount.mobileno = entity.account.mobileno;       
                        entity.newaccount.email = entity.account.email;       
                        entity.newaccount.phoneno = entity.account.phoneno;                           
                }; 
                else if(entity.apptype == "CHANGE_METER") {
                    m = [_schemaname: "waterworks_consumption" ];
                    m.findBy = [acctid: entity.account.objid, meterid: entity.account.meterid ];
                    m.orderBy = "year DESC, month DESC";
                    def r = queryService.findFirst( m );
                    entity.account.meter.reading = r.reading;
                }
            },
            "entity.newaccount.meter" : { o->
                    if(o==null) {
                        entity.newaccount.meterid = null;
                    }
                    else {
                        entity.newaccount.meterid = o.objid;
                        entity.newaccount.meter.size = entity.newaccount.meter.size.title;
                        entity.newaccount.meterstate = 'ACTIVE';
                    }
            },
            "entity.newaccount.classification" : { o->
                entity.newaccount.classificationid = o?.objid;
            },
            "entity.newaccount.owner" : { o->
                entity.newaccount.acctname = o.name;
            },
            "entity.newaccount.subarea" : { o->
                entity.newaccount.stubout = null;
                entity.newaccount.subareaid = o?.objid;
            },
            "entity.newaccount.stubout" : { o->
                entity.newaccount.stuboutid = o?.objid;
            },
        
	];

	//we are doing this becuase of a not good implementation of the WorfklowTaskList
	public String getSchemaName() {
            if(mode=="create") {
                    return "waterworks_change_request";
            }
            else {
                    return "vw_waterworks_change_request";
            }
	}

	public void afterCreate() {
            entity.apptype = invoker.properties.apptype;
            entity.account = [:];
            entity.newaccount = [units:1];
            if( entity.apptype == "CHANGE_ADDRESS" ) {
                    entity.newaccount.address = [:];
            };
            else if( entity.apptype == "CHANGE_OWNER" ) {
                    entity.newaccount.owner = [:];
            };
            else if( entity.apptype == "CHANGE_ATTRIBUTES" ) {
                    entity.newaccount.attributes = [];
            };
            else if( entity.apptype == "CHANGE_METER" ) {
                    entity.newaccount.meter = [:];
            };
            else if( entity.apptype == "CHANGE_CLASSIFICATION") {
            	def m = [_schemaname: "waterworks_classification"];
            	m._limit = 100;
            	classTypes = queryService.getList( m );
            }
	}
    
    public void afterOpen() {
        //this is to fix the bug in the combo box
        classTypes = [ entity.newaccount.classification ];
    }

	//related to attributes
	def selectedAttribute;

    void addAttribute() {
        def p = [:]
        p.onselect = { o->
            if( entity.newaccount.attributes.contains(o.name) )
                throw new Exception("Attribute already added");
            entity.newaccount.attributes << o.name;    
        }
        Modal.show( "waterworks_attribute:lookup", p );
    }
    
    void removeAttribute() {
        if(!selectedAttribute) throw new Exception("Please select an attribute");
        entity.newaccount.attributes.remove(selectedAttribute);
    }

    def save() {
        if( entity.apptype == "CHANGE_ADDRESS" ) {
            if(!entity.newaccount.address) throw new Exception("Address entry is required");
        }
        else if( entity.apptype == "CHANGE_OWNER" ) {
            if(!entity.newaccount.owner) throw new Exception("Owner entry is required");
            if(entity.account.owner.objid ==entity.newaccount.owner.objid ) 
                throw new Exception("Please specify a different owner");
            
        }
        else if( entity.apptype == "CHANGE_ATTRIBUTES") {
            if(entity.account.attributes.sort{it} == entity.newaccount.attributes.sort{it}) 
                throw new Exception("Please make changes to the attributes");			
        }
        else if( entity.apptype == "CHANGE_METER") {
        	if( !entity.newaccount.meterid ) {
        		//if( entity.account.meterid ==null ) throw new Exception("Please specify a meter");
        		if(!MsgBox.confirm("This is an unmetered account. Are you sure you want to proceed?")) return;	
        	}	
        	else if( entity.newaccount.meterid == entity.account.meterid )
        		throw new Exception("Please select a different meter");
        }
        else if( entity.apptype == "CHANGE_CLASSIFICATION") {
            if(entity.account.classification.objid == entity.newaccount.classification.objid) 
                throw new Exception("Please select a different classification");			
        }
        else if( entity.apptype == "CHANGE_CONTACT") {
            def b1 = (entity.account.mobileno == entity.newaccount.mobileno);
            def b2 = (entity.account.email == entity.newaccount.email);
            def b3 = (entity.account.phoneno == entity.newaccount.phoneno);
            if(b1 && b2 && b3 )
                throw new Exception("There are no changes made in the contact information.");
        }
    	super.save();
        def op = Inv.lookupOpener("waterworks_change_request:open", [entity:entity] );  
        op.target = "topwindow";
        return op;
    }

    def getLookupStubout() {
        if( !entity.newaccount.subarea?.objid ) throw new Exception("Please select subarea first");
        def p = [:];
        p.put("query.subareaid", entity.newaccount.subarea.objid);
        return Inv.lookupOpener("waterworks_stubout:lookup", p );
    }
    

}