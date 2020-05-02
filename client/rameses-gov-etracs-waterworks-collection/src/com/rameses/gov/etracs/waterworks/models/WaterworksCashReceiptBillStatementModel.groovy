package com.rameses.gov.etracs.waterworks.models;

import com.rameses.rcp.annotations.*;
import com.rameses.rcp.common.*;
import com.rameses.osiris2.client.*;
import com.rameses.osiris2.common.*;
import com.rameses.seti2.models.*;
import java.text.*;
import com.rameses.treasury.common.models.*;
import com.rameses.util.BreakException

class WaterworksCashReceiptBillStatementModel {
    
    @Service(value="WaterworksBillStatementService", connection="waterworks")
    def statementSvc;

    @Binding
    def binding;

    def maxBill;
    def entity;

    void init() {
        loadInfo();
        maxBill = entity;
    }

    boolean getAllowNextBill() {
        if( entity.objid == maxBill.objid ) return false;
        return true;
    }

    def getYearMonth( def month ) {
        def ym = ((entity.period.year*12)+entity.period.month) + month;
        def m = [:];
        m.year = (int)(ym/12);
        m.month = (int)(ym % 12);
        if( m.month <= 0  ) {
            m.month = 12;
            m.year = m.year - 1;
        }
        return m;
    }
    
    void movePrevBill() {
        def ym = getYearMonth( -1 );
        entity = statementSvc.getBillInfo([acctid: entity.acctid, year:ym.year ,month: ym.month ]);
        binding.refresh();
        detailListHandler.reload();
    }

    void moveNextBill() {
        def ym = getYearMonth( 1 );    
        entity = statementSvc.getBillInfo([acctid: entity.acctid, year:ym.year ,month: ym.month ]);    
        binding.refresh();
        detailListHandler.reload();
    }

    void loadInfo() {
        entity = statementSvc.getBillInfo( [objid: entity.objid ]);        
    }

    def detailListHandler = [
        fetchList: { o->
            return entity.details;
        }
    ] as BasicListModel;

    
}    
