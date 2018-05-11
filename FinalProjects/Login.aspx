<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="FinalProjects.Login" %>

<!DOCTYPE html>

<html >
<head >

    <title>Login Page</title>
  <link rel="stylesheet" type="text/css" href="cssPage.css" />
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
			<h2>Login Here</h2>
			<form   id="form1" runat="server" >
				<div class="pom-agile">
					<span  aria-hidden="true"></span>
					
                     <asp:TextBox ID="txtEmail" runat="server"  placeholder="E-mail" name="Name" class="user" type="email"  required="" ></asp:TextBox>
				</div><br />
				<div class="pom-agile">
					<span  aria-hidden="true"></span>
					
                     <asp:TextBox ID="txtPassword" runat="server"  placeholder="P-assword" name="Name" class="pass" type="password"  required="" ></asp:TextBox>
				</div>
				<div class="sub-w3l">
                    
					<div class="sub-agile">
					
                        <asp:CheckBox ID="chkRemember" runat="server"   />
                        
						<label for="chkRemember">
							<span></span>am not a robot</label>
					</div>
					<a href="ForgetPassword.aspx">Forgot Password?</a>
					<div class="clear"></div>
				</div>
				<div class="right-w3l">
					
                     <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click"  />
				</div>
                <div runat="server" id="AlertBox1" class="alertBox" Visible="false">
                <div runat="server" id="AlertBoxMessage1"></div>
                <button onclick="closeAlert.call(this, event)">Ok</button>
                </div>
                <div class="sub-w3l">
                    <a href="Register.aspx">Dont have an account!create new one?&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>

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
