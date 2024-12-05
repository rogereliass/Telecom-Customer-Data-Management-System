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
    public partial class RechargeBalance : System.Web.UI.Page
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
            string storedProcedure = "Initiate_balance_payment";

            string paymentAmount = AmountTextBox.Text.Trim();
            string paymentMethod = PaymentMethodDropDown.SelectedValue;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(storedProcedure, connection);
                command.CommandType = CommandType.StoredProcedure;

                // Pass parameters
                command.Parameters.AddWithValue("@mobile_num", mobileNo);
                command.Parameters.AddWithValue("@amount", decimal.Parse(paymentAmount));
                command.Parameters.AddWithValue("@payment_method", paymentMethod);
                try
                {
                    connection.Open();

                    command.ExecuteNonQuery(); // Execute the stored procedure for renewal

                    ResultLabel.Text = "Successful Balance Recharge.";
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

            if (string.IsNullOrEmpty(AmountTextBox.Text.Trim()) || !decimal.TryParse(AmountTextBox.Text.Trim(), out _))
            {
                errorMessage += "Amount must be a valid number.<br/>";
                isValid = false;
            }

            if (string.IsNullOrEmpty(PaymentMethodDropDown.SelectedValue))
            {
                errorMessage += "Please select a payment method.<br/>";
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