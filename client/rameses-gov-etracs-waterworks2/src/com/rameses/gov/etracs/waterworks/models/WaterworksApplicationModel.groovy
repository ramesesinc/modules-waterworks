package com.rameses.gov.etracs.waterworks.models;

import com.rameses.rcp.annotations.*;
import com.rameses.rcp.common.*;
import com.rameses.osiris2.client.*;
import com.rameses.osiris2.common.*;
import com.rameses.rcp.annotations.*;
import com.rameses.seti2.models.*;
import com.rameses.util.*;

public class WaterworksApplicationModel extends WorkflowTaskModel {
    
    @Service("WaterworksApplicationService")
    def appSvc;
    
    @Service("PersistenceService")
    def persistenceSvc;
    
    @Service("QueryService")
    def querySvc;
    
    def classTypes;

    String getTitle() {
        if( mode == "create" ) {
            return "Application (" + entity.apptype + ")";
        }
        else {
            return "Application (" + entity.apptype + ") " + entity.appno + " [" + task.title + "]";
        }
    }
    
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
        entity.materials = [];
        entity.apptype = invoker.properties.apptype;
    }
    
    public void afterOpen() {
        //MsgBox.alert("task is " + task?.state);
    }
    
    boolean beforeSignal( def param  ) {
        if(param.taskstate=="releasing" && param.action=="release" ) {
            def subareaId = entity.account.subareaid;
            if( !subareaId ) throw new Exception("Please specify subarea");
            boolean pass = false;        
            def h = { o->
                param.info = [:];
                param.info.year = o.year;
                param.info.month = o.month;
                param.info.reading = o.reading;
                if( o.seqno ) param.info.seqno = o.seqno;
                pass = true;
            }
            Modal.show( "waterworks_application:approval", [ handler:h, subareaid: subareaId, apptype: entity.apptype ] );
            return pass;                
        }
        else {
            return true;
        }
    }
    
    public void afterSignal( def transition, def tsk ) {
        super.afterSignal(transition, tsk);
        if( tsk.state == 'end' ) {
            MsgBox.alert("Account no. " + tsk.acctno  + " is successfully created. ");
        }
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

    void updateAcctInfo( def u ) {
        def m = [_schemaname: "waterworks_account_info"];
        m.findBy = [objid: entity.acctinfoid];
        m.putAll( u );
        persistenceSvc.update( m );
    }
    
    def changeSubArea() {
        def s = { o->
            entity.account.subareaid = o.objid;
            entity.account.subarea = o;
            entity.account.stubout = null;
            entity.account.stuboutid = null;
            updateAcctInfo( [subareaid: o.objid, subarea:o, stubout: null, stuboutid: null ] )
            binding.refresh();
        }
        def op= Inv.lookupOpener("waterworks_subarea:lookup", [onselect:s]);
        op.target = "popup";
        return op;
    }

    def changeStubout() {
        if( !entity.account.subareaid ) throw new Exception("Please select subarea first");
        def p = [:];
        p.put("query.subareaid", entity.account.subareaid );
        p.onselect = { o->
            entity.account.stuboutid = o.objid;
            entity.account.stubout = o;
            updateAcctInfo( [stuboutid: o.objid, stubout: o ] );
            binding.refresh();
        }
        return Inv.lookupOpener("waterworks_stubout:lookup", p );
    }

    def changeMeter() {
        def p = [:];
        p.onselect = { o->
            entity.account.meterid = o.objid;
            entity.account.meter = o;
            entity.account.meterstate = "ACTIVE";
            updateAcctInfo( [meterid: o.objid, meter: o, meterstate: "ACTIVE" ] );            
            binding.refresh();
        }
        return Inv.lookupOpener("waterworks_meter_wo_account:lookup", p );
    }
    
    def getEntityQry() {
        return [appid: entity.objid];
    }
    
    //ASSESSMENT FUNCTIONS
    def feeListModel = [:];
    void assess() {
        def r = appSvc.buildFees(getEntityQry()); 
        entity.total = r.total;
        feeListModel.reload();
        binding.refresh("entity.total");
    }
    
    void clearFees() {
        def r = appSvc.clearFees(getEntityQry()); 
        entity.total = r.total;
        feeListModel.reload();
        binding.refresh("entity.total");
    }
    
    
    def requirementListModel = [];
    
    def showBillOfMaterials() {
        return Inv.lookupOpener("waterworks_bill_of_materials:view", [entity:entity]);
    }
    
    def save() {
        super.save();
        def op = Inv.lookupOpener("waterworks_application:open", [entity: [objid:entity.objid]]);
        op.target = "topwindow";
        return op;
    }
    
    def getLookupDisconnected() {
        def h = { o->
            entity.acctid = o.objid;
            entity.acctno = o.acctno;
            entity.acctinfoid = o.remove("acctinfoid");
            def m = [_schemaname: "vw_waterworks_account_info"];
            m.findBy = [objid: entity.acctinfoid ];
            entity.account = querySvc.findFirst( m );
            binding.refresh();
        }
        def op = Inv.lookupOpener("vw_waterworks_account_disconnected:lookup", [onselect:h] );
        op.target = "popup";
        return op;
    }
    
}