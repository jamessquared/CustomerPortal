    namespace CustomerPortal 
    {
        using System;
        using System.Collections.Generic;
        using System.Linq;
        using System.Web;
        using System.Web.Security;
        using System.Web.SessionState;
        using DevExpress.Web;
        using CustomerPortal.Utility;

        public class Global_asax : System.Web.HttpApplication {
            void Application_Start(object sender, EventArgs e) {
                DevExpress.Web.ASPxWebControl.CallbackError += new EventHandler(Application_Error);
            }

            void Application_End(object sender, EventArgs e) {
                // Code that runs on application shutdown
            }

            void Application_Error(object sender, EventArgs e) 
            {
                Exception ex = Server.GetLastError();
                
                ExceptionUtility.LogException(ex, "Global Unhandled");

                if (ex is HttpUnhandledException)
                {
                    // Pass the error on to the error page.
                    Server.Transfer("ErrorPage.aspx?handler=Application_Error%20-%20Global.asax", true);
                }
            }

            void Session_Start(object sender, EventArgs e) {
                // Code that runs when a new session is started
            }

            void Session_End(object sender, EventArgs e) 
            {
                Session.Clear();
                // Code that runs when a session ends. 
                // Note: The Session_End event is raised only when the sessionstate mode
                // is set to InProc in the Web.config file. If session mode is set to StateServer 
                // or SQLServer, the event is not raised.
            }
        }
    }