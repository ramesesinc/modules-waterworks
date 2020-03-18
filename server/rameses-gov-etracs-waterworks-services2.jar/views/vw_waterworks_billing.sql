DROP VIEW IF EXISTS vw_waterworks_billing
;
CREATE VIEW vw_waterworks_billing AS
SELECT 
   wb.*, 
   wbb.year, wbb.month,
   wa.acctno, wa.acctname, wa.state as acctstate, wa.address_text as addresstext, wa.classificationid, 
   CASE WHEN wc.meterid IS NULL THEN 'UNMETERED' ELSE wm.state END AS meterstate,
   wc.reading, wc.volume, wc.amount, wc.amtpaid, wc.rate, wc.hold,
   ((wb.arrears + wb.otherfees + wb.surcharge + wb.interest) - wb.credits) AS subtotal,
   wm.objid AS meterid, 
   wm.objid AS meter_objid, 
   wm.capacity AS meter_capacity, 
   wm.capacity AS meter_brand,
   wsz.title AS meter_size, bs.fromperiod, bs.toperiod, wbb.readingdate, bs.discdate, bs.duedate, 
   z.objid as subarea_objid, z.code as subarea_code, za.code AS subarea_area_code,
   wa.seqno, ((bs.year * 12) + bs.month) as periodindexno,
   prev.reading AS prevreading, 
   prev.month AS prevmonth,
   prev.year AS prevyear

FROM waterworks_billing wb 
INNER JOIN waterworks_batch_billing wbb ON wbb.objid = wb.batchid 
INNER JOIN waterworks_billing_period bs on bs.objid = wbb.periodid 
INNER JOIN waterworks_account wa ON wa.objid = wb.acctid 
INNER JOIN waterworks_subarea z ON z.objid = wa.subareaid 
INNER JOIN waterworks_area za ON za.objid = z.areaid 
INNER JOIN waterworks_consumption wc ON wc.objid = wb.consumptionid 
LEFT JOIN waterworks_meter wm ON wm.objid = wc.meterid 
LEFT JOIN waterworks_metersize wsz ON wm.sizeid = wsz.objid
LEFT JOIN waterworks_stubout ws on ws.objid = wa.stuboutid 
LEFT JOIN waterworks_consumption prev ON prev.acctid = wa.objid AND ( ((prev.year*12)+prev.month )) = ((wc.year*12)+wc.month-1);