namespace CustomerPortal.Classes
{
    using CustomerPortal.Utility;
    using System;
    using System.Collections.Generic;
    using System.Configuration;
    using System.Data;
    using System.Data.SqlClient;
    using System.Web;

    public class Priviliges
    {
        public long ID { get; set; }
        public int? AllowAccess { get; set; }
        public int? AllowAddorEdit { get; set; }
        public int? AllowDelete { get; set; }

        public static Dictionary<string, Priviliges> Initialize(long contactID)
        {
            Dictionary<string, Priviliges> priv = new Dictionary<string, Priviliges>();

            try
            {
                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["OHSN"].ConnectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("ohsn_Web_GetUserManagementUserPermissions_Select", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@ContactID", contactID);
                        SqlDataReader rdr = cmd.ExecuteReader();
                        if (rdr.HasRows == false)
                        {
                            InitializeUser(contactID, "User");
                            rdr.Close();
                            rdr = cmd.ExecuteReader();
                        }

                        while (rdr.Read())
                        {
                            Priviliges p = new Priviliges();
                            
                            p.ID = Convert.ToInt64(rdr["PageID"]);

                            if ((rdr["AllowAccess"] is DBNull) == false)
                            {
                                p.AllowAccess = Convert.ToInt32(rdr["AllowAccess"]);
                            }
                            else
                            {
                                p.AllowAccess = 0;
                            }

                            if ((rdr["AllowAddOrEdit"] is DBNull) == false)
                            {
                                p.AllowAddorEdit = Convert.ToInt32(rdr["AllowAddOrEdit"]);
                            }
                            else
                            {
                                p.AllowAddorEdit = null;
                            }

                            if ((rdr["AllowDelete"] is DBNull) == false)
                            {
                                p.AllowDelete = Convert.ToInt32(rdr["AllowDelete"]);
                            }
                            else
                            {
                                p.AllowDelete = null;
                            }

                            priv.Add(rdr["Page"].ToString(), p);
                        }

                        rdr.Close();
                    }

                    conn.Close();
                }
            }
            catch (Exception ex)
            {
                ExceptionUtility.LogException(ex, "Privileges - Initialize User");

                ExceptionUtility.NotifySupport(ex);

                HttpContext.Current.Response.Redirect("~/ErrorPage.aspx");
            } 

            return priv;
        }

        public static void InitializeUser(long contactID, string userCategory)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["OHSN"].ConnectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("OHSN_Web_InitalizeUserPrivileges", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@ContactID", contactID);
                        cmd.Parameters.AddWithValue("@UserCategory", userCategory);
                        var result = (int)cmd.ExecuteNonQuery();
                    }

                    conn.Close();
                }
            }
            catch (Exception ex)
            {
                ExceptionUtility.LogException(ex, "Privileges - Initialize User");

                ExceptionUtility.NotifySupport(ex);

                HttpContext.Current.Response.Redirect("~/ErrorPage.aspx");
            }
        }
    }
}