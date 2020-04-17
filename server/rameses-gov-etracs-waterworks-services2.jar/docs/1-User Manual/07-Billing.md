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
- 1. Manually by clicking on generate bill in the account
- 2. By batch billing

Each bill contains the ff: information (only the impt information must be noted):

<div class="table1">

| Name  	   | Description|
|:-------------|:-------------------------------------------------------|
|billno		   | The unique bill number. If generated thru a batch bill this number is calculated based on the batch bill no prefix and bill sequence. If manually it is automatically generated through the bill numbering format specified in the sys_var key <i>waterworks_billno_format</i>.|
|billrefno     | Usually for manual prepared bills to reference bills in the old system |
|billdate      | The date the bill was generated |	
|acctno        | Account number of the customer |
|meter         | Serial No, meter size and capacity and state of meter if ACTIVE or DEFECTIVE |
|acctname	   | The specified name of the account |
|acctstate	   | Status of the account whether ACTIVE,DISCONNECTED or UNMETERED (meaning no meter attached) |
|address	   | Address of the account |
|period|It contains the period fromdate and todate covered by this bill. The year and month of this bill is taken from the period fromdate.|
|readingdate   | the date the a reading was made for this bill|
|due date      | The due date of payment. After this payment, the penalties will be fired. |
|billexpirydate| The date bill is expired. Usually the date before the next bill is prepared. After this date, payments cannot be made anymore. The succeeding payments will be referened in the next bill | 
|validitydate|This refers to the next valid date. This is important because this will signal the system to recompute the bill. If for example the current date is more than validity date the surcharge will automatically fire and the system will move the validity date to the next applicable date|
|readings   |The previous reading and current reading. The volume is the difference in cu. meters. The amount is calculated based on the rules ```There will be no readings if there is no attached meter``` |
|balanceforward   |Balance from previous bill. Balance can be positive which means there are still unpaid dues or negative which means there was an excess payment or zero which means there are no unpaid dues from the previous bill.  |
|other charges   |Calculated by the system. It can be fixed monthly fees, or recurring fees like installments. |
| waters sales   |The amount calculated from the consumption |

</div>

## Billing Cycle ##
Each bill follows a the process depicted in the flowchart:


![alt text][billcycle]

- Steps 1-4. Bill Creation. The ff. processes execute at the same time:
> 1. __Create Bill__ - system creates the bill. Can be done manually or through batch billing.
> 2. __Calculate Forward Balance__ - System captures balance from the previous bill.
> 3. __Calculate Other Fees and Other Charges__ - System determines the other charges through the billing rules. 
> 4. __Apply Credit__ - This is applicable only if result in 2 is negative. The credits will be applied immediately to the charges and fees. 

- Step 5. Reading is manually performed. This is the point where the readings are done. If using a mobile reader, the bills are downloaded into the device including their balances. Upon making actual reading, the device can immediatly calculate the bill and print and give to the customer. Once returned to the office, all readings can be uploaded to the system. Without the device, readings must be encoded manually.

- Step 6-7. Posting consumption. The ff. processes execute at the same time:
> 6. __Add Consumption to Bill__. The calculated readings are posted to the ledger. This happens after the reading is approved.
> 7. __Apply Credits__. This is applicable only if after step 4 there are still credits unapplied or maybe the customer made payments prior to the readings. Credits will apply discounts when applicable.

- Step 8. __Print and Send Bill to Customer__. The bill is printed and sent in batches to customers

- Step 9. __Calculate Surcharge and Penalty__. If there were no payments made or if payments were made but still did not cover the full payment required after the due date, the surcharge will be automatically applied. The surcharge are set in the rules.

When the date is beyond the bill expiry date the bill will automatically close and will require to open a new bill. All payment transactions made after the bill expiry date will be carried over to the new bill. 

## Balance Forward Formula ##

The system will perform the ff. the following formula to arrive at the balance forward (This is applied to the previous bill)

```[Total billitems amount - amtpaid - discount]  - [Total Credits]```

You must countercheck this by checking the previous bill:
```[balance forward] + [total fees and charges] - [total payments] - [discounts]``` 

The countercheck value and the system generated value must be the same.



[billcycle]: ./images/bill/billcycle.gif






