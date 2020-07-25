package com.rameses.gov.etracs.waterworks.models;

import com.rameses.rcp.annotations.*;
import com.rameses.rcp.common.*;
import com.rameses.osiris2.client.*;
import com.rameses.osiris2.common.*;
import com.rameses.rcp.annotations.*;
import com.rameses.seti2.models.*;
import com.rameses.util.*;

public class WaterworksCompromiseModel extends WorkflowTaskModel {
    
    def compromiseFeeModel;
    
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
        }
    ] as BasicListModel;
    
    void buildBillItems() {
        def m = [_schemaname: "waterworks_billitem"];
        m.findBy = [acctid: entity.acctid];
        m.select = "objid,year,month,monthname,item.*,amount:{ amount - amtpaid },balance:{ amount - amtpaid }";
        m.where = " amount-amtpaid > 0 ";
        m.orderBy = "year,month,item.sortorder"
        billItems = queryService.getList(m);
        entity.amount = billItems.sum{ it.amount };
        listHandler.reload();
    }
    
    def getCompromiseQry() {
        return [objid: entity.objid];
    }
    
    
    def save() {
        entity.billitems = billItems.collect{ [billitemid: it.objid, amount: it.amount]  }
        super.save();
        def op = Inv.lookupOpener("waterworks_compromise:open", [entity: [objid:entity.objid]]);
        op.target = "topwindow";
        return op;
    }
    
}