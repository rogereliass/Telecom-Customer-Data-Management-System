using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApp
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void login(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["GUC_Telecom"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            int mobileNo = Int16.Parse(username.Text);
            String pass = password.Text;

            if (mobileNo.ToString() == "1" && pass == "admin")
            {
                Response.Write("Welcome");
            }
            /*SqlCommand loginProcess = new SqlCommand("AccountLoginValidation",conn);
            loginProcess.Parameters.Add(new SqlParameter("@mobile_num", mobileNo));
            loginProcess.Parameters.Add(new SqlParameter("@pass", pass));

            SqlParameter success = loginProcess.Parameters.Add("@output", System.Data.SqlDbType.Int);
            success.Direction = ParameterDirection.Output;

            conn.Open();
            loginProcess.ExecuteNonQuery();
            conn.Close();

            if(success.Value.ToString() == "1")
            {
                Response.Write("Welcome");
            } 
            */
        }
    }
}