using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows;


namespace FinalProjects
{
    public partial class MyProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                //Response.Write(Session["ID"].ToString());
                if (HttpContext.Current.Session != null)
                {
                    Image.ImageUrl = "~/ShowImage.ashx?id=" + Session["ID"].ToString();
                    ProfileData.Text = " First Name: " + Session["FirstName"].ToString() + "<br/>" + "Last Name : " + Session["LastName"].ToString() +
                        "<br/>" + "Email : " + Session["Email"].ToString() + "<br/>" + "Gender : " + Session["Gender"].ToString();
                    Fname.Text = Session["FirstName"].ToString();
                    Lname.Text = Session["LastName"].ToString();
                    Gmail.Text = Session["Email"].ToString();
                    Gender.Text = Session["Gender"].ToString();
                    Fname.Visible = false;
                    Lname.Visible = false;
                    Gmail.Visible = false;
                    Gender.Visible = false;
                    imgUpload.Visible = false;
                    label1.Visible = false;
                    label2.Visible = false;
                    label3.Visible = false;
                    label4.Visible = false;
                    label5.Visible = false;
                    Image2.Visible = false;




                }
            }
            
           
        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            SqlConnection connection = null;
            try
            {
                FileUpload img = (FileUpload)imgUpload;
                Byte[] imgByte = null;
                if (img.HasFile && img.PostedFile != null)
                {
                    // To create postfile
                    HttpPostedFile File = imgUpload.PostedFile;
                    //Create byte array with file len
                    imgByte = new Byte[File.ContentLength];
                    //force the control to load data in array
                    File.InputStream.Read(imgByte, 0, File.ContentLength);
                }
                //Insert the employee image into database
                string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
                connection = new SqlConnection(cs);
                connection.Open();

                string sql = "update LoginInfo   set FirstName = @fnm, LastName = @lnm, Email = @em, Gender = @gn, Image =@eimg where id = @id  Select @@IDENTITY";
                SqlCommand cmd = new SqlCommand(sql, connection);
                lblMessage.Text = "Image upload successfully";
                cmd.Parameters.AddWithValue("@fnm", Fname.Text.Trim());
                cmd.Parameters.AddWithValue("@lnm", Lname.Text.Trim());
                cmd.Parameters.AddWithValue("@em", Gmail.Text.Trim());
                cmd.Parameters.AddWithValue("@gn", Gender.Text.Trim());
                cmd.Parameters.AddWithValue("@id", Session["ID"].ToString());
              //  cmd.Parameters.AddWithValue("@psw", txtPassword.Text.Trim());
                cmd.Parameters.AddWithValue("@eimg", imgByte);
                cmd.ExecuteNonQuery();
              //  int id = Convert.ToInt32(cmd.ExecuteScalar());
               // lblMessage.Text = String.Format("Employee ID is {0}", id);
                connection.Close();
                
              //Image2.ImageUrl = "~/ShowImage.ashx?id=" + id;
                Session.Contents.Remove("FirstName");
                Session.Contents.Remove("LastName");
                Session.Contents.Remove("Gmail");
                Session.Contents.Remove("Gender");
                Session["FirstName"] = Fname.Text;
                Session["LastName"] = Lname.Text;
                Session["Email"] = Gmail.Text;
                Session["Gender"] = Gender.Text;

                lblMessage.Text = Session["FirstName"].ToString();

            }
            catch

            {
                lblMessage.Text = " There was an error " ;
            }



        }

        protected void idtPButn_Click(object sender, EventArgs e)
        {
            if(CheckBox.Checked)
                {

                    Fname.Visible = true;
                    Lname.Visible = true;
                    Gmail.Visible = true;
                    Gender.Visible = true;
                    imgUpload.Visible = true;
                    label1.Visible = true;
                    label2.Visible = true;
                    label3.Visible = true;
                    label4.Visible = true;
                    label5.Visible = true;
                 
                    ProfileData.Visible = false;
                    
                    errorMsg.Text = "All fields are visible for edit ";
                    errorMsg.ForeColor = System.Drawing.Color.Green;
                    lblMessage.Text = "";


                }
            else{
                errorMsg.Text = "Please check the edit Box";
                errorMsg.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void Fname_TextChanged(object sender, EventArgs e)
        {

        }

    }
}

