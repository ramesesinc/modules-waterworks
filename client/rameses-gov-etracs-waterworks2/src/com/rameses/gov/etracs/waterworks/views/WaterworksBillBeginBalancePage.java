/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rameses.gov.etracs.waterworks.views;

import com.rameses.osiris2.themes.FormPage;
import com.rameses.rcp.ui.annotations.Template;

/**
 *
 * @author elmonazareno
 */
@Template(FormPage.class)
public class WaterworksBillBeginBalancePage extends javax.swing.JPanel {

    /**
     * Creates new form WaterworksBillBeginBalancePage
     */
    public WaterworksBillBeginBalancePage() {
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

        xFormPanel10 = new com.rameses.rcp.control.XFormPanel();
        xLabel22 = new com.rameses.rcp.control.XLabel();
        xTabbedPane1 = new com.rameses.rcp.control.XTabbedPane();
        xPanel3 = new com.rameses.rcp.control.XPanel();
        pnlFoot1 = new javax.swing.JPanel();
        xFormPanel9 = new com.rameses.rcp.control.XFormPanel();
        xLabel43 = new com.rameses.rcp.control.XLabel();
        xDataTable7 = new com.rameses.rcp.control.XDataTable();
        xPanel1 = new com.rameses.rcp.control.XPanel();
        xButton9 = new com.rameses.rcp.control.XButton();
        xButton10 = new com.rameses.rcp.control.XButton();
        xButton12 = new com.rameses.rcp.control.XButton();

        setPreferredSize(new java.awt.Dimension(951, 481));
        setLayout(new java.awt.BorderLayout());

        xFormPanel10.setBorder(javax.swing.BorderFactory.createEmptyBorder(5, 20, 1, 1));
        xFormPanel10.setCaptionWidth(150);

        xLabel22.setCaption("Bill Year / Month");
        xLabel22.setExpression("#{ year } #{ monthname }");
        xLabel22.setCaptionFont(new java.awt.Font("SansSerif", 0, 14)); // NOI18N
        xLabel22.setFont(new java.awt.Font("SansSerif", 1, 14)); // NOI18N
        xFormPanel10.add(xLabel22);

        add(xFormPanel10, java.awt.BorderLayout.NORTH);

        xPanel3.setLayout(new java.awt.BorderLayout());

        pnlFoot1.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(204, 204, 204)));
        pnlFoot1.setPreferredSize(new java.awt.Dimension(972, 80));

        xFormPanel9.setCaptionWidth(150);

        xLabel43.setCaption("TOTAL AMOUNT");
        xLabel43.setExpression("#{ totalamount } ");
        xLabel43.setHorizontalAlignment(javax.swing.SwingConstants.RIGHT);
        xLabel43.setCaptionFont(new java.awt.Font("SansSerif", 0, 14)); // NOI18N
        xLabel43.setFont(new java.awt.Font("SansSerif", 1, 14)); // NOI18N
        xLabel43.setNumberFormat("#,##0.00;(#,##0.00)");
        xLabel43.setPreferredSize(new java.awt.Dimension(0, 20));
        xFormPanel9.add(xLabel43);

        javax.swing.GroupLayout pnlFoot1Layout = new javax.swing.GroupLayout(pnlFoot1);
        pnlFoot1.setLayout(pnlFoot1Layout);
        pnlFoot1Layout.setHorizontalGroup(
            pnlFoot1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(pnlFoot1Layout.createSequentialGroup()
                .addGap(264, 264, 264)
                .addComponent(xFormPanel9, javax.swing.GroupLayout.PREFERRED_SIZE, 289, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(375, Short.MAX_VALUE))
        );
        pnlFoot1Layout.setVerticalGroup(
            pnlFoot1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(pnlFoot1Layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(xFormPanel9, javax.swing.GroupLayout.PREFERRED_SIZE, 41, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(31, Short.MAX_VALUE))
        );

        xPanel3.add(pnlFoot1, java.awt.BorderLayout.SOUTH);

        xDataTable7.setHandler("listHandler");
        xDataTable7.setItems("");
        xDataTable7.setName("selectedItem"); // NOI18N
        xDataTable7.setVisibleWhen("");
        xDataTable7.setColumns(new com.rameses.rcp.common.Column[]{
            new com.rameses.rcp.common.Column(new Object[]{
                new Object[]{"name", "year"}
                , new Object[]{"caption", "Year"}
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
                new Object[]{"name", "item.title"}
                , new Object[]{"caption", "Item Title"}
                , new Object[]{"width", 100}
                , new Object[]{"minWidth", 250}
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
                new Object[]{"name", "amount"}
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
        xPanel3.add(xDataTable7, java.awt.BorderLayout.CENTER);

        xPanel1.setVisibleWhen("#{ mode == 'edit' }");
        xPanel1.setPreferredSize(new java.awt.Dimension(930, 40));
        xPanel1.setLayout(new java.awt.FlowLayout(java.awt.FlowLayout.LEFT));

        xButton9.setName("addItem"); // NOI18N
        xButton9.setVisibleWhen("#{ totalamount >= 0 }");
        xButton9.setText("Add Item");
        xPanel1.add(xButton9);

        xButton10.setName("openItem"); // NOI18N
        xButton10.setVisibleWhen("#{ totalamount >= 0 }");
        xButton10.setText("Open Item");
        xPanel1.add(xButton10);

        xButton12.setName("removeItem"); // NOI18N
        xButton12.setVisibleWhen("#{ totalamount >= 0 }");
        xButton12.setText("Remove Item");
        xPanel1.add(xButton12);

        xPanel3.add(xPanel1, java.awt.BorderLayout.NORTH);

        xTabbedPane1.addTab("Current Bill Items", xPanel3);

        add(xTabbedPane1, java.awt.BorderLayout.CENTER);
    }// </editor-fold>//GEN-END:initComponents


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JPanel pnlFoot1;
    private com.rameses.rcp.control.XButton xButton10;
    private com.rameses.rcp.control.XButton xButton12;
    private com.rameses.rcp.control.XButton xButton9;
    private com.rameses.rcp.control.XDataTable xDataTable7;
    private com.rameses.rcp.control.XFormPanel xFormPanel10;
    private com.rameses.rcp.control.XFormPanel xFormPanel9;
    private com.rameses.rcp.control.XLabel xLabel22;
    private com.rameses.rcp.control.XLabel xLabel43;
    private com.rameses.rcp.control.XPanel xPanel1;
    private com.rameses.rcp.control.XPanel xPanel3;
    private com.rameses.rcp.control.XTabbedPane xTabbedPane1;
    // End of variables declaration//GEN-END:variables
}
