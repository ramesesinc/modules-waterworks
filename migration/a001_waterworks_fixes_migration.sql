CREATE TABLE `waterworks_itemaccount` (
  `objid` varchar(50) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `item_objid` varchar(50) DEFAULT NULL,
  `item_code` varchar(50) DEFAULT NULL,
  `item_title` varchar(255) DEFAULT NULL,
  `item_fund_objid` varchar(50) DEFAULT NULL,
  `sortorder` int(10) DEFAULT NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT IGNORE INTO waterworks_itemaccount 
(`objid`,`title`,`item_objid`,`item_code`,`item_title`,`item_fund_objid`,`sortorder`)
SELECT 
item_objid,item_title,item_objid,item_code,item_title,null,100
FROM waterworks_otherfee;


ALTER TABLE `waterworks_otherfee` 
ADD CONSTRAINT `fk_waterworks_otherfee_itemobjid` 
FOREIGN KEY (`item_objid`) REFERENCES `waterworks_itemaccount` (`objid`) ON DELETE RESTRICT ON UPDATE RESTRICT;

