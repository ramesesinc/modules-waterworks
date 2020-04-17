package waterworks.actions;

import com.rameses.rules.common.*;
import com.rameses.util.*;
import java.util.*;
import treasury.facts.*;
import com.rameses.osiris3.common.*;
import waterworks.facts.*;

//this is not applicable for surcharge and penalties.
public class AddWaterBillItem implements RuleActionHandler {

	public void execute(def params, def drools) {
		if(!params.year) throw new Exception("Error AddWaterBillItem year is required");
		if(!params.month) throw new Exception("Error AddWaterBillItem month is required");
		if(!params.billcode) throw new Exception("Error AddWaterBillItem billcode is required");

		def year = params.year;
		def month = params.month;
		def billcode = params.billcode.key;
		def parentref = null;

		double amt = 0;
		def _amt = params.amount.eval();
		if(_amt instanceof Number) {
			amt = _amt.doubleValue();
		}
		amt = NumberUtil.round(amt).doubleValue();	

		def ct = RuleExecutionContext.getCurrentContext();
		def facts = ct.facts;

		def addItem = { 
			def bi = new WaterBillItem();
			bi.billcode = billcode;
			bi.amount = amt;
			bi.year = year;
			bi.month = month;
			facts << bi;
		}

		def billitems = facts.findAll{ it instanceof WaterBillItem };
		println "ADDING BILLITEM IN ADDWATERBILLITEM";
		billitems.each {
			println it.objid + " " + it.parentrefid + " " + it.billcode + " " + it.year + " " + it.month;
		}

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