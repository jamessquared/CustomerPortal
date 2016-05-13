namespace CustomerPortal.Projects
{
    using CustomerPortal.Classes;
    using CustomerPortal.Utility;
    using System;
    using System.Collections.Generic;
    using System.Configuration;
    using System.Data;
    using System.Data.SqlClient;
    using System.Web;

    public partial class NewProject : System.Web.UI.Page
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
                Dictionary<string, Priviliges> priv = Session["Privileges"] as Dictionary<string, Priviliges>;
                Priviliges p = priv["New Project"];

                if (p.AllowAccess == 0)
                {
                    Response.Redirect("~/Default.aspx");
                }
            }

            // Load Data
            try
            {
                dsStates.DataBind();
                dsJobCategory.DataBind();
                dsRequestType.DataBind();
                dsProtocols.DataBind();
                dsDOT.DataBind();
            }
            catch (Exception ex)
            {
                ExceptionUtility.LogException(ex, "New Project - Page_Load");

                HttpContext.Current.Response.Redirect("~/ErrorPage.aspx");
            }

            dedScheduleBy.Date = DateTime.Now.Date;
            dedCompleteBy.Date = DateTime.MinValue;
        }

        protected void Save()
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["OHSN"].ConnectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("ohsn_web_Project_Insert", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        cmd.Parameters.AddWithValue("@EmployerID", Convert.ToInt64(Session["WorkingEmployerID"]));
                        cmd.Parameters.AddWithValue("@EnteredByTID", Convert.ToInt64(Session["ContactID"]));
                        cmd.Parameters.AddWithValue("@AuthorizedBy", Convert.ToInt64(Session["ContactID"]));

                        cmd.Parameters.AddWithValue("@LastName", txtbxLastName.Text);
                        cmd.Parameters.AddWithValue("@FirstName", txtbxFirstName.Text);
                        cmd.Parameters.AddWithValue("@MI", txtbxMI.Text);

                        cmd.Parameters.AddWithValue("@PrimaryAddressLine", txtbxPrimaryAddressline.Text);
                        cmd.Parameters.AddWithValue("@SecondaryAddressLine", txtbxSecondaryAddressline.Text);
                        cmd.Parameters.AddWithValue("@City", txtbxCity.Text);
                        cmd.Parameters.AddWithValue("@State", cmbxStates.Text);
                        cmd.Parameters.AddWithValue("@PostalCode", txtbxPostalCode.Text);

                        cmd.Parameters.AddWithValue("@DOB", deDOB.Value);
                        cmd.Parameters.AddWithValue("@SSN", txtbxSSN.Text);

                        cmd.Parameters.AddWithValue("@Phone1", txtbxMainPhone.Text);
                        cmd.Parameters.AddWithValue("@Phone2", txtbxAltPhone.Text);
                        cmd.Parameters.AddWithValue("@PatientEmail", txtbxEmail.Text);

                        cmd.Parameters.AddWithValue("@JobTitleClassificationTID", cbxJobCategory.Value);
                        cmd.Parameters.AddWithValue("@JobTitle", txtbxJobTitle.Text);

                        cmd.Parameters.AddWithValue("@ScheduledByDeadline", dedScheduleBy.Value);
                        cmd.Parameters.AddWithValue("@CompletedByDeadline", dedCompleteBy.Value);

                        cmd.Parameters.AddWithValue("@RequestTypeTID", cbxRequestType.Value);
                        cmd.Parameters.AddWithValue("@SpecialInstructions", memSpecialInstructions.Text);
                        cmd.Parameters.AddWithValue("@Protocols", cbxProtocol.Value);

                        // Output
                        SqlParameter param = new SqlParameter("@ProjectID", SqlDbType.BigInt);
                        param.Direction = ParameterDirection.Output;
                        cmd.Parameters.Add(param);

                        var result = (int)cmd.ExecuteNonQuery();

                    }
                    conn.Close();
                }
            }
            catch (Exception ex)
            {
                ExceptionUtility.LogException(ex, "New Project - Save");

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
                        Response.Redirect("~/Default.aspx");
                        break;
                    }

                case "btnSubmit":
                    {
                        Save();
                        Response.Redirect("~/Default.aspx");
                        break;
                    }

                case "btnCancel":
                    {
                        Response.Redirect("~/Default.aspx");
                        break;
                    }
            }
        }

        protected void cbxJobCategory_TextChanged(object sender, EventArgs e)
        {
            dsProtocols.DataBind();
        }
    }
}