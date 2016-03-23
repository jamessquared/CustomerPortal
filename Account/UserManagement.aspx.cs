namespace CustomerPortal.Account
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Web;
    using System.Web.UI;
    using System.Web.UI.WebControls;
    using System.Data;
    using DevExpress.Web;
    using System.Data;
    using System.Data.Sql;
    using System.Data.SqlClient;
    using System.Configuration;

    public partial class UserManagement : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ContactID"] == null)
            {
                Response.Redirect("~/Default.aspx");
            }

            dsUserManagementUsers.DataBind();
            gvUserPrivileges.DataBind();
        }

        protected void gvAccountManagementUsers_SelectionChanged(object sender, EventArgs e)
        {
            dsUserManagementUsers.DataBind();

            List<object> fieldValues = gvAccountManagementUsers.GetSelectedFieldValues(new string[] { "ContactID", "LastName" });
            foreach (object[] item in fieldValues)
            {
                Session["WorkingContactID"] = item[0].ToString();
            }

            dsAccountManagementUserPrivileges.DataBind();
            gvUserPrivileges.DataBind();

            mainToolbar.Tabs[0].Groups[1].Visible = true;
            mainToolbar.Tabs[0].Groups[2].Visible = true;
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
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["OHSN"].ConnectionString))
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand("OHSN_Web_ResetUserPrivileges", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@ContactID", Session["WorkingContactID"]);
                    var result = (int)cmd.ExecuteNonQuery();
                }
                conn.Close();
            }

            pupctlDeleteUser.ShowOnPageLoad = false;
            dsUserManagementUsers.DataBind();
        }

        protected void btnDeleteUserNo_Click(object sender, EventArgs e)
        {
            pupctlDeleteUser.ShowOnPageLoad = false;
        }
        
        #endregion

        #region Reset User Password

        protected void btnResetPasswordOk_Click(object sender, EventArgs e)
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
                             
        protected void btnResetPasswordCancel_Click(object sender, EventArgs e)
        {
            pupctrlResetPassword.ShowOnPageLoad = false;
        }

        #endregion

        #region Deactivate user

        protected void btnDeactivateUserYes_Click(object sender, EventArgs e)
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
            dsUserManagementUsers.DataBind();
        }

        protected void btnDeactivateUserNo_Click(object sender, EventArgs e)
        {
            pupctrlDeactivateUser.ShowOnPageLoad = false;
        }

        #endregion

    }
}