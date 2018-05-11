using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace FinalProjects
{
    public partial class Transaction : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            txtPrice.Text = "$" + Session["Price"].ToString();
        }

        protected void btnPay_Click(object sender, EventArgs e)
        {
            //Validates if textboxes are filled correctly
            if (txtCNum.Text.Length == 16 && txtSecureity.Text.Length == 3)
            {
                //Declare Variables
                string credit, sec;
                DateTime expire;
                credit = txtCNum.Text;
                expire = DateTime.Parse(txtExpire.Text);
                sec = txtSecureity.Text;
                int id = Convert.ToInt32(Session["ClientID"].ToString());

                //Creates transaction
                string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
                using (SqlConnection con = new SqlConnection(cs))
                {
                    try
                    {
                        SqlCommand cmd2 = new SqlCommand();
                        cmd2.CommandText = "insert into TransactionInfo values(" + id + ", " + Convert.ToDecimal(Session["Price"]) + ")";
                        cmd2.Connection = con;

                        con.Open();

                        int row = cmd2.ExecuteNonQuery();

                        con.Close();
                    }
                    catch (SqlException nl)
                    {
                        Response.Write("<script LANGUAGE='JavaScript' >alert('Fill in the correct information')</script>");
                    }


                }
                //Insert to VisitInfo table
                using (SqlConnection con = new SqlConnection(cs))
                {
                    try
                    {
                        SqlCommand cmd = new SqlCommand();
                        cmd.CommandText = "insert into VisitInfo values('" + Session["ClientID"] + "', '"
                            + DateTime.Parse(Session["CheckIn"].ToString()) + "', '"
                            + DateTime.Parse(Session["CheckOut"].ToString()) + "', '"
                            + Session["Category"].ToString() + "', "
                            + Convert.ToInt32(Session["RoomNum"].ToString()) + ","
                            + Convert.ToInt32(Session["PeopleNum"].ToString()) + ",'"
                            + Session["RoomChosen"].ToString() + "')";
                        cmd.Connection = con;

                        con.Open();

                        int row = cmd.ExecuteNonQuery();

                        con.Close();
                       
                        Response.Redirect("WebForm1.aspx");
                        Session["Paid"] = "true";
                        Response.Write("<script LANGUAGE='JavaScript' >alert('Your Booking is SucessFull')</script>");
                    }
                    catch (SqlException nl)
                    {

                    }


                }

            }
            else
            {
                Response.Write("<script LANGUAGE='JavaScript' >alert('Fill in the correct information')</script>");
            }
        }
    }
}