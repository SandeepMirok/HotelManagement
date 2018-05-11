using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FinalProjects
{
    public partial class Rooms : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Displays the room category and its description on the gridview
            string command = "";
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                try
                {
                    command = "Select Category, Description, Price From RoomCategory";
                    SqlCommand cmd = new SqlCommand(command, con);

                    con.Open();

                    gvCategory.DataSource = cmd.ExecuteReader();
                    gvCategory.DataBind();
                    con.Close();
                }
                catch (SqlException nl)
                {

                }
            }
        }
    }
}