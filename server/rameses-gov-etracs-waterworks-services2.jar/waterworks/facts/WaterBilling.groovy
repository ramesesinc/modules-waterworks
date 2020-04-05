package waterworks.facts;

import com.rameses.util.*;

public class WaterBilling {

	Date billdate;
	double arrears;
	double otherfeearrears;
	int year;
	int month;

	public WaterBilling( def wb ) {
		if( wb.billdate ) this.billdate = wb.billdate;
		if( wb.arrears ) this.arrears = wb.arrears;
		if( wb.otherfeearrears ) this.otherfeearrears = wb.otherfeearrears;
		if( wb.year ) this.year = wb.year;
		if( wb.month ) this.month = wb.month;
	}
}
