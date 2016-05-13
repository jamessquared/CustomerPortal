namespace CustomerPortal 
{
    using CustomerPortal.Classes;
    using CustomerPortal.Utility;
    using DevExpress.Web;
    using System;
    using System.Collections.Generic;
    using System.Configuration;
    using System.Data;
    using System.Data.SqlClient;
    using System.Web;
    using System.Drawing;
    using System.Web.Services;

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

        #region Page Events

        protected void Page_Load(object sender, EventArgs e)
        {
            pupctrlNotifications.ShowOnPageLoad = Session["UserMessageCount"] != null && (int)Session["UserMessageCount"] > 0;
            CheckSecurityAndConfigureUI();

            if (Session["LastTabIndex"] != null)
            {
                ribMainMenu.ActiveTabIndex = Convert.ToInt16(Session["LastTabIndex"]);
                Session["LastTabIndex"] = null;
            }

            if (IsPostBack == false)
            {
                if (Session["WorkingEmployerID"] != null)
                {
                    if (cbxCompany.SelectedItem == null)
                    {
                        dsUserCompanies.DataBind();
                    }

                    if (cbxCompany.SelectedItem != null)
                    {
                        cbxCompany.SelectedItem.Value = Session["WorkingEmployerID"];
                        SetWorkingCompany();
                    }

                    CustomerPortal.RootMaster siteMasterPage = (CustomerPortal.RootMaster)this.Master;
                    if (siteMasterPage != null)
                    {
                        siteMasterPage.SetLoginLabels();
                    }
                }
            }
        }

        protected void Page_Error(object sender, EventArgs e)
        {
            // Get last error from the server
            Exception exc = Server.GetLastError();

            // Pass the error on to the Generic Error page
            Server.Transfer("ErrorPage.aspx", true);
        }

        #endregion

        private bool UserFound(string userName, string userPassword)
        {
            bool result = false;

            try
            {
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
  
                            Session["EmployerID"] = Convert.ToInt64(rdr["CompanyID"]);
                            Session["ParentCompanyID"] = Convert.ToInt64(rdr["CompanyID"]);
                            Session["WorkingEmployerID"] = Convert.ToInt64(rdr["CompanyID"]);
                            Session["WorkingEmployerName"] = rdr["UserCompany"].ToString();

                            Session["LastPasswordChange"] = Convert.ToDateTime(rdr["LastPasswordChange"]);
                            Session["LastLogin"] = Convert.ToDateTime(rdr["LastLogin"]);
                            Session["UserActive"] = Convert.ToBoolean(rdr["Active"]);
                        }

                        result = rdr.HasRows;

                        if (result)
                        {
                            Session["Privileges"] = Priviliges.Initialize(Convert.ToInt64(Session["ContactID"]));
                        }

                        rdr.Close();
                    }

                    conn.Close();
                }
            }
            catch (Exception ex)
            {
                ExceptionUtility.LogException(ex, "Add User - cbxCompanyContacts_SelectedIndexChanged");

                ExceptionUtility.NotifySupport(ex);

                HttpContext.Current.Response.Redirect("~/ErrorPage.aspx");
            } 

            return result;
        }

        private void UpdateUserLastLoginRecord(string userName, string userPassword)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["OHSN"].ConnectionString))
                {
                    conn.Open();

                    using (SqlCommand cmd = new SqlCommand("OHSN_Web_UserLoginActivity_Upsert", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@UserName", userName);
                        cmd.Parameters.AddWithValue("@UserPassword", userPassword);
                        cmd.Parameters.AddWithValue("@EmployerID", Convert.ToInt64(Session["EmployerID"]));
                        int rows = cmd.ExecuteNonQuery();
                    }

                    conn.Close();
                }
            }
            catch (Exception ex)
            {
                ExceptionUtility.LogException(ex, "Add User - cbxCompanyContacts_SelectedIndexChanged");

                ExceptionUtility.NotifySupport(ex);

                HttpContext.Current.Response.Redirect("~/ErrorPage.aspx");
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
            if ((Session["UserAccountType"].ToString() == "Organization Administrator") || (Session["UserAccountType"].ToString() == "Master Administrator"))
            {
                ShowCompanies = true;
                if (cbxCompany.SelectedItem == null)
                {
                    for (int i = 0; i < cbxCompany.Items.Count; i++)
                    {
                        if (Convert.ToInt64(cbxCompany.Items[i].Value) == Convert.ToInt64(Session["WorkingEmployerID"]))
                        {
                            cbxCompany.SelectedItem = cbxCompany.Items[i];
                        }
                    }
                }
                
                SetWorkingCompany();
            }
            else
            {
                ShowCompanies = false;
            }

            if (Session["ContactID"] != null || Session["Privileges"] != null)
            {
                Dictionary<string, Priviliges> priv = Session["Privileges"] as Dictionary<string, Priviliges>;
                Priviliges p;

                // New Project
                if (priv.TryGetValue("New Project", out p))
                {
                    ribMainMenu.Tabs[1].Groups[0].Visible = (p.AllowAccess == 1);    
                }
                else
                {
                    ribMainMenu.Tabs[1].Groups[0].Visible = false;
                }
                
                // Find Project
                if (priv.TryGetValue("Find Project", out p))
                {
                    ribMainMenu.Tabs[1].Groups[1].Visible = (p.AllowAccess == 1);
                }
                else
                {
                    ribMainMenu.Tabs[1].Groups[1].Visible = false;
                }

                if (ribMainMenu.Tabs[1].Groups[0].Visible == false && ribMainMenu.Tabs[1].Groups[1].Visible == false)
                {
                    ribMainMenu.Tabs[1].Visible = false;
                }

                // Reports
                if (priv.TryGetValue("Reports", out p))
                {
                    ribMainMenu.Tabs[2].Visible = (p.AllowAccess == 1);
                }
                else
                {
                    ribMainMenu.Tabs[2].Visible = false;
                }
                

                // Account Management 
                if (priv.TryGetValue("User Account Management", out p))
                {
                    ribMainMenu.Tabs[3].Groups[0].Visible = (p.AllowAccess == 1);
                }
                else
                {
                    ribMainMenu.Tabs[3].Groups[0].Visible = false;
                }
                
                if (ribMainMenu.Tabs[3].Groups[0].Visible == false)
                {
                    ribMainMenu.Tabs[3].Visible = false;
                }
            }
        }

         private void SetWorkingCompany()
        {
            if (Session["WorkingEmployerID"] == null)
            {
                return;
            }

            try
            {
                CustomerPortal._Default d = (CustomerPortal._Default)this.Page;
                d.Refresh();
                dsUserNotifications.DataBind();
            }
            catch (Exception ex)
            {
                Utility.ExceptionUtility.LogException(ex, "Main.Master");
            }
        }

        protected void cbxCompany_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cbxCompany.SelectedItem.Value != null)
            {
                Session["WorkingEmployerID"] = cbxCompany.SelectedItem.Value;
                Session["WorkingEmployerName"] = cbxCompany.SelectedItem.Text;
                SetWorkingCompany();

                CustomerPortal.RootMaster siteMasterPage = (CustomerPortal.RootMaster)this.Master;
                if (siteMasterPage != null)
                {
                    siteMasterPage.UserName = string.Format("{0} {1}", Session["FirstName"].ToString(), Session["LastName"].ToString());
                    siteMasterPage.Company = Session["UserCompany"].ToString();
                    siteMasterPage.AccountType = Session["UserAccountType"].ToString();
                    siteMasterPage.LastLoginDate = Convert.ToDateTime(Session["LastLogin"]);
                    siteMasterPage.ChangePassword = true;
                }
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (UserFound(txtUserName.Text, txtUserPassword.Text) )
            {
                CheckSecurityAndConfigureUI();

                if (Convert.ToBoolean(Session["UserActive"]) == false)
                {
                    pupctlAccountInactive.ShowOnPageLoad = true;
                    return;
                }

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

        protected void ribMainMenu_CommandExecuted(object source, RibbonCommandExecutedEventArgs e)
        {
            Session["LastTabIndex"] = (short)e.Item.Ribbon.ActiveTabIndex;
            switch (e.Item.Name)
            {
                case "btnLogOut":
                    {
                        pupctrlLogOut.ShowOnPageLoad = true;
                        break;
                    }

                case "btnNewProject":
                    {
                        Response.Redirect("~/Projects/NewProject.aspx");
                        break;
                    }

                case "btnFind":
                    {
                        Response.Redirect("~/Projects/FindProject.aspx");
                        break;
                    }

                case "btnActiveProjects":
                    {
                        Response.Redirect("~/Reports/ReportViewer.aspx?NameID=Active Projects");
                        break;
                    }

                case "btnCompletedProjects":
                    {
                        Response.Redirect("~/Reports/ReportViewer.aspx?NameID=Completed Projects");
                        break;
                    }

                case "btnResultsAnalysis":
                    {
                        Response.Redirect("~/Reports/ReportViewer.aspx?NameID=Results Analysis");
                        break;
                    }

                case "btnLifeCycle":
                    {
                        Response.Redirect("~/Reports/ReportViewer.aspx?NameID=Project Life Cycle Summary");
                        break;
                    }

                case "btnFurtherEvaluation":
                    {
                        Response.Redirect("~/Reports/ReportViewer.aspx?NameID=Further Evaluation");
                        break;
                    }

                case "btnProtocols":
                    {
                        Response.Redirect("~/Reports/ReportViewer.aspx?NameID=Protocol Summary");
                        break;
                    }

                case "btnCancelledProjects":
                    {
                        Response.Redirect("~/Reports/ReportViewer.aspx?NameID=Cancelled Project Summary");
                        break;
                    }

                case "btnUserAccountManagement":
                    {
                        Response.Redirect("~/Account/UserManagement.aspx");
                        break;
                    }

                case "btnProtocolManagement":
                    {
                        Response.Redirect("~/Account/ProtocolManagement.aspx");
                        break;
                    }	                   
            }
        }

        #region Pop-up Buttons

        protected void btnNotificationsPopupOk_Click(object sender, EventArgs e)
        {
            pupctrlNotifications.ShowOnPageLoad = false;
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

        protected void btnGoToChangePassword_Click(object sender, EventArgs e)
        {
            pupctlPasswordExpired.ShowOnPageLoad = false;
            Response.Redirect("~/Account/ChangePassword.aspx");
        }

        protected void btnAccountInactiveOk_Click(object sender, EventArgs e)
        {
            pupctlPasswordExpired.ShowOnPageLoad = false;
            Session.RemoveAll();
            Response.Redirect("~/Default.aspx");
        }
        #endregion

        #region Support

        private RibbonEditItemBase GetRibbonItembyName(string name)
        {
            foreach (RibbonTab tab in ribMainMenu.Tabs)
                foreach (RibbonGroup group in tab.Groups)
                    foreach (RibbonItemBase item in group.Items)
                    {
                        var edit = item as RibbonEditItemBase;

                        if (edit != null && edit.Name == name)
                            return edit;
                    }

            return null; //not found, return null
        }

        #endregion

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