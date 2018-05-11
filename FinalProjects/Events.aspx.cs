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
    public partial class Events : System.Web.UI.Page
    {
       
        DateTime localDate = DateTime.Now;
        string date;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                booking.Visible = false;
                string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
                //Adds EventsName to drop down list
                DataTable category = new DataTable();
                using (SqlConnection con = new SqlConnection(cs))
                {
                    try
                    {
                        SqlDataAdapter adapter = new SqlDataAdapter("SELECT Event From EventDescription", con);
                        adapter.Fill(category);

                        ddlEvent.DataSource = category;
                        ddlEvent.DataTextField = "Event";
                        ddlEvent.DataValueField = "Event";
                        ddlEvent.DataBind();
                    }
                    catch (SqlException nl)
                    {
                    }
                }
            }
            
        }


        protected void btnSearch_Click1(object sender, EventArgs e)
        {
            booking.Visible = true;
            search.Visible = false;
            string command = "";
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {

                command = "SELECT EventDate,Event, Description,NumerOfSeats FROM EventDescription  where EventDate='" + txtDateIn.Text + "'";
                SqlCommand cmd = new SqlCommand(command, con);


                con.Open();
                gvCategory.DataSource = cmd.ExecuteReader();
                gvCategory.DataBind();
                if (gvCategory.Rows.Count != 0)
                {
                    Response.Write("SucessFull");
                    txtEvents.Text = "Choose Your Event";
                }
                else
                {
                    con.Close();
                    command = "SELECT EventDate,Event, Description,NumerOfSeats FROM EventDescription ";
                    SqlCommand cm = new SqlCommand(command, con);
                    con.Open();

                    gvCategory.DataSource = cm.ExecuteReader();
                    gvCategory.DataBind();
                    txtEvents.Text = "No Events on that Date  Chooose From the follwing";
                    // Calendar1.Visible = true;
                    con.Close();
                }



            }
        }

        protected void btnTickets_Click(object sender, EventArgs e)
        {
             //booking the ticket for the events

            booking.Visible = false;
            search.Visible = true;
            if (Convert.ToInt32(txtPeople.Text) > 0 && ddlEvent.SelectedIndex >= 0)
            {
                Session["CheckIn"] = txtDateIn.Text;
                Session["Category"] = ddlEvent.SelectedValue;
                Session["PeopleNum"] = txtPeople.Text;

                string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
                using (SqlConnection con = new SqlConnection(cs))
                {
                   // getting the client ID
                        string command;
                        command = "SELECT Id FROM LoginInfo where Email ='" + Session["Email"].ToString() + "'";
                        SqlCommand cmd = new SqlCommand(command, con);
                        
                        con.Open();

                        Session["Id"] = cmd.ExecuteScalar();
                        string GuestID = Session["Id"].ToString();

                        con.Close();
                        string comman;
                        comman = "SELECT id FROM EventDescription where Event ='" + ddlEvent.Text + "'";
                        SqlCommand cm = new SqlCommand(comman, con);

                        con.Open();
                        Session["EventID"] = cm.ExecuteScalar();
                        string EventID = Convert.ToString( Session["EventID"]);

                        con.Close();
                       
                        string comma;
                        comma = "SELECT NumerOfSeats FROM EventDescription where Event ='" + ddlEvent.Text + "'";
                        SqlCommand c = new SqlCommand(comma, con);
                        
                        con.Open();

                        string newSeats = Convert.ToString(c.ExecuteScalar());
                       
                        string newNumber = Convert.ToString(Convert.ToInt32(newSeats) - Convert.ToInt32(txtPeople.Text) );
                        txtEvents.Text = newNumber;
                        con.Close();
                       
                        try
                        {
                            // Updating the tickets in the databse after booking
                            int a = Convert.ToInt32(newNumber);
                            if (a > 0)
                            {
                                SqlCommand cmdo = new SqlCommand("update EventDescription set NumerOfSeats ='" + newNumber + "' where Event='" + ddlEvent.Text + "'", con);
                                con.Open();
                                cmdo.ExecuteNonQuery();
                                con.Close();
                                SqlCommand cmdd = new SqlCommand("insert into EventBooking(EventID,GuestId,NumberOfSeats,GuestEmail)Values('" + EventID + "','" + GuestID + "','" + txtPeople.Text + "','" + Session["Email"].ToString() + "')", con);
                                con.Open();
                                cmdd.ExecuteNonQuery();

                                con.Close();
                               // txtEvents.Text = "done " + newNumber + "" + GuestID + "" + Session["Email"].ToString();
                                Response.Redirect("TransactionTickets.aspx");
                            }
                            else
                            {
                               

                            }
                        }
                        catch (Exception)
                        {
                            txtEvents.Text = "sry No More Seats";
                        }
                   
                     
                    }
               // txtEvents.Text = " Booking SucessFull!!!";
             
                Response.Write("Sucessfull");
               // search.Visible = true;
              //  booking.Visible = false;
                

        }
            else
            {

                // Alert for wrong validation
                Response.Write("<script LANGUAGE='JavaScript' >alert('Fill in the correct information')</script>");
            }
        }
            }
           
        }

       
    
