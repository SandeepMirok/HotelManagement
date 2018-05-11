<%@ Page Title="" Language="C#" MasterPageFile="~/MainMasterPage.Master" AutoEventWireup="true" CodeBehind="Rooms.aspx.cs" Inherits="FinalProjects.Rooms" %>
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
    <div style=" width:60%;margin-left:auto;margin-right:auto;">
        <asp:GridView ID="gvCategory" runat="server" Width="100%" CssClass="Grid" AlternatingRowStyle-CssClass="alt" PagerStyle-CssClass="pgr"></asp:GridView>
    </div>
</asp:Content>
