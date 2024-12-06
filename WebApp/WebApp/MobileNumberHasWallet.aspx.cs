using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace WebApp
{
    public partial class MobileNumberHasWallet : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SearchButton_Click(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["GUC_Telecom"].ConnectionString;
            string query = "SELECT dbo.Wallet_MobileNo(@mobile_num) AS HasWallet";

            string mobileNo = MobileNoTextBox.Text.Trim();

            if (string.IsNullOrWhiteSpace(mobileNo) || mobileNo.Length != 11)
            {
                ResultLabel.Text = "Please enter a valid 11-digit mobile number.";
                ResultLabel.ForeColor = System.Drawing.Color.Red;
                return;
            }

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(query, connection);
                command.CommandType = CommandType.Text;

                command.Parameters.AddWithValue("@mobile_num", mobileNo);

                try
                {
                    connection.Open();

                    object result = command.ExecuteScalar();

                    if (result != null && result != DBNull.Value && bool.TryParse(result.ToString(), out bool hasWallet))
                    {
                        if (hasWallet)
                        {
                            ResultLabel.Text = "Yes, it is linked to a wallet.";
                            ResultLabel.ForeColor = System.Drawing.Color.Green;
                        }
                        else
                        {
                            ResultLabel.Text = "No Wallet.";
                            ResultLabel.ForeColor = System.Drawing.Color.Orange;
                        }
                    }
                    else
                    {
                        ResultLabel.Text = "No Wallet.";
                        ResultLabel.ForeColor = System.Drawing.Color.Orange;
                    }
                }
                catch (Exception ex)
                {
                    ResultLabel.Text = "An error occurred while fetching data.";
                    ResultLabel.ForeColor = System.Drawing.Color.Red;

                    System.Diagnostics.Trace.WriteLine($"Error: {ex.Message}");
                }
            }
        }
    }
}
