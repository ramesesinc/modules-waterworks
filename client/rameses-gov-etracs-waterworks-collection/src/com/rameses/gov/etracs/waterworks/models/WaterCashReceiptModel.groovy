package com.rameses.gov.etracs.waterworks.models;

import com.rameses.rcp.annotations.*;
import com.rameses.rcp.common.*;
import com.rameses.osiris2.client.*;
import com.rameses.osiris2.common.*;
import com.rameses.seti2.models.*;
import java.text.*;
import com.rameses.treasury.common.models.*;

class WaterCashReceiptModel  extends CommonCashReceiptModel {
    
    def pmttxntype = "billing";
    BigDecimal depositAmt = 0;
    
    public String getCashReceiptServiceName() {
        return "WaterworksCashReceiptService";
    }
    
    public void loadBill( def p ) {
        query.txntype = pmttxntype;
        if( pmttxntype =="deposit" ) {
            p.amtpaid = depositAmt;
        }
        super.loadBill( p );
    }
    
}    
