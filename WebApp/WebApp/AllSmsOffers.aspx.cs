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
    public partial class AllSmsOffers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
    protected void SearchButton_Click(object sender, EventArgs e)
    {
        if (Session["user"] != null)
        {
            string mobileNo = Session["user"].ToString();


        }
        else
        {
            Response.Write("<script>alert('User session not found. Please log in.');</script>");
        }

        

       

        string connectionString = ConfigurationManager.ConnectionStrings["GUC_Telecom"].ConnectionString;

        // Query to call the table-valued function
        string query = "SELECT * FROM dbo.Account_SMS_Offers(@mobile_num)";

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            SqlCommand command = new SqlCommand(query, connection);
            command.CommandType = CommandType.Text;  // Text because it's a SELECT query

            // Pass parameters to the query
            command.Parameters.AddWithValue("@mobile_num", Session["user"].ToString());
            command.Parameters.AddWithValue("@start_date", DateTime.Parse(startDate));
            command.Parameters.AddWithValue("@end_date", DateTime.Parse(endDate));

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