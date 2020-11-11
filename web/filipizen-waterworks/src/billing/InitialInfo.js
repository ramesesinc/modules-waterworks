import React, { useState } from 'react'
import {
  Text,
  Title,
  Button,
  ActionBar,
  Subtitle,
  Spacer,
  Service,
  Error,
  BackLink,
  useData,
  Card
} from 'rsi-react-web-components'

const InitialInfo = ({
  title,
  partner,
  moveNextStep,
  movePrevStep,
}) => {

  const [ctx, dispatch] = useData();
  const { txntype } = ctx;

  const [error, setError] = useState()
  const [loading, setLoading] = useState(false)
  const [refno, setRefno] = useState()

  const getBilling = async (billOptions = {}) => {
    const svc = await Service.lookupAsync(`${partner.id}:OnlineWaterworksBillingService`, "waterworks")
    const params = { txntype, refno, ...billOptions }
    return await svc.invoke("getBilling", params);
  }

  const loadBill = (billOptions = {}) => {
    setLoading(true);
    setError(null);
    getBilling(billOptions).then(bill => {
      dispatch({type: "SET_BILL", refno: refno, bill: bill});
      moveNextStep();
    }).catch(err => {
      setError(err.toString());
      setLoading(false)
    })
  }

  return (
    <React.Fragment>
    <Card>
      <Title>{title}</Title>
      <Subtitle>Initial Information</Subtitle>
      <Spacer />
      <Error msg={error} />
      <Text
        caption="Account No."
        name="refno"
        value={refno}
        onChange={setRefno}
        readOnly={loading}
        autoFocus={true}
      />
      <ActionBar>
        <BackLink caption='Back' variant="text" action={movePrevStep} />
        <Button caption='Next' action={loadBill} loading={loading} disabled={loading} />
      </ActionBar>
    </Card>
    </React.Fragment>
  )
}

export default InitialInfo
