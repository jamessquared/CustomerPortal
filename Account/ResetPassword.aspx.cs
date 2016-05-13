namespace CustomerPortal.Account
{
    using CustomerPortal.Utility;
    using System;
    using System.Collections.Generic;
    using System.Configuration;
    using System.Data;
    using System.Data.SqlClient;
    using System.Net.Mail;
    using System.Text;
    using System.Web;

    public partial class ResetPassword : System.Web.UI.Page
    {
        protected class LostUserInfo
        {
            public string Company { get; set; }
            public string Username { get; set; }
            public string Password { get; set; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private bool EmailFound(out List<LostUserInfo> lostUserInfo)
        {
            bool result = false;
            lostUserInfo = null;

            try
            {
                lostUserInfo = new System.Collections.Generic.List<LostUserInfo>();

                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["OHSN"].ConnectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("OHSN_Web_GetLostUserPassword", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@emailAddress", txtEmail.Text);
                        SqlDataReader rdr = cmd.ExecuteReader();
                        while (rdr.Read())
                        {
                            LostUserInfo lui = new LostUserInfo();
                            lui.Company = rdr[0].ToString();
                            lui.Username = rdr[1].ToString();
                            lui.Password = rdr[2].ToString();
                            lostUserInfo.Add(lui);
                        }

                        result = rdr.HasRows;
                    }
                    conn.Close();
                }
            }
            catch (Exception ex)
            {
                ExceptionUtility.LogException(ex, "Reset Password - EmailFound");

                ExceptionUtility.NotifySupport(ex);

                HttpContext.Current.Response.Redirect("~/ErrorPage.aspx");
            } 
            
            return result;
        }

        private void SendEmail(List<LostUserInfo> lostUserInfo)
        {
            try
            {
                SmtpClient smtpClient = new SmtpClient();
                MailMessage mailMessage = new MailMessage();

                mailMessage.To.Add(new MailAddress(txtEmail.Text));
                mailMessage.Subject = "Password reset";

                StringBuilder sb = new StringBuilder();
                sb.Append("You are receiving this email because a request has been made to receive your user and password.  Below is the user name and password associated with the specified email address." + Environment.NewLine + Environment.NewLine);
                foreach (var userInfo in lostUserInfo)
                {
                    sb.Append(string.Format(" Company:{0}{1}User:{2}{3}Password:{4}{5}", userInfo.Company, Environment.NewLine, userInfo.Username, Environment.NewLine, userInfo.Password, Environment.NewLine));
                }
                mailMessage.Body = sb.ToString();

                smtpClient.Send(mailMessage);
            }
            catch (Exception ex)
            {
                ExceptionUtility.LogException(ex, "Reset Password - SendEmail");

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

                case "btnSend":
                    {
                        List<LostUserInfo> lostUserInfo = new List<LostUserInfo>();

                        if (EmailFound(out lostUserInfo))
                        {
                            SendEmail(lostUserInfo);
                            Response.Redirect("~/Default.aspx");
                        }
                        else
                        {
                            lblNoAccountFound.Visible = true;
                        }

                        break;
                    }
            }
        }
    }
}