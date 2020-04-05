<style>
.table1 th:first-child  {
	width: 110px;
}
.table1 th:nth-of-type(2)  {
	width: 50px;
}
.table1 th:nth-of-type(3)  {
	width: 70px;
}
.table1 td {
	vertical-align: top;
}
.table1 {
	font-size: 10px;
}
</style>


waterworks_billing
====================


__waterworks_billing__

 <div class="table1">

|Field     |Type	|Required | Description| 	
|:-----	    |:-----	|:----	  |:------| 
| objid     |string	|Y        |The primary key|
| billno    |string  |Y        |auto generated. Use sys_var <i>__waterworks_billno_format__</i> |  
| billdate  |datetime |Y       |Date bill was processed|  
| refbillno |string  |Y        |specified during capture for initial reference to old system |
| state     |string |Y        | DRAFT = state is still in draft mode. The bill is not yet active.<br>OPEN=Bill is active. Ledger items or payments can be added.<br>CLOSED=bill is closed. No transactions can be made with this bill. Succeeding transactions will be made on the next bill <br> See Note 1|
| periodid  |string  |Y        |link to waterworks_billing_period. Copied from batch if processed through batch. If manually prepared uses the subarea.nextperiod of the account |
| acctid    |string  |Y        |link to waterworks_account.  |
| acctinfoid |string  |Y        |link to the latest waterworks_account_info, in this case the waterworks_account.acctinofid|
| expirydate|date    |Y        | bill expirydate. a day before next billdate. After this date, ledger items or payments cannot be added to the bill anymore. See Note 2|
| lastprocessdate |datetime |Y  | date the bill was last processed for surcharge computations. Everytime a bill is accessed whether for payment or for opening or for processing next billdate, this date is checked. If less than currentdate, the rules will be fired and the processingdate will be updated. |
| balanceforward |decimal    |Y  | Balance forward is computed from the balance of previous bill. See Note 3 |
| batchid |string    |N  | This is only filled when the bill was generated through batch processing |
| readingdate |string    |N  | Copied from batch during batch preparation.  Otherwise this is manually entered|
| reader_objid |string    |N  | Copied from batch during batch preparation. objid of reader|
| reader_name |string    |N  | Copied from batch during batch preparation. display name of reader|
| preparedby_objid |string    |N  | Copied from batch if batchid is not null. Auto filled depending on user account |
| preparedby_name |string    |N  | Copied from batch if batchid is not null. Auto filled depending on user account |


</div>

## Notes ##
>
 1) Status 0 means bill was already created but the summaries of previous bill is not yet done. We need to close the previous bill before starting a new one. Once the previous bill is closed, the new bill can be processed. The new bill state will be 1 while the previous bill state will be 2.  


 2) Expirydate is derived from nextbilldate. To do this find the next period by adding one month to the bill year and month and call `WaterworksScheduleService.getSchedule` and pass the subarea.schedulegroupid and the next month year. Get the billdate and deduct one day. Once this date is surpassed by the current date any payments made will not be accepted anymore to reference this bill. 

 3) balanceforward is calculated as follows:
	- Find the previous bill and close it first. Bill can be closed even if it is not yet expired. 
	- Run the rules to calculate penalties to update the ledger, update the previous bill status to 2 and lastprocessdate to currentdate.
	- Retrieve all waterworks_ledger for account where amount - amtpaid - discount > 0 and month year <= previous bill month and year
	- Summarize total of item 2 into total_unpaid
	- Get sum of waterworks_credit dr-cr and save as total_credits
	- balanceforward = total_unpaid - total_credits
	- Compare it with the ff.formula where the billid is the objid of the previous bill (amount should be equal):
	<pre>
	   waterworks_billing.balanceforward WHERE objid = :billid 
	   + SUM(waterworks_ledger.amount) WHERE billid = :billid  
	   + SUM(waterworks_payment.amount) WHERE billid = :billid
	</pre>    


__vw_waterworks_billing__
| Field    |Type	|Description| 	
|---	   |:---	|:----| 
| objid    |string	|The primary key|

