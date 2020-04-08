<style>
.table1 th:first-child  {
	width: 100px;
}
.table1 td {
	vertical-align: top;
}
</style>

# Billing #

The billing is prepared monthly and can be generated in two ways:
>
1. Manually by clicking on generate bill in the account
2. By batch billing

Each billing contains the ff: information:

<div class="table1">

| Name  	   | Description|
|:-------------|:-------------------------------------------------------|
|billno		   | The unique bill number. If generated thru a batch bill this number is calculated based on the batch bill no prefix and bill sequence. If manually it is automatically generated through the bill numbering format specified in the sys_var key <i>waterworks_billno_format</i>.|
|refbillno     | Usually for manual prepared bills to reference bills in the old system |
|billdate      | The date the bill was generated |	
|acctno        | Account number of the customer |
|acctname	   | The specified name of the account |
|period|It contains the period fromdate and todate covered by this bill. The year and month of this bill is taken from the period fromdate.|
|readingdate   | the date the a reading was made for this bill|
|due date      | The due date of payment. After this payment, the penalties will be fired. |
|billexpirydate| The date bill is expired. Usually the date before the next bill is prepared. After this date, payments cannot be made anymore. The succeeding payments will be referened in the next bill | 

</div>


It references the account ledger items and payments made for 
that bill. Monthly consumption payments must be referenced with a bill. If a bill does not exist yet, or 
is expired, and a client wishes to pay, the latest bill must be generated first. It can be created in two ways. 


<br>
The billing contains the balanceforward which is a snapshot of all unpaid arrears, including penalties
of the previous months at the time of preparation. To view how it arrived at this amount, you need to
check the previous months' bill. To get the balance of a bill, it follows the ff. formula: 

<pre>
    balanceforward + total billitem amount - total payments made   
</pre>  

If the balance forward is negative, it means there is an overpayment. This overpayment is recorded in the
account credits table. 

## Billing Period ##