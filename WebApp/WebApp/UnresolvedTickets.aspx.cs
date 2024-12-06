using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace WebApp
{
    public partial class UnresolvedTickets : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void SearchButton_Click(object sender, EventArgs e)
        {
            string national_id = nationalID.Text.Trim();

            if (string.IsNullOrEmpty(national_id))
            {
                ResultLabel.Text = "Please provide a valid National ID.";
                ResultLabel.ForeColor = System.Drawing.Color.Red; 
                return;
            }

            string connectionString = ConfigurationManager.ConnectionStrings["GUC_Telecom"].ConnectionString;
            string query = "Ticket_Account_Customer"; // Stored procedure name

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(query, connection);
                command.CommandType = CommandType.StoredProcedure;

                command.Parameters.AddWithValue("@NID", national_id);

                try
                {
                    connection.Open();

                   
                    object result = command.ExecuteScalar();

                    if (result != null && int.TryParse(result.ToString(), out int ticketCount))
                    {
                        ResultLabel.Text = $"Number of unresolved tickets: {ticketCount}";
                        ResultLabel.ForeColor = System.Drawing.Color.Green; 
                    }
                    else
                    {
                        ResultLabel.Text = "No unresolved tickets found.";
                        ResultLabel.ForeColor = System.Drawing.Color.Orange;
                    }

                    
                }
                catch (Exception ex)
                {
                    ResultLabel.Text = "An error occurred while fetching the unresolved tickets.";
                    ResultLabel.ForeColor = System.Drawing.Color.Red;

                    System.Diagnostics.Trace.WriteLine($"Error: {ex.Message}");
                }
            }
        }
    }
}
