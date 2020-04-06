<style>
.table1 th:first-child  {
	width: 110px;
}
.table1 th:nth-of-type(2)  {
	width: 50px;
}
.table1 td {
	vertical-align: top;
}
.table1 {
	font-size: 12px;
}
</style>

__waterworks_subarea__

<div class="table1">

|Name  	|Type	|Required |Description|
|:---   |:---   |---      |:---|
|objid   | string | Yes |  primary key|
|code   | string | Yes | unique code |
|description   | string | Yes |  |
|areaid   | string | Yes | link to waterworks_area |
|schedulegroupid   | string | Yes | link to waterworks_schedule_group |
|nextperiodid   | string | Yes |  link to waterworks_billing_period |
|barangay_objid   | string | Yes |  |
|barangay_name   | string | Yes |   |

</div>

To ensure that the schedule id specified from sub area is the nextperiod, we create the ff. link: 

|waterworks_subarea	| waterworks_billing_period |
|:----              |:----                      |
|nextperiodid       | objid                     |
|schedulegroupid    | scheduleid                |    


