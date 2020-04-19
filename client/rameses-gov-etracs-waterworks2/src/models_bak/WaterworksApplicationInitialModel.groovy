package com.rameses.gov.etracs.waterworks.models;

import com.rameses.rcp.annotations.*;
import com.rameses.rcp.common.*;
import com.rameses.osiris2.client.*;
import com.rameses.osiris2.common.*;
import com.rameses.rcp.annotations.*;
import com.rameses.seti2.models.*;
import com.rameses.util.*;

public class WaterworksApplicationInitialModel {
    
    @Service("WaterworksApplicationService")
    def appSvc; 

    @Service("DateService")
    def dateSvc; 

    @Service("QueryService")
    def querySvc; 
    
    @Service("ListService")
    def listSvc; 

    @Binding
    def binding;
    
    @Controller
    def workunit;
    
    def entity;
    def acctno;
    
    String title;
    def classificationTypes;
    
    @PropertyChangeListener 
    def h = [
        "entity.owner" : { o->
            entity.acctname = o.name;
            binding.refresh("entity.acctname");
        }
    ];
    
    public String getPagename() {
        return workunit.workunit.currentPage.name;
    }
    
    
    def create(def inv) {
        entity = [address:[:], info:[:]];
        entity.apptype = inv.properties.apptype
        entity.appdate = dateSvc.getServerDate();
        if( entity.apptype == "NEW" ) {
            title = "New Connection Application";
            classificationTypes = listSvc.getList([name:"waterworks_classification"]);
            return "initial";            
        } 
        else {
            title = entity.apptype + " Application";
            return "search";
        }
    }
    
    def searchAccount() {
        entity = appSvc.findAccount( [acctno: acctno, apptype: entity.apptype ] )
        return "entry";
    }
    
    def save() {
        entity = appSvc.create( entity );
        def op = Inv.lookupOpener("waterworks_application:open", [entity: entity]);
        op.target = "topwindow";
        return op;
    }
    
}