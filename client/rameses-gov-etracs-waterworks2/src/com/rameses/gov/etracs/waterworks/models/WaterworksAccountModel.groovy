package com.rameses.gov.etracs.waterworks.models;

import com.rameses.rcp.annotations.*;
import com.rameses.rcp.common.*;
import com.rameses.osiris2.client.*;
import com.rameses.osiris2.common.*;
import com.rameses.seti2.models.*;
import java.text.*;

public class WaterworksAccountModel extends CrudFormModel {
    
    def dateFormatter = new java.text.SimpleDateFormat('yyyy-MM-dd'); 
    
    def meterStates = ["ACTIVE","DISCONNECTED","DEFECTIVE"];
    
    void afterCreate() {
        entity.address = [:];
        entity.attributes = [];
        entity.units = 1;
        entity.meter = [:];
        entity.stuboutnode = [:];
    }

    /*
    def edit() {
        return showDropdownMenu("edit");
    }
    */
    
    boolean isEditAllowed() {
        return (entity.state == "DRAFT" && mode!="edit");
    }
    
    //***************************************************************************
    def selectedAttribute;

    void addAttribute() {
        def p = [:]
        p.onselect = { o->
            if( entity.attributes.find{ it.attribute.name == o.name  } )
                throw new Exception("Attribute already added");
            def mm = [attribute: o, parent: [objid: entity.objid] ];
            addItem("attributes", mm );
        }
        Modal.show( "waterworks_attribute:lookup", p );
    }
    
    void removeAttribute() {
        if(!selectedAttribute) throw new Exception("Please select an attribute");
        removeItem( "attributes", selectedAttribute );
    }
    
    /******************************************************************************
    //List Options
    ******************************************************************************/
    @PropertyChangeListener 
    def h = [
        "consumptionViewOption" : {o->
            consumptionFilter.where = consumptionFilter.options[o];
            consumptionList.reload();
        },
        "otherFeeViewOption" : {o->
            otherFeeFilter.where = otherFeeFilter.options[o];
            otherFeeList.reload();
        },  
        "entity.owner": { o->
            if(!entity.acctname) entity.acctname = o.name;
            binding.refresh("entity.acctname");
        },
        "entity.subarea" : { o->
            entity.stubout = null;
            binding.refresh("entity.stubout");
        }
    ];
    
    //consumption
    def consumptionViewOption = 1;
    def consumptionList;
    def consumptionFilter;
    def getConsumptionQuery(){
        consumptionFilter = [:];
        consumptionFilter.options = [
            "acctid = :acctid",
            "acctid = :acctid AND (hold=1 OR (amount-discount-amtpaid) > 0) AND state='POSTED' ",
            "acctid = :acctid AND (amount-discount-amtpaid) = 0 AND amtpaid > 0 AND state='POSTED' "
        ];
        consumptionFilter.acctid = entity.objid;
        consumptionFilter.where = consumptionFilter.options[1] ;
        return consumptionFilter;
    }
    
    def viewConsumptionPayment() {
        if( !consumptionList.selectedItem?.item ) throw new Exception("Please select consumption");
        return viewPayments( consumptionList.selectedItem?.item );
    }
    
    //other fee
    def otherFeeViewOption = 1;
    def otherFeeList;
    def otherFeeFilter;
    def getOtherFeeQuery(){
        otherFeeFilter = [:];
        otherFeeFilter.options = [
            "acctid = :acctid",
            "acctid = :acctid AND  (amount-discount-amtpaid) > 0",
            "acctid = :acctid AND (amount-discount-amtpaid) = 0"
        ];
        otherFeeFilter.acctid = entity.objid;
        otherFeeFilter.where = otherFeeFilter.options[1] ;
        return otherFeeFilter;
    }
    
    def viewOtherFeePayment() {
        if( !otherFeeList.selectedItem?.item ) throw new Exception("Please select other fee");
        return viewPayments( otherFeeList.selectedItem?.item );
    }
    
    def viewPayments(def ref) {
        def p = [:];
        p.query = [refid: ref.objid];
        return Inv.lookupOpener("waterworks_payment_item:list", p );
    }
    
    def getLookupStubout() {
        if( !entity.subarea?.objid ) throw new Exception("Please select group first");
        def p = [:];
        p.put("query.subareaid", entity.subarea.objid);
        return Inv.lookupOpener("waterworks_stubout:lookup", p );
    }
    
    def getEntityQry() {
        return [objid: entity.objid];
    }
    
    
    void changeState( def state, def action ) {
        def m = [_schemaname:schemaName];
        m.objid = entity.objid;
        m.state = state;
        m.action = action;
        persistenceService.update( m );
        entity.state = state;        
    }
    
    void approve() {
        if(!MsgBox.confirm("You are about to approve this account. The data cannot be edited anymore. Proceed?")) return;
        changeState( "ACTIVE", "approve");
        MsgBox.alert("Account successfully approved");
    }
    
    void deactivate() {
        changeState("DRAFT","deactivate");
    }
    
}