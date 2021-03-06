/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rameses.gov.etracs.waterworks.views;

import com.rameses.enterprise.treasury.cashreceipt.SerialCashReceiptPage;
import com.rameses.rcp.ui.annotations.StyleSheet;
import com.rameses.rcp.ui.annotations.Template;

/**
 *
 * @author elmonazareno
 */
@StyleSheet
@Template(value=SerialCashReceiptPage.class,target="content")
public class WaterworksCashReceiptPage extends javax.swing.JPanel {

    /**
     * Creates new form WaterCashReceiptPage
     */
    public WaterworksCashReceiptPage() {
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

        jPanel4 = new javax.swing.JPanel();
        xButton4 = new com.rameses.rcp.control.XButton();
        xButton5 = new com.rameses.rcp.control.XButton();
        xButton2 = new com.rameses.rcp.control.XButton();
        xButton3 = new com.rameses.rcp.control.XButton();
        xButton6 = new com.rameses.rcp.control.XButton();
        xDataTable1 = new com.rameses.rcp.control.XDataTable();
        jPanel3 = new javax.swing.JPanel();
        xFormPanel1 = new com.rameses.rcp.control.XFormPanel();
        xLabel11 = new com.rameses.rcp.control.XLabel();

        setLayout(new java.awt.BorderLayout());

        jPanel4.setLayout(new java.awt.FlowLayout(java.awt.FlowLayout.LEFT, 2, 2));

        xButton4.setName("specifyPayAmount"); // NOI18N
        xButton4.setVisibleWhen("#{ amountSpecified == false }");
        xButton4.setText("Specify Pay Amount");
        xButton4.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                xButton4ActionPerformed(evt);
            }
        });
        jPanel4.add(xButton4);

        xButton5.setName("payAll"); // NOI18N
        xButton5.setVisibleWhen("#{ amountSpecified == true }");
        xButton5.setText("Pay All");
        jPanel4.add(xButton5);

        xButton2.setName("previewReceipt"); // NOI18N
        xButton2.setVisibleWhen("#{ entity.txnmode =='ONLINE' ||  entity.txnmode =='OFFLINE' }");
        xButton2.setText("Preview Receipt");
        jPanel4.add(xButton2);

        xButton3.setName("showPayOptions"); // NOI18N
        xButton3.setVisibleWhen("#{ payOption!=null }");
        xButton3.setText("Pay Options");
        jPanel4.add(xButton3);

        xButton6.setName("viewStatement"); // NOI18N
        xButton6.setVisibleWhen("#{ payOption!=null }");
        xButton6.setText("View Statement");
        jPanel4.add(xButton6);

        add(jPanel4, java.awt.BorderLayout.NORTH);

        xDataTable1.setHandler("itemListModel");
        xDataTable1.setName("selectedItem"); // NOI18N
        xDataTable1.setColumns(new com.rameses.rcp.common.Column[]{
            new com.rameses.rcp.common.Column(new Object[]{
                new Object[]{"name", "item.code"}
                , new Object[]{"caption", "Acct No"}
                , new Object[]{"width", 80}
                , new Object[]{"minWidth", 0}
                , new Object[]{"maxWidth", 0}
                , new Object[]{"required", false}
                , new Object[]{"resizable", false}
                , new Object[]{"nullWhenEmpty", true}
                , new Object[]{"editable", false}
                , new Object[]{"visible", true}
                , new Object[]{"visibleWhen", null}
                , new Object[]{"alignment", "CENTER"}
                , new Object[]{"textCase", com.rameses.rcp.constant.TextCase.UPPER}
                , new Object[]{"typeHandler", new com.rameses.rcp.common.TextColumnHandler()}
            }),
            new com.rameses.rcp.common.Column(new Object[]{
                new Object[]{"name", "item.title"}
                , new Object[]{"caption", "Acct Title"}
                , new Object[]{"width", 200}
                , new Object[]{"minWidth", 0}
                , new Object[]{"maxWidth", 0}
                , new Object[]{"required", true}
                , new Object[]{"resizable", true}
                , new Object[]{"nullWhenEmpty", true}
                , new Object[]{"editable", false}
                , new Object[]{"visible", true}
                , new Object[]{"visibleWhen", null}
                , new Object[]{"textCase", com.rameses.rcp.constant.TextCase.UPPER}
                , new Object[]{"typeHandler", new com.rameses.rcp.common.LookupColumnHandler(null, "lookupItems")}
            }),
            new com.rameses.rcp.common.Column(new Object[]{
                new Object[]{"name", "remarks"}
                , new Object[]{"caption", "Particulars"}
                , new Object[]{"width", 250}
                , new Object[]{"minWidth", 0}
                , new Object[]{"maxWidth", 0}
                , new Object[]{"required", false}
                , new Object[]{"resizable", true}
                , new Object[]{"nullWhenEmpty", true}
                , new Object[]{"editable", false}
                , new Object[]{"visible", true}
                , new Object[]{"visibleWhen", null}
                , new Object[]{"textCase", com.rameses.rcp.constant.TextCase.UPPER}
                , new Object[]{"typeHandler", new com.rameses.rcp.common.TextColumnHandler()}
            }),
            new com.rameses.rcp.common.Column(new Object[]{
                new Object[]{"name", "amount"}
                , new Object[]{"caption", "Amount"}
                , new Object[]{"width", 120}
                , new Object[]{"minWidth", 120}
                , new Object[]{"maxWidth", 120}
                , new Object[]{"required", true}
                , new Object[]{"resizable", false}
                , new Object[]{"nullWhenEmpty", true}
                , new Object[]{"editable", false}
                , new Object[]{"visible", true}
                , new Object[]{"visibleWhen", null}
                , new Object[]{"textCase", com.rameses.rcp.constant.TextCase.UPPER}
                , new Object[]{"typeHandler", new com.rameses.rcp.common.DecimalColumnHandler("#,##0.00", -1.0, -1.0, false, 2)}
            })
        });
        xDataTable1.setIndex(10);
        xDataTable1.setVarStatus("status");
        add(xDataTable1, java.awt.BorderLayout.CENTER);

        jPanel3.setPreferredSize(new java.awt.Dimension(809, 40));
        jPanel3.setLayout(new java.awt.FlowLayout(java.awt.FlowLayout.RIGHT));

        xFormPanel1.setPreferredSize(new java.awt.Dimension(350, 26));

        xLabel11.setCaption("Total Amount");
        xLabel11.setExpression("#{ entity.amount }");
        xLabel11.setHorizontalAlignment(javax.swing.SwingConstants.RIGHT);
        xLabel11.setBackground(new java.awt.Color(245, 245, 245));
        xLabel11.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(180, 180, 180)));
        xLabel11.setCaptionWidth(120);
        xLabel11.setFont(new java.awt.Font("Courier New", 0, 14)); // NOI18N
        xLabel11.setFontStyle("font-size:14;");
        xLabel11.setOpaque(true);
        xLabel11.setPreferredSize(new java.awt.Dimension(0, 21));
        xFormPanel1.add(xLabel11);

        jPanel3.add(xFormPanel1);

        add(jPanel3, java.awt.BorderLayout.SOUTH);
    }// </editor-fold>//GEN-END:initComponents

    private void xButton4ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_xButton4ActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_xButton4ActionPerformed


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JPanel jPanel3;
    private javax.swing.JPanel jPanel4;
    private com.rameses.rcp.control.XButton xButton2;
    private com.rameses.rcp.control.XButton xButton3;
    private com.rameses.rcp.control.XButton xButton4;
    private com.rameses.rcp.control.XButton xButton5;
    private com.rameses.rcp.control.XButton xButton6;
    private com.rameses.rcp.control.XDataTable xDataTable1;
    private com.rameses.rcp.control.XFormPanel xFormPanel1;
    private com.rameses.rcp.control.XLabel xLabel11;
    // End of variables declaration//GEN-END:variables
}
