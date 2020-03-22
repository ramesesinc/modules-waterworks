[findPendingBatchBillingBySubarea]
SELECT 
	bb.objid, bb.periodid, bs.year, bs.month, 
	bb.zoneid, z.schedulegroupid 
FROM waterworks_batch_billing bb 
where bb.subareaid = $P{subareaid} 
AND bb.state NOT IN ('POSTED','COMPLETED')
order by bb.year desc, bb.month desc 

[findLastBillByZone]
select 
	bb.objid, bb.periodid, bs.year, bs.month, 
	bb.zoneid, z.schedulegroupid  
from waterworks_batch_billing bb 
	inner join waterworks_billing_period bs on bs.objid = bb.periodid 
	inner join waterworks_subarea z on z.objid = bb.subareaid 
where bb.subareaid = $P{zoneid} ${filter} 
order by bs.year desc, bs.month desc 

[buildConsumptions]
INSERT INTO waterworks_consumption ( 
	objid,state,acctid,acctinfoid,batchid,txnmode,reading,
	volume,rate,amount,amtpaid,meterid,year,month,hold 
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
	IFNULL(prevcon.hold, 0) AS hold
FROM waterworks_batch_billing br 
INNER JOIN waterworks_account_info ai ON ai.subareaid = br.subareaid
INNER JOIN waterworks_account a ON a.acctinfoid = ai.objid 
LEFT JOIN waterworks_meter wm ON wm.objid = ai.meterid 	
LEFT JOIN waterworks_consumption prevcon 
	ON prevcon.acctid = a.objid AND prevcon.meterid=ai.meterid AND (((prevcon.year*12)+prevcon.month)) = ((br.year*12)+br.month-1)

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


