<%@ Page Title="" Language="C#" MasterPageFile="~/MainMasterPage.Master" AutoEventWireup="true" CodeBehind="AboutUs.aspx.cs" Inherits="FinalProjects.AboutUs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <script  src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>
    <style>
   .body{
       background-color:grey;
   }

/* The grid: Four equal columns that floats next to each other */
.column {
    float: left;
    width: 15%;
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
    color: white;
    font-size: 20px;
}

/* Closable button inside the expanded image */
.closebtn {
    position: absolute;
    top: 10px;
    right: 15px;
    color: white;
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
    <img src="Images/1.jpg" alt="bbb" style="width:68%" onclick="myFunction(this);">
  </div>
  <div class="column">
    <img src="images/2.jpg" alt="Fjords" style="width:80%" onclick="myFunction(this);">
  </div>
  <div class="column">
    <img src="Images/3.jpeg" alt="Mountains" style="width:90%" onclick="myFunction(this);">
  </div>
  <div class="column">
    <img src="Images/4.jpeg" alt="Lights" style="width:70%" onclick="myFunction(this);">
  </div>
        <div class="column">
    <img src="Images/5.jpeg" alt="Lights" style="width:78%" onclick="myFunction(this);">
  </div>
        <div class="column" >
    <img src="Images/6.jpeg" alt="Lights" style="width:88%" onclick="myFunction(this);"/>
          
  </div>
</div>

<div class="container">
  <span onclick="this.parentElement.style.display='none'" class="closebtn">&times;</span>
  <img id="expandedImg" style="width:60%"/>
  <div id="imgtext"></div>
</div>
        
    </div>
   <blockquote class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr">Mary, we are sorry to see this! Please DM the name of the hotel, arrival date, the name attached to the reservation, and your Marriott Rewards number. We would be happy to forward this issue to the appropriate team.</p>&mdash; Marriott Hotels (@Marriott) <a href="https://twitter.com/Marriott/status/981719153441693696?ref_src=twsrc%5Etfw">April 5, 2018</a></blockquote>
<script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>

<div>
	    <a class="twitter-timeline" href="https://twitter.com/Marriott">Tweets Liked by @TwitterDev</a> 
	  </div>
   
</asp:Content>
