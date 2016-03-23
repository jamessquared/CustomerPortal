
namespace CustomerPortal.Account
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Web;
    using System.Web.UI;
    using System.Web.UI.WebControls;
    using System.Data;
    using System.Data.Sql;
    using System.Data.SqlClient;
    using System.Configuration;
    using CustomerPortal.Utility;

    public partial class EditUser : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ContactID"] == null)
            {
                Response.Redirect("~/Default.aspx");
            }

            dsJobCategory.DataBind();
            dsProtocols.DataBind();
            dsUserLevel.DataBind();
            dsDeliveryMethod.DataBind();

            if (!this.IsPostBack)
            {
                Load();
            }
        }

        protected void Page_Error(object sender, EventArgs e)
        {
            // Get last error from the server
            Exception exc = Server.GetLastError();

            // Pass the error on to the Generic Error page
            Server.Transfer("ErrorPage.aspx", true);
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
                txtbxEmail.Text = dvContactInfo[0]["email"].ToString();
                txtbxJobTitle.Text = dvContactInfo[0]["JobTitle"].ToString();
                txtBxUserName.Text = dvContactInfo[0]["UserName"].ToString();
                chkActive.Checked = Convert.ToBoolean(dvContactInfo[0]["Active"]);
                dsPrivileges.DataBind();


                cbxJobCategory.DataBind();
                for (int i = 0; i < cbxJobCategory.Items.Count; i++)
                {
                    if (Convert.ToInt32(cbxJobCategory.Items[i].Value) == Convert.ToInt32(dvContactInfo[0]["JobCategory"]))
                    {
                        cbxJobCategory.SelectedIndex = i;
                    }
                }

                cbxUserLevel.DataBind();
                for (int i = 0; i < cbxUserLevel.Items.Count; i++)
                {
                    if (Convert.ToInt32(cbxUserLevel.Items[i].Value) == Convert.ToInt32(dvContactInfo[0]["UserLevel"]))
                    {
                        cbxUserLevel.SelectedIndex = i;
                    }
                }
            }

            dsProtocols.DataBind();
            dsContactProtocolsInfo.DataBind();

            DataView dvContactProtocolsInfo = (DataView)dsContactProtocolsInfo.Select(DataSourceSelectArguments.Empty);

            if (dvContactProtocolsInfo != null && dvContactProtocolsInfo.Count > 0)
            {
                foreach (DataRow dr in dvContactProtocolsInfo.Table.Rows)
                {
                    int rowIndex = gvContactProtocols.FindVisibleIndexByKeyValue(dr["ProtocolID"].ToString());
                    if (rowIndex > -1)
                    {
                        gvContactProtocols.Selection.SelectRow(rowIndex);
                    }
                }
            }

            dsPrivileges.DataBind();
        }

        protected void SaveUserInfo(SqlConnection conn)
        {
            using (SqlCommand cmd = new SqlCommand("[OHSN_Web_UserInfo_Update]", conn))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@ContactID", Convert.ToInt64(Session["WorkingContactID"]));
                cmd.Parameters.AddWithValue("@FirstName", txtbxLastName.Text);
                cmd.Parameters.AddWithValue("@LastName", txtbxFirstName.Text);
                cmd.Parameters.AddWithValue("@WorkPhone", txtbxWorkPhone.Text);
                cmd.Parameters.AddWithValue("@WorkExt", txtbxExt.Text);
                cmd.Parameters.AddWithValue("@Fax", txtbxFax.Text);
                cmd.Parameters.AddWithValue("@Cell", txtbxCell.Text);
                cmd.Parameters.AddWithValue("@email", txtbxEmail.Text);
                cmd.Parameters.AddWithValue("@JobCategory", cbxJobCategory.Value);
                cmd.Parameters.AddWithValue("@JobTitle", txtbxJobTitle.Text);
                cmd.Parameters.AddWithValue("@UserName", txtBxUserName.Text);
                cmd.Parameters.AddWithValue("@UserLevel", cbxUserLevel.Value);
                cmd.Parameters.AddWithValue("@Active", chkActive.Checked);
                cmd.Parameters.AddWithValue("@UserID", Convert.ToInt64(Session["ContactID"]));

                try
                {
                    var result = (int)cmd.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    ExceptionUtility.LogException(ex, "Edit User - SaveUserInfo");
                    throw;
                }                
            }
        }

        protected void SaveProtocolInfo(SqlConnection conn)
        {
            using (SqlCommand cmd = new SqlCommand("[OHSN_Web_UserInfo_Update]", conn))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@ContactID", Convert.ToInt64(Session["WorkingContactID"]));

                try
                {
                    var result = (int)cmd.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    ExceptionUtility.LogException(ex, "Edit User - SaveProtocolInfo");
                    throw;
                }

            }
        }

        protected void Save()
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["OHSN"].ConnectionString))
            {
                try
                {
                    conn.Open();

                    SaveUserInfo(conn);

                    conn.Close();
                    
                }
                catch (Exception ex)
                {
                    ExceptionUtility.LogException(ex, "Edit User - Save");
                    throw;
                }
            }
        }

        protected void ResetPrivileges()
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["OHSN"].ConnectionString))
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand("OHSN_Web_ResetUserPrivileges", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@ContactID", Session["WorkingContactID"]);
                    cmd.Parameters.AddWithValue("@UserCategory", cbxUserLevel.Value);
                    var result = (int)cmd.ExecuteNonQuery();
                }

                conn.Close();
            }

            dsPrivileges.DataBind();
            gvPrivileges.DataBind();
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

                case "btnResetPrivileges":
                    {
                        ResetPrivileges();
                        break;
                    }
	        }        
        }

        protected void cbxUserLevel_SelectedIndexChanged(object sender, EventArgs e)
        {
            ResetPrivileges();
        }

        protected void cbxUserLevel_ValueChanged(object sender, EventArgs e)
        {
            ResetPrivileges();
        }

    }
}