namespace CustomerPortal.Projects
{
    using CustomerPortal.Classes;
    using CustomerPortal.Utility;
    using DevExpress.Web;
    using System;
    using System.Collections.Generic;
    using System.Configuration;
    using System.Data;
    using System.Data.SqlClient;
    using System.IO;
    using System.Web;
    using System.Web.UI;

    public partial class ProjectDOT : System.Web.UI.Page
    {
        private void LoadProjectInfo(bool showResults)
        {
            try
            {
                string ProjectIDNo = string.Empty;
                string CompanyIDNo = string.Empty;

                if (Session["ProjectID"] != null)
                {
                    dsProjectDetails.DataBind();
                    DataView dv = (DataView)dsProjectDetails.Select(DataSourceSelectArguments.Empty);

                    txtbxProjectID.Text = dv[0]["ID"].ToString();
                    txtbxLastName.Text = dv[0]["LastName"].ToString();
                    txtbxFirstName.Text = dv[0]["FirstName"].ToString();
                    txtbxMI.Text = dv[0]["MI"].ToString();
                    txtbxPrimaryAddressline.Text = dv[0]["PrimaryAddressline"].ToString();
                    txtbxSecondaryAddressline.Text = dv[0]["SecondaryAddressline"].ToString();
                    txtbxCity.Text = dv[0]["City"].ToString();
                    txtbxState.Text = dv[0]["State"].ToString();
                    txtbxPostalCode.Text = dv[0]["PostalCode"].ToString();
                    txtbxDOB.Text = dv[0]["DOB"].ToString();
                    txtbxPhone.Text = dv[0]["Phone1"].ToString();
                    txtbxSecondPhone.Text = dv[0]["Phone2"].ToString();
                    txtbxEmail.Text = dv[0]["PatientEmail"].ToString();
                    txtbxJobTitle.Text = dv[0]["JobTitle"].ToString();
                    memSpecialInstructions.Text = dv[0]["SpecialInstructions"].ToString();
                    txtbxRequestType.Text = dv[0]["RequestType"].ToString();
                    txtbxScheduleBy.Text = dv[0]["ScheduledByDeadline"].ToString();
                    txtbxCompleteBy.Text = dv[0]["CompletedByDeadline"].ToString();
                    txtbxDOTAgency.Text = Convert.ToString(dv[0]["DOTAgency"]);
                    txtbxDOTServiceCategory.Text = Convert.ToString(dv[0]["DOTServiceCategory"]);
                    // Drugs

                    if (Convert.ToBoolean(dv[0]["ResultNegative"]))
                    {
                        rblDrugTestRefused.SelectedIndex = 0;
                    }

                    if (Convert.ToBoolean(dv[0]["DrugTestWasCancelled"]))
                    {
                        rblDrugTestResults.SelectedIndex = 1;
                    }

                    if (Convert.ToBoolean(dv[0]["Adulterated"]) || Convert.ToBoolean(dv[0]["Substituted"]) || Convert.ToBoolean(dv[0]["ShyBladder"]) || Convert.ToBoolean(dv[0]["DrugOtherRefusal"]))
                    {
                        rblDrugTestResults.SelectedIndex = 2;
                        rblDrugTestRefused.Visible = true;

                        if (Convert.ToBoolean(dv[0]["Adulterated"]))
                        {
                            rblDrugTestRefused.SelectedIndex = 0;
                        }

                        if (Convert.ToBoolean(dv[0]["Substituted"]))
                        {
                            rblDrugTestRefused.SelectedIndex = 1;
                        }

                        if (Convert.ToBoolean(dv[0]["ShyBladder"]))
                        {
                            rblDrugTestRefused.SelectedIndex = 2;
                        }

                        if (Convert.ToBoolean(dv[0]["DrugOtherRefusal"]))
                        {
                            rblDrugTestRefused.SelectedIndex = 3;
                        }
                    }

                    if (Convert.ToBoolean(dv[0]["PositiveForMarijuana"]) || Convert.ToBoolean(dv[0]["PositiveForCocaine"]) || Convert.ToBoolean(dv[0]["PositiveForPCP"]) || Convert.ToBoolean(dv[0]["PositiveForOpiates"]) || Convert.ToBoolean(dv[0]["PositiveForAmphetamines"]))
                    {
                        rblDrugTestResults.SelectedIndex = 3;
                        clbDrugTestPositiveResults.Visible = true;
                        clbDrugTestPositiveResults.Items[0].Selected = Convert.ToBoolean(dv[0]["PositiveForMarijuana"]);
                        clbDrugTestPositiveResults.Items[1].Selected = Convert.ToBoolean(dv[0]["PositiveForCocaine"]);
                        clbDrugTestPositiveResults.Items[2].Selected = Convert.ToBoolean(dv[0]["PositiveForPCP"]);
                        clbDrugTestPositiveResults.Items[3].Selected = Convert.ToBoolean(dv[0]["PositiveForOpiates"]);
                        clbDrugTestPositiveResults.Items[4].Selected = Convert.ToBoolean(dv[0]["PositiveForAmphetamines"]);
                    }

                    ckBlindSpecimensSubmitted.Checked = Convert.ToBoolean(dv[0]["BlindSpecimensSubmitted"]);
                    ckSecondCollectionPerformed.Checked = Convert.ToBoolean(dv[0]["SecondCollectionPerformed"]);

                    // Alcohol
                    if (Convert.ToBoolean(dv[0]["ResultLessthan02"]))
                    {
                        rblAlcoholTestResults.SelectedIndex = 0;
                    }

                    if (Convert.ToBoolean(dv[0]["AlcoholTestWasCancelled"]))
                    {
                        rblAlcoholTestResults.SelectedIndex = 1;
                    }

                    if (Convert.ToBoolean(dv[0]["ShyLung"]) || Convert.ToBoolean(dv[0]["AlcoholOtherRefusal"]))
                    {
                        rblAlcoholTestResults.SelectedIndex = 2;
                        rblAlcoholTestRefused.Visible = true;

                        if (Convert.ToBoolean(dv[0]["ShyLung"]))
                        {
                            rblAlcoholTestRefused.SelectedIndex = 0;
                        }

                        if (Convert.ToBoolean(dv[0]["AlcoholOtherRefusal"]))
                        {
                            rblAlcoholTestRefused.SelectedIndex = 1;
                        }
                    }

                    if (Convert.ToBoolean(dv[0]["Result02orGreater"]))
                    {
                        rblAlcoholTestResults.SelectedIndex = 3;
                        rblAlcoholTestPositiveResults.Visible = true;

                        if (Convert.ToBoolean(dv[0]["ConfirmationResultBetween02and039"]))
                        {
                            rblAlcoholTestPositiveResults.SelectedIndex = 0;
                        }

                        if (Convert.ToBoolean(dv[0]["ConfirmationResultGreaterorequalto04"]))
                        {
                            rblAlcoholTestPositiveResults.SelectedIndex = 1;
                        }
                    }

                    //
                    CompanyIDNo = dv[0]["CompanyIDNo"].ToString();
                    ProjectIDNo = dv[0]["ProjectIDNo"].ToString();
 
                    // Load Results
                    if (showResults && string.IsNullOrEmpty(CompanyIDNo) == false && string.IsNullOrEmpty(ProjectIDNo) == false)
                    {
                        DataTable table = CreateTable();
                        AddGridViewColumns(table);

                        var filePath = string.Format("\\\\{0}\\{1}\\{2}\\Patients\\{3}\\Results", ConfigurationManager.AppSettings["FileServer"].ToString(), ConfigurationManager.AppSettings["FileRootPath"].ToString(), CompanyIDNo, ProjectIDNo);

                        if (Directory.Exists(filePath))
                        {
                            DirectoryInfo di = new DirectoryInfo(filePath);

                            int ndx = 1;
                            foreach (FileInfo fi in di.GetFiles())
                            {
                                DataRow aRow = table.NewRow();
                                aRow["ID"] = ndx;
                                aRow["Name"] = fi.Name;
                                aRow["URL"] = string.Format("http://www.ohsnational.com/services/{0}/Patients/{1}/Results/{2}", CompanyIDNo, ProjectIDNo, fi.Name);
                                aRow["Ext"] = fi.Extension;
                                aRow["Created"] = fi.CreationTime;
                                aRow["Size"] = fi.Length;

                                table.Rows.Add(aRow);
                                ndx++;
                            }

                            gvFiles.DataBind();
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                ExceptionUtility.LogException(ex, "Project Details - LoadProjectInfo");

                HttpContext.Current.Response.Redirect("~/ErrorPage.aspx");
            }
          }
        
        protected void Page_Load(object sender, EventArgs e)
        {
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
                Priviliges p = priv["Find Project"];

                if (p.AllowAccess == 0)
                {
                    Response.Redirect("~/Default.aspx");
                }

                if (Request.QueryString.HasKeys())
                {
                    Session["ProjectID"] = Request.QueryString["ProjectID"];
                    Session["SourcePage"] = Request.QueryString["SourcePage"];

                    try
                    {
                        p = null;
                        p = priv["Project Results"];

                        if (!Page.IsCallback && !Page.IsPostBack)
                        {
                            LoadProjectInfo(p.AllowAccess == 1);
                        }

                        lblResults.Visible = (p.AllowAccess == 1 && gvFiles.VisibleRowCount > 0);
                        gvFiles.Visible = (p.AllowAccess == 1 && gvFiles.VisibleRowCount > 0);
                    }
                    catch (Exception)
                    {
                        gvFiles.Visible = false;
                    }
                }
            }
        }

        protected DataTable CreateTable()
        {
            DataTable table = new DataTable();

            try
            {
                DataColumn colID = table.Columns.Add("ID", typeof(Int32));
                DataColumn colName = table.Columns.Add("Name", typeof(String));
                DataColumn colURL = table.Columns.Add("URL", typeof(String));
                DataColumn colExt = table.Columns.Add("Ext", typeof(String));
                DataColumn colCreated = table.Columns.Add("Created", typeof(DateTime));
                DataColumn colSize = table.Columns.Add("Size", typeof(Int32));
                table.PrimaryKey = new DataColumn[] { colID };
                colID.ReadOnly = true;
            }
            catch (Exception ex)
            {
                ExceptionUtility.LogException(ex, "Project Details - CreateTable");

                HttpContext.Current.Response.Redirect("~/ErrorPage.aspx");
            } 

            return table;
        }

        protected void AddGridViewColumns(DataTable table)
        {
            try
            {
                gvFiles.DataSource = table;
                gvFiles.Columns.Clear();

                GridViewDataHyperLinkColumn colItemName = new GridViewDataHyperLinkColumn();
                colItemName.FieldName = "URL";
                colItemName.PropertiesHyperLinkEdit.TextField = "Name";
                gvFiles.Columns.Add(colItemName);

                GridViewDataTextColumn colItemExt = new GridViewDataTextColumn();
                colItemExt.FieldName = "Ext";
                gvFiles.Columns.Add(colItemExt);

                GridViewDataTextColumn colItemSize = new GridViewDataTextColumn();
                colItemSize.FieldName = "Size";
                gvFiles.Columns.Add(colItemSize);

                GridViewDataDateColumn colItemCreated = new GridViewDataDateColumn();
                colItemCreated.FieldName = "Created";
                colItemCreated.PropertiesEdit.DisplayFormatString = "d";
                gvFiles.Columns.Add(colItemCreated);
            }
            catch (Exception ex)
            {
                ExceptionUtility.LogException(ex, "Project Details - AddGridViewColumns");

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
                    using (SqlCommand cmd = new SqlCommand("OHSN_Web_ProjectDOTResults_Upsert", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@ParentID", Convert.ToInt64( txtbxProjectID.Text));
                        // Drug
                        cmd.Parameters.AddWithValue("@ResultNegative", (rblDrugTestResults.SelectedIndex == 0));
                        cmd.Parameters.AddWithValue("@DrugTestWasCancelled", (rblDrugTestResults.SelectedIndex == 1));
                        cmd.Parameters.AddWithValue("@Adulterated", rblDrugTestRefused.SelectedIndex == 0);
                        cmd.Parameters.AddWithValue("@Substituted", rblDrugTestRefused.SelectedIndex == 1);
                        cmd.Parameters.AddWithValue("@ShyBladder", rblDrugTestRefused.SelectedIndex == 2);
                        cmd.Parameters.AddWithValue("@DrugOtherRefusal", rblDrugTestRefused.SelectedIndex == 3);

                        cmd.Parameters.AddWithValue("@PositiveForMarijuana", clbDrugTestPositiveResults.Items[0].Selected);
                        cmd.Parameters.AddWithValue("@PositiveForCocaine", clbDrugTestPositiveResults.Items[1].Selected);
                        cmd.Parameters.AddWithValue("@PositiveForPCP", clbDrugTestPositiveResults.Items[2].Selected);
                        cmd.Parameters.AddWithValue("@PositiveForOpiates", clbDrugTestPositiveResults.Items[3].Selected);
                        cmd.Parameters.AddWithValue("@PositiveForAmphetamines", clbDrugTestPositiveResults.Items[4].Selected);

                        cmd.Parameters.AddWithValue("@BlindSpecimensSubmitted", ckBlindSpecimensSubmitted.Checked);
                        cmd.Parameters.AddWithValue("@SecondCollectionPerformedforNegativeDilute", ckSecondCollectionPerformed.Checked);
                        // Alcohol
                        cmd.Parameters.AddWithValue("@ResultLessthan02", rblAlcoholTestResults.SelectedIndex == 0);
                        cmd.Parameters.AddWithValue("@AlcoholTestWasCancelled", rblAlcoholTestResults.SelectedIndex == 1);
                        cmd.Parameters.AddWithValue("@Result02orGreater", rblAlcoholTestResults.SelectedIndex == 3);
                        cmd.Parameters.AddWithValue("@ConfirmationResultBetween02and039", rblAlcoholTestPositiveResults.SelectedIndex == 0);
                        cmd.Parameters.AddWithValue("@ConfirmationResultGreaterorequalto04", rblAlcoholTestPositiveResults.SelectedIndex == 1);
                        cmd.Parameters.AddWithValue("@ShyLung", rblAlcoholTestRefused.SelectedIndex == 0);
                        cmd.Parameters.AddWithValue("@AlcoholOtherRefusal", rblAlcoholTestRefused.SelectedIndex == 1);

                        var result = (int)cmd.ExecuteNonQuery();

                    }

                    conn.Close();
                }
            }
            catch (Exception ex)
            {
                ExceptionUtility.LogException(ex, "Add User - Save");

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
                        if (Session["SourcePage"] != null && string.Compare(Session["SourcePage"].ToString(), "FindProject", true) == 0)
                        {
                            Response.Redirect("~/Projects/ProjectManageDOT.aspx");
                        }
                        else
                        {
                            Response.Redirect("~/Default.aspx");
                        }

                        break;
                    }
                case "btnSubmit":
                    {
                        Save();
                         Response.Redirect("~/Projects/ProjectManageDOT.aspx");

                        break;
                    }

                case "btnCancel":
                    {
                        Response.Redirect("~/Projects/ProjectManageDOT.aspx");
                        break;
                    }
            }
        }

        protected void rblDrugTestResults_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (((ASPxRadioButtonList)sender).SelectedIndex != 2)
            {
                rblDrugTestRefused.SelectedIndex = -1;
            }
            rblDrugTestRefused.Visible = ((ASPxRadioButtonList)sender).SelectedIndex == 2;
            
            // Positive Results
            if (((ASPxRadioButtonList)sender).SelectedIndex != 3)
            {
                clbDrugTestPositiveResults.Items[0].Selected = false;
                clbDrugTestPositiveResults.Items[1].Selected = false;
                clbDrugTestPositiveResults.Items[2].Selected = false;
                clbDrugTestPositiveResults.Items[3].Selected = false;
                clbDrugTestPositiveResults.Items[4].Selected = false;
            }
            clbDrugTestPositiveResults.Visible = ((ASPxRadioButtonList)sender).SelectedIndex == 3;
        }

        protected void rblAlcoholTestResults_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (((ASPxRadioButtonList)sender).SelectedIndex != 2)
            {
                rblAlcoholTestRefused.SelectedIndex = -1;
            }
            rblAlcoholTestRefused.Visible = ((ASPxRadioButtonList)sender).SelectedIndex == 2;

            if (((ASPxRadioButtonList)sender).SelectedIndex != 3)
            {
                rblAlcoholTestPositiveResults.SelectedIndex = -1;
            }
            rblAlcoholTestPositiveResults.Visible = ((ASPxRadioButtonList)sender).SelectedIndex == 3;
        }
    }
}