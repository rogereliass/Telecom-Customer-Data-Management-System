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
    public partial class AvgTransactionAmout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


        }

        protected void SearchButton_Click(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["GUC_Telecom"].ConnectionString;
            string query = "SELECT dbo.Wallet_Transfer_Amount(@walletID,@start_date,@end_date)";

            string walletid = WalletIDTextBox.Text.Trim();
            string startDate = StartDateInput.Text.Trim();
            string endDate = EndDateInput.Text.Trim();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(query, connection);
                command.CommandType = CommandType.Text;

                // Pass parameters
                command.Parameters.AddWithValue("@walletID", walletid);
                command.Parameters.AddWithValue("@start_date", startDate);
                command.Parameters.AddWithValue("@end_date", endDate);


                try
                {
                    connection.Open();

                    object result = command.ExecuteScalar();

                    if (result != null && int.TryParse(result.ToString(), out int avgtransactionAmount))
                    {
                        ResultLabel.Text = $"Average Of Transaction Amount: {avgtransactionAmount}";
                        ResultLabel.ForeColor = System.Drawing.Color.Green;
                    }
                    else
                    {
                        ResultLabel.Text = "No Transactions.";
                        ResultLabel.ForeColor = System.Drawing.Color.Orange;
                    }

                    ResultGrid.Visible = false;
                }
                catch (Exception ex)
                {
                    ResultLabel.Text = "An error occurred while fetching the average transaction amount.";
                    ResultLabel.ForeColor = System.Drawing.Color.Red;

                    System.Diagnostics.Trace.WriteLine($"Error: {ex.Message}");
                }
            }
        }
    }
}