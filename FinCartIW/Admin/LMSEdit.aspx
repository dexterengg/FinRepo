<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LMSEdit.aspx.cs" Inherits="Admin_LMSEdit" %>
<%@ Register TagPrefix="AdExternalLinkAs"  TagName="AdExternalLinkAs"  Src="~/Admin/ExternalLinks.ascx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <AdExternalLinkAs:AdExternalLinkAs id="externallink" runat="server" />
</head>
<body>
    <form id="form1" runat="server">
    <div id="EditZone" runat="server">
        <div><h3>Edit data for selected client</h3></div>

        <div class="hr-cbp-mc-form" >
            <div class="hr-cbp-mc-column">
                <div class="hr-cbp-mc-column-inner">
                    <label for="clientname">Client Name</label>
                    <asp:TextBox type="text" id="txtClientName" CssClass="inputfieldSmall" TabIndex="1" ReadOnly="true"  runat="server"  ValidationGroup="LMSPayment" />                                        
                </div>                
                <div class="hr-cbp-mc-column-inner">
                    <label for="gender">Gender</label>
                    <asp:DropDownList ID="DDGender" runat="server" CssClass="aspddl">
                        <asp:ListItem Value="M">Male</asp:ListItem>
                        <asp:ListItem Value="F">Female</asp:ListItem>
                    </asp:DropDownList>               
                </div>
                <div class="hr-cbp-mc-column-inner">
                    <label for="age">Age</label>
                    <asp:TextBox type="text" id="txtAge"  ReadOnly="true" CssClass="inputfieldSmall" TabIndex="3"  runat="server"  ValidationGroup="LMSPayment" />                   
                </div>
                <div class="hr-cbp-mc-column-inner">
                    <label for="mobile1">Mobile 1</label>
                    <asp:TextBox type="text" id="txtMobile1" CssClass="inputfieldSmall" TabIndex="4"  runat="server"  ValidationGroup="LMSPayment" />
                    <asp:RequiredFieldValidator ID="RequiredContact" ValidationGroup="LMSPayment" runat="server" ErrorMessage="*" Display="Dynamic" ControlToValidate="txtMobile1" CssClass="mandatory"></asp:RequiredFieldValidator> 
                </div>                
                <div class="hr-cbp-mc-column-inner">
                    <label for="mobile2">Mobile 2</label>
                    <asp:TextBox type="text" id="txtMobile2" CssClass="inputfieldSmall" TabIndex="6"  runat="server"  ValidationGroup="LMSPayment" />                     
                </div>
            </div>
            <div class="hr-cbp-mc-column">
                <div class="hr-cbp-mc-column-inner">
                    <label for="email2">Email Id 2</label>
                    <asp:TextBox type="text" id="txtEmailID2" CssClass="inputfieldSmall" TabIndex="7"  runat="server"  ValidationGroup="LMSPayment" />                    
                </div>
                <div class="hr-cbp-mc-column-inner">
                    <label for="city">City</label>
                    <asp:TextBox type="text" id="txtCity" CssClass="inputfieldSmall" TabIndex="8"  runat="server"  ValidationGroup="LMSPayment" />
                    <asp:RequiredFieldValidator ID="RequiredCity" ValidationGroup="LMSPayment" runat="server" ErrorMessage="*" Display="Dynamic" ControlToValidate="txtCity" CssClass="mandatory"></asp:RequiredFieldValidator> 
                </div>
                <div class="hr-cbp-mc-column-inner">
                    <label for="source1">Source 1</label>
                    <asp:DropDownList ID="DDSource1" name="reportto" TabIndex="14" CssClass="aspddl" runat="server" ValidationGroup="LMSPayment" OnSelectedIndexChanged="DDSource1_SelectedIndexChanged"  AutoPostBack="true" >                                                              
                    </asp:DropDownList>                
                </div>
                <div class="hr-cbp-mc-column-inner">
                    <label for="source2">Source 2</label>
                    <asp:DropDownList ID="DDSource2" name="reportto" TabIndex="14" CssClass="aspddl" runat="server" ValidationGroup="LMSPayment" >                                                              
                    </asp:DropDownList>                   
                </div>
                <div class="hr-cbp-mc-column-inner">
                    <label for="siteac">Site A/C</label>
                    <asp:DropDownList ID="DDSiteAC" runat="server" CssClass="aspddl">
                        <asp:ListItem Value="N">No</asp:ListItem>
                        <asp:ListItem Value="Y">Yes</asp:ListItem>                        
                    </asp:DropDownList>                   
                </div> 
            </div>
            <div class="hr-cbp-mc-column">
                <div class="hr-cbp-mc-column-inner">
                    <label for="txnac">Txn A/C</label>
                    <asp:DropDownList ID="DDTxnAC" runat="server" CssClass="aspddl">
                        <asp:ListItem Value="N">No</asp:ListItem>
                        <asp:ListItem Value="Y">Yes</asp:ListItem>                        
                    </asp:DropDownList>                    
                </div> 
                <div class="hr-cbp-mc-column-inner">
                    <label for="optype1">OP Type 1</label>
                    <asp:DropDownList ID="DDOpType1" runat="server" CssClass="aspddl">
                        <asp:ListItem Value="Free">Free</asp:ListItem>
                        <asp:ListItem Value="Paid">Paid</asp:ListItem>
                    </asp:DropDownList>                    
                </div>  
                <div class="hr-cbp-mc-column-inner">
                    <label for="optype2">OP Type 2</label>
                    <asp:DropDownList ID="DDOpType2" runat="server" CssClass="aspddl">
                        <asp:ListItem Value="T">Transact</asp:ListItem>
                        <asp:ListItem Value="CP">Customized Plan</asp:ListItem>
                        <asp:ListItem Value="FAP">Fully Assisted Plan</asp:ListItem>                        
                    </asp:DropDownList>                      
                </div>                               
            </div>
            <div class="hr-cbp-mc-column">
                <label for="remarks">Remarks</label>
                    <asp:TextBox type="text" id="txtRemarks" CssClass="inputfieldSmall" TabIndex="15"  runat="server"  ValidationGroup="LMSPayment" />  
            </div>
            <div class="hr-cbp-mc-column">
                <asp:LinkButton ID="LMSEditSubmit" runat="server" CssClass="ButtonSmall" TabIndex="16" OnClick="LMSEditSubmit_click" ValidationGroup="LMSPayment">Update</asp:LinkButton>
            </div>
        </div>
    </div>
    <div id="EditSuccess" runat="server" class="ModalSuccess">
        Records edited successfully.
    </div>
    </form>
</body>
</html>
