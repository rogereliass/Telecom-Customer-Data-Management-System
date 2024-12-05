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
    public partial class RemoveAllBenifitsOffered : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

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
            string planId = PlanN.Text.Trim();
            

            if (string.IsNullOrEmpty(planId))
            {
                ResultGrid.Visible = false;
                Response.Write("<script>alert('Please provide all required inputs.');</script>");
                return;
            }

            string connectionString = ConfigurationManager.ConnectionStrings["GUC_Telecom"].ConnectionString;

            // If Consumption is a stored procedure
            string query = "Benefits_Account";  // Just the name of the stored procedure

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(query, connection);
                command.CommandType = CommandType.StoredProcedure;

                // Pass parameters
                command.Parameters.AddWithValue("@plan_id", planId);
                command.Parameters.AddWithValue("@mobile_num", Session["user"].ToString());
                

                try
                {
                    connection.Open();

                    SqlDataAdapter adapter = new SqlDataAdapter(command);
                    DataTable dataTable = new DataTable();
                    adapter.Fill(dataTable);

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