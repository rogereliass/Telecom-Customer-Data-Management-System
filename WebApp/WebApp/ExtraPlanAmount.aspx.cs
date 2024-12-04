using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApp
{
    public partial class ExtraPlanAmount : System.Web.UI.Page
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

            string planName = planN.ToString();

            if (string.IsNullOrEmpty(planName))
            {
                ResultGrid.Visible = false;
                Response.Write("<script>alert('Please provide all required inputs.');</script>");
                return;
            }

            string connectionString = ConfigurationManager.ConnectionStrings["GUC_Telecom"].ConnectionString;

            string query = "SELECT dbo.Extra_plan_amount(@mobile_num,@plan_name)";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(query, connection);
                command.CommandType = CommandType.Text;  // Text because it's a function, not a stored procedure

                command.Parameters.AddWithValue("@mobile_num", Session["user"].ToString());
                command.Parameters.AddWithValue("@plan_name", planName);
                try
                {
                    connection.Open();

                    // If the result is scalar (single value)
                    object result = command.ExecuteScalar();
                    if (result != null && int.TryParse(result.ToString(), out int RemAmount))
                    {
                        ResultLabel.Text = $"Value of Extra Amount: {RemAmount}";
                        ResultLabel.ForeColor = System.Drawing.Color.Green;
                    }
                    else
                    {
                        ResultLabel.Text = "No amount found.";
                        ResultLabel.ForeColor = System.Drawing.Color.Orange;
                    }

                    ResultGrid.Visible = false;
                }
                catch (Exception ex)
                {
                    ResultLabel.Text = "An error occurred while fetching the plan amount.";
                    ResultLabel.ForeColor = System.Drawing.Color.Red;

                    System.Diagnostics.Trace.WriteLine($"Error: {ex.Message}");
                }
            }
        }
    }
}