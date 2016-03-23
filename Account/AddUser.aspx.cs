namespace CustomerPortal.Account
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Web;
    using System.Web.UI;
    using System.Web.UI.WebControls;
    using DevExpress.Web;
    using System.Data;
    using System.Data.Sql;
    using System.Data.SqlClient;
    using System.Configuration;

    public partial class AddUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ContactID"] == null)
            {
                Response.Redirect("~/Default.aspx");
            }

            dsCompanyContacts.DataBind();
            dsJobCategory.DataBind();
            dsProtocols.DataBind();
            dsUserLevel.DataBind();
            dsDeliveryMethod.DataBind();
        }

        protected void Page_Error(object sender, EventArgs e)
        {
            // Get last error from the server
            Exception exc = Server.GetLastError();

           // Pass the error on to the Generic Error page
            Server.Transfer("ErrorPage.aspx", true);
        }

        protected void Save()
        {

        }

        protected void Load()
        {
            DataView dvContactInfo = (DataView)dsContactInfo.Select(DataSourceSelectArguments.Empty);

            if (dvContactInfo != null && dvContactInfo.Count > 0)
            {
                txtbxFirstName.Text = dvContactInfo[0]["FirstName"].ToString();
                txtbxLastName.Text = dvContactInfo[0]["LastName"].ToString();

                txtbxWorkPhone.Text = dvContactInfo[0]["Phone"].ToString();
                txtbxExt.Text = dvContactInfo[0]["Extension"].ToString();
                txtbxFax.Text = dvContactInfo[0]["Fax"].ToString();
                txtbxCell.Text = dvContactInfo[0]["Cell"].ToString();
                txtbxEmail.Text = dvContactInfo[0]["emaIL"].ToString();
                // cbx Job Category
                txtbxJobTitle.Text = dvContactInfo[0]["JobTitle"].ToString();

                cbxJobCategory.DataBind();
                for (int i = 0; i < cbxJobCategory.Items.Count; i++)
                {
                    if (Convert.ToInt32(cbxJobCategory.Items[i].Value) == Convert.ToInt32(dvContactInfo[0]["JobCategory"]))
                    {
                        cbxJobCategory.SelectedIndex = i;
                    }
                }
            }

            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["OHSN"].ConnectionString))
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand("OHSN_Web_InitializeNewWebUser", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@ContactID", Session["WorkingContactID"]);
                    var result = (int)cmd.ExecuteNonQuery();
                }

                conn.Close();
            }

            dsPrivileges.DataBind();
            gvPrivileges.DataBind();
        }

        protected void cbxCompanyContacts_ButtonClick(object source, DevExpress.Web.ButtonEditClickEventArgs e)
        {
            Response.Redirect("~/Account/NewCompanyContact.aspx");
        }

        protected void cbxCompanyContacts_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["WorkingContactID"] = cbxCompanyContacts.Value.ToString();
            dsContactInfo.DataBind();
            
            Load();
        }

        protected void mainToolbar_CommandExecuted(object source, DevExpress.Web.RibbonCommandExecutedEventArgs e)
        {
            switch (e.Item.Name)
            {
                case "btnBack":
                    {
                        Response.Redirect("~/Account/UserManagement.aspx");
                        break;
                    }

                case "btnSubmit":
                    {
                        Save();
                        Response.Redirect("~/Account/UserManagement.aspx");
                        break;
                    }

                case "btnCancel":
                    {
                        Response.Redirect("~/Account/UserManagement.aspx");
                        break;
                    }
            }
        }
    }
}