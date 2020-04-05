DROP VIEW IF EXISTS vw_waterworks_billing
;
CREATE VIEW vw_waterworks_billing AS
SELECT 
   wb.*, 

   bs.fromdate, 
   bs.todate, 
   wbb.readingdate, 
   bs.discdate, 
   bs.duedate, 

   a.acctno, 
   ai.acctname, 
   a.state AS acctstate, 
   a.seqno,
   ai.subareaid,
   ai.address_text,
   ai.classificationid,
   ai.stuboutid,

   wc.meterid, 
   wc.meterstate,
   wc.prevreading, 
   wc.prevmonth, 
   wc.prevyear,

   ((wb.arrears + wb.otherfees + wb.surcharge + wb.interest) - wb.credits) AS subtotal

FROM waterworks_billing wb 
INNER JOIN waterworks_account a on a.objid = wb.acctid
INNER JOIN waterworks_account_info ai ON wb.acctinfoid = ai.objid
LEFT JOIN vw_waterworks_consumption wc ON wc.billid = wb.objid 
LEFT JOIN waterworks_batch_billing wbb ON wbb.objid = wb.batchid 
LEFT JOIN waterworks_billing_period bs on bs.objid = wbb.periodid 

