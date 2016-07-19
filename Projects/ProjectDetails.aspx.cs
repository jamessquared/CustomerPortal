namespace CustomerPortal.Projects
{
    using CustomerPortal.Classes;
    using CustomerPortal.Utility;
    using DevExpress.Web;
    using System;
    using System.Collections.Generic;
    using System.Configuration;
    using System.Data;
    using System.IO;
    using System.Web;
    using System.Web.UI;

    public partial class ProjectDetails : System.Web.UI.Page
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
                    ckResultNegative.Checked = Convert.ToBoolean(dv[0]["ResultNegative"]);
                    ckPositiveForMarijuana.Checked = Convert.ToBoolean(dv[0]["PositiveForMarijuana"]);
                    ckPositiveForCocaine.Checked = Convert.ToBoolean(dv[0]["PositiveForCocaine"]);
                    ckPositiveForPCP.Checked = Convert.ToBoolean(dv[0]["PositiveForPCP"]);
                    ckPositiveForOpiates.Checked = Convert.ToBoolean(dv[0]["PositiveForOpiates"]);
                    ckPositiveForAmphetamines.Checked = Convert.ToBoolean(dv[0]["PositiveForAmphetamines"]);
                    ckBlindSpecimensSubmitted.Checked = Convert.ToBoolean(dv[0]["BlindSpecimensSubmitted"]);
                    ckSecondCollectionPerformed.Checked = Convert.ToBoolean(dv[0]["SecondCollectionPerformed"]);
                    //
                    ckRefusedDueToAdulterated.Checked = Convert.ToBoolean(dv[0]["Adulterated"]);
                    ckRefusedDueToSubstition.Checked = Convert.ToBoolean(dv[0]["Substituted"]);
                    ckRefusedDueToShyBladder.Checked = Convert.ToBoolean(dv[0]["ShyBladder"]);
                    ckDrugTestRefusedDueToOtherReason.Checked = Convert.ToBoolean(dv[0]["DrugOtherRefusal"]);
                    ckDrugTestCancelled.Checked = Convert.ToBoolean(dv[0]["DrugTestWasCancelled"]);
                    // Alcohol
                    ckRefusedDueToShyLung.Checked = Convert.ToBoolean(dv[0]["ShyLung"]);
                    ckAlcoholTestRefusedDueToOtherReason.Checked = Convert.ToBoolean(dv[0]["AlcoholOtherRefusal"]);
                    ckAlcoholTestCancelled.Checked = Convert.ToBoolean(dv[0]["AlcoholTestWasCancelled"]);

                    CompanyIDNo = dv[0]["CompanyIDNo"].ToString();
                    ProjectIDNo = dv[0]["ProjectIDNo"].ToString();
                    // Load Protocols
                    dsProjectDetailsViewProtocolInfo.DataBind();

                    // Load Notes
                    dsProjectDetailsViewNotes.DataBind();
                    gvNotes.DataBind();

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
                try
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

                            LoadProjectInfo(p.AllowAccess == 1);
                            lblResults.Visible = (p.AllowAccess == 1 && gvFiles.VisibleRowCount > 0);
                            gvFiles.Visible = (p.AllowAccess == 1 && gvFiles.VisibleRowCount > 0);
                        }
                        catch (KeyNotFoundException)
                        {
                            gvFiles.Visible = false;
                        }
                        catch (Exception ex)
                        {
                            ExceptionUtility.LogException(ex, "Project Details - Page_Load");
                            gvFiles.Visible = false;
                        }
                    } 
                }
                catch (KeyNotFoundException)
                {
                    Response.Redirect("~/Default.aspx");
                }
                catch (Exception ex)
                {
                    ExceptionUtility.LogException(ex, "Project Details - Page_Load");
                    Response.Redirect("~/Default.aspx");
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

        protected void mainToolbar_CommandExecuted(object source, DevExpress.Web.RibbonCommandExecutedEventArgs e)
        {
            switch (e.Item.Name)
            {
                case "btnBack":
                    {
                        if (Session["SourcePage"] != null && string.Compare(Session["SourcePage"].ToString(), "FindProject", true) == 0)
                        {
                            Response.Redirect("~/Projects/FindProject.aspx");
                        }
                        else
                        {
                            Response.Redirect("~/Default.aspx");
                        }

                        break;
                    }
            }
        }
    }
}