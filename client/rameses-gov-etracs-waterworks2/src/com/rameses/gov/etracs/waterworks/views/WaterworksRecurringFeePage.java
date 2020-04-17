/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rameses.gov.etracs.waterworks.views;

import com.rameses.rcp.ui.annotations.Template;
import com.rameses.seti2.views.CrudFormPage;

/**
 *
 * @author elmonazareno
 */
@Template(CrudFormPage.class)
public class WaterworksRecurringFeePage extends javax.swing.JPanel {

    /**
     * Creates new form WaterworksRecurringFee
     */
    public WaterworksRecurringFeePage() {
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
        xFormPanel1 = new com.rameses.rcp.control.XFormPanel();
        xComboBox1 = new com.rameses.rcp.control.XComboBox();
        xLookupField1 = new com.rameses.rcp.control.XLookupField();
        xDecimalField1 = new com.rameses.rcp.control.XDecimalField();
        xDecimalField3 = new com.rameses.rcp.control.XDecimalField();
        xDecimalField4 = new com.rameses.rcp.control.XDecimalField();
        xIntegerField2 = new com.rameses.rcp.control.XIntegerField();
        monthList1 = new com.rameses.enterprise.components.MonthList();
        xIntegerField1 = new com.rameses.rcp.control.XIntegerField();
        xDecimalField2 = new com.rameses.rcp.control.XDecimalField();
        jScrollPane1 = new javax.swing.JScrollPane();
        xTextArea1 = new com.rameses.rcp.control.XTextArea();
        xCheckBox1 = new com.rameses.rcp.control.XCheckBox();
        xPanel1 = new com.rameses.rcp.control.XPanel();
        schemaList1 = new com.rameses.seti2.components.SchemaList();

        setLayout(new java.awt.BorderLayout());

        xTabbedPane1.setPreferredSize(new java.awt.Dimension(631, 456));

        xFormPanel1.setCaptionWidth(150);

        xComboBox1.setCaption("Type");
        xComboBox1.setExpression("");
        xComboBox1.setItemKey("");
        xComboBox1.setItems("types");
        xComboBox1.setName("entity.type"); // NOI18N
        xFormPanel1.add(xComboBox1);

        xLookupField1.setCaption("Item Account");
        xLookupField1.setExpression("#{ entity.item.objid }  #{ entity.item.title } ");
        xLookupField1.setHandler("waterworks_itemaccount:lookup");
        xLookupField1.setName("entity.item"); // NOI18N
        xLookupField1.setPreferredSize(new java.awt.Dimension(0, 20));
        xFormPanel1.add(xLookupField1);

        xDecimalField1.setCaption("Amount");
        xDecimalField1.setName("entity.amount"); // NOI18N
        xFormPanel1.add(xDecimalField1);

        xDecimalField3.setCaption("Amt Paid");
        xDecimalField3.setName("entity.amtpaid"); // NOI18N
        xFormPanel1.add(xDecimalField3);

        xDecimalField4.setCaption("Balance");
        xDecimalField4.setDisableWhen("#{ true }");
        xDecimalField4.setName("entity.balance"); // NOI18N
        xFormPanel1.add(xDecimalField4);

        xIntegerField2.setCaption("Start Year");
        xIntegerField2.setName("entity.startyear"); // NOI18N
        xIntegerField2.setCellPadding(new java.awt.Insets(20, 0, 0, 0));
        xFormPanel1.add(xIntegerField2);

        monthList1.setCaption("Start Month");
        monthList1.setName("entity.startmonth"); // NOI18N
        xFormPanel1.add(monthList1);

        xIntegerField1.setCaption("Term");
        xIntegerField1.setDepends(new String[] {"entity.type"});
        xIntegerField1.setName("entity.term"); // NOI18N
        xIntegerField1.setVisibleWhen("#{ entity.type == 'installment' }");
        xFormPanel1.add(xIntegerField1);

        xDecimalField2.setCaption("Installment Amount");
        xDecimalField2.setDepends(new String[] {"entity.type"});
        xDecimalField2.setName("entity.installmentamount"); // NOI18N
        xDecimalField2.setText("entity.installmentamount");
        xDecimalField2.setVisibleWhen("#{ entity.type == 'installment' }");
        xFormPanel1.add(xDecimalField2);

        jScrollPane1.setPreferredSize(new java.awt.Dimension(0, 38));

        xTextArea1.setCaption("Particulars");
        xTextArea1.setName("entity.particulars"); // NOI18N
        jScrollPane1.setViewportView(xTextArea1);

        xFormPanel1.add(jScrollPane1);

        xCheckBox1.setCaption("");
        xCheckBox1.setCheckValue(1);
        xCheckBox1.setDisableWhen("#{ true }");
        xCheckBox1.setName("entity.system"); // NOI18N
        xCheckBox1.setUncheckValue(0);
        xCheckBox1.setCellPadding(new java.awt.Insets(20, 0, 0, 0));
        xCheckBox1.setText("System");
        xFormPanel1.add(xCheckBox1);

        javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addGap(29, 29, 29)
                .addComponent(xFormPanel1, javax.swing.GroupLayout.PREFERRED_SIZE, 529, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(52, Short.MAX_VALUE))
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addGap(16, 16, 16)
                .addComponent(xFormPanel1, javax.swing.GroupLayout.PREFERRED_SIZE, 358, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(36, Short.MAX_VALUE))
        );

        xTabbedPane1.addTab("General Info", jPanel1);

        xPanel1.setVisibleWhen("#{ mode == 'read' }");
        xPanel1.setLayout(new java.awt.BorderLayout());

        schemaList1.setColumns(new com.rameses.rcp.common.Column[]{
            new com.rameses.rcp.common.Column(new Object[]{
                new Object[]{"name", "year"}
                , new Object[]{"caption", "Year"}
                , new Object[]{"width", 50}
                , new Object[]{"minWidth", 50}
                , new Object[]{"maxWidth", 50}
                , new Object[]{"required", false}
                , new Object[]{"resizable", true}
                , new Object[]{"nullWhenEmpty", true}
                , new Object[]{"editable", false}
                , new Object[]{"visible", true}
                , new Object[]{"visibleWhen", null}
                , new Object[]{"textCase", com.rameses.rcp.constant.TextCase.NONE}
                , new Object[]{"typeHandler", new com.rameses.rcp.common.IntegerColumnHandler(null, -1, -1)}
            }),
            new com.rameses.rcp.common.Column(new Object[]{
                new Object[]{"name", "monthname"}
                , new Object[]{"caption", "Month"}
                , new Object[]{"width", 100}
                , new Object[]{"minWidth", 100}
                , new Object[]{"maxWidth", 100}
                , new Object[]{"required", false}
                , new Object[]{"resizable", true}
                , new Object[]{"nullWhenEmpty", true}
                , new Object[]{"editable", false}
                , new Object[]{"visible", true}
                , new Object[]{"visibleWhen", null}
                , new Object[]{"textCase", com.rameses.rcp.constant.TextCase.NONE}
                , new Object[]{"typeHandler", new com.rameses.rcp.common.TextColumnHandler()}
            }),
            new com.rameses.rcp.common.Column(new Object[]{
                new Object[]{"name", "amount"}
                , new Object[]{"caption", "Amount"}
                , new Object[]{"width", 100}
                , new Object[]{"minWidth", 0}
                , new Object[]{"maxWidth", 0}
                , new Object[]{"required", false}
                , new Object[]{"resizable", true}
                , new Object[]{"nullWhenEmpty", true}
                , new Object[]{"editable", false}
                , new Object[]{"visible", true}
                , new Object[]{"visibleWhen", null}
                , new Object[]{"textCase", com.rameses.rcp.constant.TextCase.NONE}
                , new Object[]{"typeHandler", new com.rameses.rcp.common.DecimalColumnHandler("#,##0.00", -1.0, -1.0, false, 2)}
            }),
            new com.rameses.rcp.common.Column(new Object[]{
                new Object[]{"name", " "}
                , new Object[]{"caption", " "}
                , new Object[]{"width", 100}
                , new Object[]{"minWidth", 0}
                , new Object[]{"maxWidth", 0}
                , new Object[]{"required", false}
                , new Object[]{"resizable", true}
                , new Object[]{"nullWhenEmpty", true}
                , new Object[]{"editable", false}
                , new Object[]{"visible", true}
                , new Object[]{"visibleWhen", null}
                , new Object[]{"textCase", com.rameses.rcp.constant.TextCase.NONE}
                , new Object[]{"typeHandler", new com.rameses.rcp.common.TextColumnHandler()}
            })
        });
        schemaList1.setCustomFilter("recurringfeeid = :objid");
        schemaList1.setGroupBy("");
        schemaList1.setOrderBy("year ASC, month ASC");
        schemaList1.setQueryName("entityQry");
        schemaList1.setSchemaName("waterworks_billitem");
        schemaList1.setAllowOpen(false);
        xPanel1.add(schemaList1, java.awt.BorderLayout.CENTER);

        xTabbedPane1.addTab("Billings", xPanel1);

        add(xTabbedPane1, java.awt.BorderLayout.CENTER);
    }// </editor-fold>//GEN-END:initComponents


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JPanel jPanel1;
    private javax.swing.JScrollPane jScrollPane1;
    private com.rameses.enterprise.components.MonthList monthList1;
    private com.rameses.seti2.components.SchemaList schemaList1;
    private com.rameses.rcp.control.XCheckBox xCheckBox1;
    private com.rameses.rcp.control.XComboBox xComboBox1;
    private com.rameses.rcp.control.XDecimalField xDecimalField1;
    private com.rameses.rcp.control.XDecimalField xDecimalField2;
    private com.rameses.rcp.control.XDecimalField xDecimalField3;
    private com.rameses.rcp.control.XDecimalField xDecimalField4;
    private com.rameses.rcp.control.XFormPanel xFormPanel1;
    private com.rameses.rcp.control.XIntegerField xIntegerField1;
    private com.rameses.rcp.control.XIntegerField xIntegerField2;
    private com.rameses.rcp.control.XLookupField xLookupField1;
    private com.rameses.rcp.control.XPanel xPanel1;
    private com.rameses.rcp.control.XTabbedPane xTabbedPane1;
    private com.rameses.rcp.control.XTextArea xTextArea1;
    // End of variables declaration//GEN-END:variables
}