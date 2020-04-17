package com.rameses.gov.etracs.waterworks.models;

import com.rameses.rcp.annotations.*;
import com.rameses.rcp.common.*;
import com.rameses.osiris2.client.*;
import com.rameses.osiris2.common.*;
import com.rameses.seti2.models.*;
import com.rameses.osiris2.report.*;
import com.rameses.rcp.framework.*;


public class WaterworksBillItemModel extends CrudFormModel {
   
    //the ff. are passed by the caller
    def bill;
    boolean current = false;
    
    boolean isEditAllowed() {
        if(bill?.state!='DRAFT') {
            return false;
        }
        else if( entity.billed == 1 ) {
            return false;
        }
        return super.isEditAllowed();
    }
    
    void afterCreate() {
        entity.system = 0;
        entity.billed = 0;
        entity.amtpaid = 0;
        entity.discount = 0;
        if( bill ) {
            entity.acctid = bill.acctid;
            if( current ) {
                entity.billid = bill.objid;            
                entity.year = bill.period.year;
                entity.month = bill.period.month;
            }
            else {
                entity.year = bill.period.year;
                entity.month = bill.period.month - 1;
                if( entity.month <= 0 ) {
                    entity.year = entity.year - 1;
                    entity.month = 12;
                }
            }
        }
    }
    
    void beforeSave( def mode ) {
        if(entity.amount<=0)
            throw new Exception("Amount must be greater than zero");
        if( !current && bill!=null) {
            int ym1 = ((bill.period.year*12)+bill.period.month);
            int ym2 = ((entity.year*12 )+entity.month);
            if( ym2 >= ym1 ) {
                throw new Exception("The year and month must not be greater than or equal to the bill's period");
            }
        }    
    }
    
}