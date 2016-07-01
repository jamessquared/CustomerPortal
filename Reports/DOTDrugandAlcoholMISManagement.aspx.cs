namespace CustomerPortal.Reports
{
    using CustomerPortal.Classes;
    using System;
    using System.Collections.Generic;
    using System.Data;

    public partial class DOTDrugandAlcoholMISManagement : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Session["WorkingEmployerID"] = 22232;
            //Session["ContactID"] = 92629;
            //Session["FirstName"] = "Matt";
            //Session["LastName"] = "Hess";
            //Session["UserCompany"] = "OHS National, LLC";
            //Session["UserAccountType"] = "Master Administrator";
            //Session["DOTReportID"] = 0;     

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
                Priviliges p = priv["D.O.T. Drug & Alcohol MIS Data Collection"];

                if (p.AllowAccess == 0)
                {
                    Response.Redirect("~/Default.aspx");
                }
            }

            dsDOTReportList.DataBind();
            mainToolbar.Tabs[0].Groups[1].Items[1].Visible = (gvDOTDrugandAlcoholMISReport.VisibleRowCount > 0);
        }

        protected void gvDOTDrugandAlcoholMISReport_SelectionChanged(object sender, EventArgs e)
        {
            mainToolbar.Tabs[0].Groups[1].Items[1].Visible = (gvDOTDrugandAlcoholMISReport.VisibleRowCount > 0);
            //mainToolbar.Tabs[0].Groups[1].Items[2].Visible = (gvDOTDrugandAlcoholMISReport.VisibleRowCount > 0);
            List<object> fieldValues = gvDOTDrugandAlcoholMISReport.GetSelectedFieldValues(new string[] { "ReportYear", "ReportFor", "ID" });
            foreach (object[] item in fieldValues)
            {
                Session["DOTReportYear"] = item[0].ToString();
                Session["DOTReportFor"] = item[1].ToString();
                Session["DOTReportID"] = item[2].ToString();
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

                case "btnAdd":
                    {
                        Response.Redirect("~/Reports/AddDOTDrugandAlcoholMIS.aspx");
                        break;
                    }

                case "btnEdit":
                    {
                        Response.Redirect("~/Reports/EditDOTDrugandAlcoholMIS.aspx");
                        break;
                    }

                //case "btnCopy":
                //    {
                //        Response.Redirect("~/Reports/EditDOTDrugandAlcoholMIS.aspx");
                //        break;
                //    }

            }
        }
    }
}