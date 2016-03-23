namespace CustomerPortal.Projects
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Web;
    using System.Web.UI;
    using System.Web.UI.WebControls;
    using System.Data;
    using System.Drawing;
    using System.Configuration;
    using System.Net.Mail;
    using System.Net;
    using System.Text;
    using System.Configuration;
    using System.Data;
    using System.Data.SqlClient;

    public partial class NotificationProjectDetails : System.Web.UI.Page
    {
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
                txtbxSpecialInstructions.BackColor = Color.Yellow;
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
            txtbxSpecialInstructions.Text = dv[0]["SpecialInstructions"].ToString();
            txtbxRequestType.Text = dv[0]["RequestType"].ToString();
            txtbxScheduleBy.Text = dv[0]["ScheduledByDeadline"].ToString();
            txtbxCompleteBy.Text = dv[0]["CompletedByDeadline"].ToString();
            // Load Protocols
            dsProjectDetailsViewProtocolInfo.DataBind();

            // Load Notes
            dsProjectDetailsViewNotes.DataBind();
        }

        protected void Page_Load(object sender, EventArgs e)
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

        private void AddNote(long projectID, string note, long userID)
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

        private void MarkNotificationComplete()
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
                    cmd.Parameters.AddWithValue("@NotificationMessage", memNotifications.Text);
                    cmd.Parameters.AddWithValue("@FieldsToCorrect", Session["FieldsToCorrect"].ToString());
                    cmd.Parameters.AddWithValue("@Completed", true);

                    int rows = cmd.ExecuteNonQuery();
                }
                conn.Close();
            }
        }

        protected void SendNotificationResponseEmail()
        {
            SmtpClient smtpClient = new SmtpClient();
            MailMessage mailMessage = new MailMessage();
            
            mailMessage.To.Add(ConfigurationManager.AppSettings["NotificationReplyEmailDestination"]);
            mailMessage.Subject = "User Notification Response";

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

            mailMessage.Body = sb.ToString();

            smtpClient.Send(mailMessage);
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Default.aspx");
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            AddNote(Convert.ToInt64(txtbxProjectID.Text), memResponse.Text, Convert.ToInt64(Session["ContactID"]));
            MarkNotificationComplete();
            SendNotificationResponseEmail();
            Session["FieldsToCorrect"] = null;
            Session["NotificationID"] = null;
            Response.Redirect("~/Default.aspx");
        }
    }
}