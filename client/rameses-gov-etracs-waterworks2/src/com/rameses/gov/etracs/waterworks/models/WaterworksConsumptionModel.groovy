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

public class WaterworksConsumptionModel  {
    
    @Service("WaterworksComputationService")
    def compSvc;
    
    @Binding
    def binding;
    
    def saveHandler;

    def bill;                 
    def entity;  //the consumption
    def meter;
    
    public void init() {
        if( !bill) throw new Exception("Please include bill");
        meter = bill.meter;
        entity = [:];
        entity.putAll( bill.consumption );
    }     
    
    @PropertyChangeListener
    def listener = [
        "entity.reading" : { o->
            def capacity = meter.capacity?.toInteger();
            if(capacity==null) throw new Exception("capacity is null");
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
            };
            calc();
            binding.refresh("entity.(volume|amount)");
        }
    ];
    
    public void calc() {
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
    }
    
    def doOk() {
        saveHandler( entity );
        return "_close";
    }
    
    def doCancel() {
        return "_close";
    }
    
    
}