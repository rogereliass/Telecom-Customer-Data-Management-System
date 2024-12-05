using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace WebApp
{
    public partial class CashbackReturned : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


        }

        protected void SearchButton_Click(object sender, EventArgs e)
        {
            // Validate inputs
            if (!ValidateInputs())
            {
                return; // Stop if validation fails
            }

            // Retrieve the user's session
            if (Session["user"] == null)
            {
                Response.Write("<script>alert('User session not found. Please log in.');</script>");
                return;
            }

            string mobileNo = Session["user"].ToString();
            string connectionString = ConfigurationManager.ConnectionStrings["GUC_Telecom"].ConnectionString;
            string storedProcedure = "Payment_wallet_cashback";

            string paymentID = PaymentIDTextBox.Text.Trim();
            string benefitID = BenefitIDTextBox.Text.Trim();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(storedProcedure, connection);
                command.CommandType = CommandType.StoredProcedure;

                // Pass parameters
                command.Parameters.AddWithValue("@mobile_num", mobileNo);
                command.Parameters.AddWithValue("@payment_id", int.Parse(paymentID));
                command.Parameters.AddWithValue("@benefit_id", int.Parse(benefitID));

                try
                {
                    connection.Open();

                    command.ExecuteNonQuery(); // Execute the stored procedure for renewal

                    ResultLabel.Text = "Successful Return Of Cashback";
                    ResultLabel.ForeColor = System.Drawing.Color.Green;
                }
                catch (Exception ex)
                {
                    ResultLabel.Text = $"Error: {ex.Message}";
                    ResultLabel.ForeColor = System.Drawing.Color.Red;
                }
            }
        }
        private bool ValidateInputs()
        {
            bool isValid = true;
            string errorMessage = string.Empty;

            if (string.IsNullOrEmpty(PaymentIDTextBox.Text.Trim()) || !int.TryParse(PaymentIDTextBox.Text.Trim(), out _))
            {
                errorMessage += "Payment ID must be a valid integer.<br/>";
                isValid = false;
            }

            if (string.IsNullOrEmpty(BenefitIDTextBox.Text.Trim()) || !int.TryParse(BenefitIDTextBox.Text.Trim(), out _))
            {
                errorMessage += "Benefit ID must be a valid integer.<br/>";
                isValid = false;
            }

            if (!isValid)
            {
                ResultLabel.Text = errorMessage;
                ResultLabel.ForeColor = System.Drawing.Color.Red;
            }

            return isValid;
        }
    }
}


