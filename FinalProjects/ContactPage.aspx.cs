using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FinalProjects
{
    public partial class ContactPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SendMail()
        {
            // Gmail Address from where you send the mail
            //var fromAddress = "sonumalhi97@gmail.com";
            var fromAddress = email.Text;
            // any address where the email will be sending
            var toAddress = "sonumalhi97@gmail.com";
            //  var toAddress = email.Text.ToString();
            //Password of your gmail address
            var fromPassword = password.Text;
            // const string fromPassword = "Sm9781865160";
            // Passing the values and make a email formate to display
            string subject = sub.Text.ToString();
            //string body = "From: " + name.Text + "\n";
            //  body += "Email: " + email.Text + "\n";
            string body = "Subject: " + sub.Text + "\n";
            body += "Question: \n" + message.Text + "\n";
            // smtp settings
            var smtp = new System.Net.Mail.SmtpClient();
            {
                smtp.Host = "smtp.gmail.com";
                smtp.Port = 587;
                smtp.EnableSsl = true;
                smtp.DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network;
                smtp.Credentials = new NetworkCredential(fromAddress, fromPassword);
                smtp.Timeout = 20000;
            }
            // Passing values to smtp object
            smtp.Send(fromAddress, toAddress, subject, body);
        }
        protected void btnContactUs_Click(object sender, EventArgs e)
        {
            try
            {
                //here on button click what will done 
                SendMail();
                lblmessage.Text = "Your mail has been sent";
                lblmessage.ForeColor = System.Drawing.Color.Green;
                //  DisplayMessage.Visible = true;
                sub.Text = "";
                email.Text = "";
                name.Text = "";
                message.Text = "";
                password.Text = "";
            }
            catch (Exception)
            {
                lblmessage.Text = "Email has not been sent";
                lblmessage.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
}