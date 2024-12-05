using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApp
{
    public partial class AllServicePlans5Months : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] != null)
            {
                string mobileNo = Session["user"].ToString();

                LoadCurrentUsage(mobileNo);
            }
            else
            {
                Response.Write("<script>alert('User session not found. Please log in.');</script>");
            }

        }
        private void LoadCurrentUsage(string mobileNo)
        {

            string connectionString = ConfigurationManager.ConnectionStrings["GUC_Telecom"].ConnectionString;


            string query = "SELECT * FROM dbo.Subscribed_plans_5_Months(@MobileNo)";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(query, connection);
                command.CommandType = CommandType.Text;

                command.Parameters.AddWithValue("@MobileNo", mobileNo);


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