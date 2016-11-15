<%@ Page Title="Fincart Workshop" Language="C#" MasterPageFile="~/Website.master" AutoEventWireup="true" CodeFile="WorkShop.aspx.cs" Inherits="Website_WorkShop" %>
<%@ Register TagPrefix="uc" Namespace="ASPNET_Captcha" Assembly="ASPNET_Captcha" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajax" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            height: 23px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    
<!-- -----------------------------------start slider -->
	<div class="wrap-workshop">
        <div class="slider">
            <h1>Workshop</h1>
        </div>
	</div>
<!-- -----------------------------------end slider -->  
<div class="main">
        <div class="wrap2">      
    <div class="PageHeader" style="text-align:left;">
        <h1>Start Your Investing Career Here!</h1>
        <p>A FREE Workshop Can Change the Way You Think about Money | ENROL!!</p>
    </div>
    <div class="workshopArea"  style="text-align:left !important;">        
        <article>Workshop Registration</article>
        <table cellpadding="2" width="96%" align="center" >
            <tr>
                <td>Full Name<span class="mandatory"> *</span></td>
                <td><asp:TextBox ID="txtFullName" runat="server" CssClass="inputfield" ValidationGroup="wsregistration" ></asp:TextBox>
                     <asp:RequiredFieldValidator ID="ReqFullName" ValidationGroup="wsregistration" runat="server" ErrorMessage="Required" Display="Dynamic" ControlToValidate="txtFullName" CssClass="mandatory"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>City <span class="mandatory">*</span></td>
                <td><asp:TextBox ID="txtCity" runat="server" CssClass="inputfield" ValidationGroup="wsregistration"></asp:TextBox></td>
                <asp:RequiredFieldValidator ID="RFVCity" ValidationGroup="wsregistration" runat="server" ErrorMessage="Required" Display="Dynamic" ControlToValidate="txtCity" CssClass="mandatory"></asp:RequiredFieldValidator>
            </tr>
            <tr>
                <td>Email Address <span class="mandatory">*</span></td>
                <td><asp:TextBox ID="txtEmail" runat="server" CssClass="inputfield smallcapField" ValidationGroup="wsregistration"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="ReqEmail" ValidationGroup="wsregistration" runat="server" ErrorMessage="Required" Display="Dynamic" ControlToValidate="txtEmail" CssClass="mandatory"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" 
                runat="server" ErrorMessage="Please Enter Valid Email ID"
                    ValidationGroup="wsregistration" ControlToValidate="txtEmail" Display="Dynamic"                     
                    CssClass="mandatory" 
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
                    </asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>Mobile Number <span class="mandatory">*</span></td>
                <td>
                    <asp:TextBox ID="txtCountryCode" runat="server" MaxLength="4" Text="+91" CssClass="inputfieldCC" ValidationGroup="wsregistration"></asp:TextBox>
                    <asp:TextBox ID="txtMobileNo" runat="server" MaxLength="10" CssClass="inputfieldMobile" ValidationGroup="wsregistration"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="ReqMobile" ValidationGroup="wsregistration" runat="server" ErrorMessage="Required" Display="Dynamic" ControlToValidate="txtMobileNo" CssClass="mandatory"></asp:RequiredFieldValidator> 
                                    <asp:RegularExpressionValidator ID="REVMobile1" 
                runat="server" ErrorMessage="Phone Number is not valid" Display="Dynamic"
                    ValidationGroup="wsregistration" ControlToValidate="txtMobileNo"  CssClass="mandatory"
                    validationexpression="^[0-9]{10}$">
                    </asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td valign="top">Workshop <span class="mandatory">*</span></td>
                <td>
                    <asp:radiobuttonlist ID="rbWorkShop" runat="server" CssClass="radioButton"></asp:radiobuttonlist><br />
                </td>
            </tr><tr>
                <td valign="top">How did you hear about our workshop <span class="mandatory">*</span></td>
                <td>
                    <asp:radiobuttonlist ID="rbWSInfo" runat="server" CssClass="radioButton">
                        <asp:ListItem Value="Email">Email</asp:ListItem>
                        <asp:ListItem Value="Website" Selected="True">Website</asp:ListItem>
                        <asp:ListItem Value="Article">Website Article</asp:ListItem>
                        <asp:ListItem Value="Friend">Friend</asp:ListItem>
                        <asp:ListItem Value="Advertisement">Advertisement</asp:ListItem>
                        <asp:ListItem Value="Other">Other</asp:ListItem>
                    </asp:radiobuttonlist>                    
                </td>
            </tr>
            <tr>
                <td valign="top">In the event of a cancellation, how do we contact you <span class="mandatory">*</span></td>
                <td>
                    <asp:radiobuttonlist ID="rbContactInfo" runat="server" CssClass="radioButton">
                        <asp:ListItem Value="Phone">Phone Call</asp:ListItem>
                        <asp:ListItem Value="Email" Selected="True">Email</asp:ListItem>
                        <asp:ListItem Value="SMS">SMS</asp:ListItem>
                    </asp:radiobuttonlist>                   
                </td>
            </tr>
            <tr>
                <td colspan="2">&nbsp;</td>
            </tr>
            
            <tr>
                <td></td>
                <td>
                    <asp:LinkButton ID="WSRegistration" runat="server" CssClass="MainButton" OnClick="WSRegistration_Click" ValidationGroup="wsregistration">Register</asp:LinkButton>
                    
                </td>
            </tr>
            <tr>
                <td colspan="2" class="style1"></td>
            </tr>
            <tr>
                <td colspan="2">If you are finding any problem in filling the form, kindly contact support (91) 11 30018181 <br /><br />
                    <span class="mandatory" style="margin-top:20px;">* Fields are mandatory</span>
                </td>              
            </tr>
            <tr>
                <td colspan="2">&nbsp;</td>
            </tr>
        </table>
            
    </div>
        </div>
    </div>
    <%--**********************************************--%>
            <%--Message popup area start--%>
            <%--**********************************************--%>
            <asp:Button runat="server" ID="btnMessagePopupTargetButton" Style="display: none;" />
            <ajax:ModalPopupExtender ID="mpeMessagePopup" runat="server" PopupControlID="pnlMessageBox"
                TargetControlID="btnMessagePopupTargetButton" OkControlID="btnOk" CancelControlID="btnCancel"
                BackgroundCssClass="MessageBoxPopupBackground">
            </ajax:ModalPopupExtender>
            <asp:Panel runat="server" ID="pnlMessageBox" 
                   BackColor="White" Width="420" 
                   Style="display: none; border: 1px solid #859ab1;">
                <div class="popupHeader" style="width: 420px;">
                    <asp:Label ID="lblMessagePopupHeading" Text="Information" 
                        runat="server"></asp:Label><asp:LinkButton
                        ID="btnCancel" runat="server" 
                         Style="float: right; margin-right: 5px;">X</asp:LinkButton>
                </div>
                <div style="max-height: 500px; width: 420px; overflow: hidden;">
                    <div style="float:left; width:380px; margin:20px;">
                        <table style="padding: 0; border-spacing: 0; border-collapse: collapse; width: 100%;">
                            <tr>
                                <td style="text-align: left; vertical-align: top; width: 11%;">
                                    <i class="fa fa-thumbs-up fa-2x"></i>                                    
                                </td>
                                <td style="width: 2%;">
                                </td>
                                <td style="text-align: left; vertical-align: top; width: 87%;">
                                    <p style="margin: 0px; padding: 0px; color: #5F0202;">
                                        
                                            <asp:Label runat="server" ID="lblMessagePopupText"></asp:Label>
                                    </p>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: right; vertical-align: top;" colspan="3">
                                    <div style="margin-right: 0px; float: right; width: auto;">
                                        <asp:LinkButton ID="btnOk" runat="server" 
                                            CssClass="popup_button">Ok</asp:LinkButton>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </asp:Panel>
            <%--**********************************************--%>
            <%--Message popup area end--%>
            <%--**********************************************--%>

    
</asp:Content>

