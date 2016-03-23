namespace CustomerPortal.Projects
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

    public partial class NewProject : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            dsStates.DataBind();
            dsJobCategory.DataBind();
            dsRequestType.DataBind();
            dsProtocols.DataBind();
            dsDOT.DataBind();

            dedScheduleBy.Date = DateTime.Now.Date;
            dedCompleteBy.Date = DateTime.MinValue;
        }

        protected void Save()
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["OHSN"].ConnectionString))
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand("ohsn_web_Project_Insert", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@EmployerID", Session["EmployerID"]);
                    cmd.Parameters.AddWithValue("@EnteredByTID", Session["UserID"]);
                    cmd.Parameters.AddWithValue("@AuthorizedBy", Session["UserID"]);

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

                    cmd.Parameters.AddWithValue("@ScheduledByDeadline", dedScheduleBy.Date);
                    cmd.Parameters.AddWithValue("@CompletedByDeadline", dedCompleteBy.Date);

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
    }
}