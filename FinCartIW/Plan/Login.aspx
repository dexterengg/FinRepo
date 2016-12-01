<%@ Page Title="Fincart Financial Planning" Language="C#" MasterPageFile="Website.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>
<%@ Register TagPrefix="uc" Namespace="ASPNET_Captcha" Assembly="ASPNET_Captcha" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript">//<![CDATA[
        var tlJsHost = ((window.location.protocol == "https:") ? "https://secure.comodo.com/" : "http://www.trustlogo.com/");
        document.write(unescape("%3Cscript src='" + tlJsHost + "trustlogo/javascript/trustlogo.js' type='text/javascript'%3E%3C/script%3E"));
        //]]>
</script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">      
    <!-- section for main page content start -->
    <div class="MainContainer">
    <div class="LoginBg">
    <div id="pageSection">
        <div class="loginLeft">
            <div class="newmember" style="text-align:left;">
            <h3>Not a Member?</h3>

            <span>Membership is free!</span> <br /> <a href="SampleOutput.aspx" >View Sample Mini Free Plan Output</a><br />
                
            <a href="Registration.aspx" class="MainButton">Join Fincart</a><br /><br />
            <%--<img src="images/sample-mydb.jpg" />--%> 
            </div>           
        </div>
        <div class="separator"></div>
        <div class="loginRight">
            <div class="loginSection">
            <asp:UpdatePanel ID="updatePanelLogin" runat="server" >
                          <ContentTemplate> 
                           <div id="signin" runat="server" style="text-align:left;"> 
                               <h1 style="font-size:24px;font-weight:500;line-height:1.1;margin:0 0 10px;">Login & Start Financial Planning</h1>
                               <p style="margin:0 0 10px;vertical-align:baseline;">If you have an account with Fincart, please login. <span class="knowfund"><a href="#" title="Always check for https:// in the URL and ensure that it is Fincart's authentic website. The 's' at the end of https:// stands for 'Secure'. Technically speaking, it means all network traffic between your browser and the Fincart website are encrypted. Fincart uses two EV (extended validation) SSL certificates, the technology that shows a “lock icon” and/or a green address bar on the browser to let viewers know that they are visiting a website that contains the highest assurance, trust and authentication available. Fincart is validated by Comodo, the leading Internet Security Provider. You are guaranteed bank-level security, the highest possible encryption levels for online transactions, i.e., highest strength 2048-bit signatures in each SSL certificate with 256 bit SSL/TLS encryption of customer data."  class="underlineLink">Security</a></span></p>                          	                    
                               <div class="row">
                                <div class="col-sm-12">
                                    <asp:Label ID="lblInvalidCredentials" Text="" runat="server" CssClass="mandatory"></asp:Label>
                                </div>                                                              
                              </div>
                                <div role="form">
                                    <div class="form-group">
                                      <label for="email" style="display:inline-block;font-weight:700;margin-bottom:5px;max-width:100%;">Email ID</label>
                                      <asp:TextBox type="text" name="eusername" runat="server" TabIndex="1" id="eusername" class="form-control"  />
                                      <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" EnableClientScript="false" ValidationGroup="SubmitInfo" ErrorMessage="Mandatory Field" ControlToValidate="eusername" CssClass="mandatory"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="form-group">
                                      <label for="pwd" style="display:inline-block;font-weight:700;margin-bottom:5px;max-width:100%;">Password&nbsp;&nbsp;(<asp:LinkButton ID="forgotpassword" runat="server" TabIndex="5"  ValidationGroup="SubmitInfo" OnClick="forgotpassword_Click" CssClass="underlineLink">Forgot Password?</asp:LinkButton>)</label>
                                      <asp:TextBox type="password" name="epassword" runat="server" TabIndex="2" id="epassword" class="form-control" />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" EnableClientScript="false" ValidationGroup="SubmitInfo" ErrorMessage="Mandatory Field" ControlToValidate="epassword" CssClass="mandatory" Display="Dynamic"></asp:RequiredFieldValidator>
                                    </div> 
                                    <div class="form-group">                                                                       
                                    <asp:Button type="submit" name="LoginButton" id="LoginButton" TabIndex="4" runat="server" class="btn btn-info btn-block" Text="Login" ValidationGroup="SubmitInfo" OnClick="LoginButton_Click" />
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


                        <div class="forgetPassword" id="forgotpswd" runat="server">
                          <div id="FPZone" runat="server"  style="text-align:left;">                 
                                <h3 style="font-size:24px;font-weight:500;line-height:1.1;margin:0 0 10px;">Having trouble signing in?</h3>                         
                                <p style="margin:0 0 10px;vertical-align:baseline;">To reset your password, enter the email address you use to sign in to Fincart. This can be your any email address associated with your account.</p>             
                                <div class="row">
                                    <div class="col-sm-12">
                                        <div id="txtInvalidEmail" runat="server" class="DisplayNone invalidMessage">No account found with that email address</div>
                                    </div>
                                </div>
                                <div role="form">
                                    <div class="form-group">
                                        <label for="txtEmailID" style="display:inline-block;font-weight:700;margin-bottom:5px;max-width:100%;">Email ID</label>
                                        <asp:TextBox type="text" name="txtEmailID" runat="server" TabIndex="1" id="txtEmailID" class="form-control"  />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" Display="Dynamic" runat="server" ValidationGroup="forgotp" ErrorMessage="Please enter valid Email Address" CssClass="mandatory" ControlToValidate="txtEmailID"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-12">
                                    <asp:Button ID="forgetButton" runat="server" Text="Submit" CssClass="btn btn-info btn-block" ValidationGroup="forgotp" OnClick="forgetButton_Click"  />
                                    </div>
                                </div>                            
                          </div>
                          <div id="FPMessageZone" runat="server" class="DisplayNone message">
                              <h2>We have sent information about your password to your recovery email address.</h2>
                              <div class="spacer"></div>
                              <p>Check the message sent to you at your given emailid to find out what to do next.</p>
                              <br /><br /><br />
                              <i class="fa fa-sign-in"></i>&nbsp;<asp:LinkButton ID="signinbutton" runat="server"  ValidationGroup="SubmitInfo" OnClick="signinbutton_Click">Click to Sign In?</asp:LinkButton>
                          </div>
                      </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
                </div>
        </div>
        
    <!-- section for main page content end -->    
    </div>
        
    </div>
        <div class="videoSection" style="text-align:center;">
            <h2>How it works</h2>
            <div class="videoArea">
                <iframe width="100%" height="315" src="https://player.vimeo.com/video/139190833" frameborder="0" allowfullscreen></iframe>
            </div>
        </div>        
</div>
 <div class="clear"></div>  
    
</asp:Content>

