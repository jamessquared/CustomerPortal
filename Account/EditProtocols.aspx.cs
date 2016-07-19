namespace CustomerPortal.Account
{
    using CustomerPortal.Classes;
    using CustomerPortal.Utility;
    using DevExpress.Data.Filtering;
    using DevExpress.Web;
    using System;
    using System.Collections.Generic;
    using System.Configuration;
    using System.Data;
    using System.Data.SqlClient;
    using System.Net.Mail;
    using System.Web;
    using System.Web.UI;
    using System.Text;

    public partial class EditProtocols : System.Web.UI.Page
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
                    Priviliges p = priv["Protocol Management"];

                    if (p.AllowAccess == null || p.AllowAddorEdit == null || p.AllowAccess == 0 || p.AllowAddorEdit == 0)
                    {
                        Response.Redirect("~/Account/ProtocolManagement.aspx");
                    }
                }
                catch (KeyNotFoundException)
                {
                    Response.Redirect("~/Account/ProtocolManagement.aspx");
                }
                catch (Exception ex)
                {
                    ExceptionUtility.LogException(ex, "Edit Protocol - Page_Load");
                    Response.Redirect("~/Account/ProtocolManagement.aspx");
                }

            if (!IsPostBack)
            {
                Session["ShowSelection"] = true;
                LoadProtocoltInfo();
            }
            }
        }

        protected void Refresh()
        {
            dsServices.DataBind();
            dsJobTitleClassifications.DataBind();
            dsAuthorizedUsers.DataBind();
            dsDeliveryMethod.DataBind();
        }

        #region Load Form

        protected void GetProtocolInfo()
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["OHSN"].ConnectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("OHSN_Web_GetEmployersProtocolInfo", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@ProtocolID", Session["WorkingProtocolID"]);
                                                                       
                        SqlDataReader rdr = cmd.ExecuteReader();
                        while (rdr.Read())
                        {
                            txtProtocolName.Text = rdr[1].ToString();
                            ckActive.Checked = Convert.ToBoolean(rdr[2]);
                        }
                    }

                    conn.Close();
                }
            }
            catch (Exception ex)
            {
                ExceptionUtility.LogException(ex, "Edit Protocol - SelectProtocolServices");

                ExceptionUtility.NotifySupport(ex);

                HttpContext.Current.Response.Redirect("~/ErrorPage.aspx");
            }
        }
        
        protected void SelectProtocolServices()
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["OHSN"].ConnectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("OHSN_Web_GetEmployersProtocolServices", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@ProtocolID", Session["WorkingProtocolID"]);
                        SqlDataReader rdr = cmd.ExecuteReader();
                        while (rdr.Read())
                        {
                            gvServices.Selection.SelectRowByKey(Convert.ToInt64(rdr[1]));
                        }
                    }

                    conn.Close();
                }
            }
            catch (Exception ex)
            {
                ExceptionUtility.LogException(ex, "Edit Protocol - SelectProtocolServices");

                ExceptionUtility.NotifySupport(ex);

                HttpContext.Current.Response.Redirect("~/ErrorPage.aspx");
            }
        }

        protected void SelectJobClassificationRestrictions()
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["OHSN"].ConnectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("OSHN_Web_GetEmployerProtocol_JobTitles", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@ProtocolID", Session["WorkingProtocolID"]);
                        SqlDataReader rdr = cmd.ExecuteReader();
                        while (rdr.Read())
                        {
                            gvJobClassificationRestriction.Selection.SelectRowByKey(rdr[1].ToString());
                        }
                    }

                    conn.Close();
                }
            }
            catch (Exception ex)
            {
                ExceptionUtility.LogException(ex, "Edit Protocol - SelectProtocolServices");

                ExceptionUtility.NotifySupport(ex);

                HttpContext.Current.Response.Redirect("~/ErrorPage.aspx");
            }
        }

        protected void LoadProtocoltInfo()
        {
            Refresh();
            GetProtocolInfo();
            SelectProtocolServices();
            SelectJobClassificationRestrictions();
        }

        #endregion 

        protected string GetServices()
        {
            List<object> serviceInfoValues;
            string result = string.Empty;
            try
            {
                try
                {
                    gvServices.DataBind();
                    serviceInfoValues = gvServices.GetSelectedFieldValues(new string[] { "ID", "Name" });

                    foreach (object[] serviceData in serviceInfoValues)
                    {
                        result += serviceData[0].ToString() + ',' + serviceData[1].ToString() + ';';
                    }
                }
                catch (Exception ex)
                {
                    ExceptionUtility.LogException(ex, "Edit Protocol - GetServices");

                    ExceptionUtility.NotifySupport(ex);
                }
            }
            finally
            {
                serviceInfoValues = null;
            }

            return result;
        }

        protected string GetJobClassificationRestrictions()
        {
            List<object> jobClassificationRestrictionValues;
            string result = string.Empty;
            try
            {
                try
                {
                    gvJobClassificationRestriction.DataBind();
                    jobClassificationRestrictionValues = gvJobClassificationRestriction.GetSelectedFieldValues(new string[] { "NAME" });

                    foreach (string jobClassificationData in jobClassificationRestrictionValues)
                    {
                        if (jobClassificationData != null)
                            result += jobClassificationData.ToString() + ';';
                    }
                }
                catch (Exception ex)
                {
                    ExceptionUtility.LogException(ex, "Edit Protocol - GetJobClassificationRestictionValues");

                    ExceptionUtility.NotifySupport(ex);
                }
            }
            finally
            {
                jobClassificationRestrictionValues = null;
            }

            return result;
        }

        protected string GetContact()
        {
            List<object> contactInfoValues;
            string result = string.Empty;
            try
            {
                try
                {
                    gvAuthorizedUsers.DataBind();
                    contactInfoValues = gvAuthorizedUsers.GetSelectedFieldValues(new string[] { "ID" });

                    foreach (long contactData in contactInfoValues)
                    {
                        result += contactData.ToString() + ';';
                    }
                }
                catch (Exception ex)
                {
                    ExceptionUtility.LogException(ex, "Edit Protocol - GetContact");

                    ExceptionUtility.NotifySupport(ex);
                }
            }
            finally
            {
                contactInfoValues = null;
            }

            return result;
        }

        protected void Save()
        {
            string serviceInfo = GetServices();
            string jobTitleClassificationInfo = GetJobClassificationRestrictions();
            string contactInfo = GetContact();

            try
            {
                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["OHSN"].ConnectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("OHSN_Web_UpdateEmployerProtocol", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@EmployerID", Convert.ToInt64(Session["WorkingEmployerID"]));
                        cmd.Parameters.AddWithValue("@ProtocolID", Session["WorkingProtocolID"]);
                        cmd.Parameters.AddWithValue("@ProtocolName", txtProtocolName.Text);
                        cmd.Parameters.AddWithValue("@Active", ckActive.Checked);
                        cmd.Parameters.AddWithValue("@ReportToMIS", ckReportToMIS.Checked);
                        cmd.Parameters.AddWithValue("@ServiceInfo", serviceInfo);
                        cmd.Parameters.AddWithValue("@JobTitleClassificationInfo", jobTitleClassificationInfo);
                        cmd.Parameters.AddWithValue("@ContactInfo", contactInfo);
                        cmd.Parameters.AddWithValue("@EnteredByID", Convert.ToInt64(Session["ContactID"]));

                        var result = (int)cmd.ExecuteNonQuery();
                    }

                    conn.Close();
                }
            }
            catch (Exception ex)
            {
                ExceptionUtility.LogException(ex, "Edit Protol - Save");

                ExceptionUtility.NotifySupport(ex);

                HttpContext.Current.Response.Redirect("~/ErrorPage.aspx");
            }
        }

        protected void SendEmail()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(string.Format("{0} {1} from {2} has changed the {3} protocol.    Please review and verify that it still has the appropriate services.", Session["FirstName"], Session["LastName"], Session["WorkingEmployerName"], txtProtocolName.Text));
            string subject = string.Format("{0} {1} from {2} has changed the {3} protocol.", Session["FirstName"], Session["LastName"], Session["WorkingEmployerName"], txtProtocolName.Text);
            emailUtility email = new emailUtility("support@ohsnational.com", subject, sb);
            email.Send();
        }

        protected void mainToolbar_CommandExecuted(object source, DevExpress.Web.RibbonCommandExecutedEventArgs e)
        {
            switch (e.Item.Name)
            {
                case "btnBack":
                    {
                        Response.Redirect("~/Account/ProtocolManagement.aspx");
                        break;
                    }

                case "btnSubmit":
                    {
                            Save();
                            SendEmail();
                            Response.Redirect("~/Account/ProtocolManagement.aspx");

                        break;
                    }

                case "btnCancel":
                    {
                        Response.Redirect("~/Account/ProtocolManagement.aspx");
                        break;
                    }

                case "btnShowSelected":
                    {
                        CriteriaOperator selectionCriteria = new InOperator(gvServices.KeyFieldName, gvServices.GetSelectedFieldValues(gvServices.KeyFieldName));
                        if (Convert.ToBoolean(Session["ShowSelection"]) == true)
                        {
                            mainToolbar.Tabs[0].Groups[2].Items[0].Text = "Show All";
                            Session["ShowSelection"] = false;
                        }
                        else
                        {
                            mainToolbar.Tabs[0].Groups[2].Items[0].Text = "Show Selected";
                            Session["ShowSelection"] = true;
                            selectionCriteria = selectionCriteria.Not();
                        }

                        gvServices.FilterExpression = (GroupOperator.Combine(GroupOperatorType.And, selectionCriteria)).ToString();
                        break;
                    }
            }
        }
    }
}