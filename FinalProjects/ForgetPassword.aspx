<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ForgetPassword.aspx.cs" Inherits="FinalProjects.ForgetPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>forget Passowrd? </title>
     <link rel="stylesheet" type="text/css" href="cssPage.css" />
</head>
<body>
     <div class="header-w3l">
		<h1>
			
			<span>H</span>otel
			<span>M</span>anagement
            <span>S</span>ystem

		</h1>
	</div><!--//header-->
	<div class="main-content-agile">
		<div class="sub-main-w3">
			<h2>Reset your Password here</h2>
			<form   id="form1" runat="server" >
				<div class="pom-agile">
					<span  aria-hidden="true"></span>
					
                     <asp:TextBox ID="txtEmail" runat="server"  placeholder="Please enter your email here" name="Name" class="user" type="email"  required="" ></asp:TextBox>
				</div><br />
                <div class="pom-agile">
					<span  aria-hidden="true"></span>
					
                     <asp:TextBox ID="txtFname" runat="server"  placeholder="Please enter your first name" name="Name" class="user" type="name"  required="" ></asp:TextBox>
				</div><br /> 
                <div class="pom-agile">
					<span  aria-hidden="true"></span>
					
                     <asp:TextBox ID="txtLname" runat="server"  placeholder="Please enter your last name" name="Name" class="user" type="name"  required="" ></asp:TextBox>
				</div><br />
				<div class="pom-agile">
					<span  aria-hidden="true"></span>
					
                     <asp:TextBox ID="txtNPassword" runat="server"  placeholder="Enter your new password here" name="Name" class="pass" type="password"  required="" ></asp:TextBox>
				</div><br />
                <asp:Label ID ="lblMessage" runat="server" Text=""></asp:Label>
                <br />
				<div class="right-w3l">
					
                     <asp:Button ID="btnConfirm" runat="server" Text="Confirm" OnClick="btnConfirm_Click"   />
				</div>
                <div runat="server" id="AlertBox1" class="alertBox" Visible="false">
                <div runat="server" id="AlertBoxMessage1"></div>
                <button onclick="closeAlert.call(this, event)">Ok</button>
                </div>
                
                
			</form>
		</div>
	</div>
	<!--//main-->
	<!--footer-->
	<div class="footer">
		<p>&copy; 2018 Creative Login Form. All rights reserved | Design by
			<a>e.g. Copyright © 2008 Parminder.David.Sandeep Inc. All rights reserved.</a>
		</p>
	</div>
	<!--//footer-->

</body>
</html>
