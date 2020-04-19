package com.rameses.gov.etracs.waterworks.models;

import com.rameses.rcp.annotations.*;
import com.rameses.rcp.common.*;
import com.rameses.osiris2.client.*;
import com.rameses.osiris2.common.*;
import com.rameses.seti2.models.*;
import com.rameses.osiris2.report.*;
import com.rameses.rcp.framework.*;
import java.text.*;


public class WaterworksAccountApprovalModel {
   
    @Caller 
    def caller;

    @Service("QueryService")
    def qryService;
    
    @Service("PersistenceService")
    def persistenceService;
    
    /**
    * steps:
    * 0 = initial
    * 1 = No period error
    * 2 = display billing period year,month
    * 3 = validate unmetered
    * 4 = edit reading
    * 5 = confirmation page 
    * 6 = approved
    */
    int step = 0;
    def stepTitles = [
        "Initial (Select an option)",
        "No Billing Period",        
        "Validate Next Billing Period",
        "Validate No Meter Assigned",
        "Enter Initial Reading",
        "Confirm",
        "Approved"
    ];    

    int errno;

    //1 = no bill   2=require bill
    int createOption;
    def consumption;
    
    def getEntity() {
        return caller.entity;
    }

    public String getTitle() {
        return stepTitles[step];
    }


    boolean checkHasPeriod() {
        if( !entity.subarea?.period?.objid ) {
            errno = 3;
            return false;
        }
        else {
            return true;
        }
    }

    boolean validateBill() {
        if( !entity.billid ) {
            errno = 1;
            return false;
        }
        def m = [_schemaname: "waterworks_bill"];
        m.findBy = [objid: entity.billid ];
        def bill = qryService.findFirst( m );
        if( bill.state == 'DRAFT') {
            errno = 2;    
            return false;
        }
        return true;
    }

    boolean checkHasMeter() {
        if( entity.meter?.objid ) {
            return true;
        }
        else {
            return false;
        }
    }

    boolean checkHasReading() {
        if(!consumption?.objid ) {
            int yrMonth = (entity.subarea.period.year*12)+entity.subarea.period.month-1;
            //loading reading first if exists
            def m = [_schemaname: "waterworks_consumption"];
            m.findBy = [acctid: entity.objid, meterid: entity.meter.objid ];
            m.where = ["(year*12)+month = :ym", [ym:yrMonth] ];
            consumption = qryService.findFirst( m );
        }
        if(!consumption?.objid) {
            consumption = [:];
            return false;
        }    
        else {
            return true;
        }         
    }

    void saveReading() {
        def capacity = entity.meter.capacity.toInteger();
        if( consumption.reading >= capacity ) 
            throw new Exception("Error initial reading. Reading must be less than capcity");

        if(consumption.objid == null ){
            //update if exist
            def m = [_schemaname:  "waterworks_consumption"];
            m.acctid = entity.objid;
            m.year = entity.subarea.period.year;
            m.month = entity.subarea.period.month - 1;
            if(m.month <= 0 ) {
                m.month = 12;
                m.year = m.year - 1;
            }
            m.reading = consumption.reading;
            m.hold = 0;
            m.meterid = entity.meter.objid;
            m.amount = 0;
            m.state = ""
            m.volume = 0;
            m.txnmode = "CAPTURE";
            m = persistenceService.create( m );
            consumption.objid = m.objid;
        }
        else {
            def m = [_schemaname:  "waterworks_consumption"];
            m.findBy = [objid: consumption.objid ];
            m.reading = consumption.reading;
            persistenceService.update( m );            
        }
    }

    void approve() {
        def m = [_schemaname: "waterworks_account"]
        m.findBy = [objid: entity.objid];
        m.state = "ACTIVE";
        persistenceService.update( m );
        entity.state = "ACTIVE";
        caller.reloadEntity();
    }

    void doNext() {
        if( step == 0 ) {
            if( !createOption ) throw new Exception("Please select an option first");
            if( createOption == 1 ) {
                if( !validateBill()) {
                    step = 1
                }
                else {
                     step = 5;
                }
            }
            else {    
                if( !checkHasPeriod()) {
                    //display the current info   
                    step = 1 
                }
                else {
                    step = 2;
                }
            };
        }
        else if( step == 2 ) {
            if(checkHasMeter() == false ) {
                step = 3;
            }
            else {
                boolean hasReading = checkHasReading();
                step = 4;
            }
        }
        else if( step == 3  ) {
            step = 5;
        }
        else if(step == 4) {
            saveReading();
            step = 5;
        }
        else if(step == 5 ) {
            if( MsgBox.confirm("You are about to approve this account. Please confirm") == true ) {
                approve();
                step = 6;                
            }
        }
    }
    
    
    
}