namespace CustomerPortal.Projects
{
    using CustomerPortal.Classes;
    using CustomerPortal.Utility;
    using System;
    using System.Collections.Generic;
    using System.Configuration;
    using System.Data;
    using System.Data.SqlClient;
    using System.Drawing;
    using System.Net.Mail;
    using System.Text;
    using System.Web;
    using System.Web.UI;

    public partial class NotificationProjectDetails : System.Web.UI.Page
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
                    Priviliges p = priv["Find Project"];

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
                    ExceptionUtility.LogException(ex, "Notification Project Details - Page_Load");
                    Response.Redirect("~/Default.aspx");
                }
            }

            try
            {
                if (Request.QueryString.HasKeys())
                {
                    Session["ProjectID"] = Request.QueryString["ProjectID"];
                    Session["NotificationID"] = Request.QueryString["NotificationID"];

                    if (Session["ProjectID"] != null && string.IsNullOrEmpty(memNotifications.Text) == true)
                    {
                        LoadProjectData();

                        // Mark controls
                        Session["FieldsToCorrect"] = string.Empty;
                        dsNotification.DataBind();
                        DataView dv = (DataView)dsNotification.Select(DataSourceSelectArguments.Empty);
                        if (dv != null)
                        {
                            DataRow dr = dv.Table.Rows[0];
                            if (dr["Message"] != null)
                            {
                                memNotifications.Text = dr["Message"].ToString();
                            }

                            if (dr["FieldsToCorrect"] != null && string.IsNullOrEmpty(dr["FieldsToCorrect"].ToString()) == false)
                            {
                                Session["FieldsToCorrect"] = Session["FieldsToCorrect"].ToString() + dr["FieldsToCorrect"].ToString();
                                HighlightIssues(dr["FieldsToCorrect"].ToString());
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                ExceptionUtility.LogException(ex, "Notification Project Details - Page_Load");

                HttpContext.Current.Response.Redirect("~/ErrorPage.aspx");
            } 
        }

        protected void HighlightIssues(string issues)
        {
            if (issues.Contains("Name"))
            {
                txtbxLastName.BackColor = Color.Yellow;
                txtbxFirstName.BackColor = Color.Yellow;
                txtbxMI.BackColor = Color.Yellow;
            }
            
            if (issues.Contains("Address"))
            {
                txtbxPrimaryAddressline.BackColor = Color.Yellow;
                txtbxSecondaryAddressline.BackColor = Color.Yellow;
            }

            if (issues.Contains("City"))
            {
                txtbxCity.BackColor = Color.Yellow;
            }

            if (issues.Contains("State"))
            {
                txtbxState.BackColor = Color.Yellow;
            }

            if (issues.Contains("PostalCode"))
            {
                txtbxPostalCode.BackColor = Color.Yellow;
            }

            if (issues.Contains("DOB"))
            {
                txtbxDOB.BackColor = Color.Yellow;
            }

            if (issues.Contains("SSN"))
            {
                txtbxSSN.BackColor = Color.Yellow;
            }

            if (issues.Contains("Phone"))
            {
                txtbxPhone.BackColor = Color.Yellow;
                txtbxSecondPhone.BackColor = Color.Yellow;
            }

            if (issues.Contains("Email"))
            {
                txtbxEmail.BackColor = Color.Yellow;
            }

            if (issues.Contains("JobTitle"))
            {
                txtbxJobTitle.BackColor = Color.Yellow;
            }

            if (issues.Contains("SpecialInstructions"))
            {
                memSpecialInstructions.BackColor = Color.Yellow;
            }

            if (issues.Contains("RequestType"))
            {
                txtbxRequestType.BackColor = Color.Yellow;
            }

            if (issues.Contains("ScheduleBy"))
            {
                txtbxScheduleBy.BackColor = Color.Yellow;
            }

            if (issues.Contains("CompleteBy"))
            {
                txtbxCompleteBy.BackColor = Color.Yellow;
            }

            if (issues.Contains("Protocols"))
            {
                for (int i = 0; i < gvProtocols.Columns.Count; i++)
                {
                    gvProtocols.Columns[i].CellStyle.BackColor = Color.Yellow;    
                }
            }
        }

        protected void LoadProjectData()
        {
            try
            {
                dsProjectDetails.DataBind();
                DataView dv = (DataView)dsProjectDetails.Select(DataSourceSelectArguments.Empty);

                txtbxProjectID.Text = dv[0]["ID"].ToString();
                txtbxLastName.Text = dv[0]["LastName"].ToString();
                txtbxFirstName.Text = dv[0]["FirstName"].ToString();
                txtbxMI.Text = dv[0]["MI"].ToString();
                txtbxPrimaryAddressline.Text = dv[0]["PrimaryAddressline"].ToString();
                txtbxSecondaryAddressline.Text = dv[0]["SecondaryAddressline"].ToString();
                txtbxCity.Text = dv[0]["City"].ToString();
                txtbxState.Text = dv[0]["State"].ToString();
                txtbxPostalCode.Text = dv[0]["PostalCode"].ToString();
                txtbxDOB.Text = dv[0]["DOB"].ToString();
                txtbxPhone.Text = dv[0]["Phone1"].ToString();
                txtbxSecondPhone.Text = dv[0]["Phone2"].ToString();
                txtbxEmail.Text = dv[0]["PatientEmail"].ToString();
                txtbxJobTitle.Text = dv[0]["JobTitle"].ToString();
                memSpecialInstructions.Text = dv[0]["SpecialInstructions"].ToString();
                txtbxRequestType.Text = dv[0]["RequestType"].ToString();
                txtbxScheduleBy.Text = dv[0]["ScheduledByDeadline"].ToString();
                txtbxCompleteBy.Text = dv[0]["CompletedByDeadline"].ToString();
                txtbxDOTAgency.Text = Convert.ToString(dv[0]["DOTAgency"]);
                txtbxDOTServiceCategory.Text = Convert.ToString(dv[0]["DOTServiceCategory"]);

                // Load Protocols
                dsProjectDetailsViewProtocolInfo.DataBind();

                // Load Notes
                dsProjectDetailsViewNotes.DataBind();
            }
            catch (Exception ex)
            {
                ExceptionUtility.LogException(ex, "Notification Project Details - LoadProjectData");

                HttpContext.Current.Response.Redirect("~/ErrorPage.aspx");
            }
        }

        private void AddNote(long projectID, string note, long userID)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["OHSN"].ConnectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("ohsn_Web_NoteInsertCommand_Execute", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        cmd.Parameters.AddWithValue("@ProjectID ", projectID);
                        cmd.Parameters.AddWithValue("@Note", note);
                        cmd.Parameters.AddWithValue("@EnteredByID", userID);

                        int rows = cmd.ExecuteNonQuery();
                    }
                    conn.Close();
                }
            }
            catch (Exception ex)
            {
                ExceptionUtility.LogException(ex, "Notification Project Details - AddNote");

                ExceptionUtility.NotifySupport(ex);

                HttpContext.Current.Response.Redirect("~/ErrorPage.aspx");
            }
        }

        private void MarkNotificationComplete()
        {
            try
            {
                if (Session["FieldsToCorrect"] == null)
                {
                    Session["FieldsToCorrect"] = string.Empty;
                }

                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["OHSN"].ConnectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("OHSN_pm_UserNotification_Update", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        cmd.Parameters.AddWithValue("@ID ", Session["NotificationID"].ToString());
                        cmd.Parameters.AddWithValue("@ProjectID ", Convert.ToInt64(Session["ProjectID"]));
                        cmd.Parameters.AddWithValue("@NotificationMessage", memNotifications.Text);
                        cmd.Parameters.AddWithValue("@FieldsToCorrect", Session["FieldsToCorrect"].ToString());
                        cmd.Parameters.AddWithValue("@Completed", true);
                        cmd.Parameters.AddWithValue("@EnteredByID ", Convert.ToInt64(Session["ContactID"]));
                        int rows = cmd.ExecuteNonQuery();
                    }
                    conn.Close();
                }
            }
            catch (Exception ex)
            {
                ExceptionUtility.LogException(ex, "Notification Project Details - MarkNotificationComplete");

                ExceptionUtility.NotifySupport(ex);

                HttpContext.Current.Response.Redirect("~/ErrorPage.aspx");
            }
        }

        protected void SendNotificationResponseEmail()
        {
                StringBuilder sb = new StringBuilder();
                sb.Append(string.Format("==============================================================================================={0}", Environment.NewLine));
                sb.Append(string.Format("Notification sent to {0}{1} at {2}{3}{4}", Session["FirstName"].ToString(), Session["LastName"].ToString(), Session["UserCompany"].ToString(), Environment.NewLine, Environment.NewLine));
                sb.Append(string.Format("==============================================================================================={0}", Environment.NewLine));
                sb.Append(string.Format("Project ID: {0}{1}", txtbxProjectID.Text, Environment.NewLine));
                sb.Append(string.Format("Message: {0}{1}", memNotifications.Text, Environment.NewLine));
                sb.Append(string.Format("==============================================================================================={0}", Environment.NewLine));
                sb.Append(string.Format("Response{0}", Environment.NewLine));
                sb.Append(string.Format("==============================================================================================={0}", Environment.NewLine));
                sb.Append(string.Format("{0}{1}", memResponse.Text, Environment.NewLine));

                emailUtility email = new emailUtility(ConfigurationManager.AppSettings["NotificationReplyEmailDestination"], "User Notification Response", sb);
                email.Send();
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

                case "btnSubmit":
                    {
                        AddNote(Convert.ToInt64(txtbxProjectID.Text), memResponse.Text, Convert.ToInt64(Session["ContactID"]));
                        MarkNotificationComplete();
                        SendNotificationResponseEmail();
                        Session["FieldsToCorrect"] = null;
                        Session["NotificationID"] = null;
                        Response.Redirect("~/Default.aspx");
                        break;
                    }

            }
        }
    }
}