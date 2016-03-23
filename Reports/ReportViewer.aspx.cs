using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.XtraPrinting;
using DevExpress.XtraReports.UI;

namespace CustomerPortal.Reports
{
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
            if (Session["EmployerID"] == null)
            {
                Response.Redirect("~/Account/Login.aspx");
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
                DocumentViewer.Report = mainRpt;
                DocumentViewer.ReportTypeName = mainRpt.ToString();
                DocumentViewer.DataBind();
            }
        }

        protected void mainToolbar_CommandExecuted(object source, DevExpress.Web.RibbonCommandExecutedEventArgs e)
        {
            switch (e.Item.Name)
            {
                case "btnBack":
                    {
                        Response.Redirect("~/Default.aspx");
                        break;
                    }
            }
        }
    }
}