using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

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

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(storedProcedure, connection);
                command.CommandType = CommandType.StoredProcedure;

                // Pass parameters
                command.Parameters.AddWithValue("@mobile_num", mobileno);

                try
                {
                    connection.Open();


                    object result = command.ExecuteScalar();

                    if (result != null && int.TryParse(result.ToString(), out int totalPoints))
                    {
                        ResultLabel.Text = $"Number of unresolved tickets: {totalPoints}";
                        ResultLabel.ForeColor = System.Drawing.Color.Green;
                    }
                    else
                    {
                        ResultLabel.Text = "No Points.";
                        ResultLabel.ForeColor = System.Drawing.Color.Orange;
                    }

                    ResultGrid.Visible = false;
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