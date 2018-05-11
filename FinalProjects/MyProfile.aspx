<%@ Page Title="" enableEventValidation="false"  Language="C#" MasterPageFile="~/MainMasterPage.Master" AutoEventWireup="true" CodeBehind="MyProfile.aspx.cs" Inherits="FinalProjects.MyProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <div class="container"  style="align-content:center;">
     <div class="well well-sm">
     <div class="row">
    
     <div class="form-group">
         <br /><br />
   <asp:Image ID="Image" style="border:1px solid black;  width:230px; height:230px; border-radius:50%;" runat="server"     /><br /><br /><br />
         <asp:Image ID="Image2" style="border:1px solid black;  width:230px; height:230px; border-radius:50%;" runat="server"     /><br /><br /><br />
     <div class="form-group" >
         <asp:Label ID="ProfileData"  runat="server" Text="Label"></asp:Label>
      <asp:Label ID="label1" runat="server" Text="Upload Image"></asp:Label><br />
     <asp:FileUpload ID="imgUpload" runat="server" name="image" style="width:30%; position:relative; left:33%; "  class="form-control"/>
         <br/>
      <asp:Label ID="label2"  runat="server" Text="First Name"></asp:Label><br />
         <asp:TextBox ID="Fname" class ="form-control" runat ="server" style="width:30%; position:relative; left:33%; " name="name" OnTextChanged="Fname_TextChanged"></asp:TextBox>
         <br />
      <asp:Label ID="label3"  runat="server" Text="Last Name"></asp:Label><br />
         <asp:TextBox ID="Lname" class ="form-control" runat="server" style="width:30%; position:relative; left:33%; "  name="name"></asp:TextBox>
         <br />   
    <asp:Label ID="label4"  runat="server" Text="Gmail"></asp:Label><br />
      <asp:TextBox ID="Gmail" class ="form-control" name ="gmail" runat="server" style="width:30%; position:relative; left:33%; " ></asp:TextBox>
      <br />
    <asp:Label ID="label5"  runat="server" Text="Gender"></asp:Label><br />
         <asp:TextBox ID ="Gender" class ="form-control" name="name" runat="server" style="width:30%; position:relative; left:33%; " ></asp:TextBox>  
         <br />   
    <asp:Label ID="lblMessage" runat="server" Text="Check this text box and press edit button to update your profile"></asp:Label><br />
         <asp:Label ID="errorMsg" runat="server" Text=""></asp:Label>
    <br />
         <asp:CheckBox ID="CheckBox" runat="server"></asp:CheckBox><label>Edit Profile</label><asp:Button ID="idtPButn" runat="server" Text="Edit" OnClick="idtPButn_Click"></asp:Button>
         <div class="right-w3l"><asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="btnUpload_Click" /> 
   </div>
   </div> 
   </div>
   </div>
   </div>
   </div>
     
      
            
            
</asp:Content>
