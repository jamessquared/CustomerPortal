﻿namespace CustomerPortal.Reports
{
    using CustomerPortal.Classes;
    using CustomerPortal.Utility;
    using System;
    using System.Collections.Generic;
    using System.Configuration;
    using System.Data;
    using System.Data.SqlClient;
    using System.Web;

    public partial class AddDOTDrugandAlcoholMIS : System.Web.UI.Page
    {
        public bool MISReportIsSelected{ get; set; }

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
                Priviliges p = priv["D.O.T. Drug & Alcohol MIS Data Collection"];

                if (p.AllowAccess == 0 || p.AllowAddorEdit == 0)
                {
                    Response.Redirect("~/Default.aspx");
                }
            }

            if (IsCallback)
            {
                MISReportIsSelected = false;
                dsReportYears.DataBind();
                dsDOTAgencyList.DataBind();
                dsDOTEmployeeCategoryList.DataBind();
                dsProjectRequestTypeList.DataBind();
            }
        }

        #region Data Scripts

        protected bool FindEmployerData()
        {
            long result = 0;

            try
            {
                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["OHSN"].ConnectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("OHSN_Web_DOTDrugAndAlcoholMISExists_Select", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@EmployerID", Session["WorkingEmployerID"]);
                        cmd.Parameters.AddWithValue("@ReportYear", (int)cbxCalendarYear.SelectedItem.Value);
                        cmd.Parameters.AddWithValue("@ReportForTID", (int)cbxReportFor.SelectedItem.Value);

                        result = (int)cmd.ExecuteScalar();
                    }

                    conn.Close();
                }
            }
            catch (Exception ex)
            {
                ExceptionUtility.LogException(ex, "AddDOTDrugandAlcoholMIS - FindEmployerData");

                ExceptionUtility.NotifySupport(ex);

                HttpContext.Current.Response.Redirect("~/ErrorPage.aspx");
            }

            return result > 0;
        }

        protected bool FindDrugTestingData()
        {
            long result = 0;
            try
            {
                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["OHSN"].ConnectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("OHSN_Web_DOTDrugAndAlcoholMISDrugTestExists_Select", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@DOTReportID", Session["DOTReportID"]);

                        result = (int)cmd.ExecuteScalar();
                    }

                    conn.Close();
                }
            }
            catch (Exception ex)
            {
                ExceptionUtility.LogException(ex, "AddDOTDrugandAlcoholMIS -  FindDrugTestingData");

                ExceptionUtility.NotifySupport(ex);

                HttpContext.Current.Response.Redirect("~/ErrorPage.aspx");
            }

            return result > 0;
        }

        protected bool FindAlcoholTestingData()
        {
            long result = 0;
            try
            {
                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["OHSN"].ConnectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("OHSN_Web_DOTDrugAndAlcoholMISAlcoholTestExists_Select", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@DOTReportID", Session["DOTReportID"]);

                        result = (int)cmd.ExecuteScalar();
                    }

                    conn.Close();
                }
            }
            catch (Exception ex)
            {
                ExceptionUtility.LogException(ex, "AddDOTDrugandAlcoholMIS -  FindAlcoholTestingData");

                ExceptionUtility.NotifySupport(ex);

                HttpContext.Current.Response.Redirect("~/ErrorPage.aspx");
            }

            return result > 0;
        }

        protected void LoadEmployerData()
        {
            if (cbxCalendarYear.SelectedItem == null || cbxReportFor.SelectedItem == null)
            {
                return;
            }

            try
            {
                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["OHSN"].ConnectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("OHSN_Web_DOTDrugAndAlcoholMIS_Select", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@ID", Session["DOTReportID"]);

                        SqlDataReader rdr = cmd.ExecuteReader();
                        while (rdr.Read())
                        {
                            txtbxCompanyName.Text = Convert.ToString(rdr["CompanyName"]);
                            txtbxDBAName.Text = Convert.ToString(rdr["DBA"]);
                            txtbxAddress.Text = Convert.ToString(rdr["Address"]);
                            txtbxEmail.Text = Convert.ToString(rdr["Email"]);
                            txtbxNameOfCertifyingOfficial.Text = Convert.ToString(rdr["CertifyingOffical"]);
                            txtbxTelephone.Text = Convert.ToString(rdr["CertifyingOfficalTelephone"]);
                            if (rdr["DateCertified"] != DBNull.Value)
                            {
                                dedDateCertified.Date = Convert.ToDateTime(rdr["DateCertified"]);
                            }

                            txtbxPreparedBy.Text = Convert.ToString(rdr["PreparedBy"]);
                            txtbxPreparedByTelephone.Text = Convert.ToString(rdr["PreparedByTelephone"]);
                            txtbxTPAName.Text = Convert.ToString(rdr["TPA"]);
                            txtbxTPATelephoneNumber.Text = Convert.ToString(rdr["TPAPhone"]);

                            txtbxTotalNoOfSafetySensitveEmployees.Text = Convert.ToString(rdr["CoverEmployeesAllCategories"]);
                            txtbxTotalNoOfEmployeeCategories.Text = Convert.ToString(rdr["CoverEmployeesTotalNoOfCategories"]);
                            txtbxEmployeeCategory.Text = Convert.ToString(rdr["CoverEmployeesCategory"]);
                            txtbxTotalNoOfEmployeesInThisCategory.Text = Convert.ToString(rdr["CoverEmployeesTotalNoOfInCategory"]);
                        }
                    }

                    conn.Close();
                }
            }
            catch (Exception ex)
            {
                ExceptionUtility.LogException(ex, "Edit Protocol - SelectProtocolServices");

                ExceptionUtility.NotifySupport(ex);

                HttpContext.Current.Response.Redirect("~/ErrorPage.aspx");
            }
        }

        protected void InsertEmployerData()
        {
            if (cbxCalendarYear.SelectedItem == null || cbxReportFor.SelectedItem == null)
            {
                return;
            }

            try
            {
                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["OHSN"].ConnectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("OHSN_Web_DOTDrugAndAlcoholMIS_Insert", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@EmployerID", Session["WorkingEmployerID"]);
                        cmd.Parameters.AddWithValue("@ReportYear", cbxCalendarYear.SelectedItem.Value);
                        cmd.Parameters.AddWithValue("@ReportForTID", cbxReportFor.SelectedItem.Value);
                        cmd.Parameters.AddWithValue("@EmployeeCategory", cbxEmployeeCategory.SelectedItem.Value);

                        SqlParameter param = new SqlParameter("@ID", SqlDbType.BigInt);
                        param.Direction = ParameterDirection.Output;
                        cmd.Parameters.Add(param);

                        cmd.ExecuteNonQuery();

                        Session["DOTReportID"] = param.Value;
                    }

                    conn.Close();
                }
            }
            catch (Exception ex)
            {
                ExceptionUtility.LogException(ex, "DOTDrugandAlcoholMIS - InsertEmployerData");

                ExceptionUtility.NotifySupport(ex);

                HttpContext.Current.Response.Redirect("~/ErrorPage.aspx");
            }
        }

        protected void InsertDrugTestingDataRecords(string typeOfTest)
        {
            long calendarYear = 0;
            long reportFor = 0;

            if (cbxCalendarYear.SelectedItem != null)
            {
                calendarYear = (int)cbxCalendarYear.SelectedItem.Value;
            }

            if (cbxReportFor.SelectedItem != null)
            {
                reportFor = (int)cbxReportFor.SelectedItem.Value;
            }

            try
            {
                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["OHSN"].ConnectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("OHSN_Web_DOTDrugAndAlcoholMISDrugTestingData_Insert", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        cmd.Parameters.AddWithValue("@EmployerID", Session["WorkingEmployerID"]);
                        cmd.Parameters.AddWithValue("@ReportYear", calendarYear);
                        cmd.Parameters.AddWithValue("@ReportForTID", reportFor);
                        cmd.Parameters.AddWithValue("@EmployeeCategory", cbxEmployeeCategory.SelectedItem.Value);
                        cmd.Parameters.AddWithValue("@TypeOfTest", typeOfTest);

                        cmd.ExecuteNonQuery();

                    }

                    conn.Close();
                }
            }
            catch (Exception ex)
            {
                ExceptionUtility.LogException(ex, "DOTDrugandAlcoholMIS - InsertDrugTestingDataRecords");

                ExceptionUtility.NotifySupport(ex);

                HttpContext.Current.Response.Redirect("~/ErrorPage.aspx");
            }
        }

        protected void InsertDrugTestingData()
        {
            InsertDrugTestingDataRecords("Pre-Employment");
            InsertDrugTestingDataRecords("Random");
            InsertDrugTestingDataRecords("Post Accident");
            InsertDrugTestingDataRecords("Reasonable Suspicion");
            InsertDrugTestingDataRecords("Return to Duty");
            InsertDrugTestingDataRecords("Follow-up");
        }

        protected void InsertAlcoholTestingDataRecords(string typeOfTest)
        {
            long calendarYear = 0;
            long reportFor = 0;

            if (cbxCalendarYear.SelectedItem != null)
            {
                calendarYear = (int)cbxCalendarYear.SelectedItem.Value;
            }

            if (cbxReportFor.SelectedItem != null)
            {
                reportFor = (int)cbxReportFor.SelectedItem.Value;
            }

            try
            {
                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["OHSN"].ConnectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("OHSN_Web_DOTDrugAndAlcoholMISAlcoholTestingData_Insert", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        cmd.Parameters.AddWithValue("@EmployerID", Session["WorkingEmployerID"]);
                        cmd.Parameters.AddWithValue("@ReportYear", calendarYear);
                        cmd.Parameters.AddWithValue("@ReportForTID", reportFor);
                        cmd.Parameters.AddWithValue("@EmployeeCategory", cbxEmployeeCategory.SelectedItem.Value);
                        cmd.Parameters.AddWithValue("@TypeOfTest", typeOfTest);

                        cmd.ExecuteNonQuery();

                    }

                    conn.Close();
                }
            }
            catch (Exception ex)
            {
                ExceptionUtility.LogException(ex, "DOTDrugandAlcoholMIS - InsertAlcoholTestingDataRecords");

                ExceptionUtility.NotifySupport(ex);

                HttpContext.Current.Response.Redirect("~/ErrorPage.aspx");
            }
        }

        protected void InsertAlcoholTestingData()
        {
            InsertAlcoholTestingDataRecords("Pre-Employment");
            InsertAlcoholTestingDataRecords("Random");
            InsertAlcoholTestingDataRecords("Post Accident");
            InsertAlcoholTestingDataRecords("Reasonable Suspicion");
            InsertAlcoholTestingDataRecords("Return to Duty");
            InsertAlcoholTestingDataRecords("Follow-up");
        }

        private bool Save()
        {
            bool result = false;

            try
            {
                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["OHSN"].ConnectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("OHSN_Web_DOTDrugAndAlcoholMIS_Update", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@ID", Session["DOTReportID"]);
                        cmd.Parameters.AddWithValue("@EmployerID", Session["WorkingEmployerID"]);
                        //
                        cmd.Parameters.AddWithValue("@DoingBusinessAs", txtbxDBAName.Text);

                        cmd.Parameters.AddWithValue("@Email", txtbxEmail.Text);
                        //
                        cmd.Parameters.AddWithValue("@CertifyingOFfical", txtbxNameOfCertifyingOfficial.Text);
                        cmd.Parameters.AddWithValue("@CertifyingOfficalTelephone", txtbxTelephone.Text);
                        cmd.Parameters.AddWithValue("@DateCertified", dedDateCertified.Date.ToString());
                        //
                        cmd.Parameters.AddWithValue("@PreparedBy", txtbxPreparedBy.Text);
                        cmd.Parameters.AddWithValue("@PreparedByTelephone", txtbxPreparedByTelephone.Text);
                        //
                        cmd.Parameters.AddWithValue("@FMCSA", ckFMCSA.Checked);
                        cmd.Parameters.AddWithValue("@FMCSADOTNo", txtbxFMCSADOTNo.Text);
                        cmd.Parameters.AddWithValue("@FMCSAOwnerOperator", ckFMCSAOwnerOperator.Checked);
                        cmd.Parameters.AddWithValue("@FMCSAExempt", ckFMCSAExempt.Checked);
                        cmd.Parameters.AddWithValue("@FAA", ckFAA.Checked);
                        cmd.Parameters.AddWithValue("@FAACertificationNo", txtbxFAACertificateNo.Text);
                        cmd.Parameters.AddWithValue("@FAAPlanRegistration", txtbxFAAPlanRegistration.Text);
                        cmd.Parameters.AddWithValue("@PHMSA", ckPHMSA.Checked);
                        cmd.Parameters.AddWithValue("@PHMSAGasGathering", ckPHMSAGasGathering.Checked);
                        cmd.Parameters.AddWithValue("@PHMSAGasTransmission", ckPHMSAGasTransmission.Checked);
                        cmd.Parameters.AddWithValue("@PHMSAGasDistribution", ckPHMSAGasDistribution.Checked);
                        cmd.Parameters.AddWithValue("@PHMSATransportHazardousLiquids", ckPHMSATransportHazardousLiquids.Checked);
                        cmd.Parameters.AddWithValue("@PHMSATransportCarbonDioxide", ckPHMSATransportCarbonDioxide.Checked);
                        cmd.Parameters.AddWithValue("@FRA", ckFRA.Checked);
                        cmd.Parameters.AddWithValue("@FRACoveredEmployees", txtbxFRACoveredEmployees.Text);
                        cmd.Parameters.AddWithValue("@USCG", ckUSCG.Checked);
                        cmd.Parameters.AddWithValue("@USCGVesselID", txtbxUSCGVesselID.Text);
                        //
                        cmd.Parameters.AddWithValue("@CoveredEmployeesA", txtbxTotalNoOfSafetySensitveEmployees.Text);
                        cmd.Parameters.AddWithValue("@CoveredEmployeesB", txtbxTotalNoOfEmployeeCategories.Text);
                        cmd.Parameters.AddWithValue("@CoveredEmployeesC1", txtbxEmployeeCategory.Text);
                        cmd.Parameters.AddWithValue("@CoveredEmployeesC2", txtbxTotalNoOfEmployeesInThisCategory.Text);


                        result = cmd.ExecuteNonQuery() > 0;
                    }

                    conn.Close();
                }
            }
            catch (Exception ex)
            {
                ExceptionUtility.LogException(ex, "AddDOTDrugandAlcoholMIS - Save");

                ExceptionUtility.NotifySupport(ex);

                HttpContext.Current.Response.Redirect("~/ErrorPage.aspx");
            }

            return result;
        }

        private bool Cancel()
        {
            bool result = false;

            try
            {
                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["OHSN"].ConnectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("OHSN_Web_DOTDrugAndAlcoholMIS_Delete", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@ID", Session["DOTReportID"]);

                        result = cmd.ExecuteNonQuery() > 0;
                    }

                    conn.Close();
                }
            }
            catch (Exception ex)
            {
                ExceptionUtility.LogException(ex, "AddDOTDrugandAlcoholMIS - Save");

                ExceptionUtility.NotifySupport(ex);

                HttpContext.Current.Response.Redirect("~/ErrorPage.aspx");
            }

            return result;
        }

        #endregion

        #region Form Controls

        protected void mainToolbar_CommandExecuted(object source, DevExpress.Web.RibbonCommandExecutedEventArgs e)
        {
            switch (e.Item.Name)
            {
                case "btnBack":
                case "btnCancel":
                    {
                        cbxCalendarYear.SelectedIndexChanged -= null;
                        cbxReportFor.SelectedIndexChanged -= null;

                        if (FindEmployerData() == false || Cancel() == true)
                        {
                            Response.Redirect("~/Reports/DOTDrugandAlcoholMISManagement.aspx");
                        }

                        break;
                    }

                case "btnSubmit":
                    {
                        if (Save() == true)
                        {
                            Response.Redirect("~/Reports/DOTDrugandAlcoholMISManagement.aspx");
                        }
                        
                        break;
                    }
            }
        }

        private void ClearFMCSAFields()
        {
            ckFMCSA.Checked = false;
            txtbxFMCSADOTNo.Text = string.Empty;
            ckFMCSAOwnerOperator.Checked = false;
            ckFMCSAExempt.Checked = false;

            ckFMCSA.Enabled = false;
            txtbxFMCSADOTNo.Enabled = false;
            ckFMCSAOwnerOperator.Enabled = false;
            ckFMCSAExempt.Enabled = false;
        }

        private void ClearFAAFields()
        {
            ckFAA.Checked = false;
            txtbxFAACertificateNo.Text = string.Empty;
            txtbxFAAPlanRegistration.Text = string.Empty;

            ckFAA.Enabled = false;
            txtbxFAACertificateNo.Enabled = false;
            txtbxFAAPlanRegistration.Enabled = false;
        }

        private void ClearPHMSAFields()
        {
            ckPHMSA.Checked = false;
            ckPHMSAGasDistribution.Checked = false;
            ckPHMSAGasGathering.Checked = false;
            ckPHMSAGasTransmission.Checked = false;
            ckPHMSATransportCarbonDioxide.Checked = false;
            ckPHMSATransportHazardousLiquids.Checked = false;

            ckPHMSA.Enabled = false;
            ckPHMSAGasDistribution.Enabled = false;
            ckPHMSAGasGathering.Enabled = false;
            ckPHMSAGasTransmission.Enabled = false;
            ckPHMSATransportCarbonDioxide.Enabled = false;
            ckPHMSATransportHazardousLiquids.Enabled = false;
        }

        private void ClearFRAFields()
        {
            ckFRA.Checked = false;
            txtbxFRACoveredEmployees.Text = string.Empty;

            ckFRA.Enabled = false;
            txtbxFRACoveredEmployees.Enabled = false;
        }

        private void ClearUSCGFiels()
        {
            ckUSCG.Checked = false;
            txtbxUSCGVesselID.Text = string.Empty;

            ckUSCG.Enabled = false;
            txtbxUSCGVesselID.Enabled = false;
        }

        private void ClearFTAFields()
        {
            ckFTA.Checked = false;

            ckFTA.Enabled = false;
        }

        private void ConfigureFields()
        {
            //FindTheData();

            switch (cbxReportFor.Text)
            {
                case "Federal Motor Carrier Safety Administration":
                    {
                        ClearFAAFields();
                        ClearPHMSAFields();
                        ClearFRAFields();
                        ClearUSCGFiels();
                        ClearFTAFields();

                        ckFMCSA.Checked = true;
                        ckFMCSA.Enabled = true;
                        txtbxFMCSADOTNo.Enabled = true;
                        ckFMCSAOwnerOperator.Enabled = true;
                        ckFMCSAExempt.Enabled = true;

                        break;
                    }

                case "Federal Aviation Administration":
                    {
                        ClearFMCSAFields();
                        ClearPHMSAFields();
                        ClearFRAFields();
                        ClearUSCGFiels();
                        ClearFTAFields();

                        ckFAA.Checked = true;
                        ckFAA.Enabled = true;
                        txtbxFAACertificateNo.Enabled = true;
                        txtbxFAAPlanRegistration.Enabled = true;

                        break;
                    }

                case "Pipeline and Hazardous Materials Safety Administration":
                    {
                        ClearFMCSAFields();
                        ClearFAAFields();
                        ClearFRAFields();
                        ClearUSCGFiels();
                        ClearFTAFields();

                        ckPHMSA.Checked = true;
                        ckPHMSA.Enabled = true;
                        ckPHMSAGasDistribution.Enabled = true;
                        ckPHMSAGasGathering.Enabled = true;
                        ckPHMSAGasTransmission.Enabled = true;
                        ckPHMSATransportCarbonDioxide.Enabled = true;
                        ckPHMSATransportHazardousLiquids.Enabled = true;

                        break;
                    }

                case "Federal Railroad Administration":
                    {
                        ClearFMCSAFields();
                        ClearFAAFields();
                        ClearPHMSAFields();
                        ClearUSCGFiels();
                        ClearFTAFields();

                        ckFRA.Checked = true;
                        ckFRA.Enabled = true;
                        txtbxFRACoveredEmployees.Enabled = true;

                        break;
                    }

                case "United States Coast Guard":
                    {
                        ClearFMCSAFields();
                        ClearFAAFields();
                        ClearPHMSAFields();
                        ClearFTAFields();

                        ckUSCG.Checked = true;
                        ckUSCG.Enabled = true;
                        txtbxUSCGVesselID.Enabled = true;

                        break;
                    }

                case "Federal Transit Administration":
                    {
                        ClearFMCSAFields();
                        ClearFAAFields();
                        ClearPHMSAFields();

                        ckFTA.Checked = true;
                        ckFTA.Enabled = true;
                        break;
                    }

                default:
                    break;
            }
        }

        protected void cbxCalendarYear_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["DOTReportYear"] = cbxCalendarYear.Value;

            dsDOTAgencyList.DataBind();
        }

        protected void cbxcbxReportFor_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (this.MISReportIsSelected)
            {
                return;
            }

            Session["DOTReportFor"] = cbxReportFor.Value;
            ConfigureFields();
            dsDOTEmployeeCategoryList.DataBind();


        }

        protected void cbxEmployeeCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (this.MISReportIsSelected)
            {
                return;
            }

            if ((string.IsNullOrEmpty(cbxCalendarYear.Text) == true) || (string.IsNullOrEmpty(cbxReportFor.Text) == true) || (string.IsNullOrEmpty(cbxEmployeeCategory.Text) == true))
            {
                return;
            }

            Session["EmployeeCategory"] = cbxEmployeeCategory.Value;
            this.MISReportIsSelected = true;

            if (FindEmployerData() == false)
            {
                InsertEmployerData();
            }

            // Load the Master Record - Populates the Session[DOTReportID] variable
            LoadEmployerData();

            if (FindDrugTestingData() == false)
            {
                // Child Records
                InsertDrugTestingData();
            }

            dsDOTDrugandAlcoholMISDrugTestData.DataBind();

            if (FindAlcoholTestingData() == false)
            {
                InsertAlcoholTestingData();
            }

            dsDOTDrugandAlcoholMISAlcoholTestData.DataBind();

            ConfigureFields();

            cbxCalendarYear.Enabled = false;
            cbxReportFor.Enabled = false;
            cbxEmployeeCategory.Enabled = false; 
        }

        #endregion
    }
}