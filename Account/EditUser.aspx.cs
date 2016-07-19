namespace CustomerPortal.Account
{
    using CustomerPortal.Classes;
    using CustomerPortal.Utility;
    using System;
    using System.Collections.Generic;
    using System.Configuration;
    using System.Data;
    using System.Data.SqlClient;
    using System.Web;
    using System.Web.UI;
    using System.Web.UI.WebControls;
    using System.Data.SqlClient;
    using System.Configuration;

    public partial class EditUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Redirect to Login if NOT logged in
            if (Session["ContactID"] == null)
            {
                Response.Redirect("~/Default.aspx");
            }

            // Set Login Header
            CustomerPortal.RootMaster siteMasterPage = (CustomerPortal.RootMaster)this.Master;
            if (siteMasterPage != null)
            {
                siteMasterPage.SetLoginLabels();
            }

            // Validate that the user has access to this page
            if (Session["Privileges"] != null)
            {
                try
                {
                    Dictionary<string, Priviliges> priv = Session["Privileges"] as Dictionary<string, Priviliges>;
                    Priviliges p = priv["User Account Management"];

                    if (p.AllowAccess == 0 || p.AllowAddorEdit == 0)
                    {
                        Response.Redirect("~/Account/UserManagement.aspx");
                    }
                }
                catch (KeyNotFoundException)
                {
                    Response.Redirect("~/Account/UserManagement.aspx");
                }
                catch (Exception ex)
                {
                    ExceptionUtility.LogException(ex, "Edit User - Page_Load");
                    Response.Redirect("~/Account/UserManagement.aspx");
                }
            }

            // Load Data
            try
            {
                dsJobCategory.DataBind();
                dsProtocols.DataBind();
                dsUserLevel.DataBind();
                dsDeliveryMethod.DataBind();
            }
            catch (Exception ex)
            {
                ExceptionUtility.LogException(ex, "Edit User - Page_Load");

                HttpContext.Current.Response.Redirect("~/ErrorPage.aspx");
            }

            if (!this.IsPostBack)
            {
                Load();
            }
        }

        protected void Load()
        {
            try
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
                    chkActive.Value = Convert.ToBoolean(dvContactInfo[0]["Active"]);
                    dsPrivileges.DataBind();


                    cbxJobCategory.DataBind();
                    if (string.IsNullOrEmpty(dvContactInfo[0]["JobCategory"].ToString()) == false)
                    {
                        for (int i = 0; i < cbxJobCategory.Items.Count; i++)
                        {
                            if (Convert.ToInt32(cbxJobCategory.Items[i].Value) == Convert.ToInt32(dvContactInfo[0]["JobCategory"]))
                            {
                                cbxJobCategory.SelectedIndex = i;
                            }
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

                    if (Convert.ToInt32(dvContactInfo[0]["UserLevel"]) == 388)
                    {
                        cbxUserLevel.Items.Add(new DevExpress.Web.ListEditItem(){Value=388, Text="Master User", Selected=true});
                    }
                }

                dsProtocols.DataBind();
                dsContactProtocolsInfo.DataBind();

                DataView dvContactProtocolsInfo = (DataView)dsContactProtocolsInfo.Select(DataSourceSelectArguments.Empty);

                if (dvContactProtocolsInfo != null && dvContactProtocolsInfo.Count > 0)
                {
                    foreach (DataRow dr in dvContactProtocolsInfo.Table.Rows)
                    {
                        int rowIndex = gvAuthorizedProtocols.FindVisibleIndexByKeyValue(dr["ProtocolID"].ToString());
                        if (rowIndex > -1)
                        {
                            gvAuthorizedProtocols.Selection.SelectRow(rowIndex);
                        }
                    }
                }

                dsPrivileges.DataBind();
            }
            catch (Exception ex)
            {
                ExceptionUtility.LogException(ex, "Edit User - Load");

                HttpContext.Current.Response.Redirect("~/ErrorPage.aspx");
            } 
        }

        protected void SaveProtocolInfo(SqlConnection conn)
        {
            try
            {
                using (SqlCommand cmd = new SqlCommand("[OHSN_Web_UserInfo_Update]", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@ContactID", Convert.ToInt64(Session["WorkingContactID"]));

                    var result = (int)cmd.ExecuteNonQuery();
                }
            }
            catch (Exception ex)
            {
                ExceptionUtility.LogException(ex, "Edit User - SaveProtocolInfo");

                ExceptionUtility.NotifySupport(ex);

                HttpContext.Current.Response.Redirect("~/ErrorPage.aspx");
            } 
        }

        protected void Save()
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["OHSN"].ConnectionString))
                {
                    conn.Open();

                    using (SqlCommand cmd = new SqlCommand("[OHSN_Web_UserInfo_Update]", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@ContactID", Convert.ToInt64(Session["WorkingContactID"]));
                        cmd.Parameters.AddWithValue("@FirstName", txtbxFirstName.Text);
                        cmd.Parameters.AddWithValue("@LastName", txtbxLastName.Text);
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

                        var result = (int)cmd.ExecuteNonQuery();
                    }

                    conn.Close();
                }
            }
            catch (Exception ex)
            {
                ExceptionUtility.LogException(ex, "Edit User - Save");

                ExceptionUtility.NotifySupport(ex);

                HttpContext.Current.Response.Redirect("~/ErrorPage.aspx");
            } 
        }

        protected void ResetPrivileges()
        {
            try
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
            }
            catch (Exception ex)
            {
                ExceptionUtility.LogException(ex, "Edit User - ResetPrivileges");

                ExceptionUtility.NotifySupport(ex);

                HttpContext.Current.Response.Redirect("~/ErrorPage.aspx");
            }
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
                        gvPrivileges.DataBind();
                        break;
                    }
	        }        
        }

        protected void cbxUserLevel_ValueChanged(object sender, EventArgs e)
        {
            try
            {
                ResetPrivileges();
                gvPrivileges.DataBind();
            }
            catch (Exception ex)
            {
                ExceptionUtility.LogException(ex, "Edit User - cbxUserLevel_ValueChanged");

                HttpContext.Current.Response.Redirect("~/ErrorPage.aspx");
            }
        }

        protected void dsProtocols_Updating(object sender, SqlDataSourceCommandEventArgs e)
        {
            try
            {
                e.Command.Parameters["@ContactID"].Value = Session["WorkingContactID"].ToString();
            }
            catch (Exception ex)
            {
                ExceptionUtility.LogException(ex, "Edit User - cbxUserLevel_ValueChanged");

                HttpContext.Current.Response.Redirect("~/ErrorPage.aspx");
            }
        }
    }
}