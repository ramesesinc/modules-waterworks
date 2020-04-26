[updateInitialBillBalanceForward]
UPDATE waterworks_bill wb, waterworks_account ca, waterworks_billing_period wbp
SET balanceforward =  IFNULL((
	SELECT SUM(wb2.amount) 
	FROM waterworks_billitem wb2
	WHERE wb2.acctid = ca.objid 
	AND ((wb2.year*12)+wb2.month) < ((wbp.year*12)+wbp.month)	
),0)
- IFNULL(( 
	SELECT amount 
	FROM waterworks_payment wp 
	WHERE wp.acctid = ca.objid 
	AND wp.reftype = "beginbalance"
),0)
WHERE wb.objid = ca.billid
AND wb.initial = 1
AND wbp.objid= wb.periodid
AND ca.objid = $P{acctid}

[findBalanceForward]
SELECT wb.balanceforward 
FROM waterworks_bill wb 
INNER JOIN waterworks_account wa ON wb.objid=wa.billid 
WHERE wa.objid = $P{acctid}