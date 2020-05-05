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

public class WaterworksConsumptionBuilderModel {
    
    @Service("WaterworksConsumptionService")
    def consumptionSvc;

    def bill;
    def meter;
    def listItems;
    def selectedItem;

    int startYear;
    int startMonth;
    int hold = 0;
    def handler;

    def defaultItems = [];
    def monthNames = ["JAN","FEB","MAR","APR","MAY","JUN","JUL","AUG","SEP","OCT","NOV","DEC"];

    int step = 0;

    void init() {
        if(!bill) throw new Exception("bill is required");
        if(!meter) throw new Exception("meter is required");   

        //if defaultItems provided start at the beginning year month, otherwise start one month less than period
        if( defaultItems ) {
            defaultItems = defaultItems.sort{ (it.year*12)+it.month };
            def fym = defaultItems.first();
            startYear = fym.year;
            startMonth = fym.month;
        }    
        else {
            startYear = bill.period.year; 
            startMonth = bill.period.month - 1;
            if( startMonth==0) {
                startMonth = 12;
                startYear = startYear - 1;
            }
        }
    }

    void buildEntries() {
        listItems = [];
        int ym1 = (startYear*12)+startMonth;
        int ym2 = (bill.period.year*12)+bill.period.month; 

        (ym1..ym2).each { ym->
            int y = (int)(ym/12);
            int m = (int)(ym%12);
            if(m==0) {
                m = 12;
                y = y-1;
            }
            def mm = [year:y, month:m, monthname: monthNames[m-1], volume:0, reading: 0, hold:hold ];
            def df = defaultItems.find{ d-> d.year==y && d.month==m };
            if( df ) {
                mm.reading = df.reading;
                mm.objid = df.objid;

                //we remove this so whatever is remaining will be deleted items
                defaultItems.remove( df );
            }
            listItems << mm;
        }
        listModel.reload();
    }

    void calculateList() {
        //validate the list first that all readings are encoded
        def unread = listItems.findAll{ it.reading==null };
        if( unread ) throw new Exception("All items must have readings");
        def prev = null;
        listItems.each {
            if(prev) {
                it.prev = prev;
            }
            prev = it;
        }
        listItems = consumptionSvc.calcItems( [acctid: bill.acctid, meterstate: bill.meterstate, items: listItems] );
        listModel.reload();
    }

    def saveItems() {
        if(!MsgBox.confirm("You are about to save the items. Proceed?")) return null; 

        def pp = [billid: bill.objid, items: listItems ];
        if( defaultItems ) {
            pp.deleteditems = defaultItems.findAll{ it.objid }.collect{ [objid: it.objid] };
        }

        consumptionSvc.saveItems( pp );
        if( handler ) handler();
        return "_close";     
    }

    def listModel = [
        fetchList: { o->
            return listItems;
        }         
    ] as EditorListModel;

    void moveNext() {
        if( step == 0 ) {
            //validate year
            buildEntries();    
        }
        else if(step == 1) {
            calculateList();
        }
        step = step + 1;
    }

    def moveBack() {
        step = step - 1;
        if(step <=0) step = 0;
        return null;
    }
    
}