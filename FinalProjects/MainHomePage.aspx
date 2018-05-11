<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MainHomePage.aspx.cs" Inherits="FinalProjects.MainHomePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title> My homePage</title>
  <link rel="stylesheet" type="text/css" href="cssPage.css" />
  
</head>
<body>
    <div class="header-w3l">
		<h1>
			
			<span>H</span>otel
			<span>M</span>anagement
            <span>S</span>ystem

       
		</h1>
      
        
	</div>
    <br /><br /><br /> <br /> <br /><br /> <br /> <br />
  <form id="form1" runat="server">
    <div>
        <div class="right-w3l">
					
                     <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click"  />
	   </div>
        <br /> <br /> <br /><br /> <br /> <br />
       <div class="right-w3l">
					
                     <asp:Button ID="btnSignup" runat="server" Text="SignUp" OnClick="btnSignup_Click"   />
         </div>
    
    </div>
    </form>
   <br /><br /><br /><br /><br /><br /><br /><br /><br />
    <!--footer-->
	<div class="footer">
		<p>&copy; 2018 Creative Login Form. All rights reserved | Design by
			<a>e.g. Copyright © 2008 Parminder.David.Sandeep Inc. All rights reserved.</a>
		</p>
	</div>
	<!--//footer-->
</body>
</html>