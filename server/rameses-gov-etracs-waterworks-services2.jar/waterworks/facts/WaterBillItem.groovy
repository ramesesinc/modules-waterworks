package waterworks.facts;

import java.util.*;
import com.rameses.util.*;
import treasury.facts.*;

public class WaterBillItem extends BillItem {

	def monthNames = ['JAN','FEB','MAR','APR','MAY','JUN','JUL','AUG','SEP','OCT','NOV','DEC'];

	def objid;
	def parentrefid;

	public WaterBillItem(def o) {
		super(o);
		if(o.objid) this.objid = o.objid;
	}

	public WaterBillItem() {}

	public def toMap() { 
		def m = super.toMap(); 
		if(objid) m.objid = objid;
		if(parentrefid) m.parentrefid = parentrefid;
		m.monthname = getMonthname();
		return m;
	}	

	public int hashCode() {
		def buff = new StringBuilder();
		buff.append( yearMonth );
		buff.append( "-" + billcode );
		if( parentrefid ) {
			buff.append( "-" + parentrefid );
		}
		return buff.toString().hashCode();
	}

	public int getPaypriority() {
		return (yearMonth +""+ ( 1000 + sortorder )).toInteger();
	}

	public String getMonthname() { 
		def idx = month-1; 
		if ( idx >= 0 && idx < monthNames.size() ) {
			return monthNames[ idx ]; 
		}
		return null; 
    }

}	