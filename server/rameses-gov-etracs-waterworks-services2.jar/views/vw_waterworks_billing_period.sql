drop view if exists vw_waterworks_billing_period 
;
create view vw_waterworks_billing_period as 
select bs.*, ((bs.year * 12) + bs.month) as periodindexno  
from waterworks_billing_period bs 
;
