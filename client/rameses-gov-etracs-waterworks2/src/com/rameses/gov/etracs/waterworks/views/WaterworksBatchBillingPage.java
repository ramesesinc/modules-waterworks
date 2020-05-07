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
public class WaterworksBatchBillingPage extends javax.swing.JPanel {

    /**
     * Creates new form WaterworksBatchBillingPage
     */
    public WaterworksBatchBillingPage() {
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

        vwInitial = new com.rameses.rcp.control.XPanel();
        xFormPanel4 = new com.rameses.rcp.control.XFormPanel();
        xLookupField1 = new com.rameses.rcp.control.XLookupField();
        xLabel3 = new com.rameses.rcp.control.XLabel();
        xLabel1 = new com.rameses.rcp.control.XLabel();
        xLabel4 = new com.rameses.rcp.control.XLabel();
        vwCompleted = new com.rameses.rcp.control.XPanel();
        xFormPanel6 = new com.rameses.rcp.control.XFormPanel();
        xLabel9 = new com.rameses.rcp.control.XLabel();
        xLookupField5 = new com.rameses.rcp.control.XLookupField();
        xDateField3 = new com.rameses.rcp.control.XDateField();
        vwInfo = new com.rameses.rcp.control.XPanel();
        pnlHeader = new javax.swing.JPanel();
        xFormPanel5 = new com.rameses.rcp.control.XFormPanel();
        xLabel8 = new com.rameses.rcp.control.XLabel();
        xLabel10 = new com.rameses.rcp.control.XLabel();
        pnlFooter = new javax.swing.JPanel();
        pnlBody = new javax.swing.JPanel();
        svwInvalidAccounts = new com.rameses.rcp.control.XPanel();
        xDataTable2 = new com.rameses.rcp.control.XDataTable();
        jPanel5 = new javax.swing.JPanel();
        xButton9 = new com.rameses.rcp.control.XButton();
        xButton10 = new com.rameses.rcp.control.XButton();
        xButton11 = new com.rameses.rcp.control.XButton();
        xButton12 = new com.rameses.rcp.control.XButton();
        xButton13 = new com.rameses.rcp.control.XButton();
        xButton14 = new com.rameses.rcp.control.XButton();
        jPanel6 = new javax.swing.JPanel();
        jPanel7 = new javax.swing.JPanel();
        xRadio3 = new com.rameses.rcp.control.XRadio();
        xRadio4 = new com.rameses.rcp.control.XRadio();
        xCheckBox2 = new com.rameses.rcp.control.XCheckBox();
        jPanel8 = new javax.swing.JPanel();
        jLabel2 = new javax.swing.JLabel();
        svwBillsList = new com.rameses.rcp.control.XPanel();
        jPanel3 = new javax.swing.JPanel();
        jPanel2 = new javax.swing.JPanel();
        schemaList1 = new com.rameses.seti2.components.SchemaList();
        vwProcessing = new com.rameses.rcp.control.XPanel();
        jPanel11 = new javax.swing.JPanel();
        xLabel11 = new com.rameses.rcp.control.XLabel();
        xLabel6 = new com.rameses.rcp.control.XLabel();
        xProgressBar2 = new com.rameses.rcp.control.XProgressBar();
        jPanel10 = new javax.swing.JPanel();
        xButton17 = new com.rameses.rcp.control.XButton();
        xButton18 = new com.rameses.rcp.control.XButton();
        xButton19 = new com.rameses.rcp.control.XButton();

        setLayout(new java.awt.CardLayout());

        vwInitial.setVisibleWhen("#{ mode == 'create' }");

        xFormPanel4.setCaptionVAlignment(com.rameses.rcp.constant.UIConstants.CENTER);
        xFormPanel4.setCaptionWidth(150);

        xLookupField1.setCaption("Sub Area");
        xLookupField1.setExpression("#{ entity.subarea.code }");
        xLookupField1.setHandler("waterworks_subarea:lookup");
        xLookupField1.setName("entity.subarea"); // NOI18N
        xLookupField1.setPreferredSize(new java.awt.Dimension(0, 20));
        xLookupField1.setRequired(true);
        xFormPanel4.add(xLookupField1);

        xLabel3.setCaption("Schedule");
        xLabel3.setExpression("#{ entity.subarea.schedulegroup.objid } - #{ entity.subarea.schedulegroup.description }");
        xLabel3.setCellPadding(new java.awt.Insets(20, 0, 0, 0));
        xLabel3.setPreferredSize(new java.awt.Dimension(0, 18));
        xFormPanel4.add(xLabel3);

        xLabel1.setCaption("Year / Month");
        xLabel1.setExpression("#{ entity.period.monthname } #{ entity.period.year }");
        xFormPanel4.add(xLabel1);

        xLabel4.setCaption("Period");
        xLabel4.setExpression("#{ entity.period.fromdate } - #{ entity.period.todate } ");
        xFormPanel4.add(xLabel4);

        javax.swing.GroupLayout vwInitialLayout = new javax.swing.GroupLayout(vwInitial);
        vwInitial.setLayout(vwInitialLayout);
        vwInitialLayout.setHorizontalGroup(
            vwInitialLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(vwInitialLayout.createSequentialGroup()
                .addGap(20, 20, 20)
                .addComponent(xFormPanel4, javax.swing.GroupLayout.PREFERRED_SIZE, 546, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(533, Short.MAX_VALUE))
        );
        vwInitialLayout.setVerticalGroup(
            vwInitialLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(vwInitialLayout.createSequentialGroup()
                .addGap(35, 35, 35)
                .addComponent(xFormPanel4, javax.swing.GroupLayout.PREFERRED_SIZE, 151, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(315, Short.MAX_VALUE))
        );

        add(vwInitial, "card2");

        vwCompleted.setVisibleWhen("#{ mode!='create' && task.state == 'end' }");

        xFormPanel6.setCaptionVAlignment(com.rameses.rcp.constant.UIConstants.CENTER);
        xFormPanel6.setCaptionWidth(150);

        xLabel9.setCaption("Period");
        xLabel9.setExpression("#{ entity.period.fromperiod } - #{ entity.period.toperiod } ");
        xFormPanel6.add(xLabel9);

        xLookupField5.setCaption("Assign To Reader");
        xLookupField5.setExpression("#{ entity.reader.name }");
        xLookupField5.setHandler("waterworks_reader:lookup");
        xLookupField5.setName("entity.reader"); // NOI18N
        xLookupField5.setCellPadding(new java.awt.Insets(20, 0, 0, 0));
        xLookupField5.setPreferredSize(new java.awt.Dimension(0, 20));
        xLookupField5.setRequired(true);
        xFormPanel6.add(xLookupField5);

        xDateField3.setCaption("Reading Date");
        xDateField3.setDepends(new String[] {"entity.zone"});
        xDateField3.setName("entity.readingdate"); // NOI18N
        xDateField3.setPreferredSize(new java.awt.Dimension(120, 20));
        xDateField3.setRequired(true);
        xFormPanel6.add(xDateField3);

        javax.swing.GroupLayout vwCompletedLayout = new javax.swing.GroupLayout(vwCompleted);
        vwCompleted.setLayout(vwCompletedLayout);
        vwCompletedLayout.setHorizontalGroup(
            vwCompletedLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(vwCompletedLayout.createSequentialGroup()
                .addContainerGap()
                .addComponent(xFormPanel6, javax.swing.GroupLayout.PREFERRED_SIZE, 546, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(547, Short.MAX_VALUE))
        );
        vwCompletedLayout.setVerticalGroup(
            vwCompletedLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(vwCompletedLayout.createSequentialGroup()
                .addContainerGap()
                .addComponent(xFormPanel6, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        add(vwCompleted, "card3");

        vwInfo.setVisibleWhen("#{ mode!='create' &&  entity.processing == null }");
        vwInfo.setLayout(new java.awt.BorderLayout());

        pnlHeader.setPreferredSize(new java.awt.Dimension(200, 60));

        xFormPanel5.setCaptionVAlignment(com.rameses.rcp.constant.UIConstants.CENTER);
        xFormPanel5.setCaptionWidth(120);

        xLabel8.setCaption("Batch No");
        xLabel8.setExpression("#{ entity.objid } ");
        xFormPanel5.add(xLabel8);

        xLabel10.setCaption("Period");
        xLabel10.setExpression("#{ entity.period.fromdate } - #{ entity.period.todate } ");
        xFormPanel5.add(xLabel10);

        javax.swing.GroupLayout pnlHeaderLayout = new javax.swing.GroupLayout(pnlHeader);
        pnlHeader.setLayout(pnlHeaderLayout);
        pnlHeaderLayout.setHorizontalGroup(
            pnlHeaderLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(pnlHeaderLayout.createSequentialGroup()
                .addContainerGap()
                .addComponent(xFormPanel5, javax.swing.GroupLayout.PREFERRED_SIZE, 670, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(423, Short.MAX_VALUE))
        );
        pnlHeaderLayout.setVerticalGroup(
            pnlHeaderLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(pnlHeaderLayout.createSequentialGroup()
                .addContainerGap()
                .addComponent(xFormPanel5, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(11, Short.MAX_VALUE))
        );

        vwInfo.add(pnlHeader, java.awt.BorderLayout.NORTH);

        pnlFooter.setPreferredSize(new java.awt.Dimension(0, 30));

        javax.swing.GroupLayout pnlFooterLayout = new javax.swing.GroupLayout(pnlFooter);
        pnlFooter.setLayout(pnlFooterLayout);
        pnlFooterLayout.setHorizontalGroup(
            pnlFooterLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 1099, Short.MAX_VALUE)
        );
        pnlFooterLayout.setVerticalGroup(
            pnlFooterLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 30, Short.MAX_VALUE)
        );

        vwInfo.add(pnlFooter, java.awt.BorderLayout.SOUTH);

        pnlBody.setLayout(new java.awt.CardLayout());

        svwInvalidAccounts.setVisibleWhen("#{ task!=null && task.state == 'draft' }");
        svwInvalidAccounts.setLayout(new java.awt.BorderLayout());

        xDataTable2.setHandler("errListHandler");
        xDataTable2.setItems("");
        xDataTable2.setName("selectedErr"); // NOI18N
        xDataTable2.setColumns(new com.rameses.rcp.common.Column[]{
            new com.rameses.rcp.common.Column(new Object[]{
                new Object[]{"name", "acctno"}
                , new Object[]{"caption", "Acct No"}
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
                , new Object[]{"typeHandler", new com.rameses.rcp.common.TextColumnHandler()}
            }),
            new com.rameses.rcp.common.Column(new Object[]{
                new Object[]{"name", "acctname"}
                , new Object[]{"caption", "Acct Name"}
                , new Object[]{"width", 100}
                , new Object[]{"minWidth", 250}
                , new Object[]{"maxWidth", 300}
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
                , new Object[]{"maxWidth", 100}
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
                new Object[]{"name", null}
                , new Object[]{"caption", "Last Bill Date"}
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
                , new Object[]{"expression", "#{item.lastbillyear}  #{item.lastbillmonth}"}
                , new Object[]{"typeHandler", new com.rameses.rcp.common.LabelColumnHandler()}
            }),
            new com.rameses.rcp.common.Column(new Object[]{
                new Object[]{"name", "errmsg"}
                , new Object[]{"caption", "Error Message "}
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
        svwInvalidAccounts.add(xDataTable2, java.awt.BorderLayout.CENTER);

        jPanel5.setPreferredSize(new java.awt.Dimension(0, 30));
        jPanel5.setLayout(new java.awt.FlowLayout(java.awt.FlowLayout.LEFT));

        xButton9.setName("errListHandler.moveBackPage"); // NOI18N
        xButton9.setText("<<");
        jPanel5.add(xButton9);

        xButton10.setName("errListHandler.moveNextPage"); // NOI18N
        xButton10.setText(">>");
        jPanel5.add(xButton10);

        xButton11.setDepends(new String[] {"excludeinbatch"});
        xButton11.setName("excludeFromBatch"); // NOI18N
        xButton11.setVisibleWhen("#{ excludeinbatch == 0 }");
        xButton11.setText("Exclude");
        jPanel5.add(xButton11);

        xButton12.setDepends(new String[] {"excludeinbatch"});
        xButton12.setName("includeInBatch"); // NOI18N
        xButton12.setVisibleWhen("#{ excludeinbatch == 1 }");
        xButton12.setText("Include");
        jPanel5.add(xButton12);

        xButton13.setName("viewItem"); // NOI18N
        xButton13.setText("View Account");
        jPanel5.add(xButton13);

        xButton14.setName("refreshList"); // NOI18N
        xButton14.setText("Refresh");
        jPanel5.add(xButton14);

        svwInvalidAccounts.add(jPanel5, java.awt.BorderLayout.SOUTH);

        jPanel6.setPreferredSize(new java.awt.Dimension(832, 60));
        jPanel6.setLayout(new java.awt.BorderLayout());

        jPanel7.setPreferredSize(new java.awt.Dimension(346, 30));
        jPanel7.setLayout(new java.awt.FlowLayout(java.awt.FlowLayout.LEFT));

        xRadio3.setName("excludeinbatch"); // NOI18N
        xRadio3.setOptionValue(0);
        xRadio3.setText("Show items included in batch");
        jPanel7.add(xRadio3);

        xRadio4.setName("excludeinbatch"); // NOI18N
        xRadio4.setOptionValue(1);
        xRadio4.setText("Show items excluded in batch");
        xRadio4.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                xRadio4ActionPerformed(evt);
            }
        });
        jPanel7.add(xRadio4);

        xCheckBox2.setName("showerronly"); // NOI18N
        xCheckBox2.setText("Show only with errors");
        jPanel7.add(xCheckBox2);

        jPanel6.add(jPanel7, java.awt.BorderLayout.CENTER);

        jPanel8.setBorder(javax.swing.BorderFactory.createEmptyBorder(1, 20, 1, 1));
        jPanel8.setLayout(new java.awt.BorderLayout());

        jLabel2.setFont(new java.awt.Font("SansSerif", 1, 13)); // NOI18N
        jLabel2.setText("Review the accounts listed below to include or exclude for batch billing. Resolve errors if any before processing.");
        jPanel8.add(jLabel2, java.awt.BorderLayout.CENTER);

        jPanel6.add(jPanel8, java.awt.BorderLayout.NORTH);

        svwInvalidAccounts.add(jPanel6, java.awt.BorderLayout.NORTH);

        pnlBody.add(svwInvalidAccounts, "card4");

        svwBillsList.setVisibleWhen("#{task!=null &&  task.state != 'draft' }");
        svwBillsList.setLayout(new java.awt.BorderLayout());

        jPanel3.setPreferredSize(new java.awt.Dimension(832, 20));
        jPanel3.setLayout(new java.awt.BorderLayout());

        jPanel2.setPreferredSize(new java.awt.Dimension(346, 10));
        jPanel2.setLayout(new java.awt.FlowLayout(java.awt.FlowLayout.LEFT));
        jPanel3.add(jPanel2, java.awt.BorderLayout.CENTER);

        svwBillsList.add(jPanel3, java.awt.BorderLayout.NORTH);

        schemaList1.setColumns(new com.rameses.rcp.common.Column[]{
            new com.rameses.rcp.common.Column(new Object[]{
                new Object[]{"name", "consumption.hold"}
                , new Object[]{"caption", "Hold"}
                , new Object[]{"width", 60}
                , new Object[]{"minWidth", 60}
                , new Object[]{"maxWidth", 60}
                , new Object[]{"required", false}
                , new Object[]{"resizable", true}
                , new Object[]{"nullWhenEmpty", true}
                , new Object[]{"editable", true}
                , new Object[]{"editableWhen", null}
                , new Object[]{"visible", true}
                , new Object[]{"visibleWhen", null}
                , new Object[]{"textCase", com.rameses.rcp.constant.TextCase.NONE}
                , new Object[]{"typeHandler", new com.rameses.rcp.common.CheckBoxColumnHandler(java.lang.Integer.class, 1, 0)}
            }),
            new com.rameses.rcp.common.Column(new Object[]{
                new Object[]{"name", "billno"}
                , new Object[]{"caption", "Bill No"}
                , new Object[]{"width", 100}
                , new Object[]{"minWidth", 100}
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
                new Object[]{"name", "acctno"}
                , new Object[]{"caption", "Acct No"}
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
                new Object[]{"name", "acctname"}
                , new Object[]{"caption", "Acct Name"}
                , new Object[]{"width", 100}
                , new Object[]{"minWidth", 150}
                , new Object[]{"maxWidth", 250}
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
                , new Object[]{"minWidth", 100}
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
                new Object[]{"name", "meterstate"}
                , new Object[]{"caption", "Meter Status"}
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
                new Object[]{"name", "consumption.prev.reading"}
                , new Object[]{"caption", "Prev Reading"}
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
                , new Object[]{"typeHandler", new com.rameses.rcp.common.IntegerColumnHandler(null, -1, -1)}
            }),
            new com.rameses.rcp.common.Column(new Object[]{
                new Object[]{"name", "consumption.reading"}
                , new Object[]{"caption", "Curr Reading"}
                , new Object[]{"width", 100}
                , new Object[]{"minWidth", 100}
                , new Object[]{"maxWidth", 100}
                , new Object[]{"required", false}
                , new Object[]{"resizable", true}
                , new Object[]{"nullWhenEmpty", true}
                , new Object[]{"editable", true}
                , new Object[]{"editableWhen", null}
                , new Object[]{"visible", true}
                , new Object[]{"visibleWhen", null}
                , new Object[]{"textCase", com.rameses.rcp.constant.TextCase.NONE}
                , new Object[]{"typeHandler", new com.rameses.rcp.common.IntegerColumnHandler(null, -1, -1)}
            }),
            new com.rameses.rcp.common.Column(new Object[]{
                new Object[]{"name", "consumption.volume"}
                , new Object[]{"caption", "Vol (cu.m)"}
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
                , new Object[]{"typeHandler", new com.rameses.rcp.common.IntegerColumnHandler(null, -1, -1)}
            }),
            new com.rameses.rcp.common.Column(new Object[]{
                new Object[]{"name", "consumption.amount"}
                , new Object[]{"caption", "Amount"}
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
                , new Object[]{"typeHandler", new com.rameses.rcp.common.DecimalColumnHandler("#,##0.00", -1.0, -1.0, false, 2)}
            }),
            new com.rameses.rcp.common.Column(new Object[]{
                new Object[]{"name", "state"}
                , new Object[]{"caption", "Bill Status"}
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
        schemaList1.setCustomFilter("batchid = :objid");
        schemaList1.setHandler("billListHandler");
        schemaList1.setHandlerName("");
        schemaList1.setQueryName("batchQry");
        schemaList1.setSchemaName("vw_waterworks_bill");
        svwBillsList.add(schemaList1, java.awt.BorderLayout.CENTER);

        pnlBody.add(svwBillsList, "card2");

        vwInfo.add(pnlBody, java.awt.BorderLayout.CENTER);

        add(vwInfo, "card4");

        vwProcessing.setVisibleWhen("#{ mode!='create' && entity.processing !=null }");
        vwProcessing.setLayout(new java.awt.BorderLayout());

        xLabel11.setExpression("Processing");
        xLabel11.setName("label"); // NOI18N
        xLabel11.setBorder(javax.swing.BorderFactory.createEmptyBorder(0, 0, 0, 0));
        xLabel11.setFontStyle("font-size:12; font-weight:bold;");
        xLabel11.setForeground(new java.awt.Color(100, 100, 100));

        xLabel6.setExpression("#{label}");
        xLabel6.setName("label"); // NOI18N
        xLabel6.setBorder(javax.swing.BorderFactory.createEmptyBorder(0, 0, 0, 0));
        xLabel6.setFontStyle("font-size:12; font-weight:bold;");
        xLabel6.setForeground(new java.awt.Color(100, 100, 100));

        xProgressBar2.setHandler("progressBar");

        jPanel10.setLayout(new java.awt.FlowLayout(java.awt.FlowLayout.LEFT));

        xButton17.setName("startProcess"); // NOI18N
        xButton17.setVisibleWhen("#{ processing == false && stat==null }");
        xButton17.setText("Start");
        jPanel10.add(xButton17);

        xButton18.setName("resumeProcess"); // NOI18N
        xButton18.setVisibleWhen("#{ processing == false && stat !=null }");
        xButton18.setText("Restart");
        jPanel10.add(xButton18);

        xButton19.setName("cancelProcess"); // NOI18N
        xButton19.setVisibleWhen("#{ processing == true }");
        xButton19.setText("Cancel");
        jPanel10.add(xButton19);

        javax.swing.GroupLayout jPanel11Layout = new javax.swing.GroupLayout(jPanel11);
        jPanel11.setLayout(jPanel11Layout);
        jPanel11Layout.setHorizontalGroup(
            jPanel11Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel11Layout.createSequentialGroup()
                .addGap(17, 17, 17)
                .addGroup(jPanel11Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(xProgressBar2, javax.swing.GroupLayout.PREFERRED_SIZE, 335, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jPanel10, javax.swing.GroupLayout.PREFERRED_SIZE, 387, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addGroup(jPanel11Layout.createSequentialGroup()
                        .addGap(6, 6, 6)
                        .addGroup(jPanel11Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(xLabel11, javax.swing.GroupLayout.PREFERRED_SIZE, 252, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(xLabel6, javax.swing.GroupLayout.PREFERRED_SIZE, 335, javax.swing.GroupLayout.PREFERRED_SIZE))))
                .addContainerGap(695, Short.MAX_VALUE))
        );
        jPanel11Layout.setVerticalGroup(
            jPanel11Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel11Layout.createSequentialGroup()
                .addGap(15, 15, 15)
                .addComponent(xLabel11, javax.swing.GroupLayout.PREFERRED_SIZE, 19, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(12, 12, 12)
                .addComponent(xLabel6, javax.swing.GroupLayout.PREFERRED_SIZE, 19, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(18, 18, 18)
                .addComponent(xProgressBar2, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(18, 18, 18)
                .addComponent(jPanel10, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(341, Short.MAX_VALUE))
        );

        vwProcessing.add(jPanel11, java.awt.BorderLayout.CENTER);

        add(vwProcessing, "card5");
    }// </editor-fold>//GEN-END:initComponents

    private void xRadio4ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_xRadio4ActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_xRadio4ActionPerformed


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JLabel jLabel2;
    private javax.swing.JPanel jPanel10;
    private javax.swing.JPanel jPanel11;
    private javax.swing.JPanel jPanel2;
    private javax.swing.JPanel jPanel3;
    private javax.swing.JPanel jPanel5;
    private javax.swing.JPanel jPanel6;
    private javax.swing.JPanel jPanel7;
    private javax.swing.JPanel jPanel8;
    private javax.swing.JPanel pnlBody;
    private javax.swing.JPanel pnlFooter;
    private javax.swing.JPanel pnlHeader;
    private com.rameses.seti2.components.SchemaList schemaList1;
    private com.rameses.rcp.control.XPanel svwBillsList;
    private com.rameses.rcp.control.XPanel svwInvalidAccounts;
    private com.rameses.rcp.control.XPanel vwCompleted;
    private com.rameses.rcp.control.XPanel vwInfo;
    private com.rameses.rcp.control.XPanel vwInitial;
    private com.rameses.rcp.control.XPanel vwProcessing;
    private com.rameses.rcp.control.XButton xButton10;
    private com.rameses.rcp.control.XButton xButton11;
    private com.rameses.rcp.control.XButton xButton12;
    private com.rameses.rcp.control.XButton xButton13;
    private com.rameses.rcp.control.XButton xButton14;
    private com.rameses.rcp.control.XButton xButton17;
    private com.rameses.rcp.control.XButton xButton18;
    private com.rameses.rcp.control.XButton xButton19;
    private com.rameses.rcp.control.XButton xButton9;
    private com.rameses.rcp.control.XCheckBox xCheckBox2;
    private com.rameses.rcp.control.XDataTable xDataTable2;
    private com.rameses.rcp.control.XDateField xDateField3;
    private com.rameses.rcp.control.XFormPanel xFormPanel4;
    private com.rameses.rcp.control.XFormPanel xFormPanel5;
    private com.rameses.rcp.control.XFormPanel xFormPanel6;
    private com.rameses.rcp.control.XLabel xLabel1;
    private com.rameses.rcp.control.XLabel xLabel10;
    private com.rameses.rcp.control.XLabel xLabel11;
    private com.rameses.rcp.control.XLabel xLabel3;
    private com.rameses.rcp.control.XLabel xLabel4;
    private com.rameses.rcp.control.XLabel xLabel6;
    private com.rameses.rcp.control.XLabel xLabel8;
    private com.rameses.rcp.control.XLabel xLabel9;
    private com.rameses.rcp.control.XLookupField xLookupField1;
    private com.rameses.rcp.control.XLookupField xLookupField5;
    private com.rameses.rcp.control.XProgressBar xProgressBar2;
    private com.rameses.rcp.control.XRadio xRadio3;
    private com.rameses.rcp.control.XRadio xRadio4;
    // End of variables declaration//GEN-END:variables
}
