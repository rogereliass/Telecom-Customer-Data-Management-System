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
    public partial class RedeemVoucher : System.Web.UI.Page
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
            string storedProcedure = "Redeem_voucher_points";

            string voucherID = VoucherIDTextBox.Text.Trim();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(storedProcedure, connection);
                command.CommandType = CommandType.StoredProcedure;

                // Pass parameters
                command.Parameters.AddWithValue("@mobile_num", mobileNo);
                command.Parameters.AddWithValue("@voucher_id", int.Parse(voucherID));

                try
                {
                    connection.Open();

                    // Execute the stored procedure and get a SqlDataReader to capture PRINT statements
                    SqlDataReader reader = command.ExecuteReader();

                    // Read all the results, including any PRINT messages
                    StringBuilder outputMessages = new StringBuilder();

                    while (reader.Read())
                    {
                        // Assuming the procedure outputs a result set with a message column
                        // For example, if the stored procedure returns a "message" column, capture it
                        // You may adjust this part if the procedure returns a message as part of the result
                        string resultMessage = reader[0].ToString(); // Adjust column index if needed
                        outputMessages.Append(resultMessage);
                    }

                    // Check if the message contains the specific "no enough points" message
                    if (outputMessages.ToString().Contains("no enough points to redeem voucher"))
                    {
                        // If the message matches, show it
                        ResultLabel.Text = "No enough points to redeem voucher";
                        ResultLabel.ForeColor = System.Drawing.Color.Red;
                    }
                    else
                    {
                        // Otherwise, show the success message
                        ResultLabel.Text = "Successful Redeem Of Voucher";
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

            if (string.IsNullOrEmpty(VoucherIDTextBox.Text.Trim()) || !int.TryParse(VoucherDTextBox.Text.Trim(), out _))
            {
                errorMessage += "Voucher ID must be a valid integer.<br/>";
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