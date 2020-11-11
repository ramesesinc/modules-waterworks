import React, { useState } from 'react'
import {
  Card,
  Panel,
  Text,
  Button,
  FormPanel,
  ActionBar,
  Spacer,
  Error,
  Subtitle,
  Title,
  BackLink,
  useData,
  Table,
  TableColumn,
  currencyFormat
} from 'rsi-react-web-components'

const origin = 'filipizen'

const OnlineBilling = ({
  title,
  partner,
  onCancel,
  onSubmit,
  error: paymentError
}) => {
  const [ctx, dispatch] = useData();
  const { refno, txntype, contact, bill: initialBill } = ctx;
  const [bill, setBill] = useState(initialBill);
  const [error, setError] = useState(paymentError);
  const [loading, setLoading] = useState(false)

  const checkoutPayment = () => {
    onSubmit({
      refno,
      txntype,
      origin,
      orgcode: partner.id,
      billtoyear: bill.billtoyear,
      billtoqtr: bill.billtoqtr,
      paidby: bill.paidby,
      paidbyaddress: bill.paidbyaddress,
      amount: bill.amount,
      info: {data: bill },
      particulars: `Wateworks Account No. ${bill.acctno}`
    });
  }

  const onCancelBilling = () => {
    onCancel(0);
  }

  return (
    <Card style={{maxWidth: 500}}>
      <Title>{title}</Title>
      <Subtitle>Billing Information</Subtitle>
      <Spacer />
        <Error msg={error} />
        <FormPanel context={bill} handler={setBill}>
          <Text name="acctno" caption="Account No." readOnly />
          <Text name="acctname" caption="Account Name" readOnly />
          <Text name="address.text" caption="Address" readOnly />
          <Text name="classificationid" caption="Classification" readOnly />
          <Text name="billno" caption="Last Bill Period" readOnly />
          <Panel row>
            <Text name="monthname" caption="Bill Month" readOnly />
            <Text name="year" caption="Bill Year" readOnly />
          </Panel>
          <Panel row>
            <Text name="meter.size.title" caption="Meter Size" readOnly />
            <Text name="consumption.prev.reading" caption="Previous Reading" readOnly />
            <Text name="consumption.reading" caption="Current Reading" readOnly />
            <Text name="consumption.volume" caption="Consumption" readOnly />
          </Panel>
          <Spacer />
          <h4>Bill Details</h4>
          <Table items={bill.items} showPagination={false}>
            <TableColumn expr="item.title" caption="Account" />
            <TableColumn expr="remarks" caption="Particulars" />
            <TableColumn
              expr={item =>  currencyFormat(item.amount)}
              caption="Amount Due"
              type="decimal"
              align="right"
            />
          </Table>
          <Panel style={styles.totalContainer}>
            <h4 style={styles.total}>TOTAL</h4>
            <h4 style={styles.amount}>{currencyFormat(bill.amount)}</h4>
          </Panel>
        </FormPanel>
      <ActionBar disabled={loading}>
        <BackLink caption='Back' action={onCancelBilling} />
        <Button caption='Confirm Payment' action={checkoutPayment} disableWhen={bill.amount === 0} />
      </ActionBar>
    </Card>
  )
}

const styles = {
  subtitle: {
    fontSize: 16,
    fontWeight: 400,
    opacity: 0.8,
    color: "green"
  },
  totalContainer: {
    display: "flex",
    justifyContent: "flex-end",
    marginTop: -10
  },
  total: {
    fontWeight: 800,
    marginRight: 40,
  },
  amount: {
    marginRight: 20,
  }
};

export default OnlineBilling
