<%@ Page Title="" Language="C#" MasterPageFile="~/MainMasterPage.Master" AutoEventWireup="true" CodeBehind="TransactionTickets.aspx.cs" Inherits="FinalProjects.TransactionTickets" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="main-content-agile">
		<div class="sub-main-w3">
			<h2>Payment</h2>
             <asp:Label ID="txtEvents" style="color:white;font-size: 40px;" runat="server" Text=""></asp:Label>
                <div class="pom-agile">
					<span  aria-hidden="true"></span>
					
                    <asp:TextBox ID="txtPrice" runat="server"  placeholder="Price" name="Name" class="user" type="name" required="" readonly="true"></asp:TextBox>
				</div><br />
				<div class="pom-agile">
					<span  aria-hidden="true"></span>
					
                    <asp:TextBox ID="txtCNum" runat="server"  placeholder="Credit Card Number" name="Name" class="user" type="name" required="" ></asp:TextBox>
				</div><br />
                <div class="pom-agile">
					<span  aria-hidden="true"></span>
					
                    Expire Date: <asp:TextBox ID="txtExpire" runat="server"  name="Name" class="user" type="date" required="" style="background-color:transparent; border:none"></asp:TextBox>
				</div><br />
                <div class="pom-agile">
					<span  aria-hidden="true"></span>
			
                    <asp:TextBox ID="txtSecureity" runat="server"  placeholder="Secureity Number(3 digits)" name="Name" class="user" type="name" required="" ></asp:TextBox>
				</div><br/>
                
				<div class="right-w3l" >	
				    <asp:Button ID="btnPay" runat="server" Text="Pay" OnClick="btnPay_Click" /> 
				</div>
               
		</div>
	</div>
</asp:Content>
