using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FinalProjects
{
    public partial class ForgetPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnConfirm_Click(object sender, EventArgs e)
        {
            //Validation for the textFields
       if (txtEmail.Text != null && txtEmail.Text != "" && txtFname.Text != null && txtFname.Text != "" && txtLname.Text !=null && txtLname.Text != "" && txtNPassword.Text != null && txtNPassword.Text !="")
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
                using (SqlConnection con = new SqlConnection(cs))
                {
                    try
                    {
                        // Updating the password 
                        SqlCommand cmd = new SqlCommand("update LoginInfo set Password = '" + txtNPassword.Text + "' where Email = '" + txtEmail.Text + "'  and FirstName = '" + txtFname.Text + "' and LastName = '" + txtLname.Text + "'", con);
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                        lblMessage.Text = "Your Password is successfully changed";
                        lblMessage.ForeColor = System.Drawing.Color.Green;
                        Response.Redirect("Login.aspx");
                    }
                    catch (SqlException){
                        lblMessage.Text = "Your have Problem is changing password";
                        lblMessage.ForeColor = System.Drawing.Color.Red;

                    }
                }
         }
       else
       {
           lblMessage.Text = "We are not sure its your account";
           lblMessage.ForeColor = System.Drawing.Color.Red;
       }
}
    }
}