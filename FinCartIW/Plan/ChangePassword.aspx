<%@ Page Title="" Language="C#" MasterPageFile="~/Plan/DashBoard.master" AutoEventWireup="true" CodeFile="ChangePassword.aspx.cs" Inherits="Plan_ChangePassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script type="text/javascript">
        $(window).load(function () {
            $(".loader").fadeOut("slow");
        })
    </script>
    <div class="loader"></div>

        <div class="my-db-area">
            <div id="mydetails" class="virtualpage hidepiece" runat="server" style="margin-top:0px;">
                <h1>My Details</h1>        
                <div class="hr-cbp-mc-form">
					    <div class="hr-cbp-mc-column">
                            <div class="hr-cbp-mc-column-inner">
						        <label for="name">Old Password</label>                            						
                                <asp:TextBox type="password" runat="server" CssClass="inputfieldFixedWidth" id="txtOldPassword" ValidationGroup="pass" />
                                <asp:RequiredFieldValidator ValidationGroup="pass" ID="RequiredFieldoldpass" Display="Dynamic" runat="server" ErrorMessage="Old Password Required" ControlToValidate="txtOldPassword" style="color:red;"></asp:RequiredFieldValidator>
                            </div>
                            <div class="hr-cbp-mc-column-inner">
	  					        <label for="email">New Password</label>	  					
                                <asp:TextBox type="password" runat="server" CssClass="inputfieldFixedWidth" id="txtNewPassword" ValidationGroup="pass" />
                                <asp:RequiredFieldValidator ValidationGroup="pass" ID="RequiredFieldnewpass" Display="Dynamic" runat="server" ErrorMessage="New Password Required" ControlToValidate="txtNewPassword" style="color:red;"></asp:RequiredFieldValidator>
                            </div>                                                                     
	  				    </div>	  				
                        </div>
                    <div>
                        <asp:Button ID="btnsave" runat="server" CssClass="MainButton" OnClick="btnsave_Click" ValidationGroup="pass" Text="Save" />
                        <asp:Label ID="errormsg" runat="server" CssClass="message"></asp:Label>
                    </div>                          
		    </div>   
    <!-- section for main page content end -->    
    </div>
</asp:Content>

