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
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }



        protected void btnRegister_Click(object sender, EventArgs e)
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
                string sql = "insert into LoginInfo(FirstName,LastName,Email,Gender,Password,Image) values(@fnm,@lnm,@em,@gn,@psw,@eimg) Select @@IDENTITY";
                SqlCommand cmd = new SqlCommand(sql, connection);
                lblMessage.Text = "Image upload successfully";
                cmd.Parameters.AddWithValue("@fnm", txtFname.Text.Trim());
                cmd.Parameters.AddWithValue("@lnm", txtLname.Text.Trim());
                cmd.Parameters.AddWithValue("@em", txtEmail.Text.Trim());
                cmd.Parameters.AddWithValue("@gn", txtGender.Text.Trim());
                cmd.Parameters.AddWithValue("@psw", txtPassword.Text.Trim());
                cmd.Parameters.AddWithValue("@eimg", imgByte);
                int id = Convert.ToInt32(cmd.ExecuteScalar());
                lblMessage.Text = String.Format("Employee ID is {0}", id);
                connection.Close();
                lblMessage.Text = "Upload Successfully";
                Response.Redirect("Login.aspx");
                lblMessage.ForeColor = System.Drawing.Color.Green;
                imgShow.ImageUrl = "~/ShowImage.ashx?id=" + id;


            }
            catch
            {
                lblMessage.Text = " There was an error ";
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
     

                

           
        }

        private void MessageBoxShow(string message)
        {
            this.AlertBoxMessage.InnerText = message;
            this.AlertBox.Visible = true;
        }
        }
    }
