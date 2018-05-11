using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FinalProjects
{
    public partial class MainMasterPage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (Session["Email"] != null)
            {
                lblUserName.Text = Session["FirstName"].ToString();
                lblUserMsg.Text = Session["LastName"].ToString();
                Image.ImageUrl = "~/ShowImage.ashx?id=" + Session["ID"].ToString();
              
               
            }

        }
    }
}