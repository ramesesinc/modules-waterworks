package com.rameses.gov.etracs.waterworks.models;

import com.rameses.rcp.annotations.*;
import com.rameses.rcp.common.*;
import com.rameses.osiris2.client.*;
import com.rameses.osiris2.common.*;
import com.rameses.seti2.models.*;

public class WaterworksStuboutModel extends CrudFormModel {
    
    def parent;
    boolean hasParent = true;
    
    void afterCreate() {
        if( caller instanceof CrudFormModel ) {
            parent = caller.entity;
            entity.subarea = parent;
            hasParent = true;
        }
        else {
            hasParent = false;
        }
    }
    
    
}