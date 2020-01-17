package com.rameses.gov.etracs.waterworks.models;

import com.rameses.rcp.annotations.*;
import com.rameses.rcp.common.*;
import com.rameses.osiris2.client.*;
import com.rameses.osiris2.common.*;
import com.rameses.seti2.models.*;
import java.text.*;

public class AccountModel extends CrudFormModel {
    
    def dateFormatter = new java.text.SimpleDateFormat('yyyy-MM-dd'); 
    def meterStates;
    
    
    void afterCreate() {
        entity.address = [:];
        entity.attributes = [];
        entity.units = 1;
        entity.meter = [:];
        entity.stuboutnode = [:];
    }

    def edit() {
        return showDropdownMenu("edit");
    }
    
    //***************************************************************************
    def selectedAttribute;
    def attributeList = [
        fetchList: { o->
            def m = [_schemaname:'waterworks_account_attribute'];
            m.findBy = [parentid: entity.objid];
            return queryService.getList(m);
        }
    ] as BasicListModel;
    
    void addAttribute() {
        def p = [:]
        p.onselect = { o->
            def m = [_schemaname:'waterworks_account_attribute'];
            m.parent = entity;
            m.attribute = o;
            persistenceService.create( m );
            attributeList.reload();
        }
        Modal.show( "waterworks_attribute:lookup", p );
    }
    
    void removeAttribute() {
        if(!selectedAttribute) throw new Exception("Please select an attribute");
        def m = [_schemaname:'waterworks_account_attribute'];
        m.findBy = [objid: selectedAttribute.objid];
        persistenceService.removeEntity( m );
        attributeList.reload();
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
    ];
    
    //consumption
    def consumptionViewOption = 1;
    def consumptionList;
    def consumptionFilter;
    def getConsumptionQuery(){
        consumptionFilter = [:];
        consumptionFilter.options = [
            "acctid = :acctid",
            "acctid = :acctid AND (hold=1 OR (amount-discount-amtpaid) > 0)",
            "acctid = :acctid AND (amount-discount-amtpaid) = 0"
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
    
    
    
}