using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApp
{
    public partial class UserLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }
        protected void LoginButton_Click(object sender, EventArgs e)
        {
            string mobile = TextBox1.Text.Trim();  
            string password = TextBox2.Text;

            string connectionString = ConfigurationManager.ConnectionStrings["GUC_Telecom"].ConnectionString;

            string query = "SELECT dbo.AccountLoginValidation(@mobile, @password)";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@mobile", mobile);
                command.Parameters.AddWithValue("@password", password);

                try
                {
                    connection.Open();
                    bool isValidUser = (bool)command.ExecuteScalar();

                    if (isValidUser)
                    {
                        Response.Write("<script>alert('Login successful!');</script>");
                        Response.Redirect("UserDashboard.aspx");
                        Session["user"] = mobile;
                    }
                    else
                    {
                        Response.Write("<script>alert('Invalid mobile number or password.');</script>");
                    }
                }
                catch (Exception ex)
                {
                    Response.Write($"<script>alert('Error: {ex.Message}');</script>");
                }
            }
        }
        protected void ViewPlansButton_Click(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["GUC_Telecom"].ConnectionString;

            string query = "SELECT * FROM allServicePlans";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(query, connection);
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                DataTable dataTable = new DataTable();

                try
                {
                    connection.Open();
                    adapter.Fill(dataTable);

                    ServicePlansGrid.DataSource = dataTable;
                    ServicePlansGrid.DataBind();
                    ServicePlansGrid.Visible = true;
                }
                catch (Exception ex)
                {
                    Response.Write($"<script>alert('Error: {ex.Message}');</script>");
                }
            }
        }

    }
}
