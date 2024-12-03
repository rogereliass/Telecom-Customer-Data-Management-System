using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApp
{
    public partial class TotalConsumption : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void SearchButton_Click(object sender, EventArgs e)
        {
            // Get input values from TextBox controls
            string planName = PlanN.Text.Trim();
            string startDate = StartDateInput.Text.Trim();
            string endDate = EndDateInput.Text.Trim();

            // Validate input (optional but recommended)
            if (string.IsNullOrEmpty(planName) || string.IsNullOrEmpty(startDate) || string.IsNullOrEmpty(endDate))
            {
                ResultGrid.Visible = false;
                Response.Write("<script>alert('Please provide all required inputs.');</script>");
                return;
            }

            // Database connection
            string connectionString = ConfigurationManager.ConnectionStrings["GUC_Telecom"].ConnectionString;

            string query = "SELECT * from dbo.Consumption(@Plan_name, @start_date, @end_date)";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(query, connection);
                command.CommandType= CommandType.Text;

                // Pass parameters as their respective values
                command.Parameters.AddWithValue("@Plan_name", planName);
                command.Parameters.AddWithValue("@start_date", startDate);
                command.Parameters.AddWithValue("@end_date", endDate);

                try
                {
                    connection.Open();

                    SqlDataAdapter adapter = new SqlDataAdapter(command);
                    DataTable dataTable = new DataTable();
                    adapter.Fill(dataTable);

                    // Bind results to GridView
                    ResultGrid.DataSource = dataTable;
                    ResultGrid.DataBind();
                    ResultGrid.Visible = true;
                }
                catch (Exception ex)
                {
                    ResultGrid.Visible = false;
                    Response.Write($"<script>alert('Error: {ex.Message}');</script>");
                }
            }
        }
    }
}
