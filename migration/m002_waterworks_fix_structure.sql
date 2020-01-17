ALTER TABLE waterworks_credit CHANGE amount dr DECIMAL(16,2);
ALTER TABLE waterworks_credit CHANGE amtpaid cr DECIMAL(16,2);
ALTER TABLE waterworks_credit ADD COLUMN refid varchar(50);
UPDATE waterworks_credit SET refid=parentid;
ALTER TABLE waterworks_credit DROP COLUMN parentid;
ALTER TABLE waterworks_credit DROP COLUMN rootid;

ALTER TABLE waterworks_credit DROP COLUMN item_objid;
ALTER TABLE waterworks_credit DROP COLUMN item_title;
ALTER TABLE waterworks_credit DROP COLUMN item_code;
ALTER TABLE waterworks_credit DROP COLUMN discount;

UPDATE waterworks_payment_item SET reftype = 'waterworks_credit' WHERE txntype = 'credit';
ALTER TABLE waterworks_payment_item DROP COLUMN txnrefid;
ALTER TABLE waterworks_payment_item DROP COLUMN item_objid;
ALTER TABLE waterworks_payment_item DROP COLUMN item_title;
ALTER TABLE waterworks_payment_item DROP COLUMN year;
ALTER TABLE waterworks_payment_item DROP COLUMN month;
ALTER TABLE waterworks_payment_item DROP COLUMN txntype;

ALTER TABLE waterworks_payment DROP COLUMN parentid;
ALTER TABLE waterworks_payment DROP COLUMN rootid;
ALTER TABLE waterworks_payment DROP COLUMN parentschemaname;

ALTER TABLE waterworks_payment ADD COLUMN acctid varchar(50);
ALTER TABLE waterworks_payment ADD CONSTRAINT `fk_waterworks_payment_acctid` FOREIGN KEY (`acctid`) REFERENCES waterworks_account (`objid`);
