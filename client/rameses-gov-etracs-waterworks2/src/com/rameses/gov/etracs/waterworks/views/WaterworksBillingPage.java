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
public class WaterworksBillingPage extends javax.swing.JPanel {

    /**
     * Creates new form WaterBillingPage
     */
    public WaterworksBillingPage() {
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
        jPanel2 = new javax.swing.JPanel();
        xFormPanel1 = new com.rameses.rcp.control.XFormPanel();
        xLabel1 = new com.rameses.rcp.control.XLabel();
        xLabel2 = new com.rameses.rcp.control.XLabel();
        xLabel3 = new com.rameses.rcp.control.XLabel();
        xLabel7 = new com.rameses.rcp.control.XLabel();
        xLabel13 = new com.rameses.rcp.control.XLabel();
        jPanel1 = new javax.swing.JPanel();
        xFormPanel2 = new com.rameses.rcp.control.XFormPanel();
        xLabel4 = new com.rameses.rcp.control.XLabel();
        xLabel6 = new com.rameses.rcp.control.XLabel();
        xLabel5 = new com.rameses.rcp.control.XLabel();
        xFormPanel4 = new com.rameses.rcp.control.XFormPanel();
        xLabel15 = new com.rameses.rcp.control.XLabel();
        xLabel21 = new com.rameses.rcp.control.XLabel();
        xLabel19 = new com.rameses.rcp.control.XLabel();
        xLabel20 = new com.rameses.rcp.control.XLabel();
        xLabel22 = new com.rameses.rcp.control.XLabel();
        xLabel23 = new com.rameses.rcp.control.XLabel();
        xLabel24 = new com.rameses.rcp.control.XLabel();
        xFormPanel3 = new com.rameses.rcp.control.XFormPanel();
        xLabel9 = new com.rameses.rcp.control.XLabel();
        xLabel11 = new com.rameses.rcp.control.XLabel();
        xLabel12 = new com.rameses.rcp.control.XLabel();
        xLabel14 = new com.rameses.rcp.control.XLabel();
        xLabel10 = new com.rameses.rcp.control.XLabel();
        xLabel16 = new com.rameses.rcp.control.XLabel();
        xLabel17 = new com.rameses.rcp.control.XLabel();
        xLabel18 = new com.rameses.rcp.control.XLabel();
        xPanel1 = new com.rameses.rcp.control.XPanel();
        xLabel8 = new com.rameses.rcp.control.XLabel();

        setLayout(new java.awt.BorderLayout());

        xTabbedPane1.setPreferredSize(new java.awt.Dimension(788, 505));

        com.rameses.rcp.control.border.XTitledBorder xTitledBorder1 = new com.rameses.rcp.control.border.XTitledBorder();
        xTitledBorder1.setPadding(new java.awt.Insets(20, 5, 5, 5));
        xTitledBorder1.setTitle("Account Information");
        xFormPanel1.setBorder(xTitledBorder1);
        xFormPanel1.setCaptionWidth(120);

        xLabel1.setCaption("Acct No");
        xLabel1.setExpression("#{ entity.acctno }");
        xLabel1.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(204, 204, 204)));
        xLabel1.setPreferredSize(new java.awt.Dimension(0, 20));
        xFormPanel1.add(xLabel1);

        xLabel2.setCaption("Acct Name");
        xLabel2.setExpression("#{ entity.acctname }");
        xLabel2.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(204, 204, 204)));
        xLabel2.setPreferredSize(new java.awt.Dimension(0, 20));
        xFormPanel1.add(xLabel2);

        xLabel3.setCaption("Address");
        xLabel3.setExpression("#{ entity.addresstext }");
        xLabel3.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(204, 204, 204)));
        xLabel3.setPreferredSize(new java.awt.Dimension(0, 20));
        xFormPanel1.add(xLabel3);

        xLabel7.setCaption("Acct Status");
        xLabel7.setExpression("#{ entity.acctstate }");
        xLabel7.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(204, 204, 204)));
        xLabel7.setPreferredSize(new java.awt.Dimension(0, 20));
        xFormPanel1.add(xLabel7);

        xLabel13.setCaption("Class");
        xLabel13.setExpression("#{ entity.classificationid }");
        xLabel13.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(204, 204, 204)));
        xLabel13.setPreferredSize(new java.awt.Dimension(0, 20));
        xFormPanel1.add(xLabel13);

        com.rameses.rcp.control.border.XTitledBorder xTitledBorder2 = new com.rameses.rcp.control.border.XTitledBorder();
        xTitledBorder2.setTitle("Billing Details");
        jPanel1.setBorder(xTitledBorder2);

        xFormPanel2.setCaptionWidth(120);

        xLabel4.setCaption("Bill No");
        xLabel4.setExpression("#{ entity.billno }");
        xLabel4.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(204, 204, 204)));
        xLabel4.setPreferredSize(new java.awt.Dimension(0, 20));
        xFormPanel2.add(xLabel4);

        xLabel6.setCaption("Bill Status");
        xLabel6.setExpression("#{ entity.state }");
        xLabel6.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(204, 204, 204)));
        xLabel6.setPreferredSize(new java.awt.Dimension(0, 20));
        xFormPanel2.add(xLabel6);

        xLabel5.setCaption("Period");
        xLabel5.setExpression("#{entity.monthname}  #{ entity.year } ");
        xLabel5.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(204, 204, 204)));
        xLabel5.setPreferredSize(new java.awt.Dimension(0, 20));
        xFormPanel2.add(xLabel5);

        xFormPanel4.setCaptionWidth(160);

        xLabel15.setCaption("Prev Unpaid");
        xLabel15.setExpression("#{ entity.arrears }");
        xLabel15.setHorizontalAlignment(javax.swing.SwingConstants.RIGHT);
        xLabel15.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(204, 204, 204)));
        xLabel15.setNumberFormat("#,##0.00");
        xLabel15.setPreferredSize(new java.awt.Dimension(150, 20));
        xFormPanel4.add(xLabel15);

        xLabel21.setCaption("Other Fees");
        xLabel21.setExpression("#{ entity.otherfees }");
        xLabel21.setHorizontalAlignment(javax.swing.SwingConstants.RIGHT);
        xLabel21.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(204, 204, 204)));
        xLabel21.setNumberFormat("#,##0.00");
        xLabel21.setPreferredSize(new java.awt.Dimension(150, 20));
        xFormPanel4.add(xLabel21);

        xLabel19.setCaption("Surcharge");
        xLabel19.setExpression("#{ entity.surcharge }");
        xLabel19.setHorizontalAlignment(javax.swing.SwingConstants.RIGHT);
        xLabel19.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(204, 204, 204)));
        xLabel19.setNumberFormat("#,##0.00");
        xLabel19.setPreferredSize(new java.awt.Dimension(150, 20));
        xFormPanel4.add(xLabel19);

        xLabel20.setCaption("Interest");
        xLabel20.setExpression("#{ entity.interest }");
        xLabel20.setHorizontalAlignment(javax.swing.SwingConstants.RIGHT);
        xLabel20.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(204, 204, 204)));
        xLabel20.setNumberFormat("#,##0.00");
        xLabel20.setPreferredSize(new java.awt.Dimension(150, 20));
        xFormPanel4.add(xLabel20);

        xLabel22.setCaption("Credits");
        xLabel22.setExpression("#{ entity.credits }");
        xLabel22.setHorizontalAlignment(javax.swing.SwingConstants.RIGHT);
        xLabel22.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(204, 204, 204)));
        xLabel22.setNumberFormat("#,##0.00");
        xLabel22.setPreferredSize(new java.awt.Dimension(150, 20));
        xFormPanel4.add(xLabel22);

        xLabel23.setCaption("Current Amount");
        xLabel23.setExpression("#{ entity.amount }");
        xLabel23.setHorizontalAlignment(javax.swing.SwingConstants.RIGHT);
        xLabel23.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(204, 204, 204)));
        xLabel23.setNumberFormat("#,##0.00");
        xLabel23.setPreferredSize(new java.awt.Dimension(150, 20));
        xFormPanel4.add(xLabel23);

        xLabel24.setCaption("TOTAL (this bill)");
        xLabel24.setExpression("#{ entity.arrears + entity.otherfees + entity.surcharge + entity.interest + entity.credits + entity.amount }");
        xLabel24.setHorizontalAlignment(javax.swing.SwingConstants.RIGHT);
        xLabel24.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(204, 204, 204)));
        xLabel24.setCaptionFont(new java.awt.Font("SansSerif", 1, 12)); // NOI18N
        xLabel24.setCellPadding(new java.awt.Insets(20, 0, 0, 0));
        xLabel24.setNumberFormat("#,##0.00");
        xLabel24.setPreferredSize(new java.awt.Dimension(150, 20));
        xFormPanel4.add(xLabel24);

        javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(xFormPanel2, javax.swing.GroupLayout.PREFERRED_SIZE, 329, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(xFormPanel4, javax.swing.GroupLayout.PREFERRED_SIZE, 329, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addContainerGap(30, Short.MAX_VALUE))
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(xFormPanel2, javax.swing.GroupLayout.DEFAULT_SIZE, 149, Short.MAX_VALUE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(xFormPanel4, javax.swing.GroupLayout.PREFERRED_SIZE, 219, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap())
        );

        com.rameses.rcp.control.border.XTitledBorder xTitledBorder3 = new com.rameses.rcp.control.border.XTitledBorder();
        xTitledBorder3.setPadding(new java.awt.Insets(20, 5, 5, 5));
        xTitledBorder3.setTitle("Meter Information");
        xFormPanel3.setBorder(xTitledBorder3);
        xFormPanel3.setCaptionWidth(120);

        xLabel9.setCaption("Meter");
        xLabel9.setExpression("#{ entity.acctno }");
        xLabel9.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(204, 204, 204)));
        xLabel9.setPreferredSize(new java.awt.Dimension(0, 20));
        xFormPanel3.add(xLabel9);

        xLabel11.setCaption("Brand");
        xLabel11.setExpression("#{ entity.meter.brand }");
        xLabel11.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(204, 204, 204)));
        xLabel11.setPreferredSize(new java.awt.Dimension(0, 20));
        xFormPanel3.add(xLabel11);

        xLabel12.setCaption("Meter Size");
        xLabel12.setExpression("#{ entity.meter.size.title }");
        xLabel12.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(204, 204, 204)));
        xLabel12.setPreferredSize(new java.awt.Dimension(0, 20));
        xFormPanel3.add(xLabel12);

        xLabel14.setCaption("Capacity");
        xLabel14.setExpression("#{ entity.meter.capacity }");
        xLabel14.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(204, 204, 204)));
        xLabel14.setPreferredSize(new java.awt.Dimension(0, 20));
        xFormPanel3.add(xLabel14);

        xLabel10.setCaption("Meter Status");
        xLabel10.setExpression("#{ entity.meter.state }");
        xLabel10.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(204, 204, 204)));
        xLabel10.setPreferredSize(new java.awt.Dimension(0, 20));
        xFormPanel3.add(xLabel10);

        xLabel16.setCaption("Prev Reading");
        xLabel16.setExpression("#{ entity.prevreading == null ? 'NA' : entity.prevreading }");
        xLabel16.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(204, 204, 204)));
        xLabel16.setCellPadding(new java.awt.Insets(20, 0, 0, 0));
        xLabel16.setPreferredSize(new java.awt.Dimension(0, 20));
        xFormPanel3.add(xLabel16);

        xLabel17.setCaption("Current Reading");
        xLabel17.setExpression("#{ entity.reading }");
        xLabel17.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(204, 204, 204)));
        xLabel17.setPreferredSize(new java.awt.Dimension(0, 20));
        xFormPanel3.add(xLabel17);

        xLabel18.setCaption("Vol. Cons.");
        xLabel18.setExpression("#{ entity.volume }");
        xLabel18.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(204, 204, 204)));
        xLabel18.setPreferredSize(new java.awt.Dimension(0, 20));
        xFormPanel3.add(xLabel18);

        javax.swing.GroupLayout jPanel2Layout = new javax.swing.GroupLayout(jPanel2);
        jPanel2.setLayout(jPanel2Layout);
        jPanel2Layout.setHorizontalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel2Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(xFormPanel1, javax.swing.GroupLayout.PREFERRED_SIZE, 380, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(xFormPanel3, javax.swing.GroupLayout.PREFERRED_SIZE, 380, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jPanel1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );
        jPanel2Layout.setVerticalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel2Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addComponent(jPanel1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addGroup(jPanel2Layout.createSequentialGroup()
                        .addComponent(xFormPanel1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(xFormPanel3, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        xTabbedPane1.addTab("General", jPanel2);

        add(xTabbedPane1, java.awt.BorderLayout.CENTER);

        xPanel1.setVisibleWhen("#{ entity.state == 'ERR' }");
        xPanel1.setPreferredSize(new java.awt.Dimension(0, 50));

        xLabel8.setExpression("<html>#{errmsg}</html>");
        xLabel8.setVerticalAlignment(javax.swing.SwingConstants.TOP);

        javax.swing.GroupLayout xPanel1Layout = new javax.swing.GroupLayout(xPanel1);
        xPanel1.setLayout(xPanel1Layout);
        xPanel1Layout.setHorizontalGroup(
            xPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(xPanel1Layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(xLabel8, javax.swing.GroupLayout.DEFAULT_SIZE, 776, Short.MAX_VALUE)
                .addContainerGap())
        );
        xPanel1Layout.setVerticalGroup(
            xPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(xPanel1Layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(xLabel8, javax.swing.GroupLayout.DEFAULT_SIZE, 28, Short.MAX_VALUE)
                .addContainerGap())
        );

        add(xPanel1, java.awt.BorderLayout.NORTH);
    }// </editor-fold>//GEN-END:initComponents


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JPanel jPanel1;
    private javax.swing.JPanel jPanel2;
    private com.rameses.rcp.control.XFormPanel xFormPanel1;
    private com.rameses.rcp.control.XFormPanel xFormPanel2;
    private com.rameses.rcp.control.XFormPanel xFormPanel3;
    private com.rameses.rcp.control.XFormPanel xFormPanel4;
    private com.rameses.rcp.control.XLabel xLabel1;
    private com.rameses.rcp.control.XLabel xLabel10;
    private com.rameses.rcp.control.XLabel xLabel11;
    private com.rameses.rcp.control.XLabel xLabel12;
    private com.rameses.rcp.control.XLabel xLabel13;
    private com.rameses.rcp.control.XLabel xLabel14;
    private com.rameses.rcp.control.XLabel xLabel15;
    private com.rameses.rcp.control.XLabel xLabel16;
    private com.rameses.rcp.control.XLabel xLabel17;
    private com.rameses.rcp.control.XLabel xLabel18;
    private com.rameses.rcp.control.XLabel xLabel19;
    private com.rameses.rcp.control.XLabel xLabel2;
    private com.rameses.rcp.control.XLabel xLabel20;
    private com.rameses.rcp.control.XLabel xLabel21;
    private com.rameses.rcp.control.XLabel xLabel22;
    private com.rameses.rcp.control.XLabel xLabel23;
    private com.rameses.rcp.control.XLabel xLabel24;
    private com.rameses.rcp.control.XLabel xLabel3;
    private com.rameses.rcp.control.XLabel xLabel4;
    private com.rameses.rcp.control.XLabel xLabel5;
    private com.rameses.rcp.control.XLabel xLabel6;
    private com.rameses.rcp.control.XLabel xLabel7;
    private com.rameses.rcp.control.XLabel xLabel8;
    private com.rameses.rcp.control.XLabel xLabel9;
    private com.rameses.rcp.control.XPanel xPanel1;
    private com.rameses.rcp.control.XTabbedPane xTabbedPane1;
    // End of variables declaration//GEN-END:variables
}
