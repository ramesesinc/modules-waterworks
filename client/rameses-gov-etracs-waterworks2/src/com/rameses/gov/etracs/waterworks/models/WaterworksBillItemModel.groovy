package com.rameses.gov.etracs.waterworks.models;

import com.rameses.rcp.annotations.*;
import com.rameses.rcp.common.*;
import com.rameses.osiris2.client.*;
import com.rameses.osiris2.common.*;
import com.rameses.seti2.models.*;
import com.rameses.osiris2.report.*;
import com.rameses.rcp.framework.*;


public class WaterworksBillItemModel  {
   
    //the ff. are passed by the caller
    def bill;
    def entity;
    boolean current = false;
    boolean editing = true;
    def saveHandler;

    def yearMonths = [];
    def monthNames = ["JAN", "FEB", "MAR", "APR", "MAY", "JUN", "JUL", "AUG", "SEP", "OCT", "NOV", "DEC"];
    def yearMonth;
    def mode;

    void buildYearMonths() {
        yearMonths = [];
        int ym1 = ((bill.period.year*12)+bill.period.month) - 1;
        (ym1..(ym1-36)).each {
            def y = (int)(it / 12 );
            def m = (int)(it % 12);
            if( m <= 0 ) {
                y = y - 1;
                m = 12;    
            }          
            yearMonths << [ year: y, month: m, monthname: monthNames[m-1] ];  
        }
    }

    @PropertyChangeListener
    def listener = [
        "yearMonth" : { o->
            entity.year = o.year;
            entity.month = o.month;
        }
    ];

    void create() {
        if(!bill) throw new Exception("bill is required");
        entity = [:];
        entity.system = 0;
        entity.billed = 0;
        entity.amount = 0;
        entity.amtpaid = 0;
        entity.discount = 0;
        entity.acctid = bill.acctid;
        if( current ) {
            entity.billid = bill.objid;   
            entity.year = bill.period.year;
            entity.month = bill.period.month;
        }
        else {
            buildYearMonths();
            yearMonth = yearMonths[0];
            entity.year = yearMonth.year;
            entity.month = yearMonth.month;
        }
        mode = "create";
    }

    void open() {
        editing = false;
        if(!current) {
            buildYearMonths();
            yearMonth = yearMonths.find{ it.year == entity.year && it.month == entity.month }            
        }
        mode = "edit";
    }
    
    def doOk() {
        if(entity.amount<=0)
            throw new Exception("Amount must be greater than zero");
        if( !current && bill!=null) {
            int ym1 = ((bill.period.year*12)+bill.period.month);
            int ym2 = ((entity.year*12 )+entity.month);
            if( ym2 >= ym1 ) {
                throw new Exception("The year and month must not be greater than or equal to the bill's period");
            }
        }    
        saveHandler( entity );
        if(mode=="create") {
            create();
            return null;
        }
        else {
            return "_close";
        }
    }

    def doCancel() {
        return "_close";
    }
    
}