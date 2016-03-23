namespace CustomerPortal
{
    using System;
    using System.Drawing;
    using System.Collections;
    using System.ComponentModel;
    using DevExpress.XtraReports.UI;

    public partial class rptBaseLandscape : DevExpress.XtraReports.UI.XtraReport
    {
        public rptBaseLandscape()
        {
            InitializeComponent();
        }

        private void rptBaseLandscape_BeforePrint(object sender, System.Drawing.Printing.PrintEventArgs e)
        {
            var rpt = (CustomerPortal.rptBaseLandscape)sender;

            DateTime fromDate = (DateTime)rpt.FromDate.Value;
            DateTime toDate = (DateTime)rpt.ToDate.Value;

            xrLabel5.Text = string.Format("{0} to {1}", fromDate.Date.ToShortDateString(), toDate.Date.ToShortDateString());
        }

        private void rptBaseLandscape_ParametersRequestBeforeShow(object sender, DevExpress.XtraReports.Parameters.ParametersRequestEventArgs e)
        {
            FromDate.Value = DateTime.Now.AddDays(-30);
            ToDate.Value = DateTime.Now;
        }

    }
}
