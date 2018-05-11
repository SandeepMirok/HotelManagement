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
    public partial class Bookings : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                //Adds Room Categories to drop down list
                DataTable category = new DataTable();
                string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
                using (SqlConnection con = new SqlConnection(cs))
                {
                    try
                    {
                        SqlDataAdapter adapter = new SqlDataAdapter("SELECT Category From RoomCategory", con);
                        adapter.Fill(category);

                        ddlCategory.DataSource = category;
                        ddlCategory.DataTextField = "Category";
                        ddlCategory.DataValueField = "Category";
                        ddlCategory.DataBind();
                    }
                    catch (SqlException nl)
                    {
                    }
                }
                ddlCategory.Items.Insert(0, new ListItem("-Select Room Type-", ""));
            }
            
        }

        protected void btnBook_Click(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            //stores the rooms numbers selected into string and session
            int c = 0;
            Boolean choose = false;
            string roomNum = "(";
            foreach (ListItem item in lstRooms.Items)
            {
                if (item.Selected)
                {
                    roomNum += item.Text + ",";
                    c++;
                    choose = true;
                }
            }

            roomNum = roomNum.Substring(0, (roomNum.Length - 1));
            roomNum += ")";
            Session["RoomChosen"] = roomNum;

            //calculates the days reserved
            DateTime cin = Convert.ToDateTime(txtDateIn.Text);
            DateTime cout = Convert.ToDateTime(txtDateOut.Text);
            DateTime now = DateTime.Now;

            TimeSpan ts = cout - cin;
            int days = ts.Days;

            //Gets the total capacity of people that can fit into the rooms
            if (choose)
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    try
                    {
                        string command;
                        command = "SELECT sum(Capacity) FROM RoomsInfo where RoomNum in " + roomNum;
                        SqlCommand cmd = new SqlCommand(command, con);

                        con.Open();

                        Session["Capacity"] = cmd.ExecuteScalar();

                        con.Close();
                    }
                    catch (SqlException nl)
                    {

                    }
                }
            }
            else
            {
                Response.Write("<script LANGUAGE='JavaScript' >alert('Please Choose Rooms')</script>");
                return;
            }


            //Validates the data input and stores them into sessions
            if (Convert.ToInt32(txtRoom.Text) > 0 && Convert.ToInt32(txtPeople.Text) > 0 && ddlCategory.SelectedIndex != 0 && choose && Convert.ToInt32(txtRoom.Text) == c && Convert.ToInt32(txtPeople.Text) < Convert.ToInt32(Session["Capacity"]) && days > 0 && cin > now && cout > cin)
            {
                Session["CheckIn"] = txtDateIn.Text;
                Session["CheckOut"] = txtDateOut.Text;
                Session["RoomNum"] = txtRoom.Text;
                Session["PeopleNum"] = txtPeople.Text;

                //gets the total price
                using (SqlConnection con = new SqlConnection(cs))
                {
                    try
                    {
                        string command;
                        command = "SELECT sum(Price) FROM RoomsInfo where RoomNum in " + roomNum;
                        SqlCommand cmd = new SqlCommand(command, con);

                        con.Open();

                        Session["Price"] = cmd.ExecuteScalar();
                        Session["Price"] = Convert.ToInt32(Session["Price"]) * days;

                        con.Close();
                    }
                    catch (SqlException nl)
                    {

                    }
                }

                //gets the client ID
                using (SqlConnection con = new SqlConnection(cs))
                {
                    try
                    {
                        string command;
                        command = "SELECT Id FROM LoginInfo where Email ='" + Session["Email"].ToString() + "'";
                        SqlCommand cmd = new SqlCommand(command, con);

                        con.Open();

                        Session["ClientID"] = cmd.ExecuteScalar();

                        con.Close();
                    }
                    catch (SqlException nl)
                    {

                    }
                }
                //Opens Transaction page
                Response.Redirect("Transaction.aspx");

            }
            else
            {
                Response.Write("<script LANGUAGE='JavaScript' >alert('Fill in the correct information')</script>");
            }

        }

        protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e){
        //Displays the rooms that are not occupied and beloning to the category selected in the listbox
            Session["Category"] = ddlCategory.SelectedValue;
            lblRooms.Text = "Hold Ctrl to select multiple Rooms";
            DataTable category = new DataTable();
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                try
                {
                    con.Open();
                    SqlDataAdapter adapter = new SqlDataAdapter("SELECT RoomNum From RoomsInfo where Occupation = 'false' and Category = '" + Session["Category"].ToString() + "'", con);
                    DataSet myDataSet = new DataSet();

                    adapter.Fill(myDataSet, "RoomsInfo");

                    DataTable myDataTable = myDataSet.Tables[0];

                    DataRow tempRow = null;


                    lstRooms.Items.Clear();
                    foreach (DataRow tempRow_Variable in myDataTable.Rows)
                    {
                        tempRow = tempRow_Variable;
                        lstRooms.Items.Add((tempRow["RoomNum"]).ToString());
                    }
                    lstRooms.DataBind();
                    con.Close();



                }
                catch (SqlException nl)
                {

                }
            }

        }
    }
}