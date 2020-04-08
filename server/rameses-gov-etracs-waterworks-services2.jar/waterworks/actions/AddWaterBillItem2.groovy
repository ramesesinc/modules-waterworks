package waterworks.actions;

import com.rameses.rules.common.*;
import com.rameses.util.*;
import java.util.*;
import treasury.facts.*;
import com.rameses.osiris3.common.*;
import waterworks.facts.*;

public class AddWaterBillItem implements RuleActionHandler {

	public void execute(def params, def drools) {
		def year = params.year;
		def month = params.month;
		def billcode = params.billcode;
		def parentref = params.parentref;

		double amt = 0;
		def _amt = params.amount.eval();
		if(_amt instanceof Number) {
			amt = _amt.doubleValue();
		}
		amt = NumberUtil.round(amt).doubleValue();	

		def ct = RuleExecutionContext.getCurrentContext();
		def facts = ct.facts;

		def addItem = { 
			facts << new WaterBillItem();
			bi.billcode = billcode.objid;
			bi.amount = amt;
			bi.year = year;
			bi.month = month;
			if( parentref.objid != null ) bi.refid = parentref.objid;
			facts << bi;
		}

		def billitems = facts.findAll{ it instanceof BillItem };
		if( parentref == null ) {
			if( !billitems.find{ it.year == year && it.month == month && it.billcode == billcode }  ) {
				addItem();
			}
		}
		else {
			if( !billitems.find{ it.year == year && it.month == month && it.billcode == billcode && it.parentrefid == parentref.objid }  ) {
				addItem();
			}
		}

	}
}