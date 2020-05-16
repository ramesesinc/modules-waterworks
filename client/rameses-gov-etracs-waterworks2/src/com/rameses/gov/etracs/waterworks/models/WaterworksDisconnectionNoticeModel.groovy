package com.rameses.gov.etracs.waterworks.models;

import com.rameses.rcp.annotations.*;
import com.rameses.rcp.common.*;
import com.rameses.osiris2.client.*;
import com.rameses.osiris2.common.*;
import com.rameses.rcp.annotations.*;
import com.rameses.seti2.models.*;

public class WaterworksDisconnectionNoticeModel extends FormReportModel {

	@Service("WaterworksDisconnectionNoticeService")
	def disconSvc;

	def entity;

    public def create() {
       	entity = [monthsdelinquent: 2, refdate: new Date() ];
       	return "initial";
    }
    
    public void open() {
        
    }
    
	public void saveNew() {
		 disconSvc.create(  entity );
	}    
    

}	