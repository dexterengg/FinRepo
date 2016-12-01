<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="Website.master" CodeFile="RegistrationLink.aspx.cs" Inherits="RegistrationLink" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="MainContainer">
    <div class="main">
        <div class="wrap2">      
        <!-- ****************Content Start here********************** -->        
              <!--<div class="leftZone">hello jfdgdggjdg ddjg kg dgkjd</div>-->
              <div class="registrationLink" >
                  
      	                    <table >  
                                  <tr>
                                      <td height="40px">&nbsp;</td>
                                  </tr>
                                  <tr>
                                      <td colspan="2">Please set your password and complete the account activation process.</td>
                                  </tr>                            
                              <tr>
                                <td><asp:TextBox type="text" name="username" runat="server" id="username" class="inputfield" Width="300px" placeholder="Your Email" /></td>
                                <td><asp:RequiredFieldValidator ID="RequiredFieldUsername" runat="server" ErrorMessage="Mandatory Field" ControlToValidate="username" CssClass="mandatory"></asp:RequiredFieldValidator></td>
                              </tr>
                              <tr>
                                <td><asp:TextBox type="password" name="upassword" runat="server" id="upassword" class="inputfield" Width="300px" placeholder="Password"></asp:TextBox></td>
                                <td><asp:RequiredFieldValidator ID="RequiredFieldPassword" runat="server" ErrorMessage="Mandatory Field" ControlToValidate="upassword" CssClass="mandatory"></asp:RequiredFieldValidator></td>
                              </tr>
                              <tr>
                                <td><asp:TextBox type="password" name="cnfpassword" runat="server" id="cnfpassword" class="inputfield" Width="300px" placeholder="Confirm Password" /></td>                                
                                <td><asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Password is not matched" ControlToValidate="upassword" ControlToCompare="cnfpassword"></asp:CompareValidator></td>
                              </tr>                              
                              <!--<tr>
                                <td><asp:TextBox type="text" name="otp" id="otp" runat="server" class="LoginInputfield" placeholder="OTP" /></td>
                              </tr>-->
                              <tr>
                                <td><asp:Button type="submit" name="button" id="RegisterLavel1" runat="server" Text="Submit" class="MainButton" OnClick="RegisterLavel1_Click" /></td>
                              </tr>                              
                            </table>                   
              </div>                               
        
            </div>
        </div>    
        </div>    
<!-- ****************Footer Start here********************** -->
</asp:Content>
