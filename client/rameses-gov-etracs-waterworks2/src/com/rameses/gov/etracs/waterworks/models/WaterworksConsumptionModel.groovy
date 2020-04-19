package com.rameses.gov.etracs.waterworks.models;

import com.rameses.rcp.annotations.*;
import com.rameses.rcp.common.*;
import com.rameses.osiris2.client.*;
import com.rameses.osiris2.common.*;
import com.rameses.rcp.annotations.*;
import com.rameses.seti2.models.*;
import java.text.*;
import com.rameses.functions.*;
import com.rameses.seti2.models.*;

public class WaterworksConsumptionModel extends CrudFormModel {
    
    @Service("WaterworksComputationService")
    def compSvc;
    
    def bill;                 
    def prev;                 //the previous entry
    boolean current = false;  //flag to indicate if current
    
    void afterCreate() {
        entity.state = "OPEN";
        entity.reading = 0;
        entity.volume = 0;
        entity.amount = 0;
        entity.txnmode = "CAPTURE";
        if( bill ) {
            //check if current prev year must equal
            entity.billid = bill.objid;
            entity.meter = bill.meter;
            entity.acctid = bill.acctid;
            if(current) {
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
        if(prev) {
            entity.prev = prev;
            entity.hold = prev.hold;
        }
        
        //check current
        if(current == true) {
            if(!prev) throw new Exception("Previous is required");
            int p1 = (prev.year*12)+prev.month+1;
            int p2 = (entity.year*12)+entity.month;
            if(p1!=p2) 
                throw new Exception("Please check previous must be one month less than the current");
        }
    }
    
    void afterOpen() {
        if( entity.prev?.objid ) prev = entity.prev;
    }
    
    @PropertyChangeListener
    def listener = [
        "entity.reading" : { o->
            //calculate the volume. do not calculate yet the amount
            if( entity.prev == null ) {
                entity.volume = 0;
            }
            else {
                def capacity = entity.meter.capacity?.toInteger();
                if(capacity==null) throw new Exception("capcity is null");
                def prevreading = entity.prev.reading.toInteger(); 
                if( o >= capacity ) {
                    //this is error
                    entity.volume = -1;
                }
                else if( o < prevreading ) {
                    entity.volume = (o + capacity) - prevreading;
                    entity.amount = 0;
                }
                else {
                    entity.volume = o - prevreading;
                    entity.amount = 0;
                }
            }
            binding.refresh("entity.(volume|amount)");
        }
    ];
    
    void calc() {
        if(!bill) throw new Exception("bill is required");
        def z = [:];
        z.acctid = bill.acctid;
        z.prevreading = entity.prev.reading;
        z.reading = entity.reading;
        z.meterstate = bill.meterstate;
        def res = compSvc.compute(z);
        //we cannot use putAll bec. entity is a datamap
        if(res.volume) entity.volume = res.volume;
        if(res.amount) entity.amount = res.amount;
        binding.refresh("entity.(amount|volume)");
    }
    
    void beforeSave(mode) {
        if(current==false && bill!=null) {
            int p1 = (bill.period.year*12)+bill.period.month;
            int p2 = (entity.year*12)+entity.month;
            if(p1==p2) 
                throw new Exception("Year and month must not be the same as the current");
        }

        if( entity.reading >= entity.meter.capacity ) {
            throw new Exception("Invalid reading. Reading must be less than or equal to the meter capacity")
        }
        else if( entity.volume < 0 )
            throw new Exception("Invalid reading. Please ensure reading is less than or equal to meter capacity");
    }
    
    
    
}