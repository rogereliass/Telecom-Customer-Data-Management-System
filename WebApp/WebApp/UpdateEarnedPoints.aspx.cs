using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace WebApp
{
    public partial class UpdateEarnedPoints : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SearchButton_Click(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["GUC_Telecom"].ConnectionString;
            string storedProcedure = "Total_Points_Account";

            string mobileno = MobileNoTextBox.Text.Trim();

            if (string.IsNullOrWhiteSpace(mobileno) || mobileno.Length != 11)
            {
                ResultLabel.Text = "Please enter a valid 11-digit mobile number.";
                ResultLabel.ForeColor = System.Drawing.Color.Red;
                return;
            }

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    // Execute the stored procedure
                    SqlCommand command = new SqlCommand(storedProcedure, connection);
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@mobile_num", mobileno);

                    connection.Open();
                    command.ExecuteNonQuery();

                    // Retrieve the updated points
                    string query = "SELECT points FROM customer_account WHERE mobileNo = @mobile_num";
                    SqlCommand retrieveCommand = new SqlCommand(query, connection);
                    retrieveCommand.Parameters.AddWithValue("@mobile_num", mobileno);

                    object result = retrieveCommand.ExecuteScalar();

                    if (result != null && int.TryParse(result.ToString(), out int totalPoints))
                    {
                        ResultLabel.Text = $"Total Amount of Points: {totalPoints}";
                        ResultLabel.ForeColor = System.Drawing.Color.Green;
                    }
                    else
                    {
                        ResultLabel.Text = "No points found for the provided mobile number.";
                        ResultLabel.ForeColor = System.Drawing.Color.Orange;
                    }
                }
                catch (Exception ex)
                {
                    ResultLabel.Text = "An error occurred while updating the earned points.";
                    ResultLabel.ForeColor = System.Drawing.Color.Red;

                    System.Diagnostics.Trace.WriteLine($"Error: {ex.Message}");
                }
            }
        }


    }
}
