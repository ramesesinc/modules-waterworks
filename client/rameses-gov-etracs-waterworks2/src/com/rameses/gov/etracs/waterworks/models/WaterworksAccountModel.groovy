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
        entity.state = "DRAFT";
    }
    
    void afterOpen() {
        if(entity.attributes==null) entity.attributes = [];
    }
    
    boolean isEditAllowed() {
        if( entity.state != "DRAFT" ) {
            return false;
        }
        return super.isEditAllowed();
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
        "ledgerViewOption" : {o->
            ledgerFilter.where = ledgerFilter.options[o];
            ledgerList.reload();
        },  
        "entity.owner": { o->
            if(!entity.acctname) entity.acctname = o.name;
            binding.refresh("entity.acctname");
        },
        "entity.subarea" : { o->
            entity.stubout = null;
            binding.refresh("entity.stubout");
        },
        "paymentViewOption" : { o->
            paymentFilter.where = paymentFilter.options[o];    
            paymentList.reload();
        }
    ];
    
    def getLookupStubout() {
        if( !entity.subarea?.objid ) throw new Exception("Please select group first");
        def p = [:];
        p.put("query.subareaid", entity.subarea.objid);
        return Inv.lookupOpener("waterworks_stubout:lookup", p );
    }
    
    def getEntityQry() {
        return [objid: entity.objid];
    }

    /************************************************************************
    * RELATED TO LEDGER
    *************************************************************************/
    def ledgerItem;
    def ledgerViewOption = 1;
    def ledgerList;
    def ledgerFilter;
    def getLedgerQuery(){
        ledgerFilter = [:];
        ledgerFilter.options = [
            "acctid = :acctid",
            "acctid = :acctid AND  (amount-amtpaid) > 0",
            "acctid = :acctid AND (amount-amtpaid) = 0 AND amtpaid > 0"
        ];
        ledgerFilter.acctid = entity.objid;
        ledgerFilter.where = ledgerFilter.options[ledgerViewOption] ;
        return ledgerFilter;
    }
    
    def viewLedgerPayment() {
        if( !ledgerList.selectedItem?.item ) throw new Exception("Please select ledger item");
        def p = [:];
        p.query = [refid: ledgerList.selectedItem?.item.objid];
        return Inv.lookupOpener("waterworks_payment_item:list", p );
    }

    /************************************************************************
    * RELATED TO PAYMENT
    *************************************************************************/
    def paymentViewOption = 0;
    def paymentFilter;
    def paymentList;
    def paymentItem;
    def getPaymentQuery() {
        paymentFilter = [:];
        paymentFilter.acctid = entity.objid;
        paymentFilter.options = [
            " acctid=:acctid AND voided = 0 ", 
            " acctid = :acctid "
        ];
        paymentFilter.where = paymentFilter.options[paymentViewOption];
        return paymentFilter;
    }

    void excludeFromBatch() {
        def m = [_schemaname: entitySchemaName ];
        m.findBy = [objid: entity.objid];
        m.excludeinbatch = 1;
        persistenceService.update( m );
    }

    void includeInBatch() {
        def m = [_schemaname: entitySchemaName ];
        m.findBy = [objid: entity.objid];
        m.excludeinbatch = 0;
        persistenceService.update( m );
    }
    
}