package com.rameses.gov.etracs.waterworks.models;

import com.rameses.rcp.annotations.*;
import com.rameses.rcp.common.*;
import com.rameses.osiris2.client.*;
import com.rameses.osiris2.common.*;
import com.rameses.seti2.models.*;
import java.text.*;

public class WaterworksAccountModel extends CrudFormModel {
    
    @Service("WaterworksAccountService")
    def acctSvc;
    
    def dateFormatter = new java.text.SimpleDateFormat('yyyy-MM-dd'); 
    
    def meterStates = ["ACTIVE","DISCONNECTED","DEFECTIVE"];
    
    void afterCreate() {
        entity.address = [:];
        entity.attributes = [];
        entity.units = 1;
        entity.meter = [:];
    }
    
    void afterOpen() {
        if(entity.attributes==null) entity.attributes = [];
    }
    
    boolean isEditAllowed() {
        return (entity.state == "DRAFT" && mode!="edit");
    }
    
    //***************************************************************************
    def selectedAttribute;

    void addAttribute() {
        def p = [:]
        p.onselect = { o->
            if( entity.attributes.contains(o.name) )
                throw new Exception("Attribute already added");
            entity.attributes << o.name;    
        }
        Modal.show( "waterworks_attribute:lookup", p );
    }
    
    void removeAttribute() {
        if(!selectedAttribute) throw new Exception("Please select an attribute");
        entity.attributes.remove(selectedAttribute);
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
            "acctid = :acctid AND (amount-discount-amtpaid) > 0  ",
            "acctid = :acctid AND (amount-discount-amtpaid) = 0 AND amtpaid > 0 "
        ];
        consumptionFilter.acctid = entity.objid;
        consumptionFilter.where = consumptionFilter.options[consumptionViewOption] ;
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
            "acctid = :acctid AND (amount-discount-amtpaid) = 0 AND amtpaid > 0"
        ];
        otherFeeFilter.acctid = entity.objid;
        otherFeeFilter.where = otherFeeFilter.options[otherFeeViewOption] ;
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
    
    void approve() {
        if(!MsgBox.confirm("You are about to approve this account. The data cannot be edited anymore. Proceed?")) return;
        acctSvc.approve( [acctid: entity.objid ] );
        MsgBox.alert("Account successfully approved");
    }
    
    void deactivate() {
        acctSvc.deactivate( [acctid: entity.objid ] );
    }
    
}