namespace CustomerPortal.Account
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Web;
    using System.Web.UI;
    using System.Web.UI.WebControls;
    using System.Configuration;
    using System.Net.Mail;
    using System.Net;
    using System.Data;
    using System.Data.Sql;
    using System.Data.SqlClient;
    using System.Text;

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

        private bool emailFound(out List<LostUserInfo> lostUserInfo)
        {
            bool result = false;
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
            
            return result;
        }

        protected void btnPasswordemail_Click(object sender, EventArgs e)
        {
            List<LostUserInfo> lostUserInfo = new List<LostUserInfo>();

            if (emailFound(out lostUserInfo))
            {
                SmtpClient smtpClient = new SmtpClient();
                MailMessage mailMessage = new MailMessage();

                mailMessage.To.Add(new MailAddress(txtEmail.Text));
                mailMessage.Subject = "Password reset";

                StringBuilder sb = new StringBuilder();
                sb.Append("You are receiving this email because a request has been made to receive your user and password.  Below are the user name(s) and password(s) which are associated with the specified email address." + Environment.NewLine + Environment.NewLine);
                foreach (var userInfo in lostUserInfo)
                {
                    sb.Append(string.Format(" Company:{0}{1}User:{2}{3}Password:{4}{5}", userInfo.Company, Environment.NewLine, userInfo.Username, Environment.NewLine, userInfo.Password, Environment.NewLine));
                }
                mailMessage.Body = sb.ToString();

                smtpClient.Send(mailMessage);

                Response.Redirect("~/");
            }
            else
            {
                lblNoAccountFound.Visible = true;
            }
        }
    }
}