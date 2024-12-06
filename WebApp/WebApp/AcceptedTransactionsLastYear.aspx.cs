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
    public partial class AcceptedTransactionsLastYear : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


        }

        protected void SearchButton_Click(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["GUC_Telecom"].ConnectionString;
            string storedProcedure = "Account_Payment_Points";

            string mobileno = MobileNoTextBox.Text.Trim();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(storedProcedure, connection);
                command.CommandType = CommandType.StoredProcedure;

                // Pass input parameter
                command.Parameters.AddWithValue("@mobile_num", mobileno);

                try
                {
                    connection.Open();

                    // Execute the stored procedure and get both values
                    SqlDataReader reader = command.ExecuteReader();

                    if (reader.Read()) // Read the first (and only) result row
                    {
                        int ticketCount = reader.IsDBNull(0) ? 0 : reader.GetInt32(0);  // Count of payments
                        int totalPoints = reader.IsDBNull(1) ? 0 : reader.GetInt32(1);  // Sum of points

                        // Display the results
                        if (ticketCount > 0)
                        {
                            ResultLabel.Text = $"Number of successful payments made last year: {ticketCount}<br>Total points earned: {totalPoints}";
                            ResultLabel.ForeColor = System.Drawing.Color.Green;
                        }
                        else
                        {
                            ResultLabel.Text = $"No successful payments made last year. Total points earned: {totalPoints}";
                            ResultLabel.ForeColor = System.Drawing.Color.Orange;
                        }
                    }
                    else
                    {
                        ResultLabel.Text = "No data found for this mobile number.";
                        ResultLabel.ForeColor = System.Drawing.Color.Red;
                    }

                    
                }
                catch (Exception ex)
                {
                    ResultLabel.Text = "An error occurred while fetching the payment data.";
                    ResultLabel.ForeColor = System.Drawing.Color.Red;

                    System.Diagnostics.Trace.WriteLine($"Error: {ex.Message}");
                }
            }
        }
    }
}



