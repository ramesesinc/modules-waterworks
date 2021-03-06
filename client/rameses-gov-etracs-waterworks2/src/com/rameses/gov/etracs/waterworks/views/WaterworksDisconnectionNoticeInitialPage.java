/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rameses.gov.etracs.waterworks.views;

/**
 *
 * @author elmonazareno
 */
public class WaterworksDisconnectionNoticeInitialPage extends javax.swing.JPanel {

    /**
     * Creates new form WaterworksDisconnectionNoticeInitialPage
     */
    public WaterworksDisconnectionNoticeInitialPage() {
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

        jLabel1 = new javax.swing.JLabel();
        xButton1 = new com.rameses.rcp.control.XButton();
        xFormPanel1 = new com.rameses.rcp.control.XFormPanel();
        xTextField1 = new com.rameses.rcp.control.XTextField();
        xDateField1 = new com.rameses.rcp.control.XDateField();
        xLookupField1 = new com.rameses.rcp.control.XLookupField();
        xIntegerField1 = new com.rameses.rcp.control.XIntegerField();

        jLabel1.setText("<html>\nYou are about to generate disconnection notice letters for delinquent accounts\n</html>");

        xButton1.setName("saveNew"); // NOI18N
        xButton1.setText("Next");

        xFormPanel1.setCaptionWidth(150);

        xTextField1.setCaption("Group Name");
        xTextField1.setName("entity.groupname"); // NOI18N
        xTextField1.setPreferredSize(new java.awt.Dimension(0, 20));
        xTextField1.setRequired(true);
        xFormPanel1.add(xTextField1);

        xDateField1.setCaption("Ref. Date");
        xDateField1.setName("entity.refdate"); // NOI18N
        xDateField1.setPreferredSize(new java.awt.Dimension(0, 20));
        xDateField1.setRequired(true);
        xFormPanel1.add(xDateField1);

        xLookupField1.setCaption("Sub Area");
        xLookupField1.setExpression("#{ entity.subarea.code } #{ entity.subarea.description }");
        xLookupField1.setHandler("waterworks_subarea:lookup");
        xLookupField1.setName("entity.subarea"); // NOI18N
        xLookupField1.setPreferredSize(new java.awt.Dimension(0, 20));
        xFormPanel1.add(xLookupField1);

        xIntegerField1.setCaption("Months Delinquent");
        xIntegerField1.setName("entity.monthsdelinquent"); // NOI18N
        xFormPanel1.add(xIntegerField1);

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(this);
        this.setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(32, 32, 32)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(xButton1, javax.swing.GroupLayout.PREFERRED_SIZE, 86, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel1, javax.swing.GroupLayout.PREFERRED_SIZE, 431, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(xFormPanel1, javax.swing.GroupLayout.PREFERRED_SIZE, 393, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addContainerGap(44, Short.MAX_VALUE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(21, 21, 21)
                .addComponent(jLabel1, javax.swing.GroupLayout.PREFERRED_SIZE, 56, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(18, 18, 18)
                .addComponent(xFormPanel1, javax.swing.GroupLayout.PREFERRED_SIZE, 100, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 30, Short.MAX_VALUE)
                .addComponent(xButton1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(104, 104, 104))
        );
    }// </editor-fold>//GEN-END:initComponents


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JLabel jLabel1;
    private com.rameses.rcp.control.XButton xButton1;
    private com.rameses.rcp.control.XDateField xDateField1;
    private com.rameses.rcp.control.XFormPanel xFormPanel1;
    private com.rameses.rcp.control.XIntegerField xIntegerField1;
    private com.rameses.rcp.control.XLookupField xLookupField1;
    private com.rameses.rcp.control.XTextField xTextField1;
    // End of variables declaration//GEN-END:variables
}
