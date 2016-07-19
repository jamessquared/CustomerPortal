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
                try
                {
                    Dictionary<string, Priviliges> priv = Session["Privileges"] as Dictionary<string, Priviliges>;
                    Priviliges p = priv["New Project"];

                    if (p.AllowAccess == 0)
                    {
                        Response.Redirect("~/Default.aspx");
                    }
                }
                catch (KeyNotFoundException)
                {
                    Response.Redirect("~/Default.aspx");
                }
                catch (Exception ex)
                {
                    ExceptionUtility.LogException(ex, "New Project - Page_Load");
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
                dsDOTAgency.DataBind();
            }
            catch (Exception ex)
            {
                ExceptionUtility.LogException(ex, "New Project - Page_Load");

                HttpContext.Current.Response.Redirect("~/ErrorPage.aspx");
            }

            deScheduleBy.Date = DateTime.Now.Date;
            deCompleteBy.Date = DateTime.MinValue;
        }

        protected bool IsValid()
        {
            bool result = true;

            // Patient MUST have a Name
            if (string.IsNullOrEmpty(txtbxLastName.Text))
            {
                txtbxLastName.ErrorText = "Cannot be blank";
                txtbxLastName.IsValid = false;
                result = false;
            }

            if (string.IsNullOrEmpty(txtbxFirstName.Text))
            {
                txtbxFirstName.ErrorText = "Cannot be blank";
                txtbxFirstName.IsValid = false;
                result = false;
            }

            // Patient MUST have an Address
            if (string.IsNullOrEmpty(txtbxPrimaryAddressline.Text))
            {
                txtbxPrimaryAddressline.ErrorText = "Cannot be blank";
                txtbxPrimaryAddressline.IsValid = false;
                result = false;
            }

            if (string.IsNullOrEmpty(cbxState.Text))
            {
                cbxState.ErrorText = "Cannot be blank";
                cbxState.IsValid = false;
                result = false;
            }
                
            if (string.IsNullOrEmpty(txtbxPostalCode.Text))
            {
                txtbxPostalCode.ErrorText = "Cannot be blank";
                txtbxPostalCode.IsValid = false;
                result = false;
            }

            // Must have a contact phone
            if (string.IsNullOrEmpty(txtbxMainPhone.Text))
            {
                txtbxMainPhone.ErrorText = "Cannot be blank";
                txtbxMainPhone.IsValid = false;
                result = false;
            }

            // Must have a Date of Birth
            if (string.IsNullOrEmpty(deDOB.Text))
            {
                deDOB.ErrorText = "Cannot be blank";
                deDOB.IsValid = false;
                result = false;
            }

            // Must have a SSN
            if (string.IsNullOrEmpty(txtbxSSN.Text))
            {
                txtbxSSN.ErrorText = "Cannot be blank";
                txtbxSSN.IsValid = false;
                result = false;
            }

            // Must have a Protocol
            if (string.IsNullOrEmpty(cbxProtocol.Text))
            {
                cbxProtocol.ErrorText = "Cannot be blank";
                cbxProtocol.IsValid = false;
                result = false;
            }

            // Must have a Schedule by
            if (string.IsNullOrEmpty(deScheduleBy.Text))
            {
                deScheduleBy.ErrorText = "Cannot be blank";
                deScheduleBy.IsValid = false;
                result = false;
            }

            // If it is a DOT Protocol then must have an Agency & Category
             if (cbxProtocol.SelectedItem != null && (bool)cbxProtocol.SelectedItem.GetValue("ReportToMIS") && (string.IsNullOrEmpty(cbxDOTAgency.Text) || string.IsNullOrEmpty(cbxDOTServiceCategory.Text)))
             {
                 cbxDOTAgency.ErrorText = "Cannot be blank";
                 cbxDOTAgency.IsValid = false;
                 result = false;
             }

            return result;
        }
        protected bool Save()
        {
            bool result = false;

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
                        cmd.Parameters.AddWithValue("@State", cbxState.Text);
                        cmd.Parameters.AddWithValue("@PostalCode", txtbxPostalCode.Text);

                        cmd.Parameters.AddWithValue("@DOB", deDOB.Value);
                        cmd.Parameters.AddWithValue("@SSN", txtbxSSN.Text);

                        cmd.Parameters.AddWithValue("@Phone1", txtbxMainPhone.Text);
                        cmd.Parameters.AddWithValue("@Phone2", txtbxAltPhone.Text);
                        cmd.Parameters.AddWithValue("@PatientEmail", txtbxEmail.Text);

                        cmd.Parameters.AddWithValue("@JobTitleClassificationTID", cbxJobCategory.Value);
                        cmd.Parameters.AddWithValue("@JobTitle", txtbxJobTitle.Text);

                        cmd.Parameters.AddWithValue("@ScheduledByDeadline", deScheduleBy.Value);
                        cmd.Parameters.AddWithValue("@CompletedByDeadline", deCompleteBy.Value);

                        cmd.Parameters.AddWithValue("@RequestTypeTID", cbxRequestType.Value);
                        cmd.Parameters.AddWithValue("@SpecialInstructions", memSpecialInstructions.Text);
                        cmd.Parameters.AddWithValue("@Protocols", cbxProtocol.Value);

                        cmd.Parameters.AddWithValue("@DOTAgencyTID",  cbxDOTAgency.Value);
                        cmd.Parameters.AddWithValue("@DOTServiceCategoryTID", cbxDOTServiceCategory.Value);

                        // Output
                        SqlParameter param = new SqlParameter("@ProjectID", SqlDbType.BigInt);
                        param.Direction = ParameterDirection.Output;
                        cmd.Parameters.Add(param);

                        result = ((int)cmd.ExecuteNonQuery() > 0);

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

            return result;
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
                        if (IsValid())
                        {
                            if (Save())
                            {
                                Response.Redirect("~/Default.aspx");
                            }
                            else
                            {
                                Exception ex = new Exception("Project record did not save!");
                                ExceptionUtility.LogException(ex, "New Project - mainToolbar_CommandExecuted");
                                HttpContext.Current.Response.Redirect("~/ErrorPage.aspx");
                            }
                        }
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

        protected void cbxDOTAgency_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            dsDOTServiceCategory.DataBind();
        }

        protected void cbxDOTAgency_SelectedIndexChanged(object sender, EventArgs e)
        {
            dsDOTServiceCategory.DataBind();
        }

        protected void cbxProtocol_ValueChanged(object sender, EventArgs e)
        {
            bool reportToMIS = (bool)cbxProtocol.SelectedItem.GetValue("ReportToMIS");
            lblDOTAgency.Visible = reportToMIS;
            cbxDOTAgency.Visible = reportToMIS;
            lblDOTServiceAgency.Visible = reportToMIS;
            cbxDOTServiceCategory.Visible = reportToMIS;

            // Clear out DOT info in case Protocol was switched from Report to MIS to Don't report to MIS
            if (reportToMIS == false)
            {
                cbxDOTAgency.SelectedIndex = -1;
                cbxDOTServiceCategory.SelectedIndex = -1;
            }
        }
    }
}