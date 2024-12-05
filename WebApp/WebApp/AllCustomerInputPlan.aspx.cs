using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApp
{
    public partial class AllCustomerInputPlan : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void SearchButton_Click(object sender, EventArgs e)
        {
            // Get input values from TextBox controls
            string planId = Planid.Text.Trim();
            string planDate = DateInput.Text.Trim();
            

            // Validate input
            if (string.IsNullOrEmpty(planId) || string.IsNullOrEmpty(planDate))
            {
                ResultGrid.Visible = false;
                Response.Write("<script>alert('Please provide all required inputs.');</script>");
                return;
            }

            string connectionString = ConfigurationManager.ConnectionStrings["GUC_Telecom"].ConnectionString;

            // Query to call the table-valued function
            string query = "SELECT * FROM dbo.Account_Plan_date(@sub_date, @plan_id)";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(query, connection);
                command.CommandType = CommandType.Text;  // Text because it's a SELECT query

                // Pass parameters to the query
                command.Parameters.AddWithValue("@plan_id", planId);
                command.Parameters.AddWithValue("@sub_date", DateTime.Parse(planDate));
                

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