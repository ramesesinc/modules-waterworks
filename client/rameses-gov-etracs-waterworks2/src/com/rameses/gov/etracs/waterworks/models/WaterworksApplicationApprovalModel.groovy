package com.rameses.gov.etracs.waterworks.models;

import com.rameses.rcp.annotations.*;
import com.rameses.rcp.common.*;
import com.rameses.osiris2.client.*;
import com.rameses.osiris2.common.*;
import com.rameses.rcp.annotations.*;
import com.rameses.seti2.models.*;
import com.rameses.util.*;

public class WaterworksApplicationApprovalModel {
    
    @Service("QueryService")
    def querySvc;
    
    def handler;
    
    def apptype;
    def subareaid;
    int year;
    int month;
    int reading = 0;
    int seqno = 0;
    
    void init() {
        def m = [_schemaname: "waterworks_subarea"];
        m.findBy = [objid: subareaid];
        def sa = querySvc.findFirst( m );
        year = sa.year;
        month = sa.month;
    }
    
    def doOk() {
        handler( [year:year, month: month, reading: reading, seqno: seqno]  );
        return "_close";
    }
    
    def doCancel() {
        return "_close";
    }
    
}