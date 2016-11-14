<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Admin_Login" %>
<%@ Register TagPrefix="AdHeaderAs"  TagName="AdHeaderAs"  Src="~/Admin/Header.ascx" %>
<%@ Register TagPrefix="AdExternalLinkAs"  TagName="AdExternalLinkAs"  Src="~/Admin/ExternalLinks.ascx" %>

<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="ie6 ielt8"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="ie7 ielt8"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="ie8"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--> <html lang="en"> <!--<![endif]-->
<head runat="server">
<meta charset="utf-8">
<title>Fincart Admin</title>
    <AdExternalLinkAs:AdExternalLinkAs id="externallink" runat="server" /> 
</head>
<body>
<div class="container">
    <header>
        <div class="logo"><a href="../Default.aspx" target="_parent"><img src="../images/fincart.png" /></a></div>        
    </header>
    <div class="clear"></div>
	<section id="Logincontent">
        <asp:Label ID="lblInvalidCredentials" runat="server" Text=""></asp:Label>
		<form action="" runat="server" defaultbutton="AdminLoginSumbit">
			<div runat="server" id="ELogin" class="EULogin">                                
                <p><span><i class="fa fa-user fa-2x"></i></span>
                    <asp:TextBox type="text" id="txtAdminUserName" TabIndex="1" CssClass="ELinputfield" placeholder="Username"  runat="server" ValidationGroup="existingUser"  />
                </p>
                <p><span><i class="fa fa-lock fa-2x"></i></span>
                    <asp:TextBox type="password" id="txtAdminPassword" TabIndex="2" CssClass="ELinputfield" placeholder="Password"  runat="server" ValidationGroup="existingUser"  />
                </p>                                 
                <p>
                    <asp:LinkButton ID="AdminLoginSumbit" runat="server" CssClass="ELbutton" TabIndex="3" OnClick="AdminLoginSumbit_click" ValidationGroup="existingUser">Login</asp:LinkButton>
                </p>
            </div>
		</form><!-- form -->
		
	</section><!-- content -->
</div><!-- container -->
</body>
</html>
