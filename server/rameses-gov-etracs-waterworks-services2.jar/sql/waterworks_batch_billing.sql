[buildConsumptions]
INSERT INTO waterworks_consumption ( 
	objid,state,acctid,acctinfoid,batchid,txnmode,reading,
	volume,rate,amount,amtpaid,meterid,year,month,hold,meterstate 
) 
SELECT 
	CONCAT(a.objid,'-',br.periodid) AS objid, 
	'DRAFT' as state, 
	a.objid as acctid, 
	a.acctinfoid,

	br.objid as batchid, 
	'ONLINE' as txnmode,
	prevcon.reading, 
	0 AS volume, 
	0 AS rate,
	0 AS amount,
	0 AS amtpaid, 
	ai.meterid,
	br.year,
	br.month,
	IFNULL(prevcon.hold, 0) AS hold,
	wm.state
FROM waterworks_batch_billing br 
INNER JOIN waterworks_account_info ai ON ai.subareaid = br.subareaid
INNER JOIN waterworks_account a ON a.acctinfoid = ai.objid 
LEFT JOIN waterworks_meter wm ON wm.objid = ai.meterid 	
LEFT JOIN waterworks_consumption prevcon 
	ON prevcon.acctid = a.objid AND prevcon.meterid=ai.meterid AND (((prevcon.year*12)+prevcon.month)) = ((br.year*12)+br.month-1)

[buildBillings]
INSERT INTO waterworks_billing 

SELECT * FROM vw_waterworks_consumption


if( !o.batchid ) throw new Exception("batchid is required");
		if( !o.consumptionid ) throw new Exception("consumptionid is required");
		if( !o.acctid ) throw new Exception("acctid is required");
		if( !o.counter ) throw new Exception("counter is required");

		int errcode = getErrCode( o );
		def wb = [:];
		wb.state = (errcode > 0) ? "ERR" : "UNBILLED";
		wb.batchid = o.batchid;
		wb.acctid = o.acctid;
		wb.consumptionid = o.consumptionid;			
		wb.billno = o.batchid + "-" + String.format("%04d", o.counter);
		wb.objid = wb.billno;
		wb.discount = 0;
		wb.surcharge = 0;
		wb.interest = 0;
		wb.otherfees = 0;
		wb.credits = 0;
		wb.arrears = 0;
		wb.averageconsumption = 0;
		wb.unpaidmonths = 0;
		wb.billed = 0;
		wb.printed = 0;
		wb.errcode = errcode;
		billEm.create( wb );
		return wb;



[findBilledStatus]
select tmp1.*, (totalcount-billedcount) as balance 
from ( 
	select 
		(select count(*) from waterworks_billing where batchid = $P{batchid} ) as totalcount, 
		(select count(*) from waterworks_billing where batchid = $P{batchid} and billed=1) as billedcount  
)tmp1 

[findAverageConsumption]
SELECT AVG(a.volume)  AS avgcon
FROM
( SELECT volume FROM waterworks_consumption 
WHERE  acctid = $P{acctid}
AND ((year*12)+month) < (($P{year}*12)+$P{month})
ORDER BY ((year*12)+month) DESC
LIMIT $P{months} ) a

[postMeterReading]
UPDATE 
	waterworks_meter wm, waterworks_account wa, 
	waterworks_consumption wb, waterworks_batch_billing wbb 
SET 
	wm.lastreadingdate = wbb.readingdate, 
	wm.lastreading = wb.reading 
WHERE wbb.objid = $P{batchid} 
	and wb.batchid = wbb.objid 
	and wa.objid = wb.acctid 
	and wm.objid = wa.meterid 


