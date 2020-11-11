alter table waterworks_payment add compromiseid varchar(50)
;

alter table waterworks_payment_item 
    add billitemid varchar(50), 
    add compromisefeeid varchar(50)
;

