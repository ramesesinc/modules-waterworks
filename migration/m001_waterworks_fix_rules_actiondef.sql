INSERT INTO sys_rule_actiondef_param 
(`objid`, `parentid`, `name`, `sortorder`, `title`, `datatype`, `handler`, `lookuphandler`, 
`lookupkey`, `lookupvalue`, `vardatatype`, `lovname`) 
VALUES 
('treasury.actions.SetBillItemAccount.billcode', 
'treasury.actions.SetBillItemAccount', 'billcode', 3, 'Billcode', NULL, 'lookup', 'waterworks_itemaccount:lookup', 
'objid', 'title', 'string', NULL);


INSERT INTO sys_rule_actiondef_param 
(`objid`, `parentid`, `name`, `sortorder`, `title`, `datatype`, `handler`, `lookuphandler`, 
`lookupkey`, `lookupvalue`, `vardatatype`, `lovname`) 
VALUES 
('treasury.actions.AddDiscountItem.billcode', 
'treasury.actions.AddDiscountItem', 'billcode', 3, 'Billcode', NULL, 'lookup', 'waterworks_itemaccount:lookup', 
'objid', 'title', 'string', NULL);

INSERT INTO sys_rule_actiondef_param 
(`objid`, `parentid`, `name`, `sortorder`, `title`, `datatype`, `handler`, `lookuphandler`, 
`lookupkey`, `lookupvalue`, `vardatatype`, `lovname`) 
VALUES 
('treasury.actions.AddSurchargeItem.billcode', 
'treasury.actions.AddSurchargeItem', 'billcode', 3, 'Billcode', NULL, 'lookup', 'waterworks_itemaccount:lookup', 
'objid', 'title', 'string', NULL);

INSERT INTO sys_rule_actiondef_param 
(`objid`, `parentid`, `name`, `sortorder`, `title`, `datatype`, `handler`, `lookuphandler`, 
`lookupkey`, `lookupvalue`, `vardatatype`, `lovname`) 
VALUES 
('treasury.actions.AddInterestItem.billcode', 
'treasury.actions.AddInterestItem', 'billcode', 3, 'Billcode', NULL, 'lookup', 'waterworks_itemaccount:lookup', 
'objid', 'title', 'string', NULL);

