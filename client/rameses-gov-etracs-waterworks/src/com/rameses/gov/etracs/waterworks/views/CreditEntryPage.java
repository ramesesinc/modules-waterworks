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
public class CreditEntryPage extends javax.swing.JPanel {

    /**
     * Creates new form CreditEntryPage
     */
    public CreditEntryPage() {
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
        xTextField2 = new com.rameses.rcp.control.XTextField();
        xDateField1 = new com.rameses.rcp.control.XDateField();
        xTextField3 = new com.rameses.rcp.control.XTextField();
        xTextField1 = new com.rameses.rcp.control.XTextField();
        xDecimalField2 = new com.rameses.rcp.control.XDecimalField();

        xFormPanel2.setCaptionVAlignment(com.rameses.rcp.constant.UIConstants.CENTER);
        xFormPanel2.setCaptionWidth(100);

        xTextField2.setCaption("Ref No");
        xTextField2.setName("entity.refno"); // NOI18N
        xTextField2.setPreferredSize(new java.awt.Dimension(120, 20));
        xFormPanel2.add(xTextField2);

        xDateField1.setCaption("Ref Date");
        xDateField1.setName("entity.refdate"); // NOI18N
        xDateField1.setPreferredSize(new java.awt.Dimension(120, 20));
        xFormPanel2.add(xDateField1);

        xTextField3.setCaption("Ref Type");
        xTextField3.setName("entity.reftype"); // NOI18N
        xTextField3.setPreferredSize(new java.awt.Dimension(120, 20));
        xTextField3.setTextCase(com.rameses.rcp.constant.TextCase.NONE);
        xFormPanel2.add(xTextField3);

        xTextField1.setCaption("Particulars");
        xTextField1.setName("entity.remarks"); // NOI18N
        xTextField1.setCellPadding(new java.awt.Insets(20, 0, 0, 0));
        xTextField1.setPreferredSize(new java.awt.Dimension(0, 20));
        xTextField1.setRequired(true);
        xTextField1.setTextCase(com.rameses.rcp.constant.TextCase.NONE);
        xFormPanel2.add(xTextField1);

        xDecimalField2.setCaption("Amount");
        xDecimalField2.setDisableWhen("#{ mode=='read' || entity.refid != null }");
        xDecimalField2.setName("entity.dr"); // NOI18N
        xDecimalField2.setText("entity.dr");
        xDecimalField2.setCellPadding(new java.awt.Insets(20, 0, 0, 0));
        xDecimalField2.setPreferredSize(new java.awt.Dimension(120, 20));
        xDecimalField2.setRequired(true);
        xFormPanel2.add(xDecimalField2);

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(this);
        this.setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(xFormPanel2, javax.swing.GroupLayout.DEFAULT_SIZE, 388, Short.MAX_VALUE)
                .addContainerGap())
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(xFormPanel2, javax.swing.GroupLayout.PREFERRED_SIZE, 309, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );
    }// </editor-fold>//GEN-END:initComponents


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private com.rameses.rcp.control.XDateField xDateField1;
    private com.rameses.rcp.control.XDecimalField xDecimalField2;
    private com.rameses.rcp.control.XFormPanel xFormPanel2;
    private com.rameses.rcp.control.XTextField xTextField1;
    private com.rameses.rcp.control.XTextField xTextField2;
    private com.rameses.rcp.control.XTextField xTextField3;
    // End of variables declaration//GEN-END:variables
}
