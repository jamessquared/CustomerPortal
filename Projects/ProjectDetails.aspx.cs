namespace CustomerPortal.Projects
{
    using System;
    using System.IO;
    using System.Collections.Generic;
    using System.Linq;
    using System.Web;
    using System.Web.UI;
    using System.Web.UI.WebControls;
    using System.Data;
    using System.Configuration;
    using DevExpress.Web;
    using CustomerPortal.Utility;

    public partial class ProjectDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string ProjectIDNo = string.Empty;
            string CompanyIDNo = string.Empty;

            if (Session["ContactID"] == null)
            {
                Response.Redirect("~/Default.aspx");
            }

            if (Request.QueryString.HasKeys())
            {
                Session["ProjectID"] = Request.QueryString["ProjectID"];
                Session["SourcePage"] = Request.QueryString["SourcePage"];

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
                    txtbxSpecialInstructions.Text = dv[0]["SpecialInstructions"].ToString();
                    txtbxRequestType.Text = dv[0]["RequestType"].ToString();
                    txtbxScheduleBy.Text = dv[0]["ScheduledByDeadline"].ToString();
                    txtbxCompleteBy.Text = dv[0]["CompletedByDeadline"].ToString();
                    CompanyIDNo  = dv[0]["CompanyIDNo"].ToString();
                    ProjectIDNo = dv[0]["ProjectIDNo"].ToString();
                    // Load Protocols
                    dsProjectDetailsViewProtocolInfo.DataBind();

                    // Load Notes
                    dsProjectDetailsViewNotes.DataBind();

                    // Load Results
                    if (string.IsNullOrEmpty(CompanyIDNo) == false && string.IsNullOrEmpty(ProjectIDNo) == false)
                    {
                        DataTable table = CreateTable();

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

                            AddGridViewColumns(table);

                            gvFiles.DataBind();

                        }
                    }
                }
            }
        }

        protected DataTable CreateTable()
        {
            DataTable table = new DataTable();

            DataColumn colID = table.Columns.Add("ID", typeof(Int32));
            DataColumn colName = table.Columns.Add("Name", typeof(String));
            DataColumn colURL = table.Columns.Add("URL", typeof(String));
            DataColumn colExt = table.Columns.Add("Ext", typeof(String));
            DataColumn colCreated = table.Columns.Add("Created", typeof(DateTime));
            DataColumn colSize = table.Columns.Add("Size", typeof(Int32));
            table.PrimaryKey = new DataColumn[] { colID };
            colID.ReadOnly = true;

            return table;
        }

        protected void AddGridViewColumns(DataTable table)
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
            gvFiles.Columns.Add(colItemExt);


            GridViewDataDateColumn colItemCreated = new GridViewDataDateColumn();
            colItemCreated.FieldName = "Created";
            colItemCreated.PropertiesEdit.DisplayFormatString = "d";
            gvFiles.Columns.Add(colItemCreated);
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