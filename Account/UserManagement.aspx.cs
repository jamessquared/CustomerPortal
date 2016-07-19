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

    public partial class UserManagement : System.Web.UI.Page
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

                    if (p.AllowAccess == 0)
                    {
                        Response.Redirect("~/Default.aspx");
                    }
                }
                catch (KeyNotFoundException)
                {
                    Response.Redirect("~/Default.aspx");
                }
                catch (Exception ex)
                {
                    ExceptionUtility.LogException(ex, "User Management - Page_Load");
                    Response.Redirect("~/Default.aspx");
                }
            }

            Refresh();
        }

        protected void Refresh()
        {
            // Load Data
            try
            {
                dsUserManagementUsers.DataBind();
                dsPrivileges.DataBind();
                gvAccountManagementUsers.DataBind();
                gvPrivileges.DataBind();
            }
            catch (Exception ex)
            {
                ExceptionUtility.LogException(ex, "User Management - Page_Load");

                HttpContext.Current.Response.Redirect("~/ErrorPage.aspx");
            } 
        }

        protected void gvAccountManagementUsers_SelectionChanged(object sender, EventArgs e)
        {
            try
            {
                dsUserManagementUsers.DataBind();

                List<object> fieldValues = gvAccountManagementUsers.GetSelectedFieldValues(new string[] { "ContactID", "LastName" });
                foreach (object[] item in fieldValues)
                {
                    Session["WorkingContactID"] = item[0].ToString();
                }

                Refresh();

                mainToolbar.Tabs[0].Groups[1].Items[1].Visible = true;
                mainToolbar.Tabs[0].Groups[1].Items[2].Visible = true;
                mainToolbar.Tabs[0].Groups[2].Visible = true;
            }
            catch (Exception ex)
            {
                ExceptionUtility.LogException(ex, "User Managment - gvAccountManagementUsers_SelectionChanged");

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
                        Response.Redirect("~/Account/AddUser.aspx");
                        break;
                    }

                case "btnEdit":
                    {
                        Response.Redirect("~/Account/EditUser.aspx");
                        break;
                    }

                case "btnDelete":
                    {
                        pupctlDeleteUser.ShowOnPageLoad = true;
                        break;
                    }

                case "btnResetPassword":
                    {
                        pupctrlResetPassword.ShowOnPageLoad = true;
                        break;
                    }

                case "btnDeactivate":
                    {
                        pupctrlDeactivateUser.ShowOnPageLoad = true;
                        break;
                    }
            }
        }

        #region Delete User

        protected void btnDeleteUserYes_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["OHSN"].ConnectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("OHSN_Web_WebUserDelete_Update", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@ContactID", Session["WorkingContactID"]);
                        var result = (int)cmd.ExecuteNonQuery();
                    }
                    conn.Close();
                }

                pupctlDeleteUser.ShowOnPageLoad = false;
                Refresh();
            }
            catch (Exception ex)
            {
                ExceptionUtility.LogException(ex, "User Management - btnDeleteUserYes_Click");

                ExceptionUtility.NotifySupport(ex);

                HttpContext.Current.Response.Redirect("~/ErrorPage.aspx");
            } 
        }

        protected void btnDeleteUserNo_Click(object sender, EventArgs e)
        {
            pupctlDeleteUser.ShowOnPageLoad = false;
        }
        
        #endregion

        #region Reset User Password

        protected void btnResetPasswordOk_Click(object sender, EventArgs e)
        {
            try
            {
                if (string.IsNullOrEmpty(txtbxResetUserPassword.Text) == false)
                {
                    using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["OHSN"].ConnectionString))
                    {
                        conn.Open();
                        using (SqlCommand cmd = new SqlCommand("OHSN_Web_ResetUserPassword", conn))
                        {
                            cmd.CommandType = CommandType.StoredProcedure;
                            cmd.Parameters.AddWithValue("@ContactID", Session["WorkingContactID"]);
                            cmd.Parameters.AddWithValue("@temppassword", txtbxResetUserPassword.Text);
                            var result = (int)cmd.ExecuteNonQuery();
                        }
                        conn.Close();
                    }

                    pupctrlResetPassword.ShowOnPageLoad = false;
                }
            }
            catch (Exception ex)
            {
                ExceptionUtility.LogException(ex, "User Management - btnResetPasswordOk_Click");

                ExceptionUtility.NotifySupport(ex);

                HttpContext.Current.Response.Redirect("~/ErrorPage.aspx");
            } 
        }
                             
        protected void btnResetPasswordCancel_Click(object sender, EventArgs e)
        {
            pupctrlResetPassword.ShowOnPageLoad = false;
        }

        #endregion

        #region Deactivate user

        protected void btnDeactivateUserYes_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["OHSN"].ConnectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("[OHSN_Web_DeactivateUser]", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@ContactID", Session["WorkingContactID"]);
                        var result = (int)cmd.ExecuteNonQuery();
                    }
                    conn.Close();
                }

                pupctrlDeactivateUser.ShowOnPageLoad = false;
                Refresh();
            }
            catch (Exception ex)
            {
                ExceptionUtility.LogException(ex, "User Management - btnDeactivateUserYes_Click");

                ExceptionUtility.NotifySupport(ex);

                HttpContext.Current.Response.Redirect("~/ErrorPage.aspx");
            } 
        }

        protected void btnDeactivateUserNo_Click(object sender, EventArgs e)
        {
            pupctrlDeactivateUser.ShowOnPageLoad = false;
        }

        #endregion

    }
}