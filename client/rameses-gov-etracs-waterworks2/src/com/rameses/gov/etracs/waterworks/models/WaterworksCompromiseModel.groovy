package com.rameses.gov.etracs.waterworks.models;

import com.rameses.rcp.annotations.*;
import com.rameses.rcp.common.*;
import com.rameses.osiris2.client.*;
import com.rameses.osiris2.common.*;
import com.rameses.rcp.annotations.*;
import com.rameses.seti2.models.*;
import com.rameses.util.*;

public class WaterworksCompromiseModel extends WorkflowTaskModel {
    
    @Service("WaterworksCompromiseService")
    def compSvc;
    
    def compromiseFeeModel;
    
    @PropertyChangeListener
    def listener = [
        "entity.downpaymentrate" : { o->
            if(o == null ) entity.downpaymentrate = 0;
            entity.downpayment = NumberUtil.round(entity.amount * entity.downpaymentrate);
            entity.principal = NumberUtil.round(entity.amount - entity.downpayment);
            binding.refresh("entity.principal");
        }
    ];
    
    public String getSchemaName() {
        if( mode == "create" ) {
            return "waterworks_compromise";
        }
        else {
            return "vw_waterworks_compromise";
        }
    }
    
    public String getTitle() {
        if( mode == "create" ) {
            return "New Compromise Agreement";
        }
        else {
            return "Compromise Agreement Control No." + entity.controlno + " (" + task.title + ")";
        }
    }
    
    void afterCreate() {
        entity.downpaymentrate = 0;
    }
    
    void afterOpen() {
        def m = [_schemaname: "vw_waterworks_compromise_billitem"];
        m.findBy = [parentid: entity.objid];
        m.orderBy = "year,month,item.sortorder"
        billItems = queryService.getList(m);
    }
    
    def getLookupAccount() {
        def h = { o->
            entity.acctid = o.objid;
            entity.acctinfoid = o.acctinfoid;
            entity.acctno = o.acctno;
            entity.account = [acctname: o.acctname];
            buildBillItems();
            binding.refresh();
        }
        return Inv.lookupOpener("vw_waterworks_account:lookup", [onselect:h])
    }
    
    def billItems;
    def listHandler = [
        fetchList: { o->
            return billItems;
        },
        afterColumnUpdate : {item, colName ->
            boolean t = true;
            billItems.each { bi->
                bi.selected = t;                
                if( bi.objid == item.objid ) {
                    t = false;
                }
            };
            entity.amount = billItems.findAll{ it.selected == true }.sum{ it.amount };
            listHandler.refresh();
            binding.refresh("entity.amount");
        } 
    ] as EditorListModel;
    
    void buildBillItems() {
        def m = [_schemaname: "waterworks_billitem"];
        m.findBy = [acctid: entity.acctid];
        m.select = "objid,year,month,monthname,item.*,amount:{ amount - amtpaid },balance:{ amount - amtpaid }";
        m.where = " amount-amtpaid > 0 ";
        m.orderBy = "year,month,item.sortorder"
        billItems = queryService.getList(m);
        billItems.each { it.selected = true };
        entity.amount = billItems.sum{ it.amount };
        listHandler.reload();
    }
    
    def getCompromiseQry() {
        return [objid: entity.objid];
    }
    
    def save() {
        entity.billitems = billItems.findAll{ it.selected == true }.collect{ [billitemid: it.objid, amount: it.amount]  }
        super.save();
        def op = Inv.lookupOpener("waterworks_compromise:open", [entity: [objid:entity.objid]]);
        op.target = "topwindow";
        return op;
    }
    
    def buildInstallment() {
        compSvc.buildInstallment( [objid: entity.objid ]);
        compromiseFeeModel.reload();
    }
    
    
}