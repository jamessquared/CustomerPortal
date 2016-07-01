using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CustomerPortal.Classes;
using CustomerPortal.Utility;

namespace CustomerPortal.Projects
{
    public partial class ProjectDOTResults : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
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

                if (Request.QueryString.HasKeys())
                {
                    Session["ProjectID"] = Request.QueryString["ProjectID"];
                    Session["SourcePage"] = Request.QueryString["SourcePage"];

                }
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