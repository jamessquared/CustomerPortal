namespace CustomerPortal.Account
{
    using CustomerPortal.Classes;
    using CustomerPortal.Utility;
    using System;
    using System.Collections.Generic;
    using System.Configuration;
    using System.Data;
    using System.Data.SqlClient;
    using System.Web;

    public partial class ProtocolManagement : System.Web.UI.Page
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

            Refresh();
        }

        protected void Refresh()
        {
            // Load Data
            try
            {
                dsProtocolManagement.DataBind();
            }
            catch (Exception ex)
            {
                ExceptionUtility.LogException(ex, "User Management - Page_Load");

                HttpContext.Current.Response.Redirect("~/ErrorPage.aspx");
            } 
        }

        protected void gvProtocolsManagement_SelectionChanged(object sender, EventArgs e)
        {
            try
            {
                mainToolbar.Tabs[0].Groups[1].Items[0].Visible = true;
                mainToolbar.Tabs[0].Groups[1].Items[1].Visible = gvAccountManagementProtocols.Selection.Count >= 1;
                mainToolbar.Tabs[0].Groups[1].Items[2].Visible = gvAccountManagementProtocols.Selection.Count >= 1;
            }
            catch (Exception ex)
            {
                ExceptionUtility.LogException(ex, "Protocols Managment - gvProtocolsManagement_SelectionChanged");

                HttpContext.Current.Response.Redirect("~/ErrorPage.aspx");
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
                        Response.Redirect("~/Account/AddProtocols.aspx");
                        break;
                    }

                case "btnEdit":
                    {
                        List<object> id = gvAccountManagementProtocols.GetSelectedFieldValues(new string[] { "ID" });
                        if (id != null && id.Count > 0)
                        {
                            Session["WorkingProtocolID"] = id[0].ToString();
                            Response.Redirect("~/Account/EditProtocols.aspx");
                        }

                        id = null;
                        break;
                    }

                case "btnDeactivate":
                    {
                        List<object> id = gvAccountManagementProtocols.GetSelectedFieldValues(new string[] { "ID" });
                        if (id != null && id.Count > 0)
                        {
                            Session["WorkingProtocolID"] = id[0].ToString();
                            DeactivateProtocol(); 
                        }

                        id = null;
                        break;
                    }
            }
        }

        protected void DeactivateProtocol()
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["OHSN"].ConnectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("OHSN_Web_AddUser_DeactivateEmployerProtocol", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@ProtocolID", Convert.ToInt64(Session["WorkingProtocolID"]));

                        var result = (int)cmd.ExecuteNonQuery();

                    }

                    conn.Close();
                }
            }
            catch (Exception ex)
            {
                ExceptionUtility.LogException(ex, "Protocol Management - Deactivate Protocol");

                ExceptionUtility.NotifySupport(ex);

                HttpContext.Current.Response.Redirect("~/ErrorPage.aspx");
            }
        }
    }
}