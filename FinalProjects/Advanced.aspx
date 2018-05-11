<%@ Page Title="" Language="C#" MasterPageFile="~/MainMasterPage.Master" AutoEventWireup="true" CodeBehind="Advanced.aspx.cs" Inherits="FinalProjects.Advanced" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
     <!--css for designing gridview for room categories-->
    <link href="Gridstyle.css" rel="stylesheet" type="text/css" />
    <style>
   .body{
  background-image: url('Images/ImageMenu.jpg');
       width:100%;
   }

/* The grid: three equal columns that floats next to each other */
.column {
    float: left;
    width: 33%;
    padding: 3px;
}

/* Style the images inside the grid */
.column img {
    opacity: 4; 
    cursor: pointer; 
}

.column img:hover {
    opacity: 1;
}

/* Clear floats after the columns */
.row:after {
    content: "";
    display: table;
    clear: both;
}

/* The expanding image container */
.container {
    position: relative;
    display: none;
}

/* Expanding image text */
#imgtext {
    position: absolute;
    bottom: 15px;
    left: 15px;
    color: black;
    font-size: 20px;
}

/* Closable button inside the expanded image */
.closebtn {
    position: absolute;
    top: 10px;
    right: 15px;
    color: black;
    font-size: 35px;
    cursor: pointer;
}
#booking{
    float:left;
    width:20%;
}
#search{
    float:right;
    width:15%;
}
#txtEvents{
    color: yellow;
}
#gvCategory{
    background-color:white;
    color:black;
}
    </style>
    <script>
        function myFunction(imgs) {
            var expandImg = document.getElementById("expandedImg");
            var imgText = document.getElementById("imgtext");
            expandImg.src = imgs.src;
            imgText.innerHTML = imgs.alt;
            expandImg.parentElement.style.display = "block";
        }
</script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <div class="body">
    <div class="row">
  <div class="column">
    <img src="Images/CommonRoom.jpg" alt="Common Room" style="width:30%" onclick="myFunction(this);"/>
  </div>
  <div class="column">
    <img src="Images/NobleRoom.jpg" alt="Noble Room" style="width:30%" onclick="myFunction(this);"/>
  </div>
  <div class="column">
    <img src="Images/RoyalRoom.jpg" alt="Royal Room" style="width:30%" onclick="myFunction(this);"/>
  </div>
</div>

<div class="container">
  <span onclick="this.parentElement.style.display='none'" class="closebtn">&times;</span>
  <img id="expandedImg" style="width:60%"/>
  <div id="imgtext"></div>
</div>
    </div>
    <!--Displays the page for the description of room categories-->
    <div id="divGrid" style=" width:60%;margin-left:auto;margin-right:auto;"  runat="server" >
        <asp:Label ID="txtEvents" style="color:white;font-size: 40px;" runat="server" Text=""></asp:Label>

        <asp:GridView ID="gvCategory" style="background-color:white;" runat="server" Width="100%" CssClass="Grid" AlternatingRowStyle-CssClass="alt" PagerStyle-CssClass="pgr"></asp:GridView>
   <div class="right-w3l" >	
				   
				</div> 
         </div>
   <div class="main-content-agile"> <!--Displays the page for booking rooms-->
		<div class="sub-main-w3">
             
            
			<h2 id="title"> Room Search</h2>
           <div class="pom-agile">
					<asp:DropDownList ID="ddlCategory" runat="server" style="background-color:transparent; border:none" >
                          
                        <asp:ListItem Text="Select the Room Category" Value="0" />
                    </asp:DropDownList>        
				</div><br/>
               
                <div class="pom-agile">
					<span  aria-hidden="true"></span>
				    <asp:TextBox ID="txtPrice" runat="server"  placeholder="Price Limit Per-Room" name="Name" class="user" type="number"  required="" style="background-color:transparent; border:none" min="0"></asp:TextBox>
				</div><br/>
                    
            
                   <!-- <div id="more1"  runat="server">-->
                <div class="pom-agile">
					<span  aria-hidden="true"></span>
				    <asp:TextBox ID="txtPeople" runat="server"  placeholder="Number of People" name="Name" class="user" type="number"  required="" style="background-color:transparent; border:none" min="0"></asp:TextBox>
				</div><br/>
                    
                <div class="right-w3l" >	
				    <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click"   /> 
				</div>  
            </div>      

           
               
               <!-- <div class="pom-agile">
					<asp:DropDownList ID="ddlEvents" runat="server" style="background-color:transparent; border:none" AppendDataBoundItems="true">
                        <asp:ListItem Text="-Select Event-" Value="0" />
                    </asp:DropDownList>        
				</div><br/>
            -->
                <!--<div class="pom-agile">
					<span  aria-hidden="true"></span>
				
                    <asp:TextBox ID="txtSeats" runat="server"  placeholder="Number of Sets" name="Name" class="user" type="number"  required="" style="background-color:transparent; border:none" min="0"></asp:TextBox>
				</div><br/>
            -->
					
				   
				
               
		</div>
	</div>
</asp:Content>
