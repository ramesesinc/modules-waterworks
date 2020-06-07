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
public class WaterworksCashReceiptBillStatementPage extends javax.swing.JPanel {

    /**
     * Creates new form WaterworksCashReceiptBillStatementPage
     */
    public WaterworksCashReceiptBillStatementPage() {
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

        vwSummary = new com.rameses.rcp.control.XPanel();
        xTabbedPane2 = new com.rameses.rcp.control.XTabbedPane();
        jPanel8 = new javax.swing.JPanel();
        xFormPanel6 = new com.rameses.rcp.control.XFormPanel();
        xLabel22 = new com.rameses.rcp.control.XLabel();
        xLabel25 = new com.rameses.rcp.control.XLabel();
        xLabel27 = new com.rameses.rcp.control.XLabel();
        xLabel15 = new com.rameses.rcp.control.XLabel();
        xLabel28 = new com.rameses.rcp.control.XLabel();
        xDataTable1 = new com.rameses.rcp.control.XDataTable();
        xFormPanel3 = new com.rameses.rcp.control.XFormPanel();
        xLabel1 = new com.rameses.rcp.control.XLabel();
        xLabel40 = new com.rameses.rcp.control.XLabel();
        xLabel41 = new com.rameses.rcp.control.XLabel();
        xLabel42 = new com.rameses.rcp.control.XLabel();
        xLabel45 = new com.rameses.rcp.control.XLabel();
        xPanel3 = new com.rameses.rcp.control.XPanel();
        xFormPanel11 = new com.rameses.rcp.control.XFormPanel();
        xLabel33 = new com.rameses.rcp.control.XLabel();
        xLabel34 = new com.rameses.rcp.control.XLabel();
        xLabel35 = new com.rameses.rcp.control.XLabel();
        xLabel36 = new com.rameses.rcp.control.XLabel();
        xFormPanel12 = new com.rameses.rcp.control.XFormPanel();
        xLabel32 = new com.rameses.rcp.control.XLabel();
        xLabel37 = new com.rameses.rcp.control.XLabel();
        xLabel38 = new com.rameses.rcp.control.XLabel();
        xLabel39 = new com.rameses.rcp.control.XLabel();
        pnlFoot = new javax.swing.JPanel();
        xFormPanel1 = new com.rameses.rcp.control.XFormPanel();
        xLabel46 = new com.rameses.rcp.control.XLabel();
        xLabel47 = new com.rameses.rcp.control.XLabel();
        xLabel48 = new com.rameses.rcp.control.XLabel();
        xFormPanel2 = new com.rameses.rcp.control.XFormPanel();
        xLabel49 = new com.rameses.rcp.control.XLabel();
        xLabel50 = new com.rameses.rcp.control.XLabel();
        xFormPanel4 = new com.rameses.rcp.control.XFormPanel();
        xLabel51 = new com.rameses.rcp.control.XLabel();
        xLabel52 = new com.rameses.rcp.control.XLabel();
        xLabel53 = new com.rameses.rcp.control.XLabel();

        vwSummary.setLayout(new java.awt.BorderLayout());

        xFormPanel6.setCaptionWidth(120);

        xLabel22.setCaption("Acct No");
        xLabel22.setExpression("#{ entity.acctno }");
        xFormPanel6.add(xLabel22);

        xLabel25.setCaption("Acct Name");
        xLabel25.setExpression("#{ entity.acctname }");
        xFormPanel6.add(xLabel25);

        xLabel27.setCaption("Meter Status");
        xLabel27.setExpression("#{ entity.meterstate }");
        xFormPanel6.add(xLabel27);

        xLabel15.setCaption("Acct Status");
        xLabel15.setExpression("#{ entity.acctstate }");
        xFormPanel6.add(xLabel15);

        xLabel28.setCaption("Classification");
        xLabel28.setExpression("#{ entity.classificationid }");
        xFormPanel6.add(xLabel28);

        xDataTable1.setHandler("detailListHandler");
        xDataTable1.setItems("");
        xDataTable1.setColumns(new com.rameses.rcp.common.Column[]{
            new com.rameses.rcp.common.Column(new Object[]{
                new Object[]{"name", "txndate"}
                , new Object[]{"caption", "Date"}
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
                , new Object[]{"typeHandler", new com.rameses.rcp.common.DateColumnHandler(null, "yyyy-MM-dd", "yyyy-MM-dd")}
            }),
            new com.rameses.rcp.common.Column(new Object[]{
                new Object[]{"name", "particulars"}
                , new Object[]{"caption", "Particulars"}
                , new Object[]{"width", 150}
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
                , new Object[]{"typeHandler", new com.rameses.rcp.common.DecimalColumnHandler("#,##0.00;(#,##0.00)", -1.0, -1.0, false, 2)}
            }),
            new com.rameses.rcp.common.Column(new Object[]{
                new Object[]{"name", "dr"}
                , new Object[]{"caption", "Amt Due"}
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
                new Object[]{"name", "cr"}
                , new Object[]{"caption", "Amt Paid"}
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
                new Object[]{"name", "runbalance"}
                , new Object[]{"caption", "Run.Balance"}
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
                , new Object[]{"typeHandler", new com.rameses.rcp.common.DecimalColumnHandler("#,##0.00;(#,##0.00)", -1.0, -1.0, false, 2)}
            }),
            new com.rameses.rcp.common.Column(new Object[]{
                new Object[]{"name", null}
                , new Object[]{"caption", "-"}
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
                , new Object[]{"typeHandler", new com.rameses.rcp.common.TextColumnHandler()}
            })
        });

        xFormPanel3.setCaptionWidth(150);

        xLabel1.setExpression("This Consumption");
        xLabel1.setFont(new java.awt.Font("SansSerif", 1, 13)); // NOI18N
        xLabel1.setShowCaption(false);
        xFormPanel3.add(xLabel1);

        xLabel40.setCaption("Current Reading");
        xLabel40.setExpression("#{ entity.consumption.reading }");
        xFormPanel3.add(xLabel40);

        xLabel41.setCaption("Prev Reading");
        xLabel41.setExpression("#{ entity.consumption.prev.reading }");
        xFormPanel3.add(xLabel41);

        xLabel42.setCaption("Volume (cu.m)");
        xLabel42.setExpression("#{ entity.consumption.volume }");
        xFormPanel3.add(xLabel42);

        xLabel45.setCaption("Amount");
        xLabel45.setExpression("#{ entity.consumption.amount }");
        xLabel45.setNumberFormat("#,##0.00");
        xFormPanel3.add(xLabel45);

        javax.swing.GroupLayout jPanel8Layout = new javax.swing.GroupLayout(jPanel8);
        jPanel8.setLayout(jPanel8Layout);
        jPanel8Layout.setHorizontalGroup(
            jPanel8Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel8Layout.createSequentialGroup()
                .addGap(20, 20, 20)
                .addGroup(jPanel8Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(xDataTable1, javax.swing.GroupLayout.PREFERRED_SIZE, 907, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addGroup(jPanel8Layout.createSequentialGroup()
                        .addComponent(xFormPanel6, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(75, 75, 75)
                        .addComponent(xFormPanel3, javax.swing.GroupLayout.PREFERRED_SIZE, 398, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addContainerGap(31, Short.MAX_VALUE))
        );
        jPanel8Layout.setVerticalGroup(
            jPanel8Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel8Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel8Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addComponent(xFormPanel6, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(xFormPanel3, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                .addGap(18, 18, 18)
                .addComponent(xDataTable1, javax.swing.GroupLayout.DEFAULT_SIZE, 264, Short.MAX_VALUE)
                .addContainerGap())
        );

        xTabbedPane2.addTab("General Info", jPanel8);

        vwSummary.add(xTabbedPane2, java.awt.BorderLayout.CENTER);

        xPanel3.setVisibleWhen("#{  entity.step > 0 }");
        xPanel3.setPreferredSize(new java.awt.Dimension(805, 90));

        xFormPanel11.setCaptionWidth(150);

        xLabel33.setCaption("Bill Year/Month");
        xLabel33.setExpression("#{ entity.year } #{ entity.monthname }");
        xFormPanel11.add(xLabel33);

        xLabel34.setCaption("Bill Period");
        xLabel34.setExpression("#{ entity.period.fromdate } to #{ entity.period.todate }");
        xFormPanel11.add(xLabel34);

        xLabel35.setCaption("Bill Due Date");
        xLabel35.setExpression("#{ entity.period.duedate } ");
        xLabel35.setDateFormat("yyyy-MMM-dd");
        xFormPanel11.add(xLabel35);

        xLabel36.setCaption("Pmt Disc Date");
        xLabel36.setExpression("#{ entity.period.discdate } ");
        xLabel36.setDateFormat("yyyy-MMM-dd");
        xFormPanel11.add(xLabel36);

        xFormPanel12.setCaptionWidth(120);

        xLabel32.setCaption("Bill No");
        xLabel32.setExpression("#{ entity.billno }");
        xFormPanel12.add(xLabel32);

        xLabel37.setCaption("Bill Date");
        xLabel37.setExpression("#{ entity.billdate }");
        xLabel37.setDateFormat("yyyy-MMM-dd");
        xFormPanel12.add(xLabel37);

        xLabel38.setCaption("Bill Status");
        xLabel38.setExpression("#{ entity.state }");
        xLabel38.setDateFormat("yyyy-MMM-dd");
        xFormPanel12.add(xLabel38);

        xLabel39.setCaption("Total Due");
        xLabel39.setExpression("#{ entity.totalamtdue }");
        xLabel39.setCaptionFont(new java.awt.Font("SansSerif", 0, 14)); // NOI18N
        xLabel39.setFont(new java.awt.Font("SansSerif", 1, 14)); // NOI18N
        xLabel39.setNumberFormat("#,##0.00;(#,##0.00)");
        xFormPanel12.add(xLabel39);

        javax.swing.GroupLayout xPanel3Layout = new javax.swing.GroupLayout(xPanel3);
        xPanel3.setLayout(xPanel3Layout);
        xPanel3Layout.setHorizontalGroup(
            xPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(xPanel3Layout.createSequentialGroup()
                .addGap(5, 5, 5)
                .addComponent(xFormPanel11, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(5, 5, 5)
                .addComponent(xFormPanel12, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
        );
        xPanel3Layout.setVerticalGroup(
            xPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(xPanel3Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(xPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(xFormPanel12, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addGroup(xPanel3Layout.createSequentialGroup()
                        .addComponent(xFormPanel11, javax.swing.GroupLayout.PREFERRED_SIZE, 85, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))))
        );

        vwSummary.add(xPanel3, java.awt.BorderLayout.NORTH);

        pnlFoot.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(204, 204, 204)));
        pnlFoot.setPreferredSize(new java.awt.Dimension(972, 80));

        xFormPanel1.setCaptionWidth(120);

        xLabel46.setCaption("Balance Forward");
        xLabel46.setExpression("#{ entity.balanceforward } ");
        xLabel46.setHorizontalAlignment(javax.swing.SwingConstants.RIGHT);
        xLabel46.setNumberFormat("#,##0.00;(#,##0.00)");
        xLabel46.setPreferredSize(new java.awt.Dimension(0, 20));
        xFormPanel1.add(xLabel46);

        xLabel47.setCaption("This Bill Amount");
        xLabel47.setExpression("#{ entity.billamount } ");
        xLabel47.setHorizontalAlignment(javax.swing.SwingConstants.RIGHT);
        xLabel47.setNumberFormat("#,##0.00;(#,##0.00)");
        xLabel47.setPreferredSize(new java.awt.Dimension(0, 20));
        xFormPanel1.add(xLabel47);

        xLabel48.setCaption("Total Surcharge");
        xLabel48.setExpression("#{ entity.totalsurcharge } ");
        xLabel48.setHorizontalAlignment(javax.swing.SwingConstants.RIGHT);
        xLabel48.setNumberFormat("#,##0.00;(#,##0.00)");
        xLabel48.setPreferredSize(new java.awt.Dimension(0, 20));
        xFormPanel1.add(xLabel48);

        xFormPanel2.setCaptionWidth(140);

        xLabel49.setCaption("Unapplied Credits");
        xLabel49.setExpression("#{ entity.totalcredits } ");
        xLabel49.setHorizontalAlignment(javax.swing.SwingConstants.RIGHT);
        xLabel49.setNumberFormat("#,##0.00;(#,##0.00)");
        xLabel49.setPreferredSize(new java.awt.Dimension(0, 20));
        xFormPanel2.add(xLabel49);

        xLabel50.setCaption("Unpaid Amt");
        xLabel50.setExpression("#{ entity.totalunpaid } ");
        xLabel50.setHorizontalAlignment(javax.swing.SwingConstants.RIGHT);
        xLabel50.setNumberFormat("#,##0.00;(#,##0.00)");
        xLabel50.setPreferredSize(new java.awt.Dimension(0, 20));
        xFormPanel2.add(xLabel50);

        xFormPanel4.setCaptionWidth(150);

        xLabel51.setCaption("Total Discount");
        xLabel51.setExpression("#{ entity.totaldiscount } ");
        xLabel51.setHorizontalAlignment(javax.swing.SwingConstants.RIGHT);
        xLabel51.setNumberFormat("#,##0.00;(#,##0.00)");
        xLabel51.setPreferredSize(new java.awt.Dimension(0, 20));
        xFormPanel4.add(xLabel51);

        xLabel52.setCaption("Total Cash Payments");
        xLabel52.setExpression("#{ entity.totalpayment } ");
        xLabel52.setHorizontalAlignment(javax.swing.SwingConstants.RIGHT);
        xLabel52.setNumberFormat("#,##0.00;(#,##0.00)");
        xLabel52.setPreferredSize(new java.awt.Dimension(0, 20));
        xFormPanel4.add(xLabel52);

        xLabel53.setCaption("Bill Amount Due");
        xLabel53.setExpression("#{ entity.totalamtdue } ");
        xLabel53.setHorizontalAlignment(javax.swing.SwingConstants.RIGHT);
        xLabel53.setNumberFormat("#,##0.00;(#,##0.00)");
        xLabel53.setPreferredSize(new java.awt.Dimension(0, 20));
        xFormPanel4.add(xLabel53);

        javax.swing.GroupLayout pnlFootLayout = new javax.swing.GroupLayout(pnlFoot);
        pnlFoot.setLayout(pnlFootLayout);
        pnlFootLayout.setHorizontalGroup(
            pnlFootLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(pnlFootLayout.createSequentialGroup()
                .addGap(271, 271, 271)
                .addComponent(xFormPanel1, javax.swing.GroupLayout.PREFERRED_SIZE, 241, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(30, 30, 30)
                .addComponent(xFormPanel4, javax.swing.GroupLayout.PREFERRED_SIZE, 271, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(164, Short.MAX_VALUE))
            .addGroup(pnlFootLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                .addGroup(pnlFootLayout.createSequentialGroup()
                    .addGap(16, 16, 16)
                    .addComponent(xFormPanel2, javax.swing.GroupLayout.PREFERRED_SIZE, 239, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addContainerGap(722, Short.MAX_VALUE)))
        );
        pnlFootLayout.setVerticalGroup(
            pnlFootLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(pnlFootLayout.createSequentialGroup()
                .addContainerGap()
                .addGroup(pnlFootLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(pnlFootLayout.createSequentialGroup()
                        .addComponent(xFormPanel4, javax.swing.GroupLayout.PREFERRED_SIZE, 66, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(0, 0, Short.MAX_VALUE))
                    .addComponent(xFormPanel1, javax.swing.GroupLayout.PREFERRED_SIZE, 0, Short.MAX_VALUE))
                .addContainerGap())
            .addGroup(pnlFootLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                .addGroup(pnlFootLayout.createSequentialGroup()
                    .addGap(5, 5, 5)
                    .addComponent(xFormPanel2, javax.swing.GroupLayout.PREFERRED_SIZE, 59, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addContainerGap(14, Short.MAX_VALUE)))
        );

        vwSummary.add(pnlFoot, java.awt.BorderLayout.SOUTH);

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(this);
        this.setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 979, Short.MAX_VALUE)
            .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                .addGroup(layout.createSequentialGroup()
                    .addGap(0, 0, Short.MAX_VALUE)
                    .addComponent(vwSummary, javax.swing.GroupLayout.PREFERRED_SIZE, 979, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addGap(0, 0, Short.MAX_VALUE)))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 613, Short.MAX_VALUE)
            .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                .addGroup(layout.createSequentialGroup()
                    .addGap(0, 0, Short.MAX_VALUE)
                    .addComponent(vwSummary, javax.swing.GroupLayout.PREFERRED_SIZE, 613, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addGap(0, 0, Short.MAX_VALUE)))
        );
    }// </editor-fold>//GEN-END:initComponents


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JPanel jPanel8;
    private javax.swing.JPanel pnlFoot;
    private com.rameses.rcp.control.XPanel vwSummary;
    private com.rameses.rcp.control.XDataTable xDataTable1;
    private com.rameses.rcp.control.XFormPanel xFormPanel1;
    private com.rameses.rcp.control.XFormPanel xFormPanel11;
    private com.rameses.rcp.control.XFormPanel xFormPanel12;
    private com.rameses.rcp.control.XFormPanel xFormPanel2;
    private com.rameses.rcp.control.XFormPanel xFormPanel3;
    private com.rameses.rcp.control.XFormPanel xFormPanel4;
    private com.rameses.rcp.control.XFormPanel xFormPanel6;
    private com.rameses.rcp.control.XLabel xLabel1;
    private com.rameses.rcp.control.XLabel xLabel15;
    private com.rameses.rcp.control.XLabel xLabel22;
    private com.rameses.rcp.control.XLabel xLabel25;
    private com.rameses.rcp.control.XLabel xLabel27;
    private com.rameses.rcp.control.XLabel xLabel28;
    private com.rameses.rcp.control.XLabel xLabel32;
    private com.rameses.rcp.control.XLabel xLabel33;
    private com.rameses.rcp.control.XLabel xLabel34;
    private com.rameses.rcp.control.XLabel xLabel35;
    private com.rameses.rcp.control.XLabel xLabel36;
    private com.rameses.rcp.control.XLabel xLabel37;
    private com.rameses.rcp.control.XLabel xLabel38;
    private com.rameses.rcp.control.XLabel xLabel39;
    private com.rameses.rcp.control.XLabel xLabel40;
    private com.rameses.rcp.control.XLabel xLabel41;
    private com.rameses.rcp.control.XLabel xLabel42;
    private com.rameses.rcp.control.XLabel xLabel45;
    private com.rameses.rcp.control.XLabel xLabel46;
    private com.rameses.rcp.control.XLabel xLabel47;
    private com.rameses.rcp.control.XLabel xLabel48;
    private com.rameses.rcp.control.XLabel xLabel49;
    private com.rameses.rcp.control.XLabel xLabel50;
    private com.rameses.rcp.control.XLabel xLabel51;
    private com.rameses.rcp.control.XLabel xLabel52;
    private com.rameses.rcp.control.XLabel xLabel53;
    private com.rameses.rcp.control.XPanel xPanel3;
    private com.rameses.rcp.control.XTabbedPane xTabbedPane2;
    // End of variables declaration//GEN-END:variables
}
