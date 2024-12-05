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
    public partial class TotalUsage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        protected void SearchButton_Click(object sender, EventArgs e)
        {
            string mobileNum = mobileNo.Text.Trim();
            string startDate = StartDateInput.Text.Trim();

            // Validate input
            if (string.IsNullOrEmpty(startDate) || string.IsNullOrEmpty(mobileNum))
            {
                ResultGrid.Visible = false;
                Response.Write("<script>alert('Please provide all required inputs.');</script>");
                return;
            }

            string connectionString = ConfigurationManager.ConnectionStrings["GUC_Telecom"].ConnectionString;

            // Query to call the table-valued function
            string query = "SELECT * FROM dbo.Account_Usage_Plan(@mobile_num, @from_date)";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(query, connection);
                command.CommandType = CommandType.Text;  // Text because it's a SELECT query

                // Pass parameters to the query
                command.Parameters.AddWithValue("@mobile_num", mobileNum);
                command.Parameters.AddWithValue("@from_date", DateTime.Parse(startDate));
                

                try
                {
                    connection.Open();

                    // Fetch data using SqlDataAdapter
                    SqlDataAdapter adapter = new SqlDataAdapter(command);
                    DataTable dataTable = new DataTable();
                    adapter.Fill(dataTable);

                    // Bind the results to the GridView
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