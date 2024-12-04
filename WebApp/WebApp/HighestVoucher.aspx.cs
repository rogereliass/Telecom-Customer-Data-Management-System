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
    public partial class HighestVoucher : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["user"] != null)
            {
                string mobileNo = Session["user"].ToString();

                LoadHighestValueVoucher(mobileNo);
            }
            else
            {
                Response.Write("<script>alert('User session not found. Please log in.');</script>");
            }
        }
        private void LoadHighestValueVoucher(string mobileNo)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["GUC_Telecom"].ConnectionString;
            string storedProcedure = "Account_Highest_Voucher";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(storedProcedure, connection);
                command.CommandType = CommandType.StoredProcedure;

                command.Parameters.AddWithValue("@mobile_num", mobileNo);

                try
                {
                    connection.Open();


                    object result = command.ExecuteScalar();

                    if (result != null && int.TryParse(result.ToString(), out int ticketCount))
                    {
                        ResultLabel.Text = $"Value of Highest Voucher: {ticketCount}";
                        ResultLabel.ForeColor = System.Drawing.Color.Green;
                    }
                    else
                    {
                        ResultLabel.Text = "No voucher found.";
                        ResultLabel.ForeColor = System.Drawing.Color.Orange;
                    }

                    ResultGrid.Visible = false;
                }
                catch (Exception ex)
                {
                    ResultLabel.Text = "An error occurred while fetching the highest voucher.";
                    ResultLabel.ForeColor = System.Drawing.Color.Red;

                    System.Diagnostics.Trace.WriteLine($"Error: {ex.Message}");
                }
            }
        }
    }
}