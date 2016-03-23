namespace CustomerPortal {
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Web;
    using System.Web.UI;
    using System.Web.UI.WebControls;
    using DevExpress.Web;
    using DevExpress.Web.ASPxGauges.Base;
    using DevExpress.Web.ASPxGauges.Gauges.Circular;
    using System.Data;

    public partial class _Default : System.Web.UI.Page 
    {
        protected void Page_Load(object sender, EventArgs e) 
        {
            CustomerPortal.MainMaster mainMasterPage = (CustomerPortal.MainMaster)this.Master;

            mainMasterPage.ShowLoginPopUp = (Session["WorkingEmployerID"] == null);
            mainMasterPage.ShowNotificationPopUp = Session["UserMessageCount"] != null && (int)Session["UserMessageCount"] > 0;
        }

        public void Refresh()
        {
            dsPerformanceMetrics.DataBind();
            dsProjectsByUser.DataBind();
            //
           dsDailyProjectsKPI.DataBind();
            dsResultsAnalysis.DataBind();
            //
            dsOpenProjects.DataBind();
        }

        #region Data Sources

        protected void dsPerformanceMetrics_DataBinding(object sender, EventArgs e)
        {
            DataView dv = (DataView)dsPerformanceMetrics.Select(System.Web.UI.DataSourceSelectArguments.Empty);
            if (dv != null)
            {
                DataRow dr = dv.Table.Rows[0];
                gaugeControl.BeginUpdate();
                ((ICircularGauge)gaugeControl.Gauges[0]).Needles[0].Value = (float)Convert.ToDouble(dr["ContactedWithin1Hour"].ToString());
                ((ICircularGauge)gaugeControl.Gauges[0]).Needles[0].Update();

                ((ICircularGauge)gaugeControl.Gauges[1]).Needles[0].Value = (float)Convert.ToDouble(dr["ScheduledWithin24Hours"].ToString());
                ((ICircularGauge)gaugeControl.Gauges[1]).Needles[0].Update();

                ((ICircularGauge)gaugeControl.Gauges[2]).Needles[0].Value = (float)Convert.ToDouble(dr["TurnedAroundWithin48Hours"].ToString());
                ((ICircularGauge)gaugeControl.Gauges[2]).Needles[0].Update();
                gaugeControl.EndUpdate();
                
            }
        }

        #endregion
    }
}