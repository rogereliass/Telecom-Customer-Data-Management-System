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

            // Clear the label text at the beginning of the search
            UsageTextBox.Text = "";

            if (string.IsNullOrEmpty(startDate) || string.IsNullOrEmpty(mobileNum))
            {
                ResultGrid.Visible = false;
                UsageTextBox.Text = "Please provide all required inputs.";
                UsageTextBox.ForeColor = System.Drawing.Color.Red;
                UsageTextBox.Visible = true;
                return;
            }

            string connectionString = ConfigurationManager.ConnectionStrings["GUC_Telecom"].ConnectionString;
            string query = "SELECT * FROM dbo.Account_Usage_Plan(@mobile_num, @from_date)";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(query, connection);
                command.CommandType = CommandType.Text;

                command.Parameters.AddWithValue("@mobile_num", mobileNum);
                command.Parameters.AddWithValue("@from_date", DateTime.Parse(startDate));

                try
                {
                    connection.Open();
                    SqlDataAdapter adapter = new SqlDataAdapter(command);
                    DataTable dataTable = new DataTable();
                    adapter.Fill(dataTable);

                    ResultGrid.DataSource = dataTable;
                    ResultGrid.DataBind();
                    ResultGrid.Visible = true;

                    if (dataTable.Rows.Count > 0)
                    {
                        UsageTextBox.Text = "Data available Below";
                        UsageTextBox.ForeColor = System.Drawing.Color.Green;
                    }
                    else
                    {
                        UsageTextBox.Text = "No data available";
                        UsageTextBox.ForeColor = System.Drawing.Color.Red;
                    }

                    UsageTextBox.Visible = true;
                }
                catch (Exception ex)
                {
                    ResultGrid.Visible = false;
                    UsageTextBox.Text = $"Error: {ex.Message}";
                    UsageTextBox.ForeColor = System.Drawing.Color.Red;
                    UsageTextBox.Visible = true;
                }
            }
        }




    }
}