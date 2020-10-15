package com.rameses.gov.etracs.waterworks.models;

import com.rameses.rcp.annotations.*;
import com.rameses.rcp.common.*;
import com.rameses.osiris2.client.*;
import com.rameses.osiris2.common.*;
import com.rameses.rcp.annotations.*;
import com.rameses.seti2.models.*;
import com.rameses.util.*;

public class WaterworksCompromiseNewModel {
    
    @Service("WaterworksCompromiseService")
    def compSvc;

    @Service("QueryService")
    def queryService;
    
    @Binding
    def binding;

    def entity;
    int step = 1;
    def compromiseFeeModel;
    boolean includedownpayment = true;
    def installmentItems;

    @PropertyChangeListener
    def listener = [
        "entity.downpaymentrate" : { o->
            if(o == null ) entity.downpaymentrate = 0;
            entity.downpayment = NumberUtil.round(entity.amount * entity.downpaymentrate);
            entity.principal = NumberUtil.round(entity.amount - entity.downpayment);
            binding.refresh("entity.principal");                    
        },
        "entity.downpayment" : { o->
            if(o == null ) entity.downpayment = 0;
            entity.downpaymentrate = NumberUtil.round(entity.amount / entity.downpayment);
            entity.principal = NumberUtil.round(entity.amount - entity.downpayment);
            binding.refresh("entity.principal");                    
        },
    ];
    
    
    public String getTitle() {
        return "New Compromise Agreement";
    }
    
    void create() {
        entity = [:];
        entity.downpaymentrate = 0;
        entity.term = 12;
        entity.numinstallments = 12;
        step = 1;
    }

    void doNext() {
        if( step > 4) return;
        step++;

        if( step == 2 ) {
            buildBillItems();
        }
        else if(step == 4) {
            if( !includedownpayment ) {
                entity.downpayment = 0;
                entity.downpaymentrate = 0;                
            }   
            buildInstallment();
        }
    }

    void doBack() {
        if( step < 1 ) return;
        step--;
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
            MsgBox.alert("entity.amount is " + entity.amount );
            listHandler.refresh();
            binding.refresh();
        } 
    ] as EditorListModel;
    
    
    def getCompromiseQry() {
        return [objid: entity.objid];
    }
    
    def buildInstallment() {
        installmentItems = compSvc.buildInstallments( [objid: entity.objid ]);
        installmentModel.reload();
    }

    def installmentModel = [
        fetchList: { o->
            return installmentItems;
        }
    ]as BasicListModel;

    
    def save() {
        entity.billitems = billItems.findAll{ it.selected == true }.collect{ [billitemid: it.objid, amount: it.amount]  }
        entity.installments = installmentItems;
        compSvc.create( entity );
        def op = Inv.lookupOpener("waterworks_compromise:open", [entity: [objid:entity.objid]]);
        op.target = "topwindow";
        return op;
    }
    

    
}