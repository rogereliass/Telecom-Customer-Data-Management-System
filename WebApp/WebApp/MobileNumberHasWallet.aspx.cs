using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

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
            string query = "SELECT dbo.Wallet_MobileNo(@mobile_num)";

            string mobileno = MobileNoTextBox.Text.Trim();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(query, connection);
                command.CommandType = CommandType.Text;

                // Pass parameters
                command.Parameters.AddWithValue("@mobile_num", mobileno);


                try
                {
                    connection.Open();

                    object result = command.ExecuteScalar();

                    if (result != null && int.TryParse(result.ToString(), out int hasAwallet))
                    {
                        if (hasAwallet == 1)
                        {
                            ResultLabel.Text = $"Yes it is linked to a wallet";
                            ResultLabel.ForeColor = System.Drawing.Color.Green;
                        }
                        else
                        {
                            ResultLabel.Text = "No Wallet";
                            ResultLabel.ForeColor = System.Drawing.Color.Orange;
                        }
                    }
                    else
                    {
                        ResultLabel.Text = "No Wallet.";
                        ResultLabel.ForeColor = System.Drawing.Color.Orange;
                    }

                    ResultGrid.Visible = false;
                }
                catch (Exception ex)
                {
                    ResultLabel.Text = "An error occurred while fetching is theis mobile number has a wallet.";
                    ResultLabel.ForeColor = System.Drawing.Color.Red;

                    System.Diagnostics.Trace.WriteLine($"Error: {ex.Message}");
                }
            }
        }
    }
}