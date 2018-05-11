<%@ Page Title="" EnableEventValidation="false" Language="C#" MasterPageFile="~/MainMasterPage.Master" AutoEventWireup="true" CodeBehind="ContactPage.aspx.cs" Inherits="FinalProjects.ContactPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="cssPage.css" />
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <div class ="jumbotron jumbotron-sm">
      <div class="container">
          <div class="row">
              <div class ="colvvvvs-sm-12 col-lg-12">
                 <h1 class="h1">
                    Contact us <small>Feel free to contact us</small></h1>
            </div>
        </div>
    </div>
</div>
<div class="container">
    <div class="row">
        <div class="col-md-8">
            <div class="well well-sm">
                <form   >
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="name">
                                Name</label>
                            <asp:TextBox ID="name" name="name" class="form-control" placeholder="Enter name" required="required" runat="server" ></asp:TextBox>
                            
                        </div>
                        <div class="form-group">
                            <label for="email">
                                 Email Address</label>
                            <div class="input-group">
                                <span class="input-group-addon"><span class="glyphicon glyphicon-envelope"></span>
                                </span>
                                 <asp:TextBox ID="email" name="email"  class="form-control" placeholder="Enter email" required="required" type="email"  runat="server" ></asp:TextBox>
                                </div>
                        </div>
                        <div class="form-group">
                            <label for="password">
                                 Password</label>
                            <div class="input-group">
                                <span class="input-group-addon"><span class="glyphicon glyphicon-phone"></span>
                                </span>
                                 <asp:TextBox ID="password" name="email"  class="form-control" placeholder="Enter email" required="required" type="password"  runat="server" ></asp:TextBox>
                                </div>
                        </div>
                        <div class="form-group">
                            <label for="subject">   
                                Subject</label>
                            <asp:TextBox ID="sub" class="form-control" placeholder="Enter subject"  required="required" runat="server" ></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                             <label for="message">
                                Message</label>
                            <asp:TextBox ID="message" class="form-control" runat="server" 

                TextMode="MultiLine" Rows="9" Columns="25"  />
                         
                            

                        </div>
                    </div>
                    <asp:Label ID="lblmessage" runat="server" Text=""></asp:Label>
                    <div class="col-md-12">
                       
                            <asp:Button ID="btnContactUs" runat="server"  Text="Send Message" class="btn btn-primary pull-right" OnClick="btnContactUs_Click" />
                            
                    </div>
                </div>
                </form>
            </div>
        </div>
        <div class="col-md-4">
            <div>
            <legend class="color"><span class="glyphicon glyphicon-globe icon-success"></span> Our office</legend>
            <address>
                <strong>Taj Hotel, co.</strong><br/>
                12 Viewcrest circle<br/>
                 Etobicoke, M9w7G5<br/>
                <abbr title="Phone">
                    P:</abbr>
                6477810067
            </address>
            <address>
                <strong>Full Name</strong><br>
                <a href="mailto:sonumalhi97@gmail.com">sonumalhi97@gmail.com</a>
            </address>
            </div>
        </div>
    </div>
</div>
    
    

    
   
   <!-- <?php
        if(isset($_POST['email'])){

        //Edit The 2 line below
        $email_to = "sonumalhi97@gmail.com";
        $email_subject = " Your Email subject line";

        function died($error){
        //your error code can go here
        echo "We are ver sorry, but there was an error(s) found with the form you submitted.";
        echo "these error appear below.<br /><br />";
        echo $error."<br /><br />";
        echo "please go back and fix these errors.<br />br>";
    die();
    }

    //Validation expected data exists
    if(!isset($_POST['name'])||
    !isset(@($_POST['email'])||
    !isset(@($_POST['messages'])){
    died ('we are sorry ,but there apperars to be a problem you submitted.');
    }
        $first_name = $_POST['name']; // required
    $email_from = $_POST['email']; // required
    $comments = $_POST['messages']; // required
 
    $error_message = "";
    $email_exp = '/^[A-Za-z0-9._%-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$/';
 
  if(!preg_match($email_exp,$email_from)) {
    $error_message .= 'The Email Address you entered does not appear to be valid.<br />';
  }
 
    $string_exp = "/^[A-Za-z .'-]+$/";
 
  if(!preg_match($string_exp,$name)) {
    $error_message .= 'The  Name you entered does not appear to be valid.<br />';
  }
 
 
 
  if(strlen($messages) < 2) {
    $error_message .= 'The Comments you entered do not appear to be valid.<br />';
  }
 
  if(strlen($error_message) > 0) {
    died($error_message);
  }
 
    $email_message = "Form details below.\n\n";
 
     
    function clean_string($string) {
      $bad = array("content-type","bcc:","to:","cc:","href");
      return str_replace($bad,"",$string);
    }
 
     
 
    $email_message .= "Full Name: ".clean_string($name)."\n";
    $email_message .= "Email: ".clean_string($email_from)."\n";
    $email_message .= "Messages: ".clean_string($messages)."\n";
 
// create email headers
$headers = 'From: '.$email_from."\r\n".
'Reply-To: '.$email_from."\r\n" .
'X-Mailer: PHP/' . phpversion();
@mail($email_to, $email_subject, $email_message, $headers);  
?>
 

 
Thank you for contacting us. We will be in touch with you very soon.
 
<?php
 
}
?>-->

    





       

</asp:Content>
