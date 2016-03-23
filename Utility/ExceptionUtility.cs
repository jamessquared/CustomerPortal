namespace CustomerPortal.Utility
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Web;
    using System.IO;
    using System.Configuration;
    using System.Net.Mail;
    using System.Text;
    public sealed class ExceptionUtility
    {
        // All methods are static, so this can be private
        private ExceptionUtility()
        { }

        // Log an Exception
        public static void LogInfo(string logData)
        {
            // Include logic for logging exceptions
            // Get the absolute path to the log file
            string logFile = string.Format("\\\\{0}\\{1}\\{2}", ConfigurationManager.AppSettings["FileServer"].ToString(), ConfigurationManager.AppSettings["ErrorLogPath"].ToString(), "ErrorLog.txt");
           
            // Open the log file for append and write the log
            StreamWriter sw = new StreamWriter(logFile, true);
            sw.Write(string.Format("{0}      -       {1}", DateTime.Now, logData));
            sw.Close();
        }

        // Log an Exception
        public static void LogException(Exception ex, string source)
        {
            // Include logic for logging exceptions
            // Get the absolute path to the log file
            string logFile = string.Format("\\\\{0}\\{1}\\{2}", ConfigurationManager.AppSettings["FileServer"].ToString(), ConfigurationManager.AppSettings["ErrorLogPath"].ToString(), "ErrorLog.txt");

            // Open the log file for append and write the log
            StreamWriter sw = new StreamWriter(logFile, true);
            sw.WriteLine("********** {0} **********", DateTime.Now);
            if (ex.InnerException != null)
            {
                sw.Write("Inner Exception Type: ");
                sw.WriteLine(ex.InnerException.GetType().ToString());
                sw.Write("Inner Exception: ");
                sw.WriteLine(ex.InnerException.Message);
                sw.Write("Inner Source: ");
                sw.WriteLine(ex.InnerException.Source);
                if (ex.InnerException.StackTrace != null)
                {
                    sw.WriteLine("Inner Stack Trace: ");
                    sw.WriteLine(ex.InnerException.StackTrace);
                }
            }

            sw.Write("Exception Type: ");
            sw.WriteLine(ex.GetType().ToString());
            sw.WriteLine("Exception: " + ex.Message);
            sw.WriteLine("Source: " + source);
            sw.WriteLine("Stack Trace: ");
            if (ex.StackTrace != null)
            {
                sw.WriteLine(ex.StackTrace);
                sw.WriteLine();
            }
            sw.Close();
        }

        // Notify System Operators about an exception 
        public static void NotifySupport(Exception ex)
        {
            SmtpClient smtpClient = new SmtpClient();
            MailMessage mailMessage = new MailMessage();

            mailMessage.To.Add(ConfigurationManager.AppSettings["NotificationErrorEmailDestination"].ToString());
            mailMessage.Subject = "Website Error";

            mailMessage.Body = ex.ToString();

            smtpClient.Send(mailMessage);
        }
    }
}