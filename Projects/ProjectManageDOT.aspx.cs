namespace CustomerPortal.Projects
{
    using CustomerPortal.Classes;
    using CustomerPortal.Utility;
    using System;
    using System.Collections.Generic;
    using System.Web;

    public partial class ProjectManageDOT : System.Web.UI.Page
    {
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
                Priviliges p = priv["Find Project"];

                if (p.AllowAccess == 0)
                {
                    Response.Redirect("~/Default.aspx");
                }
            }

            if (IsPostBack == false)
            {
                dedFrom.Date = DateTime.Now.AddDays(-30);
                dedTo.Date = DateTime.Now.Date;
                Session["FromDate"] = DateTime.Now.AddDays(-30);
                Session["ToDate"] = DateTime.Now.Date;
                dsFindProjects.DataBind();
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

                case "btnFind":
                    {
                        if (Session["WorkingEmployerID"] != null)
                        {                           
                            try
                            {
                                Session["FromDate"] = dedFrom.Date;
                                Session["ToDate"] = dedTo.Date;

                                dsFindProjects.DataBind();
                            }
                            catch (Exception ex)
                            {
                                ExceptionUtility.LogException(ex, "Find Project - mainToolbar_CommandExecuted");

                                HttpContext.Current.Response.Redirect("~/ErrorPage.aspx");
                            } 
                        }

                        break;
                    }
            }
        }
    }
}