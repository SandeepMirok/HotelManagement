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
    public partial class Advanced : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            divGrid.Visible = false;
            // Filling the Dropdown list with the droom category
            if (!IsPostBack)
            {
                if (Session["Paid"] != null)
                {
                    Response.Write("<script LANGUAGE='JavaScript' >alert('Payment Complete')</script>");
                }



                //Adds Room Categories to drop down list
                DataTable category = new DataTable();

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
            }
          }
        protected void btnSearch_Click(object sender, EventArgs e) {
            divGrid.Visible = true;
            string command = "";
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                //Searching the room according to the category price and Capacity

                command = "SELECT RoomNum,Category,Capacity,Price,Occupation FROM  RoomsInfo  where Price <= '" + txtPrice.Text + "' and Capacity <='" + txtPeople.Text + "' and Category ='" + ddlCategory.SelectedValue + "'";
                SqlCommand cmd = new SqlCommand(command, con);


                con.Open();
                gvCategory.DataSource = cmd.ExecuteReader();
                gvCategory.DataBind();
                if (gvCategory.Rows.Count != 0)
                {
                    Response.Write(ddlCategory.Text);
                    txtEvents.Text = "Rooms ";
                }
                else
                {
                    con.Close();
                  
                }
            }
        }

       

      

        
    }
}