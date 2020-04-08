<style>
.table1 th:first-child  {
	width: 100px;
}
.table1 td {
	vertical-align: top;
	font-size:11px;
}
</style>

# Building Account Ledgers #

Before a customer account can be activated, we must ensure that the beginning balances are setup. To do this we need to encode data in the ledgers. Because we need to set up the bills properly, after setting up the ledger we need to generate our initial bill for the current month so that the system can proceed from there. To understand more about Bills, please refer to the section Billing.

Check first the next period of the subarea where the account is assigned. Go  


```
The account cannot be approved unless there is an initial billing.
```
To view the account ledger, open first the customer account. From the form, click the Ledger Tab.

![alt text][acctledger]

## Adding a Ledger Entry ##

Get the latest billing for this account and determine the year and month. In the system, the year and month usually refers to the begiinning of the period. If that is not the case you have to make the necessary adjustments and be consistent about it. In the Ledger tab of the customer account, click on the `Add Ledger Entry` button. The ledger entry form will be displayed. Enter the data required.


- __Item__ - Lookup the appropriate item account. If the entry not in the list, you can go to the Waterworks ItemAccount list and add the entry. See section *Waterworks Itemaccount*.

- __Year__ - Enter Year of period.
- __Month__ - Enter Month of period.
- __Amount__ - Enter Amount. If it is partially paid, enter the remaining balance. 
- __ Particulars__ - Specify specific details of this entry. 

Click on `Save` to add the entry on the list. To edit, select the item in the list and click on `Open`. When the form appears, click on the `Edit` button to make the fields editable.

If there are prior balances from the current period, you need to add ledger entries using the previous year and month. If you are implementing interest per month penalty for unpaid dues, then you must make the water sales entries for every month so that the system can automatically compute it in the succeedung billings. Otherwise just enter the prior year and month and summarize all the other balances so it will be easier.

Once completed, click on the Generate Bill to view the initial bill.

## Adding Credits ##

On the other hand, if there are no previous unpaid balances but there is overpayment, you need to record this in the credits entry. This will have a negative value effect in the balance forward. To add credits, go to the Credits Tab of the customer account then click on the `Add Credit Entry` button. Fill in the necessary data and click on save.

- __Year__ - Enter Year of period.
- __Month__ - Enter Month of period.
- __Amount__ - Enter Amount of excess payment.
- __ Particulars__ - Specify specific details of this entry. 

## Adding Consumption ##
This entry is required for customer accounts that have meters. This will serve as the initial reading that will become the previous reading in the next bill. *This is not applicable for unmetered accounts*. 







### Conditions for Approval ###

- __For New Account__. If this is an entirely new account and there are no readings yet, a ledger may not be necessary unless there are some charges you want included such as material fees and the like. This is automatically done if this were through the New Connection transaction. However, in capture mode, the fees and charges must be encoded manually in the ledger. To add ledger entries go to *Building Ledgers* section. Next ensure that there will be a previous consumption entry. This will be the initial reading.  

- __For existing Accounts without balance__. 

- __For existing Accounts with balance__. 

Before a system can be approved, the system will ensure that the billings will be in sync when you start. It is important that you build first the current ledger once and the system will continue 



[acctledger]: ./images/ledger/acctledger.png