ALTER TABLE `waterworks_account` 
DROP COLUMN `seqno`,
DROP COLUMN `stuboutid`,
ADD COLUMN `seqno` int(0) NULL AFTER `ukey`,
ADD COLUMN `stuboutid` varchar(50) NULL AFTER `seqno`;

ALTER TABLE `waterworks_account` 
ADD CONSTRAINT `fk_waterworks_account_stuboutid` FOREIGN KEY (`stuboutid`) REFERENCES `waterworks_stubout` (`objid`);

ALTER TABLE `waterworks_account` 
ADD COLUMN groupid varchar(50);
ALTER TABLE `waterworks_account` 
ADD CONSTRAINT `fk_waterworks_account_groupid` 
FOREIGN KEY (`groupid`) REFERENCES waterworks_zone (`objid`);

#prepare the waterworks_account stuboutnode must exist in stuboutnode#
UPDATE waterworks_account 
SET stuboutnodeid = NULL 
WHERE stuboutnodeid IN 
(SELECT objid FROM 
waterworks_stubout_node WHERE 
stuboutid NOT IN (SELECT objid FROM waterworks_stubout ));

UPDATE waterworks_account wa, waterworks_stubout_node wsn, waterworks_stubout ws 
SET wa.stuboutid = wsn.stuboutid, wa.seqno = wsn.indexno, wa.groupid =  ws.zoneid
WHERE wa.stuboutnodeid = wsn.objid AND wsn.stuboutid = ws.objid; 

ALTER TABLE waterworks_account CHANGE COLUMN `stuboutnodeid` `_stuboutnodeid` varchar(50);
ALTER TABLE waterworks_account DROP FOREIGN KEY fk_waterworks_account_stuboutnodeid;

RENAME TABLE waterworks_sector TO waterworks_main_group;
RENAME TABLE waterworks_zone TO waterworks_group;
RENAME TABLE waterworks_block_schedule TO waterworks_schedule_group;

## waterworks_group
ALTER TABLE waterworks_group CHANGE COLUMN `sectorid` `maingroupid` varchar(50);
ALTER TABLE waterworks_group CHANGE COLUMN `schedule_objid` `schedulegroupid` varchar(50);
ALTER TABLE waterworks_group ADD CONSTRAINT `fk_waterworks_group_schedulegroupid` FOREIGN KEY (`schedulegroupid`) REFERENCES `waterworks_schedule_group` (`objid`) ;


ALTER TABLE waterworks_billing_schedule CHANGE COLUMN `scheduleid` `schedulegroupid` varchar(50);
ALTER TABLE waterworks_billing_schedule ADD CONSTRAINT `fk_waterworks_billing_schedule_schedulegroupid` FOREIGN KEY (`schedulegroupid`) REFERENCES `waterworks_schedule_group` (`objid`) ;


ALTER TABLE `waterworks_group` DROP FOREIGN KEY `fk_waterworks_zone_sectorid`;
ALTER TABLE `waterworks_group` ADD CONSTRAINT `fk_waterworks_group_maingroupid` FOREIGN KEY (`maingroupid`) REFERENCES `waterworks_main_group` (`objid`) ;

ALTER TABLE waterworks_stubout CHANGE COLUMN `zoneid` `groupid` varchar(50);
ALTER TABLE `waterworks_stubout` ADD CONSTRAINT `fk_waterworks_stubout_groupid` FOREIGN KEY (`groupid`) REFERENCES `waterworks_group` (`objid`) ;


RENAME TABLE waterworks_consumption TO waterworks_entry;
ALTER TABLE waterworks_entry 
ADD COLUMN billno	varchar(50),
ADD COLUMN surcharge	decimal(16,2),
ADD COLUMN interest	decimal(16,2),
ADD COLUMN otherfees	decimal(16,2),
ADD COLUMN credits	decimal(16,2),
ADD COLUMN arrears	decimal(16,2),
ADD COLUMN averageconsumption	int(11),
ADD COLUMN billed	int(11),
ADD COLUMN unpaidmonths	int(11),
ADD COLUMN refbillno	varchar(50),
ADD COLUMN printed	int(11);

UPDATE waterworks_entry we, waterworks_billing wb 
SET
	we.batchid = wb.batchid,
	we.billno = wb.billno,
	we.state = wb.state,
	we.surcharge = wb.surcharge,
	we.interest = wb.interest,
	we.otherfees = wb.otherfees,
	we.credits = wb.credits,
	we.arrears = wb.arrears,
	we.averageconsumption = wb.averageconsumption,
	we.billed = wb.billed,
	we.unpaidmonths = wb.unpaidmonths,
	we.refbillno = wb.refbillno,
	we.printed = wb.printed
WHERE wb.consumptionid = we.objid 	

RENAME TABLE waterworks_billing TO zzz_waterworks_billing;
RENAME TABLE waterworks_stubout_node TO zzz_waterworks_stubout_node;

ALTER TABLE waterworks_entry RENAME COLUMN prevreading TO _prevreading;

ALTER TABLE `waterworks_entry` 
CHANGE COLUMN `prevreading` `_prevreading` int(11) NULL DEFAULT NULL AFTER `printed`;

ALTER TABLE `waterworks_stubout` 
ADD COLUMN `lng` float(255, 0) NULL AFTER `barangay_name`,
ADD COLUMN `lat` float(255, 0) NULL AFTER `lng`;



