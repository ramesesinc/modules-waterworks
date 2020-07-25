package com.rameses.gov.etracs.waterworks.models;

import com.rameses.rcp.annotations.*;
import com.rameses.rcp.common.*;
import com.rameses.osiris2.client.*;
import com.rameses.osiris2.common.*;
import com.rameses.seti2.models.*;
import java.text.*;

public class WaterworksBillBalanceForwardItemsModel  {

    @Binding
    def binding;
    
    @Service("WaterworksBeginBalanceService")
    def beginBalSvc;
    def billid;
    
    String title = "View Balance Forward Items";
    
    def balanceForwardItems;
    def totalamount;

    void init() {
        balanceForwardItems = beginBalSvc.getBillBalanceForwardBillItems( [billid: billid ]);
        totalamount = balanceForwardItems.sum{ it.balance };
        balanceForwardItemModel.reload();
    }
    
    def balanceForwardItemModel = [
        fetchList: { o->
            return balanceForwardItems;
        }
    ] as BasicListModel;
    
}