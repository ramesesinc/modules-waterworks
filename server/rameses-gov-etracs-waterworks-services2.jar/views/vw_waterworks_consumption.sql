DROP VIEW if exists vw_waterworks_consumption;
CREATE VIEW vw_waterworks_consumption AS
SELECT wc.*, 
	prev.reading AS prevreading,
	prev.month AS prevmonth,
	prev.year AS prevyear,
	a.acctno, ai.acctname, 
	a.state AS acctstate, 
	a.seqno,
	ai.subareaid,
	ai.address_text,
	ai.classificationid,
	ai.stuboutid

FROM waterworks_consumption wc 
INNER JOIN waterworks_account a on a.objid = wc.acctid
INNER JOIN waterworks_account_info ai ON wc.acctinfoid = ai.objid
LEFT JOIN waterworks_consumption prev 
	ON prev.acctid = wc.acctid AND prev.meterid = wc.meterid  AND (( prev.year*12 )+prev.month) = ( (wc.year*12)+wc.month-1)