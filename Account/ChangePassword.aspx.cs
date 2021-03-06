﻿namespace CustomerPortal.Account
{
    using CustomerPortal.Utility;
    using System;
    using System.Configuration;
    using System.Data;
    using System.Data.SqlClient;
    using System.Drawing;
    using System.Linq;
    using System.Web;
    using DevExpress.Web;

    public partial class ChangePassword : System.Web.UI.Page
    {
        #region Private

        private int PasswordLengthScore(string password)
        {
            int result = 0;

            // Length up 25 points
            if (password.Length >= 1 && password.Length <= 4)
            {
                result += 5;
            }

            if (password.Length >= 5 && password.Length <= 7)
            {
                result += 10;
            }

            if (password.Length > 6)
            {
                result += 25;
            }

            return result;
        }

        private int PasswordLettersScore(string password)
        {
            int result = 0;

            // Upper & lower case
            if ((password.Count(c => c >= 65 && c <= 90) == 0) && (password.Count(c => c >= 65 && c <= 90) > 0))
            {
                result += 10;
            }

            // Upper & lower case

            if ((password.Count(c => c >= 65 && c <= 90) > 0) && (password.Count(c => c >= 65 && c <= 90) == 0))
            {
                result += 10;
            }

            if ((password.Count(c => c >= 65 && c <= 90) > 0) && (password.Count(c => c >= 65 && c <= 90) > 0))
            {
                result += 20;
            }

            return result;
        }

        private int PasswordNumbersScore(string password)
        {
            int result = 0;

            int NoOfDigitis = password.Count(c => c >= 48 && c <= 57);

            // Upper & lower case
            if (NoOfDigitis > 0 && NoOfDigitis < 3)
            {
                result += 10;
            }

            if (NoOfDigitis >= 3)
            {
                result += 20;
            }

            return result;
        }

        private int PasswordSpecialCharactersScore(string password)
        {
            int result = 0;

            int numberOfSpecialCharacters = password.Count(c => !char.IsLetterOrDigit(c));

            // Upper & lower case
            if (numberOfSpecialCharacters == 1)
            {
                result += 10;
            }

            if (numberOfSpecialCharacters > 1)
            {
                result += 25;
            }

            return result;
        }

        private int CalculatedPasswordStrength(string password)
        {
            int result = 0;

            // 0 to 25 points
            result += PasswordLengthScore(password);

            // 0 to 20 points
            int lettersScore = PasswordLettersScore(password);
            result += lettersScore;

            int numbersScore = PasswordNumbersScore(password);
            result += numbersScore;

            int specialCharactersScore = PasswordSpecialCharactersScore(password);
            result += specialCharactersScore;

            // Bonus points for having letters & numbers
            if (lettersScore > 0 && numbersScore > 0)
            {
                result += 2;
            }

            // Bonus points for having letters & numbers & characters
            if (lettersScore > 0 && numbersScore > 0 && specialCharactersScore > 0)
            {
                result += 3;
            }

            // Bonus points for having mixed case letters & numbers & characters
            if (lettersScore == 20 && numbersScore > 0 && specialCharactersScore > 0)
            {
                result += 3;
            }

            return result;
        }

        private bool ChangeUserPassword(string userName, string userPassword, string newPassword, long employerID)
        {
            bool result = false;

            try
            {
                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["OHSN"].ConnectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("OHSN_Web_UpdateUserPassword", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@UserName", userName);
                        cmd.Parameters.AddWithValue("@UserPassword", userPassword);
                        cmd.Parameters.AddWithValue("@NewPassword", newPassword);
                        cmd.Parameters.AddWithValue("@EmployerID", employerID);

                        int noOfRecords = cmd.ExecuteNonQuery();
                        if (noOfRecords == 1)
                        {
                            result = true;
                        }
                    }
                    conn.Close();
                }
            }
            catch (Exception ex)
            {
                ExceptionUtility.LogException(ex, "Change Password - ChangeUserPassword");

                ExceptionUtility.NotifySupport(ex);

                HttpContext.Current.Response.Redirect("~/ErrorPage.aspx");
            } 

            return result;
        }

        private bool UserFound(string oldPassword)
        {
            bool result = false;

            try
            {
                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["OHSN"].ConnectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("OHSN_WEB_GetUserLoginInfo", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@UserName", Session["UserName"].ToString());
                        cmd.Parameters.AddWithValue("@UserPassword", oldPassword);
                        SqlDataReader rdr = cmd.ExecuteReader();

                        result = rdr.HasRows;
                        rdr.Close();
                    }

                    conn.Close();
                }
            }
            catch (Exception ex)
            {
                ExceptionUtility.LogException(ex, "Change Password - UserFound");

                ExceptionUtility.NotifySupport(ex);

                HttpContext.Current.Response.Redirect("~/ErrorPage.aspx");
            }

            return result;
        }

        #endregion

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
        }

        protected void SetStrengthOfPassword()
        {
            // Calculate password Strength
            int passwordStrength = CalculatedPasswordStrength(txtNewPassword.Text);
            pbStrengthOfPassword.Position = passwordStrength;

            if (passwordStrength >= 80)
            {
                pbStrengthOfPassword.Caption = "Very strong";
                pbStrengthOfPassword.IndicatorStyle.BackColor = Color.Green;
            }

            if (passwordStrength <= 80 && passwordStrength >= 60)
            {
                pbStrengthOfPassword.Caption = "Strong";
                pbStrengthOfPassword.IndicatorStyle.BackColor = Color.Green;
            }

            if (passwordStrength <= 60 && passwordStrength >= 40)
            {
                pbStrengthOfPassword.Caption = "Average";
                pbStrengthOfPassword.IndicatorStyle.BackColor = Color.Yellow;
            }

            if (passwordStrength <= 40 && passwordStrength >= 10)
            {
                pbStrengthOfPassword.Caption = "Weak";
                pbStrengthOfPassword.IndicatorStyle.BackColor = Color.Red;
            }

            if (passwordStrength <= 10)
            {
                pbStrengthOfPassword.Caption = "Very weak";
                pbStrengthOfPassword.IndicatorStyle.BackColor = Color.Red;
            }
        }

        protected bool IsValid()
        {
            bool result = true;

            // Check Old password
            if (string.IsNullOrEmpty(txtOldPassword.Text) || UserFound(txtOldPassword.Text) == false)
            {
                txtOldPassword.IsValid = false;
                txtOldPassword.ValidationSettings.ErrorText = "Password is incorrect!";
                result = false;
            }

            // Check New password
            if (string.IsNullOrEmpty(txtNewPassword.Text) == true)
            {
                txtNewPassword.IsValid = false;
                txtNewPassword.ValidationSettings.ErrorText = "Password cannot be empty!";
                result = false;
            }

            if (string.Compare(txtNewPassword.Text, txtOldPassword.Text, false) == 0)
            {
                txtNewPassword.IsValid = false;
                txtNewPassword.ValidationSettings.ErrorText = "The new pasword cannot the same as the old password!";
                result = false;
            }

            if (CalculatedPasswordStrength(txtNewPassword.Text) < 40)
            {
                txtNewPassword.IsValid = false;
                txtNewPassword.ValidationSettings.ErrorText = "The new pasword is to weak!";
                result = false;
            }

            // Check Confirm password
            if (string.IsNullOrEmpty(txtConfirmPassword.Text) == true)
            {
                txtConfirmPassword.IsValid = false;
                txtConfirmPassword.ErrorText = "Password cannot be empty!";
                result = false;
            }

            if (string.Compare(txtNewPassword.Text, txtConfirmPassword.Text, false) != 0)
            {
                txtConfirmPassword.IsValid = false;
                txtConfirmPassword.ErrorText = "Does not match the new pasword!";
                result = false;
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
                            if (ChangeUserPassword(Session["UserName"].ToString(), txtOldPassword.Text, txtNewPassword.Text, Convert.ToInt64(Session["EmployerID"])) == true)
                            {
                                Response.Redirect("~/Account/PasswordSuccessfullyChanged.aspx");
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

        protected void txtConfirmPassword_Validation(object sender, ValidationEventArgs e)
        {
            SetStrengthOfPassword();
        }
    }
}