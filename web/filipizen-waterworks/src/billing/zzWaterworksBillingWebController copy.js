import React from "react";
import { Page, Panel, StateProvider, Content } from "rsi-react-web-components";

import { EPayment } from "rsi-react-filipizen-components";
import OnlineWaterworksBilling from "./OnlineWaterworksBilling";

const WaterworksBillingWebController = (props) => {
  const module = {
    title: "Waterworks Tax Online Billing",
    component: OnlineWaterworksBilling
  };
  return (
    <Page>
      <Content center>
        <EPayment module={module} {...props} />
      </Content>
    </Page>
  )
};

export default WaterworksBillingWebController;
