using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CustomerPortal.Account
{
    public partial class NewCompanyContact : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
          
        }

        protected void Page_Error(object sender, EventArgs e)
        {
            // Get last error from the server
            Exception exc = Server.GetLastError();

            // Pass the error on to the Generic Error page
            Server.Transfer("ErrorPage.aspx", true);
        }

        protected void bntOK_Click(object sender, EventArgs e)
        {
            
            Response.Redirect("~/Account/AddUser.aspx");
        }
    }
}