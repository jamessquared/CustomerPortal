namespace CustomerPortal.Reports
{
    using CustomerPortal.Classes;
    using CustomerPortal.Utility;
    using DevExpress.XtraReports.UI;
    using System;
    using System.Collections.Generic;
    using System.Web;
    using DevExpress.Web;
    using DevExpress.XtraReports.Web;
    using System.IO;

    public partial class ReportViewer : System.Web.UI.Page
    {
        private XtraReport GetReport()
        {
            var rpt = new XtraReport();
    
            switch (Session["ReportName"].ToString())
            {
                case "Active Projects":
                    {
                        rpt = new rptActiveProjects();
                        break;
                    }

                case "Completed Projects":
                    {
                        rpt = new rptCompletedProjects();
                        break;
                    }

                case "Project Life Cycle Summary":
                    {
                        rpt = new rptProjectLifeCycleSummary();
                        break;
                    }

                case "Project Life Cycle Detail":
                    {
                        rpt = new rptProjectLifeCycleDetails();
                        break;
                    }

                case "Results Analysis":
                    {
                        rpt = new rptResultsAnalysis();
                        break;
                    }

                case "Further Evaluation":
                    {
                        rpt = new rptFurtherEvaluation();
                        break;
                    }

                case "Protocol Summary":
                    {
                        rpt = new rptProtocolSummary();
                        break;
                    }

                case "Cancelled Project Summary":
                    {
                        rpt = new rptCancelledProjectSummary();
                        break;
                    }

                default:
                    {
                        Response.Redirect("~/");
                        break;
                    }
            }

            return rpt;
        }


        protected void Page_Load(object sender, EventArgs e)
        {
            // Redirect to Login if NOT logged in
            if (Session["ContactID"] == null)
            {
                Response.Redirect("~/Default.aspx");
            }

            // Set Login Header
            CustomerPortal.RootMaster siteMasterPage = (CustomerPortal.RootMaster)this.Master;
            if (siteMasterPage != null)
            {
                siteMasterPage.SetLoginLabels();
            }

            // Validate that the user has access to this page
            if (Session["Privileges"] != null)
            {
                Dictionary<string, Priviliges> priv = Session["Privileges"] as Dictionary<string, Priviliges>;
                Priviliges p = priv["Reports"];

                if (p.AllowAccess == 0)
                {
                    Response.Redirect("~/Default.aspx");
                }
            }

            Session["ReportName"] = Request.QueryString["NameID"].ToString();
            if (!IsPostBack)
            {
                XtraReport mainRpt = GetReport();
                mainRpt.Parameters[0].Value = DateTime.Now.AddDays(-30);
                mainRpt.Parameters[1].Value = DateTime.Now;
                mainRpt.Parameters[2].Value = Convert.ToInt64(Session["WorkingEmployerID"]);
                mainRpt.Parameters[2].Visible = false;

                mainRpt.CreateDocument();
                rptDocViewer.Report = mainRpt;
                rptDocViewer.ReportTypeName = mainRpt.ToString();
                rptDocViewer.DataBind();
            }
        }


        protected void mainToolbar_CommandExecuted(object source, DevExpress.Web.RibbonCommandExecutedEventArgs e)
        {
            switch (e.Item.Name)
            {
                case "btnBack":
                    {
                        Response.Redirect("~/");
                        break;
                    }
            }
        }
    }
}