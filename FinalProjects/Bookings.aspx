<%@ Page Title="" Language="C#" MasterPageFile="~/MainMasterPage.Master" AutoEventWireup="true" CodeBehind="Bookings.aspx.cs" Inherits="FinalProjects.Bookings" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    
    <script type="text/javascript"> var prm = Sys.WebForms.PageRequestManager.getInstance(); prm.add_beginRequest(beginRequest); function beginRequest() { prm._scrollPosition = null; } </script>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="main-content-agile"> <!--Displays the page for booking rooms-->
		<div class="sub-main-w3">
			<h2>Reservation</h2>

				<div class="pom-agile">
					<span  aria-hidden="true"></span>
					
                   Check In &nbsp;: <asp:TextBox ID="txtDateIn" runat="server"  name="Name" class="user" type="date" required="" style="background-color:transparent; border:none"></asp:TextBox>
				</div><br />
                <div class="pom-agile">
					<span  aria-hidden="true"></span>
					
                    Check Out: <asp:TextBox ID="txtDateOut" runat="server"  name="Name" class="user" type="date" required="" style="background-color:transparent; border:none"></asp:TextBox>
				</div><br />
                <div class="pom-agile">
					<asp:DropDownList ID="ddlCategory" runat="server" style="background-color:transparent; border:none" OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged" AutoPostBack="True">
                    </asp:DropDownList> 
                    <br/>
                    
				</div><br/>
                <div class="pom-agile">
					<span  aria-hidden="true"></span>
			
                    <asp:TextBox ID="txtRoom" runat="server"  placeholder="Number of Rooms" name="Name" class="user" type="number" required="" style="background-color:transparent; border:none" min="0"></asp:TextBox>
				</div><br/>

                <div class="pom-agile">
                    <span  aria-hidden="true"></span>
                    Choose Rooms
                        <br/>         
					 <asp:ListBox ID="lstRooms" runat="server" SelectionMode="Multiple" CssClass="col-xs-offset-0" Height="68px" Width="130px"></asp:ListBox>               
				   <br/> 
                    <asp:Label ID="lblRooms" runat="server" Text=""></asp:Label>
				</div><br/>
                <div class="pom-agile">
					<span  aria-hidden="true"></span>
				
                    <asp:TextBox ID="txtPeople" runat="server"  placeholder="Number of People" name="Name" class="user" type="number"  required="" style="background-color:transparent; border:none" min="0"></asp:TextBox>
				</div><br/>
				<div class="right-w3l" >	
				    <asp:Button ID="btnBook" runat="server" Text="Book Now" OnClick="btnBook_Click" /> 
				</div>
               
		</div>
        </div>
</asp:Content>
