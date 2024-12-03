using System;
using System.Web.UI;

namespace WebApp
{
    public partial class AdminLogin : Page
    {
       
        private const string AdminID = "admin";
        private const string AdminPassword = "admin";

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {
            
            string enteredAdminID = TextBox1.Text.Trim();
            string enteredPassword = TextBox2.Text;

            if (enteredAdminID == AdminID && enteredPassword == AdminPassword)
            {
                FeedbackLabel.Text = "Login successful! Welcome, Admin.";
                FeedbackLabel.CssClass = "feedback-label"; 
                FeedbackLabel.ForeColor = System.Drawing.Color.Green;

                Response.Write("<script>alert('Login successful!');</script>");
                Response.Redirect("AdminDashboard.aspx");
            }
            else
            {
                FeedbackLabel.Text = "Invalid Admin ID or Password. Please try again.";
                FeedbackLabel.CssClass = "feedback-label"; 
                FeedbackLabel.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
}
