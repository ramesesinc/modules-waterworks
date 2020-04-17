DROP VIEW IF EXISTS vw_waterworks_bill;
CREATE VIEW vw_waterworks_bill AS
SELECT 
   wb.*, 
   a.acctno, 
   ai.acctname, 
   a.state AS acctstate, 
   a.seqno,
   ai.subareaid,
   ai.address_text,
   ai.classificationid,
   ai.stuboutid,
   ai.meterid, 
   ai.meterstate,

   p.year AS period_year,
   p.month AS period_month,
   p.fromdate AS period_fromdate,
   p.todate AS period_todate,
   p.readingdate AS period_readingdate,
   p.readingenddate AS period_readingenddate,
   p.billdate AS period_billdate,
   p.billingenddate AS period_billingenddate,
   p.discdate AS period_discdate,
   p.duedate AS period_duedate,
   p.billexpirydate AS period_billexpirydate

FROM waterworks_bill wb 
INNER JOIN waterworks_account a on a.objid = wb.acctid
INNER JOIN waterworks_account_info ai ON wb.acctinfoid = ai.objid
INNER JOIN waterworks_billing_period p ON wb.periodid = p.objid

