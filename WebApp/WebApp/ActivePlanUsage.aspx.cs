using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Runtime.InteropServices.ComTypes;

namespace WebApp
{
    public partial class ActivePlanUsage : System.Web.UI.Page
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

           
            string query = "SELECT * FROM dbo.Usage_Plan_CurrentMonth(@MobileNo)";

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
