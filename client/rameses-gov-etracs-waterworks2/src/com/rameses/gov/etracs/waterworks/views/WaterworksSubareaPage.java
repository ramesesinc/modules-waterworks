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
public class WaterworksSubareaPage extends javax.swing.JPanel {

    /**
     * Creates new form ZonePage
     */
    public WaterworksSubareaPage() {
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

        xLookupField3 = new com.rameses.rcp.control.XLookupField();
        xTabbedPane1 = new com.rameses.rcp.control.XTabbedPane();
        jPanel1 = new javax.swing.JPanel();
        xFormPanel2 = new com.rameses.rcp.control.XFormPanel();
        xLabel1 = new com.rameses.rcp.control.XLabel();
        xLookupField2 = new com.rameses.rcp.control.XLookupField();
        xTextField3 = new com.rameses.rcp.control.XTextField();
        xTextField4 = new com.rameses.rcp.control.XTextField();
        xLookupField4 = new com.rameses.rcp.control.XLookupField();
        xLabel2 = new com.rameses.rcp.control.XLabel();
        xIntegerField1 = new com.rameses.rcp.control.XIntegerField();
        monthList1 = new com.rameses.enterprise.components.MonthList();
        xPanel1 = new com.rameses.rcp.control.XPanel();
        schemaList2 = new com.rameses.seti2.components.SchemaList();
        xPanel2 = new com.rameses.rcp.control.XPanel();
        schemaList3 = new com.rameses.seti2.components.SchemaList();

        xLookupField3.setCaption("Schedule Group");
        xLookupField3.setExpression("#{ entity.schedule.objid }");
        xLookupField3.setHandler("waterworks_schedule_group:lookup");
        xLookupField3.setName("entity.schedulegroup"); // NOI18N
        xLookupField3.setPreferredSize(new java.awt.Dimension(0, 20));
        xLookupField3.setRequired(true);

        setLayout(new java.awt.BorderLayout());

        xTabbedPane1.setItems("sections");
        xTabbedPane1.setDynamic(true);
        xTabbedPane1.setPreferredSize(new java.awt.Dimension(726, 465));

        jPanel1.setName("default"); // NOI18N

        xFormPanel2.setCaptionVAlignment(com.rameses.rcp.constant.UIConstants.CENTER);
        xFormPanel2.setCaptionWidth(150);
        xFormPanel2.setPadding(new java.awt.Insets(10, 15, 5, 0));

        xLabel1.setCaption("Area");
        xLabel1.setExpression("#{ entity.area.code }");
        xLabel1.setVisibleWhen("#{ hasParent==true || mode != 'create' }");
        xLabel1.setPreferredSize(new java.awt.Dimension(0, 20));
        xFormPanel2.add(xLabel1);

        xLookupField2.setCaption("Area");
        xLookupField2.setExpression("#{ entity.area.code }");
        xLookupField2.setHandler("waterworks_area:lookup");
        xLookupField2.setName("entity.area"); // NOI18N
        xLookupField2.setVisibleWhen("#{ hasParent == false && mode == 'create' }");
        xLookupField2.setPreferredSize(new java.awt.Dimension(0, 20));
        xLookupField2.setRequired(true);
        xFormPanel2.add(xLookupField2);

        xTextField3.setCaption("Code");
        xTextField3.setName("entity.code"); // NOI18N
        xTextField3.setPreferredSize(new java.awt.Dimension(0, 20));
        xTextField3.setRequired(true);
        xTextField3.setSpaceChar('_');
        xFormPanel2.add(xTextField3);

        xTextField4.setCaption("Description");
        xTextField4.setName("entity.description"); // NOI18N
        xTextField4.setPreferredSize(new java.awt.Dimension(0, 20));
        xTextField4.setRequired(true);
        xFormPanel2.add(xTextField4);

        xLookupField4.setCaption("Schedule Group");
        xLookupField4.setExpression("#{ entity.schedulegroup.objid }");
        xLookupField4.setHandler("waterworks_schedule_group:lookup");
        xLookupField4.setName("entity.schedulegroup"); // NOI18N
        xLookupField4.setPreferredSize(new java.awt.Dimension(0, 20));
        xLookupField4.setRequired(true);
        xFormPanel2.add(xLookupField4);

        xLabel2.setCaption("");
        xLabel2.setExpression("Next Billing Period ");
        xLabel2.setCellPadding(new java.awt.Insets(20, 0, 0, 0));
        xLabel2.setPreferredSize(new java.awt.Dimension(0, 20));
        xLabel2.setShowCaption(false);
        xFormPanel2.add(xLabel2);

        xIntegerField1.setCaption("Year");
        xIntegerField1.setName("entity.nextperiod.year"); // NOI18N
        xIntegerField1.setPreferredSize(new java.awt.Dimension(80, 20));
        xIntegerField1.setRequired(true);
        xFormPanel2.add(xIntegerField1);

        monthList1.setCaption("Month");
        monthList1.setName("entity.nextperiod.month"); // NOI18N
        monthList1.setRequired(true);
        xFormPanel2.add(monthList1);

        javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(xFormPanel2, javax.swing.GroupLayout.PREFERRED_SIZE, 657, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(42, Short.MAX_VALUE))
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(xFormPanel2, javax.swing.GroupLayout.PREFERRED_SIZE, 281, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(132, Short.MAX_VALUE))
        );

        xTabbedPane1.addTab("General Info", jPanel1);

        xPanel1.setVisibleWhen("#{ mode == 'read' }");

        schemaList2.setColumns(new com.rameses.rcp.common.Column[]{
            new com.rameses.rcp.common.Column(new Object[]{
                new Object[]{"name", "code"}
                , new Object[]{"caption", "Code"}
                , new Object[]{"width", 150}
                , new Object[]{"minWidth", 150}
                , new Object[]{"maxWidth", 200}
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
                new Object[]{"name", "description"}
                , new Object[]{"caption", "Description"}
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
        schemaList2.setCustomFilter("subareaid = :objid");
        schemaList2.setOrderBy("code");
        schemaList2.setQueryName("entity");
        schemaList2.setSchemaName("waterworks_stubout");
        schemaList2.setAllowCreate(true);
        schemaList2.setAllowDelete(true);
        schemaList2.setAllowSearch(true);

        javax.swing.GroupLayout xPanel1Layout = new javax.swing.GroupLayout(xPanel1);
        xPanel1.setLayout(xPanel1Layout);
        xPanel1Layout.setHorizontalGroup(
            xPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 705, Short.MAX_VALUE)
            .addGroup(xPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                .addGroup(xPanel1Layout.createSequentialGroup()
                    .addGap(0, 0, Short.MAX_VALUE)
                    .addComponent(schemaList2, javax.swing.GroupLayout.PREFERRED_SIZE, 693, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addGap(0, 0, Short.MAX_VALUE)))
        );
        xPanel1Layout.setVerticalGroup(
            xPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 419, Short.MAX_VALUE)
            .addGroup(xPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                .addGroup(xPanel1Layout.createSequentialGroup()
                    .addGap(0, 0, Short.MAX_VALUE)
                    .addComponent(schemaList2, javax.swing.GroupLayout.PREFERRED_SIZE, 407, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addGap(0, 0, Short.MAX_VALUE)))
        );

        xTabbedPane1.addTab("Stubouts", xPanel1);

        xPanel2.setVisibleWhen("#{ mode == 'read' }");
        xPanel2.setLayout(new java.awt.BorderLayout());

        schemaList3.setColumns(new com.rameses.rcp.common.Column[]{
            new com.rameses.rcp.common.Column(new Object[]{
                new Object[]{"name", "acctno"}
                , new Object[]{"caption", "Acct No"}
                , new Object[]{"width", 150}
                , new Object[]{"minWidth", 150}
                , new Object[]{"maxWidth", 200}
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
                new Object[]{"name", "acctname"}
                , new Object[]{"caption", "Acct Name"}
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
            }),
            new com.rameses.rcp.common.Column(new Object[]{
                new Object[]{"name", "stubout.code"}
                , new Object[]{"caption", "Stubout"}
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
                new Object[]{"name", "classificationid"}
                , new Object[]{"caption", "Classification"}
                , new Object[]{"width", 100}
                , new Object[]{"minWidth", 150}
                , new Object[]{"maxWidth", 200}
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
                new Object[]{"name", "seqno"}
                , new Object[]{"caption", "Seq No"}
                , new Object[]{"width", 100}
                , new Object[]{"minWidth", 100}
                , new Object[]{"maxWidth", 150}
                , new Object[]{"required", false}
                , new Object[]{"resizable", true}
                , new Object[]{"nullWhenEmpty", true}
                , new Object[]{"editable", false}
                , new Object[]{"visible", true}
                , new Object[]{"visibleWhen", null}
                , new Object[]{"textCase", com.rameses.rcp.constant.TextCase.NONE}
                , new Object[]{"typeHandler", new com.rameses.rcp.common.IntegerColumnHandler(null, -1, -1)}
            })
        });
        schemaList3.setCustomFilter("subareaid = :objid");
        schemaList3.setFormActions("acctActions");
        schemaList3.setHandlerName("acctListModel");
        schemaList3.setName("selectedAccount"); // NOI18N
        schemaList3.setOrderBy("seqno");
        schemaList3.setQueryName("entity");
        schemaList3.setSchemaName("waterworks_account");
        schemaList3.setAllowSearch(true);
        xPanel2.add(schemaList3, java.awt.BorderLayout.CENTER);

        xTabbedPane1.addTab("Accounts", xPanel2);

        add(xTabbedPane1, java.awt.BorderLayout.CENTER);
    }// </editor-fold>//GEN-END:initComponents
    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JPanel jPanel1;
    private com.rameses.enterprise.components.MonthList monthList1;
    private com.rameses.seti2.components.SchemaList schemaList2;
    private com.rameses.seti2.components.SchemaList schemaList3;
    private com.rameses.rcp.control.XFormPanel xFormPanel2;
    private com.rameses.rcp.control.XIntegerField xIntegerField1;
    private com.rameses.rcp.control.XLabel xLabel1;
    private com.rameses.rcp.control.XLabel xLabel2;
    private com.rameses.rcp.control.XLookupField xLookupField2;
    private com.rameses.rcp.control.XLookupField xLookupField3;
    private com.rameses.rcp.control.XLookupField xLookupField4;
    private com.rameses.rcp.control.XPanel xPanel1;
    private com.rameses.rcp.control.XPanel xPanel2;
    private com.rameses.rcp.control.XTabbedPane xTabbedPane1;
    private com.rameses.rcp.control.XTextField xTextField3;
    private com.rameses.rcp.control.XTextField xTextField4;
    // End of variables declaration//GEN-END:variables
}