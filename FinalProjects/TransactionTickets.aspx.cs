using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace FinalProjects
{
    public partial class TransactionTickets : System.Web.UI.Page
    {
        string temp;
        protected void Page_Load(object sender, EventArgs e)
        {
           

            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            //Get the total price
            using (SqlConnection con = new SqlConnection(cs))
            {
                try
                {
                    // Gettting the price of tickets to make the payment

                    string command;
                    command = "SELECT Price FROM EventDescription where id ='" + Session["EventID"].ToString() + "'";
                    SqlCommand cmd = new SqlCommand(command, con);

                    con.Open();

                    decimal price = Convert.ToDecimal(cmd.ExecuteScalar());
                    int tickets = Convert.ToInt32(Session["PeopleNum"].ToString());
                    temp = Convert.ToString(tickets * price);
                    txtPrice.Text = "$" + temp;

                    con.Close();
                }
                catch (SqlException nl)
                {

                }
            }
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
                int id = Convert.ToInt32(Session["Id"].ToString());

                //Creates transaction
                string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
                using (SqlConnection con = new SqlConnection(cs))
                {
                    try
                    {
                        SqlCommand cmdd = new SqlCommand("insert into TransactionInfo(ClientID,Amount)Values('" + id + "','" + temp + "')", con);
                        con.Open();
                        cmdd.ExecuteNonQuery();
                        con.Close();
                        /*
                            cmd.CommandText = "insert into Transaction values(" + id + ", " + Convert.ToDecimal(temp) + ")";
                            cmd.Connection = con;

                            con.Open();

                            int row = cmd.ExecuteNonQuery();

                            con.Close();
                         */
                        Response.Write("<script LANGUAGE='JavaScript' >alert(' Previous Reservation SecessFull ')</script>");
                        Response.Write("<script LANGUAGE='JavaScript' >alert('See You At Event.')</script>");
                        Response.Redirect("WebForm1.aspx");
                    }
                    catch (SqlException nl)
                    {
                        Response.Write("<script LANGUAGE='JavaScript' >alert('Fill in the correct information')</script>");
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