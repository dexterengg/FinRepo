<%@ Page Title="Registration" Language="C#" MasterPageFile="Website.master" AutoEventWireup="true" CodeFile="Registration.aspx.cs" Inherits="Registration" %>
<%@ Register TagPrefix="uc" Namespace="ASPNET_Captcha" Assembly="ASPNET_Captcha" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">   
      
    <!-- section for main page content start -->
    <div class="MainContainer">
    <div class="LoginBg">
    <div id="pageSection">
        <div class="loginLeft">
            <div class="newmember" style="text-align:left;">
             <h3>Already a member?</h3><a href="Login.aspx"  class="underlineLink">Sign In</a>
            <div class="thanks-msg">
                <h2>Thanks for choosing Fincart</h2>
                We'll help you stand out with the best Financial Planning. <a href="SampleOutput.aspx">View Sample Mini Free Plan Output</a><br /><br />
                
            </div> 
                </div>           
        </div>
        <div class="separator"></div>
        <div class="loginRight">
            <div class="loginSection">               
            <%--<asp:UpdatePanel ID="updatePanel1" runat="server">
        <ContentTemplate>--%>    
        <div id="RegistrationInit" runat="server" style="text-align:left;">
            <h3 style="font-size:24px;font-weight:500;line-height:1.1;margin:0 0 10px;">Open A Free Account</h3>
            <p style="margin:0 0 10px;vertical-align:baseline;">And get comprehensive financial planning. <span class="knowfund"><a href="#" title="Always check for https:// in the URL and ensure that it is Fincart's authentic website. The 's' at the end of https:// stands for 'Secure'. Technically speaking, it means all network traffic between your browser and the Fincart website are encrypted. Fincart uses two EV (extended validation) SSL certificates, the technology that shows a “lock icon” and/or a green address bar on the browser to let viewers know that they are visiting a website that contains the highest assurance, trust and authentication available. Fincart is validated by Comodo, the leading Internet Security Provider. You are guaranteed bank-level security, the highest possible encryption levels for online transactions, i.e., highest strength 2048-bit signatures in each SSL certificate with 256 bit SSL/TLS encryption of customer data."  class="underlineLink">Security</a></span></p>
            <div class="row">
                <div class="col-sm-12">
                    <asp:Label ID="emailValidate" runat="server" Text="" CssClass="validateEmail"></asp:Label>
                </div>
            </div>
            <div role="form">
                <div class="form-group">
                    <label for="name" style="display:inline-block;font-weight:700;margin-bottom:5px;max-width:100%;">Name <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="RegisterInfo" Display="Dynamic" ErrorMessage=" #Mandatory Field" ControlToValidate="name" CssClass="mandatory"></asp:RequiredFieldValidator></label>
                    <asp:TextBox type="text" name="name" runat="server" TabIndex="1" id="name" class="form-control" ValidationGroup="RegisterInfo"  />                    
                </div>
                <div class="form-group">
                    <label for="name" style="display:inline-block;font-weight:700;margin-bottom:5px;max-width:100%;">Mobile <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="RegisterInfo" Display="Dynamic" ErrorMessage=" #Mandatory Field" ControlToValidate="mobile" CssClass="mandatory"></asp:RequiredFieldValidator></label>
                    <div class="input-group">
                        <span class="input-group-addon">+91</span>
                        <asp:TextBox type="text" name="countrycode" id="txtCountryCode" MaxLength="3" runat="server" value=" +91" Visible="false" ValidationGroup="RegisterInfo" />
                        <asp:TextBox type="text" name="mobile" id="mobile" runat="server" class="form-control" MaxLength="10" TabIndex="2" ValidationGroup="RegisterInfo" />
                    </div>                    
                </div>
                <div class="form-group">
                    <label for="name" style="display:inline-block;font-weight:700;margin-bottom:5px;max-width:100%;">Email <asp:RequiredFieldValidator ID="RequiredFieldValidator3" Display="Dynamic" runat="server" ValidationGroup="RegisterInfo" ErrorMessage=" #Mandatory Field" ControlToValidate="email" CssClass="mandatory"></asp:RequiredFieldValidator></label>
                    <asp:TextBox type="text" name="email" id="email" runat="server" TabIndex="3" class="form-control" ValidationGroup="RegisterInfo"  />                    
                </div>
                <div class="form-group">
                    <label for="password" style="display:inline-block;font-weight:700;margin-bottom:5px;max-width:100%;">Password <asp:RequiredFieldValidator ID="RequiredFieldValidator4" Display="Dynamic" runat="server" ValidationGroup="RegisterInfo" ErrorMessage=" #Mandatory Field" ControlToValidate="password" CssClass="mandatory"></asp:RequiredFieldValidator></label>
                    <asp:TextBox type="password" name="password" id="password" runat="server" TabIndex="4" class="form-control" ValidationGroup="RegisterInfo"  />                    
                </div>
                <div class="form-group">
                    By clicking 'Join', you agree to Fincart's<a href="../TermsOfUse.aspx" style="text-decoration:none; margin:5px 5px; color:#f00"  class="underlineLink">Terms of Use</a>
                </div>
                <div class="form-group">
                    <asp:Button type="submit" name="RegisterButton" id="RegisterButton" TabIndex="5" runat="server" ValidationGroup="RegisterInfo" Text="Join" class="btn btn-info btn-block" OnClick="RegisterButton_Click" />                    
                </div>
            </div>
            <div class="row">
            <div class="col-sm-12 smallText">
                <span style="margin-right:10px; float:left; margin-bottom:20px;" >
                    <script language="JavaScript" type="text/javascript">
                        TrustLogo("http://www.fincart.com/Plan/images/comodo_sa_52x63_white.png", "SC5", "none");
</script>
</span>
                    Always check for https:// in the URL and ensure that it is Fincart's authentic website. The 's' at the end of https:// stands for 'Secure'. Technically speaking, it means all network traffic between your browser and the Fincart website are encrypted.
            </div>                                                              
            </div>                            
            
            </div>
               <%-- <div id="RegistrationStart" runat="server" visible="false">
                    <table class="registrationTable">
                        <tr>
                            <td><h2>Your Registration process initiated, please check your email and complete the registration process</h2></td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td><h3>For any query/help, feel free to call us !</h3></td>
                        </tr>
                    </table>
                </div>--%>
                <%--</ContentTemplate>
                    </asp:UpdatePanel>--%>
                </div>
        </div>

    <!-- section for main page content end -->    
    </div>
    </div>
        <div class="videoSection">
            <h2>How it works</h2>
            <div class="videoArea">
                <iframe width="100%" height="315" src="https://player.vimeo.com/video/139190833" frameborder="0" allowfullscreen></iframe>
            </div>
        </div> 
</div>
       
</asp:Content>

