<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LMSPayment.aspx.cs" Inherits="Admin_LMSPayment" %>
<%@ Register TagPrefix="AdExternalLinkAs"  TagName="AdExternalLinkAs"  Src="~/Admin/ExternalLinks.ascx" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajxct" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <AdExternalLinkAs:AdExternalLinkAs id="externallink" runat="server" />   
    <script>
        $(document).ready(function () {

            $("#AddComment").click(function () {
                $("#CommentZone").show(1000);
            });
        });
	</script> 
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>  
    <div>
        <div>Investor Name : <asp:Label ID="lblInvName" runat="server" Text=""></asp:Label></div>
        <asp:GridView ID="GridViewPayment" runat="server" AutoGenerateColumns="false" Width="100%" OnRowDeleting="GridViewPayment_RowDeleting" OnRowEditing="GridViewPayment_RowEditing" OnRowUpdating="GridViewPayment_RowUpdating" OnRowCancelingEdit="GridViewPayment_RowCancelingEdit"  DataKeyNames="Code" >
            <Columns>
                <asp:BoundField DataField="Code" Visible="false"  />
                <asp:BoundField DataField="PDate" HeaderText="Date" HeaderStyle-HorizontalAlign="Left" ReadOnly="true" ItemStyle-HorizontalAlign="Left"  >
                <HeaderStyle HorizontalAlign="Left" />
                <ItemStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="ClientNAme" HeaderText="Username" HeaderStyle-HorizontalAlign="Left" ReadOnly="true" ItemStyle-HorizontalAlign="Left"  >
                <HeaderStyle HorizontalAlign="Left" />
                <ItemStyle HorizontalAlign="Left" />
                </asp:BoundField>                           
                <asp:BoundField DataField="Amount" HeaderText="Amount" HeaderStyle-HorizontalAlign="center" ItemStyle-HorizontalAlign="center" >
                <HeaderStyle HorizontalAlign="Center" />
                <ItemStyle HorizontalAlign="Center" />  
                    <ControlStyle Width="80" />                          
                </asp:BoundField>
                <asp:BoundField DataField="Instrument" HeaderText="Instrument" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left"  >
                <HeaderStyle HorizontalAlign="Left" />
                <ItemStyle HorizontalAlign="Left" />
                    <ControlStyle Width="80" />   
                </asp:BoundField>
                <asp:BoundField DataField="Drawer" HeaderText="Drawer" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left"  >
                <HeaderStyle HorizontalAlign="Left" />
                <ItemStyle HorizontalAlign="Left" />
                    <ControlStyle Width="100" />   
                </asp:BoundField>                           
                <asp:BoundField DataField="Drawee" HeaderText="Drawee" HeaderStyle-HorizontalAlign="center" ItemStyle-HorizontalAlign="center" >
                <HeaderStyle HorizontalAlign="Center" />
                <ItemStyle HorizontalAlign="Center" />  
                    <ControlStyle Width="100" />                             
                </asp:BoundField>
                <asp:BoundField DataField="Payer" HeaderText="Payer" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left"  >
                <HeaderStyle HorizontalAlign="Left" />
                <ItemStyle HorizontalAlign="Left" />
                    <ControlStyle Width="100" />   
                </asp:BoundField>                           
                <asp:BoundField DataField="Payee" HeaderText="Payee" HeaderStyle-HorizontalAlign="center" ItemStyle-HorizontalAlign="center" >
                <HeaderStyle HorizontalAlign="Center" />
                <ItemStyle HorizontalAlign="Center" />  
                    <ControlStyle Width="80" />                             
                </asp:BoundField>
                <asp:BoundField DataField="PaymentMode" HeaderText="Payment Mode" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left"  >
                <HeaderStyle HorizontalAlign="Left" />
                <ItemStyle HorizontalAlign="Left" />
                    <ControlStyle Width="80" />   
                </asp:BoundField>                           
                <asp:BoundField DataField="PlannerName" HeaderText="Planner Name" HeaderStyle-HorizontalAlign="center" ReadOnly="true" ItemStyle-HorizontalAlign="center" >
                <HeaderStyle HorizontalAlign="Center" />
                <ItemStyle HorizontalAlign="Center" />                            
                </asp:BoundField>
                <asp:CommandField EditImageUrl="~/images/edit.png"  ButtonType="Image"  ShowEditButton="true" UpdateImageUrl="~/images/updates.png" CancelImageUrl="~/images/cancel.png" >
                                        
                </asp:CommandField>
                <asp:CommandField ShowDeleteButton="true" ButtonType="Image" DeleteImageUrl="~/images/delete.png" >
                                        
                </asp:CommandField>           
            </Columns>
            <AlternatingRowStyle CssClass="GV-AlternatingRowStyle" />
            <EditRowStyle CssClass="GV-EditRow" />                                                                       
            <HeaderStyle CssClass="GV-HeaderStyleModal" />
            <PagerStyle CssClass="GV-PagerStyle" />
            <RowStyle CssClass="GV-RowStyle" />
            <SelectedRowStyle CssClass="GV-SelectedRowStyle" />    
        </asp:GridView>

        <div><a href="#" id="AddComment" class="ButtonSmall"><i class="fa fa-plus-square"></i>&nbsp;Add Detail</a></div>

        <div class="hr-cbp-mc-form" id="CommentZone" style="display:none" >
            <div class="hr-cbp-mc-column">
                <div class="hr-cbp-mc-column-inner">
                    <asp:TextBox type="text" id="txtPaymentDate" placeholder="Date" CssClass="inputfieldSmall" TabIndex="1"  runat="server"  ValidationGroup="LMSPayment" />
                    <ajxct:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtPaymentDate"  Format="dd-MM-yyyy" SkinID="2" Animated="true"  />
                    <asp:RequiredFieldValidator ID="RequiredPaymentDate" ValidationGroup="LMSPayment" runat="server" ErrorMessage="*" Display="Dynamic" ControlToValidate="txtPaymentDate" CssClass="mandatory"></asp:RequiredFieldValidator> 
                </div>                
                <div class="hr-cbp-mc-column-inner">
                    <asp:TextBox type="text" id="txtAmount" placeholder="Amount" CssClass="inputfieldSmall" TabIndex="2"  runat="server"  ValidationGroup="LMSPayment" />
                    <asp:RequiredFieldValidator ID="RequiredAmount" ValidationGroup="LMSPayment" runat="server" ErrorMessage="*" Display="Dynamic" ControlToValidate="txtAmount" CssClass="mandatory"></asp:RequiredFieldValidator> 
                </div>
                <div class="hr-cbp-mc-column-inner">
                    <asp:TextBox type="text" id="txtInstrument" placeholder="Instrument" CssClass="inputfieldSmall" TabIndex="3"  runat="server"  ValidationGroup="LMSPayment" />
                    <asp:RequiredFieldValidator ID="RequiredInstrument" ValidationGroup="LMSPayment" runat="server" ErrorMessage="*" Display="Dynamic" ControlToValidate="txtInstrument" CssClass="mandatory"></asp:RequiredFieldValidator> 
                </div>
                <div class="hr-cbp-mc-column-inner">
                    <asp:TextBox type="text" id="txtDrawer" placeholder="Drawer" CssClass="inputfieldSmall" TabIndex="4"  runat="server"  ValidationGroup="LMSPayment" />
                    <asp:RequiredFieldValidator ID="RequiredDrawer" ValidationGroup="LMSPayment" runat="server" ErrorMessage="*" Display="Dynamic" ControlToValidate="txtDrawer" CssClass="mandatory"></asp:RequiredFieldValidator> 
                </div>
                <div class="hr-cbp-mc-column-inner">
                    <asp:TextBox type="text" id="txtDrawee" placeholder="Drawee" CssClass="inputfieldSmall" TabIndex="5"  runat="server"  ValidationGroup="LMSPayment" />
                    <asp:RequiredFieldValidator ID="RequiredDrawee" ValidationGroup="LMSPayment" runat="server" ErrorMessage="*" Display="Dynamic" ControlToValidate="txtDrawee" CssClass="mandatory"></asp:RequiredFieldValidator> 
                </div>
                <div class="hr-cbp-mc-column-inner">
                    <asp:TextBox type="text" id="txtPayer" placeholder="Payer" CssClass="inputfieldSmall" TabIndex="6"  runat="server"  ValidationGroup="LMSPayment" />
                    <asp:RequiredFieldValidator ID="RequiredPayer" ValidationGroup="LMSPayment" runat="server" ErrorMessage="*" Display="Dynamic" ControlToValidate="txtPayer" CssClass="mandatory"></asp:RequiredFieldValidator> 
                </div>
                <div class="hr-cbp-mc-column-inner">
                    <asp:TextBox type="text" id="txtPayee" placeholder="Payee" CssClass="inputfieldSmall" TabIndex="7"  runat="server"  ValidationGroup="LMSPayment" />
                    <asp:RequiredFieldValidator ID="RequiredPayee" ValidationGroup="LMSPayment" runat="server" ErrorMessage="*" Display="Dynamic" ControlToValidate="txtPayee" CssClass="mandatory"></asp:RequiredFieldValidator> 
                </div>
                <div class="hr-cbp-mc-column-inner">
                    <asp:TextBox type="text" id="txtPaymentMode" placeholder="Payment Mode" CssClass="inputfieldSmall" TabIndex="8"  runat="server"  ValidationGroup="LMSPayment" />
                    <asp:RequiredFieldValidator ID="RequiredPaymentMode" ValidationGroup="LMSPayment" runat="server" ErrorMessage="*" Display="Dynamic" ControlToValidate="txtPaymentMode" CssClass="mandatory"></asp:RequiredFieldValidator> 
                </div>                
                <div class="hr-cbp-mc-column-inner">
                    <asp:LinkButton ID="PaymentSubmit" runat="server" CssClass="ButtonSmall" TabIndex="10" OnClick="PaymentSubmit_click" ValidationGroup="LMSPayment">Add</asp:LinkButton>
                </div>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
