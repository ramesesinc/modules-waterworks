package waterworks.actions;

import com.rameses.rules.common.*;
import com.rameses.util.*;
import java.util.*;
import treasury.facts.*;
import com.rameses.osiris3.common.*;

public class SetWaterBillingPeriod implements RuleActionHandler {

	public void execute(def params, def drools) {
		def billPeriod = params.billingperiod;
		if(!billPeriod) throw new Exception("Billing Period is required in SetBillingPeriod")
		if(params.fromperiod!=null) billPeriod.fromperiod = params.fromperiod.eval();
		if(params.toperiod!=null) billPeriod.toperiod = params.toperiod.eval();
		if(params.readingdate!=null) billPeriod.readingdate = params.readingdate.eval();
		if(params.readingduedate!=null) billPeriod.readingduedate = params.readingduedate.eval();
		if(params.billingduedate!=null) billPeriod.billingduedate = params.billingduedate.eval();
		if(params.discdate!=null) billPeriod.discdate = params.discdate.eval();
		if(params.duedate!=null) billPeriod.duedate = params.duedate.eval();
	}
}


