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
    using System.Web.UI;
    using System.Web.UI.WebControls;
    using System.Net.Mail;
    using System.Text;

    public partial class AddUser : System.Web.UI.Page
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
                        Response.Redirect("~/Account/UserManagement.aspx");
                    }
                }
                catch (KeyNotFoundException)
                {
                    Response.Redirect("~/Account/UserManagement.aspx");
                }
                catch (Exception ex)
                {
                    ExceptionUtility.LogException(ex, "Add User - Page_Load");
                    Response.Redirect("~/Account/UserManagement.aspx");
                }
            }

            // Load Data
            try
            {
                dsCompanyContacts.DataBind();
                dsJobCategory.DataBind();
                dsProtocols.DataBind();
                dsUserLevel.DataBind();
                dsDeliveryMethod.DataBind();
            }
            catch (Exception ex)
            {
                ExceptionUtility.LogException(ex, "Add User - Page Load");

                HttpContext.Current.Response.Redirect("~/ErrorPage.aspx");
            }

            // Read passed in values
            if (Request.QueryString.HasKeys())
            {
                for (int i = 0; i < cbxCompanyContacts.Items.Count; i++)
                {
                    if (Convert.ToInt32(cbxCompanyContacts.Items[i].Value) == Convert.ToInt32(Session["WorkingContactID"]))
                    {
                        cbxCompanyContacts.SelectedIndex = i;
                    }
                }

                Load();
            }    
        }

        protected void Save()
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["OHSN"].ConnectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("OHSN_Web_AddNewWebUser", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@EmployerID", Convert.ToInt64(Session["WorkingEmployerID"]));
                        cmd.Parameters.AddWithValue("@ContactID", Convert.ToInt64(Session["WorkingContactID"]));
                        cmd.Parameters.AddWithValue("@UserLevelTID", cbxUserLevel.SelectedItem.Value);
                        cmd.Parameters.AddWithValue("@UserCategory", cbxUserLevel.SelectedItem.Text);
                        cmd.Parameters.AddWithValue("@UserName", txtBxUserName.Text);
                        cmd.Parameters.AddWithValue("@UserPassword", txtBxUserPassword.Text);
                        cmd.Parameters.AddWithValue("@UserID", Convert.ToInt64(Session["ContactID"]));

                        var result = (int)cmd.ExecuteNonQuery();
                    }

                    conn.Close();
                }
            }
            catch (Exception ex)
            {
                ExceptionUtility.LogException(ex, "Add User - Save");

                ExceptionUtility.NotifySupport(ex);

                HttpContext.Current.Response.Redirect("~/ErrorPage.aspx");
            }
        }

        protected bool IsUserNameAvailable()
        {
            bool result = false;

            try
            {
                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["OHSN"].ConnectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("OHSN_Web_CheckUserNameExists", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        cmd.Parameters.AddWithValue("@UserName", txtBxUserName.Text);

                        result = ((int) cmd.ExecuteScalar()) == 0;
                    }

                    conn.Close();
                }
            }
            catch (Exception ex)
            {
                ExceptionUtility.LogException(ex, "Add User - Save");

                ExceptionUtility.NotifySupport(ex);

                HttpContext.Current.Response.Redirect("~/ErrorPage.aspx");
            }

            return result;
        }

        protected bool IsValid()
        {
            bool result = true;

            if (cbxCompanyContacts.SelectedItem == null)
            {
                cbxCompanyContacts.Validate();
                result = false;
            }

            if (cbxUserLevel.SelectedItem == null)
            {
                cbxUserLevel.Validate();
                result = false;
            }

            if (string.IsNullOrEmpty(txtBxUserName.Text))
            {
                txtBxUserName.Validate();
                result = false;
            }

            if (string.IsNullOrEmpty(txtBxUserPassword.Text))
            {
                txtBxUserPassword.Validate();
                txtBxUserPassword.ErrorText = "Must have a password!";
                result = false;
            }


            return result;
        }

        protected void SendEmail()
        {
            if (string.IsNullOrEmpty(txtbxEmail.Text) == false)
            {
                StringBuilder sb = new StringBuilder();
                sb.Append(string.Format("Greetings {0} {1}", txtbxFirstName.Text, txtbxLastName.Text));
                sb.Append(Environment.NewLine);
                sb.Append(Environment.NewLine);
                sb.Append("You have been added as a new user to the OHS National Customer Portal.");
                sb.Append(string.Format("  Your user name is {0} and your temporary password is {1}.", txtBxUserName.Text, txtBxUserPassword.Text));
                sb.Append("  To access your account, please go to ");
                sb.Append(@"www.ohsnational.com/customerportal/");
                sb.Append("  When you log in the first time, you will be notified that your password has expired and we need to be changed.  Please follow the directions on the screen and create a new password.  If you have questions or experience any problems, please contact us at (888) 559-6310.");
                sb.Append(Environment.NewLine);
                sb.Append(Environment.NewLine);
                sb.Append("Thank you");
                sb.Append(Environment.NewLine);
                sb.Append("OHS National Support");

                emailUtility email = new emailUtility(txtbxEmail.Text, "New User", sb);
                email.Send();
            }
        }

        protected void SendEmailToOHSNational()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(string.Format("{0} {1} from {2} has added {3} to the Web Users..    Please review and verify that it has the OHS National services.", Session["FirstName"], Session["LastName"], Session["WorkingEmployerName"], txtBxUserName.Text));
            string subject = string.Format("{0} {1} from {2} has added {3} to the Web Users.", Session["FirstName"], Session["LastName"], Session["WorkingEmployerName"], txtBxUserName.Text);
            emailUtility email = new emailUtility(ConfigurationManager.AppSettings["NotificationReplyEmailDestination"], subject, sb);
            email.Send();
        }

        protected void Load()
        {
            try
            {
                DataView dvContactInfo = (DataView)dsContactInfo.Select(DataSourceSelectArguments.Empty);

                if (dvContactInfo != null && dvContactInfo.Count > 0)
                {
                    txtbxFirstName.Text = dvContactInfo[0]["FirstName"].ToString();
                    txtbxLastName.Text = dvContactInfo[0]["LastName"].ToString();

                    txtbxWorkPhone.Text = dvContactInfo[0]["Phone"].ToString();
                    txtbxExt.Text = dvContactInfo[0]["Extension"].ToString();
                    txtbxFax.Text = dvContactInfo[0]["Fax"].ToString();
                    txtbxCell.Text = dvContactInfo[0]["Cell"].ToString();
                    txtbxEmail.Text = dvContactInfo[0]["emaIL"].ToString();
                    // cbx Job Category
                    txtbxJobTitle.Text = dvContactInfo[0]["JobTitle"].ToString();
                    chkActive.Value = true;
                    
                    cbxJobCategory.DataBind();
                    if (string.IsNullOrEmpty(dvContactInfo[0]["JobCategory"].ToString()) == false)
                    {
                        for (int i = 0; i < cbxJobCategory.Items.Count; i++)
                        {
                            if (Convert.ToInt32(cbxJobCategory.Items[i].Value) == Convert.ToInt32(dvContactInfo[0]["JobCategory"]))
                            {
                                cbxJobCategory.SelectedIndex = i;
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                ExceptionUtility.LogException(ex, "Add User - Load");

                HttpContext.Current.Response.Redirect("~/ErrorPage.aspx");
            }
        }

        protected void cbxCompanyContacts_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                Session["WorkingContactID"] = Convert.ToInt32(cbxCompanyContacts.Value);
                Load();
            }
            catch (Exception ex)
            {
                ExceptionUtility.LogException(ex, "Add User - cbxCompanyContacts_SelectedIndexChanged");

                HttpContext.Current.Response.Redirect("~/ErrorPage.aspx");
            } 
            
            Load();
        }

        protected void mainToolbar_CommandExecuted(object source, DevExpress.Web.RibbonCommandExecutedEventArgs e)
        {
            switch (e.Item.Name)
            {
                case "btnBack":
                    {
                        Response.Redirect("~/Account/UserManagement.aspx");
                        break;
                    }

                case "btnSubmit":
                    {
                        if (IsUserNameAvailable() == true && IsValid() == true)
                        {
                            Save();
                            SendEmail();
                            SendEmailToOHSNational();
                            Response.Redirect("~/Account/UserManagement.aspx");
                        }
                        else
                        {
                            txtBxUserName.Validate();
                        }
                        break;
                    }

                case "btnCancel":
                    {
                        Response.Redirect("~/Account/UserManagement.aspx");
                        break;
                    }

                case "btnNewUser":
                    {
                        Response.Redirect("~/Account/NewCompanyContact.aspx");
                        break;
                    }
            }
        }

        protected void dsProtocols_Updating(object sender, SqlDataSourceCommandEventArgs e)
        {
            try
            {
                e.Command.Parameters["@ContactID"].Value = Session["WorkingContactID"].ToString();
            }
            catch (Exception ex)
            {
                ExceptionUtility.LogException(ex, "Add User - dsProtocols_Updating");

                HttpContext.Current.Response.Redirect("~/ErrorPage.aspx");
            }
        }

        protected void txtBxUserName_Validation(object sender, DevExpress.Web.ValidationEventArgs e)
        {
            if (string.IsNullOrEmpty((string)e.Value) == true)
            {
                e.IsValid = false;
                e.ErrorText = "User name cannot be empty.";
            }

            if (IsUserNameAvailable() == false)
            {
                e.IsValid = false;
                e.ErrorText = "User name already exists.";
            }
        }

        protected void cbxUserLevel_Validation(object sender, DevExpress.Web.ValidationEventArgs e)
        {
            if (e.Value == null)
            {
                e.IsValid = false;
                e.ErrorText = "A User level must be selected.";
            }
        }

        protected void txtBxUserPassword_Validation(object sender, DevExpress.Web.ValidationEventArgs e)
        {
            if (string.IsNullOrEmpty((string)e.Value) == true)
            {
                e.IsValid = false;
                e.ErrorText = "Password cannot be empty.";
            }
        }

        protected void cbxCompanyContacts_Validation(object sender, DevExpress.Web.ValidationEventArgs e)
        {
            if (e.Value == null)
            {
                e.IsValid = false;
                e.ErrorText = "A Contact must be selected.";
            }
        }

    }
}