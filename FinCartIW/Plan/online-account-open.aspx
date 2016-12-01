<%@ Page Title="" Language="C#" MasterPageFile="~/Plan/Website.master" AutoEventWireup="true" CodeFile="online-account-open.aspx.cs" Inherits="Plan_online_account_open" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <div class="MainContainer">    
        <div id="pageSection">
            <div class="row">
                <div class="col-sm-6 col-sm-offset-3">
        
                <p>And get comprehensive financial planning.</p>
                <div class="row">
                    <div class="col-sm-12">
                        <asp:Label ID="emailValidate" runat="server" Text="" CssClass="validateEmail"></asp:Label>
                    </div>
                </div>
                <div role="form">
                    <div class="form-group">                    
                        <asp:TextBox type="text" name="name" runat="server" placeholder="Enter Name" TabIndex="1" id="name" class="form-control" ValidationGroup="RegisterInfo"  />                    
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="RegisterInfo" Display="Dynamic" ErrorMessage="" ControlToValidate="name" CssClass="mandatory"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">                    
                        <div class="input-group">
                            <span class="input-group-addon">+91</span>
                            <asp:TextBox type="text" name="countrycode" id="txtCountryCode" MaxLength="3" runat="server" value=" +91" Visible="false" ValidationGroup="RegisterInfo" />
                            <asp:TextBox type="text" name="mobile" id="mobile" Placeholder="Enter Mobile No." runat="server" class="form-control" MaxLength="10" ValidationGroup="RegisterInfo" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="RegisterInfo" Display="Dynamic" ErrorMessage="" ControlToValidate="mobile" CssClass="mandatory"></asp:RequiredFieldValidator>
                        </div>                    
                    </div>
                    <div class="form-group">                    
                        <asp:TextBox type="text" name="email" id="email" runat="server" placeholder="Enter Email" class="form-control" ValidationGroup="RegisterInfo"  />                    
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" Display="Dynamic" runat="server" ValidationGroup="RegisterInfo" ErrorMessage="" ControlToValidate="email" CssClass="mandatory"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">                    
                        <asp:TextBox type="password" name="password" id="txtPassword" runat="server" placeholder="password" class="form-control" ValidationGroup="RegisterInfo"  />                    
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" Display="Dynamic" runat="server" ValidationGroup="RegisterInfo" ErrorMessage="" ControlToValidate="txtPassword" CssClass="mandatory"></asp:RequiredFieldValidator>
                    </div>                
                    <div class="form-group">
                        <asp:Button type="submit" name="RegisterButton" id="RegisterButton" runat="server" ValidationGroup="RegisterInfo" Text="Proceed to Invest" class="btn btn-info btn-block btn-md" OnClick="RegisterButton_Click" />                    
                    </div>
                    </div>
                </div>
            </div>
        </div>
    </div>  
        
</asp:Content>

