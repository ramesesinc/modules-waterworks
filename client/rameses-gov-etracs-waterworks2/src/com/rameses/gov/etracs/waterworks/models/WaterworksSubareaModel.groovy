package com.rameses.gov.etracs.waterworks.models;

import com.rameses.rcp.annotations.*;
import com.rameses.rcp.common.*;
import com.rameses.osiris2.client.*;
import com.rameses.osiris2.common.*;
import com.rameses.seti2.models.*;
import java.text.*;
import com.rameses.util.*;

public class WaterworksSubareaModel extends CrudFormModel {

    def parent;
    boolean hasParent = true;
    def selectedAccount;
    def acctListModel;
    
    void afterCreate() {
        if( caller instanceof CrudFormModel ) {
            parent = caller.entity;
            entity.area = parent;
            hasParent = true;
        }
        else {
            hasParent = false;
        }
        entity.nextperiod = [:];
    } 
    
    void changeSeqno() {
        if(!selectedAccount) throw new Exception("Select an account first");
        def p = MsgBox.prompt( "Enter new seq no"); 
        if(!p) return;
        def m = [_schemaname:"waterworks_account"];
        m.findBy = [objid: selectedAccount.objid];
        m.seqno = p;
        persistenceService.update( m );
        selectedAccount.seqno = p;
        acctListModel.refreshSelectedItem();
    }
    
}