<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="FinalProjects.Register" %>

<!DOCTYPE html>

<html >
<head >
     <title>Register page</title>
   <link rel="stylesheet" type="text/css" href="cssPage.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
     <script type="text/javascript">
            function closeAlert(e)
            {
                e.preventDefault();
                this.parentNode.style.display = "none";
            }
        </script>
  
<body>
    <div class="header-w3l">
		<h1>
			<a href="MainHomePage.aspx" class="pull-left"><span  class="glyphicon glyphicon-arrow-left"></span></a>&nbsp;
			<span>H</span>otel
			<span>M</span>anagement
            <span>S</span>ystem
         
            

		</h1>
	</div>
	<!--//header-->
	<div class="main-content-agile">
		<div class="sub-main-w3">
			<h2>Register Here</h2>
			<form id="form1" runat="server">
              
             <asp:Image ID="imgShow"  style="  width:230px; height:230px; border-radius:50%;"  runat="server" />
                <br />
                   <asp:Label ID="lblImage" runat="server" Text="Upload Image" style="color:white;font-size:22px; position:relative;  border:1px solid black; background-color:black;"></asp:Label><br />
                <br />
                  <div class="pom-agile">  
                    <span aria-hidden="true"></span>
                <asp:FileUpload ID="imgUpload" runat="server" required="required"/>
                 </div><br />
				<div class="pom-agile">
					<span  aria-hidden="true"></span>
					
                    <asp:TextBox ID="txtFname" runat="server"  placeholder="F-name" name="Name" class="user" type="name" required="" ></asp:TextBox>
				</div><br />
                <div class="pom-agile">
					<span  aria-hidden="true"></span>
					
                    <asp:TextBox ID="txtLname" runat="server"  placeholder="L-name" name="Name" class="user" type="name" required="" ></asp:TextBox>
				</div><br />
                <div class="pom-agile">
					<span  aria-hidden="true"></span>
			
                    <asp:TextBox ID="txtEmail" runat="server"  placeholder="E-mail" name="Name" class="user" type="email" required="" ></asp:TextBox>
				</div><br/>
                <div class="pom-agile">
					<span  aria-hidden="true"></span>
				
                    <asp:TextBox ID="txtGender" runat="server"  placeholder="G-ender" name="Name" class="user" type="gender"  required="" ></asp:TextBox>
				</div><br/>
				<div class="pom-agile">
					<span class="fa fa-key" aria-hidden="true"></span>
                    <asp:TextBox ID="txtPassword" runat="server"  placeholder="P-assword" name="Name" class="pass" type="password" required="" ></asp:TextBox>
				</div>
                <br />
                <asp:Label ID="lblMessage" runat="server" Text="Label"></asp:Label>
				<br/>
				<div class="right-w3l" >
					
				    <asp:Button ID="btnRegister" runat="server" Text="Register" OnClick="btnRegister_Click"  />
				   
				</div>
                
                <div class="sub-w3l">
                    <a href="Login.aspx">Go back to the Login page! if already have an acoount?&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>

                    </div>
                <div runat="server" id="AlertBox" class="alertBox" Visible="false">
                <div runat="server" id="AlertBoxMessage"></div>
                <button onclick="closeAlert.call(this, event)">Ok</button>
                </div>

			</form>
		</div>
	</div>

	<div class="footer">
		<p>&copy; 2018 Creative Login Form. All rights reserved | Design by
			<a>e.g. Copyright © 2008 Parminder.David.Sandeep Inc. All rights reserved.</a>
		</p>
	</div>

</body>
</html>
