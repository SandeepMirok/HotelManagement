<%@ Page Title="" Language="C#" MasterPageFile="~/MainMasterPage.Master" AutoEventWireup="true" CodeBehind="Transaction.aspx.cs" Inherits="FinalProjects.Transaction" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="main-content-agile">
		<div class="sub-main-w3">
			<h2>Payment</h2>

                <div class="pom-agile">
					<span  aria-hidden="true"></span>
					
                    <asp:TextBox ID="txtPrice" runat="server"  placeholder="Price" name="Name" class="user" type="name" required="" readonly="true"></asp:TextBox>
				</div><br />
				<div class="pom-agile">
					<span  aria-hidden="true"></span>
					
                    <asp:TextBox ID="txtCNum" runat="server"  placeholder="Card Number (16 digits)" name="Name" class="user" type="name" required="" ></asp:TextBox>
				</div><br />
                <div class="pom-agile">
					<span  aria-hidden="true"></span>
					
                    Expire Date: <asp:TextBox ID="txtExpire" runat="server"  name="Name" class="user" type="month" required="" style="background-color:transparent; border:none"></asp:TextBox>
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
