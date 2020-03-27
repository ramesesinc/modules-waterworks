DROP VIEW IF EXISTS vw_waterworks_billing
;
CREATE VIEW vw_waterworks_billing AS
SELECT 
   wb.*, 
   wbb.year, wbb.month,
   bs.fromperiod, bs.toperiod, wbb.readingdate, bs.discdate, bs.duedate, 
   ((bs.year * 12) + bs.month) as periodindexno,

   wc.acctid, wc.acctno, wc.state as acctstate, wc.acctname, wc.address_text, wc.classificationid, 
   wc.reading, wc.volume, wc.amount, wc.amtpaid, wc.rate, wc.hold,
   wc.seqno, wc.meterid, wc.meterstate,
   wc.prevreading, wc.prevmonth, wc.prevyear,

   wc.subareaid, 
   wc.stuboutid,

   ((wb.arrears + wb.otherfees + wb.surcharge + wb.interest) - wb.credits) AS subtotal
FROM waterworks_billing wb 
INNER JOIN waterworks_batch_billing wbb ON wbb.objid = wb.batchid 
INNER JOIN waterworks_billing_period bs on bs.objid = wbb.periodid 
INNER JOIN vw_waterworks_consumption wc ON wc.objid = wb.consumptionid 

