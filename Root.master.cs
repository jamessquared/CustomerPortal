namespace CustomerPortal
{
    using DevExpress.Web;
    using System;


    public partial class RootMaster : System.Web.UI.MasterPage 
    {
        private string _userName;
        private string _company;
        private string _accountType;
        private DateTime _lastLogin;

        public string UserName 
        { 
            get
            {
                return this._userName;
            }
            set
            {
                this._userName = value;
                lblLogOnName.Text = value;
                lblLogOnName.Visible = (Session["ContactID"] != null);
            }
        }

        public string Company 
        { 
            get
            {
                return this._company;
            }
            set
            {
                this._company = value;
                lblLogOnCompany.Text = value;
                lblLogOnCompany.Visible = (Session["ContactID"] != null);
            }
        }

        public string AccountType 
        { 
            get
            {
                return this._accountType;
            }
            set
            {
                this._accountType = value;
                lblLogOnAccountType.Text = value;
                lblLogOnAccountType.Visible = (Session["ContactID"] != null);
            }
        }

        public DateTime LastLoginDate 
        { 
            get
            {
                return this._lastLogin;
            }

            set
            {
                this._lastLogin = value;
                lblLastLoginDate.Text = string.Format("Last Login {0} {1} {2}", _lastLogin.Date.ToShortDateString(), _lastLogin.TimeOfDay.ToString("hh\\:mm"), _lastLogin.Date.ToString("tt")); 
                lblLastLoginDate.Visible = (Session["ContactID"] != null);
            }
        }

        public bool ChangePassword
        {
            set
            {
                hlChangePassword.Visible = value;
            }
        }

        public void SetLoginLabels()
        {
            this.UserName = string.Format("{0} {1}", Session["FirstName"].ToString(), Session["LastName"].ToString());
            this.Company = Session["UserCompany"].ToString();
            this.AccountType = Session["UserAccountType"].ToString();
            this.LastLoginDate = Convert.ToDateTime(Session["LastLogin"]);
        }

        protected void Page_Load(object sender, EventArgs e) 
        {
            lblCopyright.Text = Server.HtmlDecode(String.Format(" &copy;{0} Copyright by OSSI Online, LLC", DateTime.Now.Year));
            hlChangePassword.Visible = (Session["ContactID"] != null);
            TimeoutControl1.TimeOutUrl = "~/TimeOutPage.aspx";

        }

        protected void ASPxImage1_CustomJSProperties(object sender, CustomJSPropertiesEventArgs e)
        {
            Response.Redirect("~/Default.aspx");
        }
    }
}