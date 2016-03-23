using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;

namespace CustomerPortal
{
    public partial class RootMaster : System.Web.UI.MasterPage 
    {
        public string UserName 
            { 
                get
                {
                    return UserName;
                }
                set
                {
                    lblLogOnName.Text = value;
                    lblLogOnName.Visible = true;
                }
            }

        public string Company
        {
            get
            {
                return Company;
            }
            set
            {
                lblLogOnCompany.Text = value;
                lblLogOnCompany.Visible = true;
            }
        }

        public string AccountType
        {
            get
            {
                return AccountType;
            }
            set
            {
                lblLogOnAccountType.Text = value;
                lblLogOnAccountType.Visible = true;
            }
        }

        public DateTime LastLoginDate
        {
            get
            {
                return LastLoginDate;
            }
            set
            {
                lblLastLoginDate.Text = string.Format("Last Login {0} {1}", value.ToShortDateString(), value.ToShortTimeString());
                lblLastLoginDate.Visible = true;
            }
        }

        public bool ChangePassword
        {
            set
            {
                hlChangePassword.Visible = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e) 
        {

            lblCopyright.Text = Server.HtmlDecode(String.Format(" &copy;{0} Copyright by OSSI Online, LLC", DateTime.Now.Year));
        }

        protected void ASPxImage1_CustomJSProperties(object sender, CustomJSPropertiesEventArgs e)
        {
            Response.Redirect("~/Default.aspx");
        }
    }
}