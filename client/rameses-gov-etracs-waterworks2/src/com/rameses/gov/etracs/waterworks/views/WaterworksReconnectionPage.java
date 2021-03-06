/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rameses.gov.etracs.waterworks.views;

import com.rameses.rcp.ui.annotations.Template;
import com.rameses.seti2.views.WorkflowTaskFormPage;

/**
 *
 * @author elmonazareno
 */
@Template(WorkflowTaskFormPage.class)
public class WaterworksReconnectionPage extends javax.swing.JPanel {

    /**
     * Creates new form WaterworksReconnectionPage
     */
    public WaterworksReconnectionPage() {
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

        xActionBar3 = new com.rameses.rcp.control.XActionBar();
        xTabbedPane1 = new com.rameses.rcp.control.XTabbedPane();
        jPanel1 = new javax.swing.JPanel();
        xFormPanel1 = new com.rameses.rcp.control.XFormPanel();
        xTextField1 = new com.rameses.rcp.control.XTextField();
        xLabel2 = new com.rameses.rcp.control.XLabel();
        xDateField1 = new com.rameses.rcp.control.XDateField();
        xLookupField1 = new com.rameses.rcp.control.XLookupField();
        xLabel1 = new com.rameses.rcp.control.XLabel();
        xPanel1 = new com.rameses.rcp.control.XPanel();
        xActionBar2 = new com.rameses.rcp.control.XActionBar();
        schemaList1 = new com.rameses.seti2.components.SchemaList();

        setLayout(new java.awt.BorderLayout());

        xActionBar3.setFormName("formName");
        xActionBar3.setName("appActions"); // NOI18N
        add(xActionBar3, java.awt.BorderLayout.NORTH);

        xFormPanel1.setName(""); // NOI18N
        xFormPanel1.setCaptionWidth(200);

        xTextField1.setCaption("Control No");
        xTextField1.setDisableWhen("#{ true }");
        xTextField1.setName("entity.controlno"); // NOI18N
        xTextField1.setPreferredSize(new java.awt.Dimension(200, 20));
        xFormPanel1.add(xTextField1);

        xLabel2.setCaption("App Type");
        xLabel2.setExpression("RECONNECTION");
        xLabel2.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(153, 153, 153)));
        xLabel2.setPreferredSize(new java.awt.Dimension(200, 20));
        xFormPanel1.add(xLabel2);

        xDateField1.setCaption("Date Filed");
        xDateField1.setDisableWhen("#{ mode != 'create' }");
        xDateField1.setName("entity.dtcreated"); // NOI18N
        xDateField1.setPreferredSize(new java.awt.Dimension(200, 20));
        xFormPanel1.add(xDateField1);

        xLookupField1.setCaption("Account");
        xLookupField1.setDisableWhen("#{ mode != 'create' }");
        xLookupField1.setExpression("#{ entity.account.acctno }");
        xLookupField1.setHandler("vw_waterworks_account_disconnected:lookup");
        xLookupField1.setName("entity.account"); // NOI18N
        xLookupField1.setPreferredSize(new java.awt.Dimension(0, 20));
        xFormPanel1.add(xLookupField1);

        xLabel1.setCaption("Acct Name");
        xLabel1.setDepends(new String[] {"entity.account"});
        xLabel1.setExpression("#{ entity.account.acctname }");
        xLabel1.setPreferredSize(new java.awt.Dimension(0, 20));
        xFormPanel1.add(xLabel1);

        javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(xFormPanel1, javax.swing.GroupLayout.PREFERRED_SIZE, 624, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(320, Short.MAX_VALUE))
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(xFormPanel1, javax.swing.GroupLayout.PREFERRED_SIZE, 208, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(216, Short.MAX_VALUE))
        );

        xTabbedPane1.addTab("General Info", jPanel1);

        xPanel1.setLayout(new java.awt.BorderLayout());

        xActionBar2.setFormName("formName");
        xActionBar2.setName("feeActions"); // NOI18N
        xPanel1.add(xActionBar2, java.awt.BorderLayout.NORTH);

        schemaList1.setColumns(new com.rameses.rcp.common.Column[]{
            new com.rameses.rcp.common.Column(new Object[]{
                new Object[]{"name", "item.objid"}
                , new Object[]{"caption", "Item Code"}
                , new Object[]{"width", 100}
                , new Object[]{"minWidth", 150}
                , new Object[]{"maxWidth", 150}
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
                new Object[]{"name", "item.title"}
                , new Object[]{"caption", "Item Name"}
                , new Object[]{"width", 200}
                , new Object[]{"minWidth", 300}
                , new Object[]{"maxWidth", 350}
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
                , new Object[]{"minWidth", 150}
                , new Object[]{"maxWidth", 150}
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
                new Object[]{"name", "amtpaid"}
                , new Object[]{"caption", "Amt Paid"}
                , new Object[]{"width", 100}
                , new Object[]{"minWidth", 150}
                , new Object[]{"maxWidth", 150}
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
                new Object[]{"name", "balance"}
                , new Object[]{"caption", "Balance"}
                , new Object[]{"width", 100}
                , new Object[]{"minWidth", 150}
                , new Object[]{"maxWidth", 150}
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
                new Object[]{"name", null}
                , new Object[]{"caption", "-"}
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
        schemaList1.setCustomFilter("appid = :appid");
        schemaList1.setHandler("feeListModel");
        schemaList1.setQueryName("entityQry");
        schemaList1.setSchemaName("waterworks_application_fee");
        schemaList1.setAllowDelete(true);
        xPanel1.add(schemaList1, java.awt.BorderLayout.CENTER);

        xTabbedPane1.addTab("Fees", xPanel1);

        add(xTabbedPane1, java.awt.BorderLayout.CENTER);
    }// </editor-fold>//GEN-END:initComponents


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JPanel jPanel1;
    private com.rameses.seti2.components.SchemaList schemaList1;
    private com.rameses.rcp.control.XActionBar xActionBar2;
    private com.rameses.rcp.control.XActionBar xActionBar3;
    private com.rameses.rcp.control.XDateField xDateField1;
    private com.rameses.rcp.control.XFormPanel xFormPanel1;
    private com.rameses.rcp.control.XLabel xLabel1;
    private com.rameses.rcp.control.XLabel xLabel2;
    private com.rameses.rcp.control.XLookupField xLookupField1;
    private com.rameses.rcp.control.XPanel xPanel1;
    private com.rameses.rcp.control.XTabbedPane xTabbedPane1;
    private com.rameses.rcp.control.XTextField xTextField1;
    // End of variables declaration//GEN-END:variables
}
