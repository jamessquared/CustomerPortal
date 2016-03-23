namespace CustomerPortal 
{
    using System;
    using System.Configuration;
    using System.Data;
    using System.Data.SqlClient;
    using DevExpress.Web;

    public partial class MainMaster : System.Web.UI.MasterPage
    {
        #region Properties

            public bool ShowCompanies
            {
                set
                {
                    dsUserCompanies.DataBind();
                    cbxCompany.DataBind();
                    cbxCompany.Visible = value;
                }
            }

            public bool ShowLoginPopUp
            {
                set
                {
                    pupctrlUserLogin.ShowOnPageLoad = value;
                }
            }

            public bool ShowNotificationPopUp
            {
                set
                {
                    dsUserNotifications.DataBind();
                    pupctrlNotifications.ShowOnPageLoad = Convert.ToInt32(Session["UserMessageCount"].ToString()) > 0;
                }
            }

            public bool ShowLogoutPopUp
            {
                set
                {
                    pupctrlLogOut.ShowOnPageLoad = value;
                }
            }
        #endregion

        private bool UserFound(string userName, string userPassword)
            {
                bool result = false;
                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["OHSN"].ConnectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("OHSN_WEB_GetUserLoginInfo", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@UserName", userName);
                        cmd.Parameters.AddWithValue("@UserPassword", userPassword);
                        SqlDataReader rdr = cmd.ExecuteReader();
                        while (rdr.Read())
                        {
                            Session["UserName"] = rdr["UserName"].ToString();
                            Session["UserAccountType"] = rdr["UserAccountType"].ToString();
                            Session["ContactID"] = rdr["UserID"].ToString();
                            Session["LastName"] = rdr["LastName"].ToString();
                            Session["FirstName"] = rdr["FirstName"].ToString();
                            Session["UserCompany"] = rdr["UserCompany"].ToString();
                            Session["EmployerID"] = Convert.ToInt64(rdr["CompanyID"].ToString());
                            Session["LastPasswordChange"] = Convert.ToDateTime(rdr["LastPasswordChange"].ToString());
                            Session["LastLogin"] = Convert.ToDateTime(rdr["LastLogin"]);
                            Session["ParentCompanyID"] = Convert.ToInt64(rdr["CompanyID"].ToString());
                            Session["EmployerID"] = Convert.ToInt64(rdr["CompanyID"].ToString());
                            Session["WorkingEmployerID"] = Convert.ToInt64(rdr["CompanyID"].ToString());
                        }
                        result = rdr.HasRows;
                    }
                    conn.Close();
                }

                return result;
            }

        private void UpdateUserLastLoginRecord(string userName, string userPassword)
            {
                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["OHSN"].ConnectionString))
                {
                    conn.Open();

                    using (SqlCommand cmd = new SqlCommand("OHSN_Web_UserLoginActivity_Upsert", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@UserName", userName);
                        cmd.Parameters.AddWithValue("@UserPassword", userPassword);
                        int rows = cmd.ExecuteNonQuery();
                    }

                    conn.Close();
                }
            }

        private void CheckSecurityAndConfigureUI()
        {
            // Check to see if the Logged in User's Access has been set
            if (Session["UserAccountType"] == null)
            {
                return;
            }

            // Show Locations
            if (Session["UserAccountType"].ToString() == "Organization Administrator")
            {
                ShowCompanies = true;

                for (int i = 0; i < cbxCompany.Items.Count; i++)
                {
                    if (Convert.ToInt32(cbxCompany.Items[i].Value) == Convert.ToInt32(Session["EmployerID"]))
                    {
                        cbxCompany.SelectedIndex = i;
                    }
                }
            }
            else
            {
                ShowCompanies = false;
            }

            // Only Administrators & Users can manage 
            if (Session["UserAccountType"] != null && (Session["UserAccountType"].ToString() == "Administrator" || Session["UserAccountType"].ToString() == "Organization Administrator"))
            {
                // MainMenu.Items.FindByName("mnuitmUserManagement").Enabled = true;
            }
            else
            {
                //   MainMenu.Items.FindByName("mnuitmUserManagement").Enabled = false;
            }

        }

        protected void Page_Load(object sender, EventArgs e) 
        {
            pupctrlNotifications.ShowOnPageLoad = Session["UserMessageCount"] != null && (int)Session["UserMessageCount"] > 0;
            CheckSecurityAndConfigureUI();
        }

        protected void cbxCompany_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cbxCompany.SelectedItem.Value != null)
            {
                Session["WorkingEmployerID"] = cbxCompany.SelectedItem.Value;
                CustomerPortal._Default d = (CustomerPortal._Default)this.Page;
                d.Refresh();
                dsUserNotifications.DataBind();
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (UserFound(txtUserName.Text, txtUserPassword.Text))
            {

                UpdateUserLastLoginRecord(txtUserName.Text, txtUserPassword.Text);

                CustomerPortal.RootMaster siteMasterPage = (CustomerPortal.RootMaster)this.Master;
                if (siteMasterPage != null)
                {
                    siteMasterPage.UserName = string.Format("{0} {1}", Session["FirstName"].ToString(), Session["LastName"].ToString());
                    siteMasterPage.Company = Session["UserCompany"].ToString();
                    siteMasterPage.AccountType = Session["UserAccountType"].ToString();
                    siteMasterPage.LastLoginDate = Convert.ToDateTime(Session["LastLogin"]);
                    siteMasterPage.ChangePassword = true;
                }

                CheckSecurityAndConfigureUI();    

                Session["DaysToDisplay"] = Convert.ToInt32(ConfigurationManager.AppSettings["DaysToDisplay"]);
                Session["KPIDaysToDisplay"] = Convert.ToInt32(ConfigurationManager.AppSettings["KPIDaysToDisplay"]);
                ShowLoginPopUp = false;

                if ((DateTime.Now.Date - Convert.ToDateTime(Session["LastPasswordChange"])).TotalDays > Convert.ToInt32(ConfigurationManager.AppSettings["PasswordExpirationDays"]))
                {
                    pupctlPasswordExpired.ShowOnPageLoad = true;
                }
                else
                {
                    dsUserNotifications.DataBind();
                    pupctrlNotifications.ShowOnPageLoad = Session["UserMessageCount"] != null && (int)Session["UserMessageCount"] > 0;
                }
            }
            else
            {
                lblWarningBadUserorPassword.Visible = true;
            }
        }

        protected void btnGoToChangePassword_Click(object sender, EventArgs e)
        {
            pupctlPasswordExpired.ShowOnPageLoad = false;
            Response.Redirect("~/Account/ChangePassword.aspx");
        }

        protected void btnNotificationsPopupOk_Click(object sender, EventArgs e)
        {
             pupctrlNotifications.ShowOnPageLoad = false;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Default.aspx");
        }

        protected void btnYes_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Response.Redirect("~/Default.aspx");
        }

        protected void btnNo_Click(object sender, EventArgs e)
        {
            pupctrlLogOut.ShowOnPageLoad = false;
        }

        protected void ribMainMenu_CommandExecuted(object source, RibbonCommandExecutedEventArgs e)
        {
            switch (e.Item.Name)
            {
                case "btnLogOut":
                    {
                        pupctrlLogOut.ShowOnPageLoad = true;
                        break;
                    }
            }
        }

        #region Data Sources

        protected void dsUserNotifications_DataBinding(object sender, EventArgs e)
        {
            Session["UserMessageCount"] = 0;
            DataView dv = null;

            if (Session["WorkingEmployerID"] != null && Session["UserName"] != null)
            {
                dv = (DataView)dsUserNotifications.Select(System.Web.UI.DataSourceSelectArguments.Empty);
            }

            if (dv != null)
            {
                Session["UserMessageCount"] = dv.Table.Rows.Count;
            }

            pupctrlNotifications.ShowOnPageLoad = Session["UserMessageCount"] != null && (int)Session["UserMessageCount"] > 0;
        }

        #endregion
    }
}