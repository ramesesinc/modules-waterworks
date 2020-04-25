package waterworks.facts;

import com.rameses.util.*;

public class WaterBill {

	int year;
	int month;
	double balanceforward;

	Date fromdate;
	Date todate;
	Date billdate;
	Date duedate;
	Date discdate;
	Date expirydate;

	Date validitydate;

	boolean discountallowed = true;

	public WaterBill(){;}

	public WaterBill(def bill){
		def period = bill.period;
		if(period) {
			this.year = period.year;
			this.month = period.month;
			if( period.fromdate) this.fromdate = period.fromdate ;
			if( period.todate) this.todate = period.todate ;
			if( period.billdate) this.billdate = period.billdate ;
			if( period.duedate) this.duedate = period.duedate ;
			if( period.discdate) this.discdate = period.discdate ;
			if( period.billexpirydate) this.expirydate = period.billexpirydate ;
		}
		this.balanceforward = bill.balanceforward;
		if( bill.discountallowed !=null ) {
			this.discountallowed = bill.discountallowed;
		}		
	}

}
