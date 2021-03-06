/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rameses.gov.etracs.waterworks.views;

import com.rameses.rcp.ui.annotations.Template;
import com.rameses.seti2.views.CrudFormPage;

/**
 * @author elmonazareno
 */
@Template(CrudFormPage.class)
public class WaterworksBillingPeriodPage extends javax.swing.JPanel {

    /**
     * Creates new form WaterworksBillingSchedulePage
     */
    public WaterworksBillingPeriodPage() {
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

        xFormPanel1 = new com.rameses.rcp.control.XFormPanel();
        xFormPanel2 = new com.rameses.rcp.control.XFormPanel();
        xLabel1 = new com.rameses.rcp.control.XLabel();
        xLabel2 = new com.rameses.rcp.control.XLabel();
        xLabel3 = new com.rameses.rcp.control.XLabel();
        xDateField1 = new com.rameses.rcp.control.XDateField();
        xDateField2 = new com.rameses.rcp.control.XDateField();
        xDateField6 = new com.rameses.rcp.control.XDateField();
        xDateField3 = new com.rameses.rcp.control.XDateField();
        xDateField5 = new com.rameses.rcp.control.XDateField();
        xDateField4 = new com.rameses.rcp.control.XDateField();
        xDateField7 = new com.rameses.rcp.control.XDateField();

        xFormPanel2.setCaptionVAlignment(com.rameses.rcp.constant.UIConstants.CENTER);
        xFormPanel2.setCaptionWidth(150);

        xLabel1.setCaption("Schedule Code");
        xLabel1.setExpression("#{ entity.scheduleid }");
        xLabel1.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(180, 180, 180)));
        xLabel1.setPreferredSize(new java.awt.Dimension(0, 20));
        xFormPanel2.add(xLabel1);

        xLabel2.setCaption("From Date");
        xLabel2.setExpression("#{ entity.fromdate }");
        xLabel2.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(180, 180, 180)));
        xLabel2.setCellPadding(new java.awt.Insets(20, 0, 0, 0));
        xLabel2.setDateFormat("yyyy-MM-dd");
        xLabel2.setPreferredSize(new java.awt.Dimension(120, 20));
        xFormPanel2.add(xLabel2);

        xLabel3.setCaption("To Period");
        xLabel3.setExpression("#{ entity.todate }");
        xLabel3.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(180, 180, 180)));
        xLabel3.setDateFormat("yyyy-MM-dd");
        xLabel3.setPreferredSize(new java.awt.Dimension(120, 20));
        xFormPanel2.add(xLabel3);

        xDateField1.setCaption("Reading Date");
        xDateField1.setName("entity.readingdate"); // NOI18N
        xDateField1.setCellPadding(new java.awt.Insets(20, 0, 0, 0));
        xDateField1.setPreferredSize(new java.awt.Dimension(120, 20));
        xDateField1.setRequired(true);
        xFormPanel2.add(xDateField1);

        xDateField2.setCaption("Reading End Date");
        xDateField2.setName("entity.readingenddate"); // NOI18N
        xDateField2.setPreferredSize(new java.awt.Dimension(120, 20));
        xFormPanel2.add(xDateField2);

        xDateField6.setCaption("Bill Date");
        xDateField6.setName("entity.billdate"); // NOI18N
        xDateField6.setCellPadding(new java.awt.Insets(20, 0, 0, 0));
        xDateField6.setPreferredSize(new java.awt.Dimension(120, 20));
        xFormPanel2.add(xDateField6);

        xDateField3.setCaption("Billing End Date");
        xDateField3.setName("entity.billingenddate"); // NOI18N
        xDateField3.setPreferredSize(new java.awt.Dimension(120, 20));
        xFormPanel2.add(xDateField3);

        xDateField5.setCaption("Discount Due Date");
        xDateField5.setName("entity.discdate"); // NOI18N
        xDateField5.setCellPadding(new java.awt.Insets(20, 0, 0, 0));
        xDateField5.setPreferredSize(new java.awt.Dimension(120, 20));
        xFormPanel2.add(xDateField5);

        xDateField4.setCaption("Payment Due Date");
        xDateField4.setName("entity.duedate"); // NOI18N
        xDateField4.setCellPadding(new java.awt.Insets(10, 0, 0, 0));
        xDateField4.setPreferredSize(new java.awt.Dimension(120, 20));
        xFormPanel2.add(xDateField4);

        xDateField7.setCaption("Bill Expiry Date");
        xDateField7.setName("entity.billexpirydate"); // NOI18N
        xDateField7.setCellPadding(new java.awt.Insets(10, 0, 0, 0));
        xDateField7.setPreferredSize(new java.awt.Dimension(120, 20));
        xFormPanel2.add(xDateField7);

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(this);
        this.setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(xFormPanel2, javax.swing.GroupLayout.DEFAULT_SIZE, 386, Short.MAX_VALUE)
                .addContainerGap())
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(19, 19, 19)
                .addComponent(xFormPanel2, javax.swing.GroupLayout.PREFERRED_SIZE, 337, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(20, Short.MAX_VALUE))
        );
    }// </editor-fold>//GEN-END:initComponents


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private com.rameses.rcp.control.XDateField xDateField1;
    private com.rameses.rcp.control.XDateField xDateField2;
    private com.rameses.rcp.control.XDateField xDateField3;
    private com.rameses.rcp.control.XDateField xDateField4;
    private com.rameses.rcp.control.XDateField xDateField5;
    private com.rameses.rcp.control.XDateField xDateField6;
    private com.rameses.rcp.control.XDateField xDateField7;
    private com.rameses.rcp.control.XFormPanel xFormPanel1;
    private com.rameses.rcp.control.XFormPanel xFormPanel2;
    private com.rameses.rcp.control.XLabel xLabel1;
    private com.rameses.rcp.control.XLabel xLabel2;
    private com.rameses.rcp.control.XLabel xLabel3;
    // End of variables declaration//GEN-END:variables
}
