using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CustomerPortal.Projects
{
    public partial class FindProject : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            dedFrom.Date = DateTime.Now.AddDays(-30);
            dedTo.Date = DateTime.Now.Date;
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

                case "btnFind":
                    {
                        if (Session["WorkingEmployerID"] != null)
                        {
                            Session["FromDate"] = dedFrom.Date;
                            Session["ToDate"] = dedTo.Date;
                            dsFindProjects.DataBind();
                        }

                        break;
                    }

            }
        }
    }
}