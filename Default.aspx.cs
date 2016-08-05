namespace CustomerPortal {
    using CustomerPortal.Utility;
    using DevExpress.Web.ASPxGauges.Base;
    using System;
    using System.Data;
    using System.Web;
    using System.Web.UI;
    using DevExpress.Web;
    using DevExpress.XtraGauges.Core.Model;
    using System.Configuration;

    public partial class _Default : System.Web.UI.Page 
    {
        protected void Page_Load(object sender, EventArgs e) 
        {
            CustomerPortal.MainMaster mainMasterPage = (CustomerPortal.MainMaster)this.Master;

            mainMasterPage.ShowLoginPopUp = (Session["WorkingEmployerID"] == null);
            
            if (Request.QueryString.HasKeys())
            {
                mainMasterPage.ShowLogoutPopUp = (string.Compare(Request.QueryString["LogOut"].ToString(), "Yes", true) == 0);
            }

            mainMasterPage.ShowNotificationPopUp = Session["UserMessageCount"] != null && (int)Session["UserMessageCount"] > 0;

            if (Session["KPIDaysToDisplay"] == null)
            {
                Session["KPIDaysToDisplay"] = Convert.ToInt32(ConfigurationManager.AppSettings["KPIDaysToDisplay"]);
            }

            Refresh();

            lblPerformance.Text = string.Format("{0}-Day performance", Session["KPIDaysToDisplay"].ToString());
            lblProjectResults.Text = string.Format("{0}-Project Results", Session["KPIDaysToDisplay"].ToString());
            lblProjectActivity.Text = string.Format("{0}-Project Activity", Session["KPIDaysToDisplay"].ToString());

        }

        public void Refresh()
        {
            try
            {
                dsPerformanceMetrics.DataBind();
                dsProjectsByUser.DataBind();
                //
                dsDailyProjectsKPI.DataBind();
                dsResultsAnalysis.DataBind();
                //
                dsOpenProjects.DataBind();
            }
            catch (Exception ex)
            {
                ExceptionUtility.LogException(ex, "Default - Refresh");

                HttpContext.Current.Response.Redirect("~/ErrorPage.aspx");
            } 
        }


        #region Data Sources

        private int GetIndicatorValues(double  percent)
        {
            int result = 0;

            if (percent == 0)
            {
                return 0;
            }

            if (percent < 60)
           {
               result = 1;
           }

           if (percent >= 60 && percent < 90)
           {
               result = 2;
           }

           if (percent >= 90)
           {
               result = 3;
           }

            return result;
        }

        protected void dsPerformanceMetrics_DataBinding(object sender, EventArgs e)
        {
            try
            {
                var x  = Session["WorkingEmployerID"];
                var x1 = Session["KPIDaysToDisplay"];

                DataView dv = (DataView)dsPerformanceMetrics.Select(System.Web.UI.DataSourceSelectArguments.Empty);

                if (dv != null)
                {
                    DataRow dr = dv.Table.Rows[0];

                    lblContactWithin1hr.Text = string.Format("Contacted within 1 hour {0}%", Convert.ToDouble(dr["ContactedWithin1Hour"]));
                    lbScheduledWithin24hrs.Text = string.Format("Scheduled within 24 hours {0}%", Convert.ToDouble(dr["ScheduledWithin24Hours"]));
                    lblResultsWithin48hrs.Text = string.Format("Results within 48 hours {0}%", Convert.ToDouble(dr["TurnedAroundWithin48Hours"]));

                    indicatorWithin1hr.StateIndex = GetIndicatorValues(Convert.ToDouble(dr["ContactedWithin1Hour"]));
                    indicatorWithin24hrs.StateIndex = GetIndicatorValues(Convert.ToDouble(dr["ScheduledWithin24Hours"]));
                    indicatorWithin48hrs.StateIndex = GetIndicatorValues(Convert.ToDouble(dr["TurnedAroundWithin48Hours"]));

                }
            }
            catch (Exception ex)
            {
                ExceptionUtility.LogException(ex, "Default - dsPerformanceMetrics_DataBinding");

                HttpContext.Current.Response.Redirect("~/ErrorPage.aspx");
            } 
        }

        #endregion

    }
}