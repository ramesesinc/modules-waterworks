/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rameses.gov.etracs.waterworks.views;

import com.rameses.rcp.ui.annotations.StyleSheet;
import com.rameses.rcp.ui.annotations.Template;
import com.rameses.seti2.views.CrudFormPage;

/**
 *
 * @author Rameses
 */
@StyleSheet
@Template(CrudFormPage.class)
public class WaterConsumptionPage extends javax.swing.JPanel {

    /**
     * Creates new form CaptureConsumptionPage
     */
    public WaterConsumptionPage() {
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

        xTabbedPane1 = new com.rameses.rcp.control.XTabbedPane();
        jPanel1 = new javax.swing.JPanel();
        xFormPanel5 = new com.rameses.rcp.control.XFormPanel();
        xIntegerField1 = new com.rameses.rcp.control.XIntegerField();
        monthList1 = new com.rameses.enterprise.components.MonthList();
        xLabel13 = new com.rameses.rcp.control.XLabel();
        xLabel11 = new com.rameses.rcp.control.XLabel();
        xLabel14 = new com.rameses.rcp.control.XLabel();
        xLabel12 = new com.rameses.rcp.control.XLabel();
        xIntegerField2 = new com.rameses.rcp.control.XIntegerField();
        xIntegerField3 = new com.rameses.rcp.control.XIntegerField();
        xLabel1 = new com.rameses.rcp.control.XLabel();
        xDecimalField2 = new com.rameses.rcp.control.XDecimalField();
        xDecimalField3 = new com.rameses.rcp.control.XDecimalField();
        xCheckBox1 = new com.rameses.rcp.control.XCheckBox();
        xButton1 = new com.rameses.rcp.control.XButton();

        xTabbedPane1.setItems("sections");

        xFormPanel5.setCaptionVAlignment(com.rameses.rcp.constant.UIConstants.CENTER);
        xFormPanel5.setCaptionWidth(180);
        xFormPanel5.setPadding(new java.awt.Insets(0, 5, 20, 5));

        xIntegerField1.setCaption("Year");
        xIntegerField1.setName("entity.year"); // NOI18N
        xIntegerField1.setPreferredSize(new java.awt.Dimension(80, 20));
        xFormPanel5.add(xIntegerField1);

        monthList1.setCaption("Month");
        monthList1.setName("entity.month"); // NOI18N
        xFormPanel5.add(monthList1);

        xLabel13.setCaption("Entry Status");
        xLabel13.setExpression("#{ entity.state }");
        xLabel13.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(180, 180, 180)));
        xLabel13.setPreferredSize(new java.awt.Dimension(0, 20));
        xFormPanel5.add(xLabel13);

        xLabel11.setCaption("Txn Type");
        xLabel11.setExpression("#{ entity.txnmode }");
        xLabel11.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(180, 180, 180)));
        xLabel11.setPreferredSize(new java.awt.Dimension(0, 20));
        xFormPanel5.add(xLabel11);

        xLabel14.setCaption("Meter Brand");
        xLabel14.setExpression("#{ account.meter.brand }");
        xLabel14.setVisibleWhen("#{ account.meter.objid != null }");
        xLabel14.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(180, 180, 180)));
        xLabel14.setCellPadding(new java.awt.Insets(20, 0, 0, 0));
        xLabel14.setPreferredSize(new java.awt.Dimension(0, 20));
        xFormPanel5.add(xLabel14);

        xLabel12.setCaption("Meter Status");
        xLabel12.setExpression("#{ account.meter.state }");
        xLabel12.setVisibleWhen("#{ account.meter.objid != null }");
        xLabel12.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(180, 180, 180)));
        xLabel12.setPreferredSize(new java.awt.Dimension(0, 20));
        xFormPanel5.add(xLabel12);

        xIntegerField2.setCaption("Prev. Reading");
        xIntegerField2.setDepends(new String[] {"entity.txnmode"});
        xIntegerField2.setDisableWhen("#{ true }");
        xIntegerField2.setName("entity.prevreading"); // NOI18N
        xIntegerField2.setVisibleWhen("#{ entity.txnmode != 'BEGIN_BALANCE' && account.meter?.objid !=null }");
        xIntegerField2.setCellPadding(new java.awt.Insets(20, 0, 0, 0));
        xFormPanel5.add(xIntegerField2);

        xIntegerField3.setCaption("Reading");
        xIntegerField3.setName("entity.reading"); // NOI18N
        xIntegerField3.setVisibleWhen("#{ account.meter?.objid !=null }");
        xFormPanel5.add(xIntegerField3);

        xLabel1.setCaption("Volume");
        xLabel1.setExpression("#{ entity.volume }");
        xLabel1.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        xLabel1.setVisibleWhen("#{ entity.prevreading != null || account.meter?.objid == null }");
        xFormPanel5.add(xLabel1);

        xDecimalField2.setCaption("Amount");
        xDecimalField2.setDepends(new String[] {"entity.txnmode"});
        xDecimalField2.setName("entity.amount"); // NOI18N
        xDecimalField2.setCellPadding(new java.awt.Insets(20, 0, 0, 0));
        xDecimalField2.setRequired(true);
        xDecimalField2.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                xDecimalField2ActionPerformed(evt);
            }
        });
        xFormPanel5.add(xDecimalField2);

        xDecimalField3.setCaption("Amt Paid");
        xDecimalField3.setName("entity.amtpaid"); // NOI18N
        xDecimalField3.setRequired(true);
        xDecimalField3.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                xDecimalField3ActionPerformed(evt);
            }
        });
        xFormPanel5.add(xDecimalField3);

        xCheckBox1.setCaption("Hold");
        xCheckBox1.setName("entity.hold"); // NOI18N
        xCheckBox1.setVisibleWhen("#{ entity.txnmode != 'BEGIN_BALANCE' }");
        xCheckBox1.setCellPadding(new java.awt.Insets(20, 0, 0, 0));
        xCheckBox1.setMargin(new java.awt.Insets(0, 0, 0, 0));
        xCheckBox1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                xCheckBox1ActionPerformed(evt);
            }
        });
        xFormPanel5.add(xCheckBox1);

        xButton1.setVisibleWhen("#{ entity.meter?.objid != null }");
        xButton1.setText("Calculate Amount");

        javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(xFormPanel5, javax.swing.GroupLayout.PREFERRED_SIZE, 430, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(xButton1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(0, 28, Short.MAX_VALUE))
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(xFormPanel5, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(18, 18, 18)
                .addComponent(xButton1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(38, Short.MAX_VALUE))
        );

        xTabbedPane1.addTab("General Info", jPanel1);

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(this);
        this.setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(xTabbedPane1, javax.swing.GroupLayout.DEFAULT_SIZE, 485, Short.MAX_VALUE)
                .addContainerGap())
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(xTabbedPane1, javax.swing.GroupLayout.DEFAULT_SIZE, 506, Short.MAX_VALUE)
                .addContainerGap())
        );
    }// </editor-fold>//GEN-END:initComponents

    private void xDecimalField2ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_xDecimalField2ActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_xDecimalField2ActionPerformed

    private void xCheckBox1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_xCheckBox1ActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_xCheckBox1ActionPerformed

    private void xDecimalField3ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_xDecimalField3ActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_xDecimalField3ActionPerformed

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JPanel jPanel1;
    private com.rameses.enterprise.components.MonthList monthList1;
    private com.rameses.rcp.control.XButton xButton1;
    private com.rameses.rcp.control.XCheckBox xCheckBox1;
    private com.rameses.rcp.control.XDecimalField xDecimalField2;
    private com.rameses.rcp.control.XDecimalField xDecimalField3;
    private com.rameses.rcp.control.XFormPanel xFormPanel5;
    private com.rameses.rcp.control.XIntegerField xIntegerField1;
    private com.rameses.rcp.control.XIntegerField xIntegerField2;
    private com.rameses.rcp.control.XIntegerField xIntegerField3;
    private com.rameses.rcp.control.XLabel xLabel1;
    private com.rameses.rcp.control.XLabel xLabel11;
    private com.rameses.rcp.control.XLabel xLabel12;
    private com.rameses.rcp.control.XLabel xLabel13;
    private com.rameses.rcp.control.XLabel xLabel14;
    private com.rameses.rcp.control.XTabbedPane xTabbedPane1;
    // End of variables declaration//GEN-END:variables
}
