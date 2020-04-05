/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rameses.gov.etracs.waterworks.views;

import com.rameses.osiris2.themes.OKCancelPage;
import com.rameses.rcp.ui.annotations.Template;

/**
 *
 * @author elmonazareno
 */
@Template(OKCancelPage.class)
public class WaterworksBillingPeriodLookupPage extends javax.swing.JPanel {

    /**
     * Creates new form WaterworksBillingPeriodLookupPage
     */
    public WaterworksBillingPeriodLookupPage() {
        initComponents();
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        xFormPanel2 = new com.rameses.rcp.control.XFormPanel();
        xLabel1 = new com.rameses.rcp.control.XLabel();
        xIntegerField1 = new com.rameses.rcp.control.XIntegerField();
        monthList1 = new com.rameses.enterprise.components.MonthList();

        xFormPanel2.setCaptionVAlignment(com.rameses.rcp.constant.UIConstants.CENTER);
        xFormPanel2.setCaptionWidth(150);
        xFormPanel2.setPadding(new java.awt.Insets(10, 15, 5, 0));

        xLabel1.setCaption("Schedule Group");
        xLabel1.setExpression("#{ scheduleid }");
        xFormPanel2.add(xLabel1);

        xIntegerField1.setCaption("Year");
        xIntegerField1.setName("year"); // NOI18N
        xIntegerField1.setCellPadding(new java.awt.Insets(20, 0, 0, 0));
        xIntegerField1.setPreferredSize(new java.awt.Dimension(80, 20));
        xIntegerField1.setRequired(true);
        xFormPanel2.add(xIntegerField1);

        monthList1.setCaption("Month");
        monthList1.setName("month"); // NOI18N
        monthList1.setRequired(true);
        xFormPanel2.add(monthList1);

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(this);
        this.setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(xFormPanel2, javax.swing.GroupLayout.PREFERRED_SIZE, 395, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(54, Short.MAX_VALUE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(xFormPanel2, javax.swing.GroupLayout.PREFERRED_SIZE, 190, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(104, Short.MAX_VALUE))
        );
    }// </editor-fold>//GEN-END:initComponents


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private com.rameses.enterprise.components.MonthList monthList1;
    private com.rameses.rcp.control.XFormPanel xFormPanel2;
    private com.rameses.rcp.control.XIntegerField xIntegerField1;
    private com.rameses.rcp.control.XLabel xLabel1;
    // End of variables declaration//GEN-END:variables
}
