package waterworks.facts;

import java.util.*;
import com.rameses.util.*;
import treasury.facts.*;

public class WaterBillingPeriod  {

	int year;
	int month;

	Date fromperiod;
	Date toperiod;
	Date readingdate;
	Date readingduedate;
	Date billingduedate;
	Date discdate;
	Date duedate;

	public Map toMap() {
		def m = [:];
		m.year = year;
		m.month = month;
		m.fromperiod=fromperiod;
		m.toperiod=toperiod;
		m.readingdate=readingdate;
		m.readingduedate=readingduedate;
		m.billingduedate=billingduedate;
		m.discdate=discdate;
		m.duedate=duedate;
		return m;
	}

	public WaterBillingPeriod() {}

	public WaterBillingPeriod(def m) {
		if(m.year) year = m.year;
		if(m.month) month = m.month;
		if(m.fromperiod) fromperiod = m.fromperiod;
		if(m.toperiod) toperiod = m.toperiod;
		if(m.readingdate) readingdate = m.readingdate;
		if(m.readingduedate) readingduedate = m.readingduedate;
		if(m.billingduedate) billingduedate = m.billingduedate;
		if(m.discdate) discdate = m.discdate;
		if(m.duedate) duedate = m.duedate;
	}

}	