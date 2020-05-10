package com.rameses.gov.etracs.waterworks.models;

import com.rameses.rcp.annotations.*;
import com.rameses.rcp.common.*;
import com.rameses.osiris2.client.*;
import com.rameses.osiris2.common.*;
import com.rameses.rcp.annotations.*;
import com.rameses.seti2.models.*;

public class WaterworksBillFormReportModel extends FormReportModel {

    void sendBatchPrint( def items ) {
        data = [data: items];
	    viewReport();       
        //reportOpener.handle.printNoDialog();     	    
    }


}	