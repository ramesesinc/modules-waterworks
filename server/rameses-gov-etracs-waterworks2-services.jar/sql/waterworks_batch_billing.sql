[getAccountsForBilling]
SELECT wa.objid, wbbp.year, wbbp.month
FROM vw_waterworks_account wa
INNER JOIN waterworks_batch_billing wbb ON wa.subareaid = wbb.subareaid
INNER JOIN waterworks_billing_period wbbp ON wbb.periodid = wbbp.objid 
WHERE wbb.objid = $P{batchid} 
AND wa.state IN ('DRAFT','ACTIVE')
AND wa.objid NOT IN (
	SELECT acctid FROM waterworks_bill WHERE batchid = $P{batchid}
)
AND wa.objid NOT IN (
	SELECT acctid FROM waterworks_batch_billing_error WHERE batchid = $P{batchid}	
)
LIMIT ${start}, ${limit}

[findForBillingCount]
SELECT COUNT(*) AS count
FROM vw_waterworks_account wa
INNER JOIN waterworks_batch_billing wbb ON wa.subareaid = wbb.subareaid
INNER JOIN waterworks_billing_period wbbp ON wbb.periodid = wbbp.objid 
WHERE wbb.objid = $P{batchid}
AND wa.state IN ('DRAFT','ACTIVE')
AND wa.objid NOT IN (
	SELECT acctid FROM waterworks_bill WHERE batchid = $P{batchid}
)
AND wa.objid NOT IN (
	SELECT acctid FROM waterworks_batch_billing_error WHERE batchid = $P{batchid}	
)
