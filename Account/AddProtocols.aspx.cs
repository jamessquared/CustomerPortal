 namespace CustomerPortal.Account
{
    using CustomerPortal.Classes;
    using CustomerPortal.Utility;
    using DevExpress.Data.Filtering;
    using System;
    using System.Collections.Generic;
    using System.Configuration;
    using System.Data;
    using System.Data.SqlClient;
    using System.Net.Mail;
    using System.Web;
    using System.Text;

    public partial class AddProtocols : System.Web.UI.Page
    {
        private bool ShowSelectedRows { get; set; }

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
                try
                {
                    Dictionary<string, Priviliges> priv = Session["Privileges"] as Dictionary<string, Priviliges>;
                    Priviliges p = priv["Protocol Management"];

                    if (p.AllowAccess == 0 || p.AllowAddorEdit == 0)
                    {
                        Response.Redirect("~/ProtocolManagement.aspx");
                    }
                }
                catch (KeyNotFoundException)
                {
                    Response.Redirect("~/ProtocolManagement.aspx");
                }
                catch (Exception ex)
                {
                    ExceptionUtility.LogException(ex, " Add Protocols - Page_Load");
                    Response.Redirect("~/ProtocolManagement.aspx");
                }
            

                dsProtocols.DataBind();
                dsServices.DataBind();
                dsJobTitleClassifications.DataBind();
            }
        }

        protected bool ProtocolAlreadyExists()
        {
            bool result = true;

            try
            {
                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["OHSN"].ConnectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("OHSN_Web_ProtocolExists", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@EmployerID", Convert.ToInt64(Session["WorkingEmployerID"]));
                        cmd.Parameters.AddWithValue("@ProtocolName", cbxProtocolName.Text);

                        SqlParameter found = new SqlParameter("@Found", SqlDbType.Bit) { Direction = ParameterDirection.Output };
                        cmd.Parameters.Add(found);

                        cmd.ExecuteNonQuery();

                        result = (bool)found.Value;
                    }

                    conn.Close();
                }
            }
            catch (Exception ex)
            {
                ExceptionUtility.LogException(ex, "Add User - ProtocolAlreadyExists");

                ExceptionUtility.NotifySupport(ex);

                HttpContext.Current.Response.Redirect("~/ErrorPage.aspx");
            }

            return result;
        }

        protected bool IsValid()
        {
            bool result = true;

            // Must have a Protocol name
            result = (string.IsNullOrEmpty(cbxProtocolName.Text) == false);

            if (result == false || gvServices.Selection.Count == 0)
            {
                result = false;
            }

            return result;
        }

        protected string GetServices()
        {
            List<object> serviceInfoValues;
            string result = string.Empty;
            try
            {
                try
                {
                    serviceInfoValues = gvServices.GetSelectedFieldValues(new string[] { "ID", "Name" });

                    foreach (object[] serviceData in serviceInfoValues)
                    {
                        result += serviceData[0].ToString() + ',' + serviceData[1].ToString() + ';';
                    }
                }
                catch (Exception ex)
                {
                    ExceptionUtility.LogException(ex, "Add Protocol - GetServices");

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
                    jobClassificationRestrictionValues = gvJobClassificationRestriction.GetSelectedFieldValues(new string[] { "NAME" });

                    foreach (string jobClassificationData in jobClassificationRestrictionValues)
                    {
                        if (jobClassificationData != null)
                            result += jobClassificationData.ToString() + ';';
                    }
                }
                catch (Exception ex)
                {
                    ExceptionUtility.LogException(ex, "Add Protocol - GetJobClassificationRestrictions");

                    ExceptionUtility.NotifySupport(ex);
                }
            }
            finally
            {
                jobClassificationRestrictionValues = null;
            }

            return result;
        }

        protected void Save()
        {
            string serviceInfo = GetServices();
            string jobTitleClassificationInfo = GetJobClassificationRestrictions();

            try
            {
                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["OHSN"].ConnectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("OHSN_Web_AddNewEmployerProtocol", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@EmployerID", Convert.ToInt64(Session["WorkingEmployerID"]));
                        cmd.Parameters.AddWithValue("@StandardProtocolID", cbxProtocolName.Value);
                        cmd.Parameters.AddWithValue("@StandardProtocolName", cbxProtocolName.Text);
                        cmd.Parameters.AddWithValue("@ServiceInfo", serviceInfo);
                        cmd.Parameters.AddWithValue("@JobTitleClassificationInfo", jobTitleClassificationInfo);
                        cmd.Parameters.AddWithValue("@EnteredByID", Convert.ToInt64(Session["ContactID"]));
                        cmd.Parameters.AddWithValue("@ReportToMIS", ckReportToMIS.Checked);

                        SqlParameter paramProtocolID = new SqlParameter() { ParameterName = "@ProtocolID", DbType = DbType.Int64, Direction = ParameterDirection.Output };
                        cmd.Parameters.Add(paramProtocolID);

                        var result = (int)cmd.ExecuteNonQuery();

                        Session["WorkingProtocolID"] = paramProtocolID.Value;
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

        protected void SendEmail()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(string.Format("{0} {1} from {2} has create a new protocol {3}.    Please review and verify that it has the OHS National services.", Session["FirstName"], Session["LastName"], Session["WorkingEmployerName"], cbxProtocolName.Text));

            string subject = string.Format("{0} {1} from {2} has created the {3} protocol.", Session["FirstName"], Session["LastName"], Session["WorkingEmployerName"], cbxProtocolName.Text);
            emailUtility email = new emailUtility(ConfigurationManager.AppSettings["NotificationReplyEmailDestination"], subject, sb);
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
                      if (IsValid())
                      {
                          Save();
                          SendEmail();
                          Response.Redirect("~/Account/EditProtocols.aspx");
                      }
 
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
                        if (Convert.ToBoolean(Session["ShowSelection"] ) == true)
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

        protected List<long> GetServiceID(long protocolID)
        {
            List<long> result = new List<long>();

            try
            {
                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["OHSN"].ConnectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("OHSN_Web_GetTypeProtocolServices", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@ProtocolID", protocolID);
                        SqlDataReader rdr = cmd.ExecuteReader();
                        while (rdr.Read())
                        {
                            result.Add(Convert.ToInt64(rdr[0]));
                        }
                    }

                    conn.Close();
                }
            }
            catch (Exception ex)
            {
                ExceptionUtility.LogException(ex, "Add User - GetServiceID");

                ExceptionUtility.NotifySupport(ex);

                HttpContext.Current.Response.Redirect("~/ErrorPage.aspx");
            }

            return result;
        }

        protected void gvServices_CustomCallback(object sender, DevExpress.Web.ASPxGridViewCustomCallbackEventArgs e)
        {
            List<long> serviceIDList = new List<long>();

            Session["WorkingProtocolID"] = e.Parameters;
            
            serviceIDList.AddRange(GetServiceID(Convert.ToInt64(e.Parameters)));
            
            gvServices.Selection.UnselectAll();

            foreach (long serviceID in serviceIDList)
            {
                gvServices.Selection.SelectRowByKey(serviceID);
            }

            serviceIDList = null;
        }

        protected void cbxProtocolName_Validation(object sender, DevExpress.Web.ValidationEventArgs e)
        {
            e.IsValid = ProtocolAlreadyExists() == false;
            e.ErrorText = "This Protocol already exists for this company.";
        }
    }
}