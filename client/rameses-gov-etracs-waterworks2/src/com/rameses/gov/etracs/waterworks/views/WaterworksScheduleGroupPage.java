/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rameses.gov.etracs.waterworks.views;

import com.rameses.rcp.ui.annotations.Template;
import com.rameses.seti2.views.CrudFormPage;

/**
 *
 * @author Elmo Nazareno
 */
@Template(CrudFormPage.class)
public class WaterworksScheduleGroupPage extends javax.swing.JPanel {

    /**
     * Creates new form BlockSchedulePage
     */
    public WaterworksScheduleGroupPage() {
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
        xTextField1 = new com.rameses.rcp.control.XTextField();
        jScrollPane1 = new javax.swing.JScrollPane();
        xTextArea1 = new com.rameses.rcp.control.XTextArea();
        xPanel1 = new com.rameses.rcp.control.XPanel();
        schemaList2 = new com.rameses.seti2.components.SchemaList();

        setPreferredSize(new java.awt.Dimension(949, 474));
        setLayout(new java.awt.BorderLayout());

        xTabbedPane1.setDynamic(true);

        xFormPanel1.setCaptionWidth(120);

        xTextField1.setCaption("ID");
        xTextField1.setName("entity.objid"); // NOI18N
        xTextField1.setDisableWhen("#{ mode != 'create' }");
        xTextField1.setPreferredSize(new java.awt.Dimension(0, 20));
        xTextField1.setSpaceChar('_');
        xFormPanel1.add(xTextField1);

        jScrollPane1.setName("entity.description"); // NOI18N
        jScrollPane1.setPreferredSize(new java.awt.Dimension(0, 65));

        xTextArea1.setName("entity.description"); // NOI18N
        xTextArea1.setCaption("Description");
        jScrollPane1.setViewportView(xTextArea1);

        xFormPanel1.add(jScrollPane1);

        javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(xFormPanel1, javax.swing.GroupLayout.PREFERRED_SIZE, 454, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(489, Short.MAX_VALUE))
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(xFormPanel1, javax.swing.GroupLayout.PREFERRED_SIZE, 108, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(360, Short.MAX_VALUE))
        );

        xTabbedPane1.addTab("Info", jPanel1);

        xPanel1.setVisibleWhen("#{ mode == 'read' }");
        xPanel1.setLayout(new java.awt.BorderLayout());

        schemaList2.setColumns(new com.rameses.rcp.common.Column[]{
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
                new Object[]{"name", "fromdate"}
                , new Object[]{"caption", "From Date"}
                , new Object[]{"width", 80}
                , new Object[]{"minWidth", 80}
                , new Object[]{"maxWidth", 120}
                , new Object[]{"required", false}
                , new Object[]{"resizable", true}
                , new Object[]{"nullWhenEmpty", true}
                , new Object[]{"editable", false}
                , new Object[]{"visible", true}
                , new Object[]{"visibleWhen", null}
                , new Object[]{"textCase", com.rameses.rcp.constant.TextCase.NONE}
                , new Object[]{"typeHandler", new com.rameses.rcp.common.DateColumnHandler(null, "yyyy-MM-dd", null)}
            }),
            new com.rameses.rcp.common.Column(new Object[]{
                new Object[]{"name", "todate"}
                , new Object[]{"caption", "To Date"}
                , new Object[]{"width", 80}
                , new Object[]{"minWidth", 80}
                , new Object[]{"maxWidth", 120}
                , new Object[]{"required", false}
                , new Object[]{"resizable", true}
                , new Object[]{"nullWhenEmpty", true}
                , new Object[]{"editable", false}
                , new Object[]{"visible", true}
                , new Object[]{"visibleWhen", null}
                , new Object[]{"textCase", com.rameses.rcp.constant.TextCase.NONE}
                , new Object[]{"typeHandler", new com.rameses.rcp.common.DateColumnHandler(null, "yyyy-MM-dd", null)}
            }),
            new com.rameses.rcp.common.Column(new Object[]{
                new Object[]{"name", "readingdate"}
                , new Object[]{"caption", "Reading Date"}
                , new Object[]{"width", 80}
                , new Object[]{"minWidth", 80}
                , new Object[]{"maxWidth", 120}
                , new Object[]{"required", false}
                , new Object[]{"resizable", true}
                , new Object[]{"nullWhenEmpty", true}
                , new Object[]{"editable", false}
                , new Object[]{"visible", true}
                , new Object[]{"visibleWhen", null}
                , new Object[]{"textCase", com.rameses.rcp.constant.TextCase.NONE}
                , new Object[]{"typeHandler", new com.rameses.rcp.common.DateColumnHandler(null, "yyyy-MM-dd", null)}
            }),
            new com.rameses.rcp.common.Column(new Object[]{
                new Object[]{"name", "billdate"}
                , new Object[]{"caption", "Billing Date"}
                , new Object[]{"width", 80}
                , new Object[]{"minWidth", 80}
                , new Object[]{"maxWidth", 120}
                , new Object[]{"required", false}
                , new Object[]{"resizable", true}
                , new Object[]{"nullWhenEmpty", true}
                , new Object[]{"editable", false}
                , new Object[]{"visible", true}
                , new Object[]{"visibleWhen", null}
                , new Object[]{"textCase", com.rameses.rcp.constant.TextCase.NONE}
                , new Object[]{"typeHandler", new com.rameses.rcp.common.DateColumnHandler(null, "yyyy-MM-dd", null)}
            }),
            new com.rameses.rcp.common.Column(new Object[]{
                new Object[]{"name", "discdate"}
                , new Object[]{"caption", "Discount Date"}
                , new Object[]{"width", 80}
                , new Object[]{"minWidth", 80}
                , new Object[]{"maxWidth", 120}
                , new Object[]{"required", false}
                , new Object[]{"resizable", true}
                , new Object[]{"nullWhenEmpty", true}
                , new Object[]{"editable", false}
                , new Object[]{"visible", true}
                , new Object[]{"visibleWhen", null}
                , new Object[]{"textCase", com.rameses.rcp.constant.TextCase.NONE}
                , new Object[]{"typeHandler", new com.rameses.rcp.common.DateColumnHandler(null, "yyyy-MM-dd", null)}
            }),
            new com.rameses.rcp.common.Column(new Object[]{
                new Object[]{"name", "duedate"}
                , new Object[]{"caption", "Due Date"}
                , new Object[]{"width", 80}
                , new Object[]{"minWidth", 80}
                , new Object[]{"maxWidth", 120}
                , new Object[]{"required", false}
                , new Object[]{"resizable", true}
                , new Object[]{"nullWhenEmpty", true}
                , new Object[]{"editable", false}
                , new Object[]{"visible", true}
                , new Object[]{"visibleWhen", null}
                , new Object[]{"textCase", com.rameses.rcp.constant.TextCase.NONE}
                , new Object[]{"typeHandler", new com.rameses.rcp.common.DateColumnHandler(null, "yyyy-MM-dd", null)}
            }),
            new com.rameses.rcp.common.Column(new Object[]{
                new Object[]{"name", "billexpirydate"}
                , new Object[]{"caption", "Bill Expiry Date"}
                , new Object[]{"width", 80}
                , new Object[]{"minWidth", 80}
                , new Object[]{"maxWidth", 120}
                , new Object[]{"required", false}
                , new Object[]{"resizable", true}
                , new Object[]{"nullWhenEmpty", true}
                , new Object[]{"editable", false}
                , new Object[]{"visible", true}
                , new Object[]{"visibleWhen", null}
                , new Object[]{"textCase", com.rameses.rcp.constant.TextCase.NONE}
                , new Object[]{"typeHandler", new com.rameses.rcp.common.DateColumnHandler(null, "yyyy-MM-dd", null)}
            })
        });
        schemaList2.setCustomFilter("scheduleid = :objid");
        schemaList2.setFormActions("periodActions");
        schemaList2.setHandler("periodList");
        schemaList2.setOrderBy("year DESC, month DESC");
        schemaList2.setQueryName("entity");
        schemaList2.setSchemaName("waterworks_billing_period");
        schemaList2.setAllowDelete(true);
        xPanel1.add(schemaList2, java.awt.BorderLayout.CENTER);

        xTabbedPane1.addTab("Billing Period", xPanel1);

        add(xTabbedPane1, java.awt.BorderLayout.CENTER);
    }// </editor-fold>//GEN-END:initComponents
    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JPanel jPanel1;
    private javax.swing.JScrollPane jScrollPane1;
    private com.rameses.seti2.components.SchemaList schemaList2;
    private com.rameses.rcp.control.XFormPanel xFormPanel1;
    private com.rameses.rcp.control.XPanel xPanel1;
    private com.rameses.rcp.control.XTabbedPane xTabbedPane1;
    private com.rameses.rcp.control.XTextArea xTextArea1;
    private com.rameses.rcp.control.XTextField xTextField1;
    // End of variables declaration//GEN-END:variables
}
