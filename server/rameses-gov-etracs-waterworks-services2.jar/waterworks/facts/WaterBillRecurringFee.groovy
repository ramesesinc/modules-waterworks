package waterworks.facts;

import java.util.*;
import com.rameses.util.*;
import treasury.facts.*;

public class WaterBillRecurringFee {

	int startyear;
	int startmonth;
	String type;	//installment or onetime or recurring

	String billcode;
	double installmentamount;
	int term; // no. of months
	double amount;
	double amtdue;   //this is amount - amtpaid

}	
