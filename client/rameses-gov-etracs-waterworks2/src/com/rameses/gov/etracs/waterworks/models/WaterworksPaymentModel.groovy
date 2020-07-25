package com.rameses.gov.etracs.waterworks.models;

import com.rameses.rcp.annotations.*;
import com.rameses.rcp.common.*;
import com.rameses.osiris2.client.*;
import com.rameses.osiris2.common.*;
import com.rameses.seti2.models.*;
import com.rameses.util.*;
import java.text.*;

class WaterworksPaymentModel extends CrudFormModel  {

    def selectedItem;
    
    def listHandler = [
        fetchList: { o->
            def m = [_schemaname: "vw_waterworks_payment_item"];
            m.findBy = [pmtid: entity.objid];
            m.orderBy = "year,month,item.sortorder"
            return queryService.getList( m );
        }
    ] as BasicListModel;

    
}