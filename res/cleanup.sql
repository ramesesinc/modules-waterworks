DELETE FROM waterworks_payment_item;
DELETE FROM waterworks_payment;
DELETE FROM waterworks_changelog;
DELETE FROM waterworks_application_bom;
DELETE FROM waterworks_application_fee;
DELETE FROM waterworks_application_requirement;
DELETE FROM waterworks_application_task;
DELETE FROM waterworks_application;


DELETE FROM waterworks_billing;
DELETE FROM waterworks_consumption;

UPDATE waterworks_batch_billing SET taskid = NULL;
DELETE FROM waterworks_batch_billing_task;
DELETE FROM waterworks_batch_billing;
DELETE FROM waterworks_billing_schedule;

DELETE FROM waterworks_mobile_info;
DELETE FROM waterworks_mobile_header;


UPDATE waterworks_account SET applicationid = NULL,classificationid =NULL, meterid=NULL, stuboutnodeid = NULL;
UPDATE waterworks_meter SET currentacctid = NULL;
UPDATE waterworks_stubout_node SET currentacctid = NULL;

DELETE FROM waterworks_otherfee;
DELETE FROM waterworks_credit;
DELETE FROM waterworks_account_attribute;
DELETE FROM waterworks_account;
DELETE FROM waterworks_attribute;


DELETE FROM waterworks_block_schedule;
DELETE FROM waterworks_classification;

DELETE FROM waterworks_formula;
DELETE FROM waterworks_stubout_node;
DELETE FROM waterworks_stubout;
DELETE FROM waterworks_installment;
DELETE FROM waterworks_itemaccount;
DELETE FROM waterworks_material;
DELETE FROM waterworks_meter;
DELETE FROM waterworks_metersize;
DELETE FROM waterworks_txntype;
DELETE FROM waterworks_zone;
DELETE FROM waterworks_sector;
