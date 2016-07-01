using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CustomerPortal.Utility
{
    using System.Net.Mail;
    using System.Text;

    public class emailUtility
    {
        private SmtpClient smtpClient;
        private MailMessage mailMessage;

        #region Properties
        
        public string SendTo { get; set;  }
        
        public string Subject { get; set; }
        
        public StringBuilder Body { get; set; }

        #endregion

        public emailUtility(string sendTo)
        {
            this.smtpClient = new SmtpClient();
            this.mailMessage = new MailMessage();
            this.SendTo = sendTo;
        }

        public emailUtility(string sendTo, string subject)
        {
            this.smtpClient = new SmtpClient();
            this.mailMessage = new MailMessage();
            this.SendTo = sendTo;
            this.Subject = subject;
        }

        public emailUtility(string sendTo, string subject, StringBuilder body)
        {
            this.smtpClient = new SmtpClient();
            this.mailMessage = new MailMessage();
            this.SendTo = sendTo;
            this.Subject = subject;
            this.Body = body;
        }

        public void Send()
        {
            try
            {
                mailMessage.To.Add(new MailAddress(this.SendTo));
                mailMessage.From = new MailAddress("support@ohsnational.com");
                mailMessage.Subject = this.Subject;
                mailMessage.Body = this.Body.ToString();

                this.smtpClient.Send(mailMessage);
            }
            catch (Exception ex)
            {
                StringBuilder sb = new StringBuilder();
                sb.Append("Send - emailUtility");
                sb.Append(string.Format("To:{0}", mailMessage.To));
                sb.Append(string.Format("Subject:{0}", mailMessage.Subject));

                ExceptionUtility.LogException(ex, sb.ToString());

                HttpContext.Current.Response.Redirect("~/ErrorPage.aspx");
            } 
        }
    }
}