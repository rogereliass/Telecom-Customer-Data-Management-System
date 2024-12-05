using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApp
{
    public partial class SubscriptionRenewal : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] != null)
            {
                string mobileNo = Session["user"].ToString();

                LoadTopPlans(mobileNo);
            }
            else
            {
                Response.Write("<script>alert('User session not found. Please log in.');</script>");
            }

        }

        private void SearchButton_Click(string mobileNo)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["GUC_Telecom"].ConnectionString;
            string storedProcedure = "Initiate_plan_payment";
            string paymenAmount = AmountTextBox.Text.Trim();
            string paymentMethod = PaymentMethodDropDown.SelectedValue;
            string planID = PlanIDTextBox.Text.Trim();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(storedProcedure, connection);
                command.CommandType = CommandType.StoredProcedure;

                command.Parameters.AddWithValue("@mobile_num", mobileNo);
                command.Parameters.AddWithValue("@amount", paymenAmount);
                command.Parameters.AddWithValue("@payment_method", paymentMethod);
                command.Parameters.AddWithValue("@plan_id", planID);

                try
                {
                    connection.Open();

                    SqlDataAdapter adapter = new SqlDataAdapter(command);
                    DataTable dataTable = new DataTable();

                    adapter.Fill(dataTable);

                    ResultGrid.DataSource = dataTable;
                    ResultGrid.DataBind();
                    ResultGrid.Visible = true;
                    ResultLabel.Text = $"Succesful Renewal Of The Subscription";
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