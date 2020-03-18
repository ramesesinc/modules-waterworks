DROP VIEW if exists vw_waterworks_consumption;
CREATE VIEW vw_waterworks_consumption AS
SELECT wc.*, 
	prev.reading AS prevreading,
	prev.month AS prevmonth,
	prev.year AS prevyear,
	a.acctno, a.acctname, a.state AS acctstate, a.seqno,
	(wc.amount - wc.amtpaid - wc.discount) AS balance, 
	zn.schedulegroupid AS scheduleid,
	a.subareaid
FROM waterworks_consumption wc 
INNER JOIN waterworks_account a on a.objid = wc.acctid
INNER JOIN waterworks_subarea zn ON a.subareaid = zn.objid 
LEFT JOIN waterworks_consumption prev ON prev.acctid = a.objid AND (( prev.year*12 )+prev.month) = ( (wc.year*12)+wc.month-1)