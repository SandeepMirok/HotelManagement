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
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (txtEmail.Text != null && txtEmail.Text != "" && txtPassword.Text != null && txtPassword.Text != "")
            {
                if (chkRemember.Checked)
                {
                    string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
                    using (SqlConnection con = new SqlConnection(cs))
                    {
                        try
                        {
                            con.Open();
                            string sqlquery = "select * from LoginInfo where Email='" + txtEmail.Text + "' and Password = '" + txtPassword.Text + "'";
                            SqlCommand cmd = new SqlCommand(sqlquery, con);
                            SqlDataReader reader = cmd.ExecuteReader();
                            if (reader.Read())
                            {
                                Session["Email"] = txtEmail.Text;
                                Session["Password"] = txtPassword.Text;
                                Session["FirstName"] = reader["FirstName"].ToString();
                                Session["LastName"] = reader["LastName"].ToString();
                                Session["Gender"] = reader["Gender"].ToString();
                                Session["Image"] = reader["Image"].ToString();
                                Session["ID"] = reader["ID"].ToString();


                                Response.Redirect("WebForm1.aspx");
                               

                            }
                            else
                            {
                                MessageBoxShow("Login Failed!");

                            }



                            reader.Close();
                            con.Close();

                        }
                        catch (NullReferenceException nl)
                        {
                        }

                    }
                }
                else
                {
                    this.AlertBoxMessage1.InnerText = "Check the box";
                    this.AlertBox1.Visible = true;
                }
            }

            else
            {
                
            }
        }
             private void MessageBoxShow(string message)
        {
            this.AlertBoxMessage1.InnerText = message;
            this.AlertBox1.Visible = true;
        }

             
    }
    
    }
