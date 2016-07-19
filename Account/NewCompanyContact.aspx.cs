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

    public partial class NewCompanyContact : System.Web.UI.Page
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
                try
                {
                    Dictionary<string, Priviliges> priv = Session["Privileges"] as Dictionary<string, Priviliges>;
                    Priviliges p = priv["User Account Management"];

                    if (p.AllowAccess == 0 || p.AllowAddorEdit == 0)
                    {
                        Response.Redirect("~/UserManagement.aspx");
                    }
                }
                catch (KeyNotFoundException)
                {
                    Response.Redirect("~/UserManagement.aspx");
                }
                catch (Exception ex)
                {
                    ExceptionUtility.LogException(ex, "New Company Contact - Page_Load");
                    Response.Redirect("~/UserManagement.aspx");
                }
            }

            // Load Data
            try
            {
                dsJobCategory.DataBind();
            }
            catch (Exception ex)
            {
                ExceptionUtility.LogException(ex, "New Company Contact - Page_Load");

                HttpContext.Current.Response.Redirect("~/ErrorPage.aspx");
            } 
        }

        protected void Save()
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["OHSN"].ConnectionString))
                {
                    conn.Open();

                    using (SqlCommand cmd = new SqlCommand("ohsn_Web_EmployerContact_Insert", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@ParentID", Convert.ToInt64(Session["WorkingEmployerID"]));
                        cmd.Parameters.AddWithValue("@LastName", txtbxFirstName.Text);
                        cmd.Parameters.AddWithValue("@FirstName", txtbxLastName.Text);
                        cmd.Parameters.AddWithValue("@JobTitle", txtbxJobTitle.Text);
                        cmd.Parameters.AddWithValue("@JobTitleClassificationTID ", cbxJobCategory.Value);
                        cmd.Parameters.AddWithValue("@email", txtbxEmail.Text);
                        cmd.Parameters.AddWithValue("@Phone", txtbxWorkPhone.Text);
                        cmd.Parameters.AddWithValue("@Ext", txtbxExt.Text);
                        cmd.Parameters.AddWithValue("@Fax", txtbxFax.Text);
                        cmd.Parameters.AddWithValue("@Cell", txtbxCell.Text);
                        cmd.Parameters.AddWithValue("@UserID", Convert.ToInt64(Session["ContactID"]));
                        //
                        SqlParameter parmContactID = new SqlParameter("@ContactID", SqlDbType.BigInt);
                        parmContactID.Direction = ParameterDirection.Output;
                        cmd.Parameters.Add(parmContactID);

                        var result = (int)cmd.ExecuteNonQuery();

                        Session["WorkingContactID"] = parmContactID.Value;
                    }

                    conn.Close();
                }            
            }
            catch (Exception ex)
            {
                ExceptionUtility.LogException(ex, "New Company Contact - Save");

                ExceptionUtility.NotifySupport(ex);

                HttpContext.Current.Response.Redirect("~/ErrorPage.aspx");
            } 
        }

        protected void mainToolbar_CommandExecuted(object source, DevExpress.Web.RibbonCommandExecutedEventArgs e)
        {
            switch (e.Item.Name)
            {
                case "btnBack":
                    {
                        Response.Redirect("~/Account/AddUser.aspx");
                        break;
                    }

                case "btnSubmit":
                    {
                        Save();
                        Response.Redirect("~/Account/AddUser.aspx?AddContact=True");
                        break;
                    }

                case "btnCancel":
                    {
                        Response.Redirect("~/Account/UserManagement.aspx");
                        break;
                    }
            }
        }

    }
}