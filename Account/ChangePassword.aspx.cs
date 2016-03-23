namespace CustomerPortal.Account
{
    using System;
    using System.Configuration;
    using System.Data;
    using System.Data.SqlClient;
    using System.Drawing;
    using System.Linq;

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
            if (numberOfSpecialCharacters == 1 )
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
                    if (noOfRecords != null && noOfRecords == 1)
                    {
                        result = true;
                    }
                }
                conn.Close();
            }

            return result;
        }

        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ContactID"] == null)
            {
                Response.Redirect("~/Default.aspx");
            }
        }

        protected void btnedNewPassword_ButtonClick(object source, DevExpress.Web.ButtonEditClickEventArgs e)
        {
            btnedNewPassword.Password = !btnedNewPassword.Password;
        }

        protected void btnConfirmPassword_ButtonClick(object source, DevExpress.Web.ButtonEditClickEventArgs e)
        {
            btnConfirmPassword.Password = !btnConfirmPassword.Password;
        }

        protected void SetStrengthOfPassword()
        {
            // Calculate password Strength
            int passwordStrength = CalculatedPasswordStrength(btnedNewPassword.Text);
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

        protected void btnedNewPassword_ValueChanged(object sender, EventArgs e)
        {
            SetStrengthOfPassword();
            btnedNewPassword.Password = true;
        }

        protected void btnConfirmPassword_Validation(object sender, DevExpress.Web.ValidationEventArgs e)
        {
            btnConfirmPassword.Password = true;

            if (btnConfirmPassword.Text != btnedNewPassword.Text)
            {
                e.IsValid = false;
                e.ErrorText = "Passwords don't match!";
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
                        if (string.IsNullOrEmpty(btnConfirmPassword.Text) == false && btnConfirmPassword.Text == btnedNewPassword.Text)
                        {
                            if (ChangeUserPassword(Session["UserName"].ToString(), txtOldPassword.Text, btnedNewPassword.Text, Convert.ToInt64(Session["EmployerID"])) == true)
                            {
                                Response.Redirect("~/Account/PasswordSuccessfullyChanged.aspx");
                            }
                            else
                            {
                                lblPasswordChangeFailed.Visible = true;
                            }
                        }
                        else
                        {
                            lblPasswordChangeFailed.Visible = true;
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
    }
}