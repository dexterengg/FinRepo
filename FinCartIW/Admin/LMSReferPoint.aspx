<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LMSReferPoint.aspx.cs" Inherits="Admin_LMSReferPoint" %>
<%@ Register TagPrefix="AdExternalLinkAs"  TagName="AdExternalLinkAs"  Src="~/Admin/ExternalLinks.ascx" %>

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
    <div>
        <div>Investor Name : <asp:Label ID="lblInvName" runat="server" Text=""></asp:Label></div>
        <asp:GridView ID="GridViewRefPoint" runat="server" AutoGenerateColumns="false" Width="100%" OnRowDeleting="GridViewRefPoint_RowDeleting" 
            OnRowEditing="GridViewRefPoint_RowEditing" OnRowUpdating="GridViewRefPoint_RowUpdating" OnRowCancelingEdit="GridViewRefPoint_RowCancelingEdit"  DataKeyNames="Code">
            <Columns>
                <asp:BoundField DataField="Code" Visible="false"  />
                <asp:BoundField DataField="RPDate" HeaderText="Date" HeaderStyle-HorizontalAlign="Left" ReadOnly="true" ItemStyle-HorizontalAlign="Left"  >
                <HeaderStyle HorizontalAlign="Left" />
                <ItemStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="ClientName" HeaderText="Username" HeaderStyle-HorizontalAlign="Left" ReadOnly="true" ItemStyle-HorizontalAlign="Left"  >
                <HeaderStyle HorizontalAlign="Left" />
                <ItemStyle HorizontalAlign="Left" />
                </asp:BoundField>                           
                <asp:BoundField DataField="PointAdded" HeaderText="Referal Points" HeaderStyle-HorizontalAlign="center" ItemStyle-HorizontalAlign="center" >
                <HeaderStyle HorizontalAlign="Center" />
                <ItemStyle HorizontalAlign="Center" />                            
                </asp:BoundField>
                <asp:BoundField DataField="ReferredBy" HeaderText="Referred By" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left"  >
                <HeaderStyle HorizontalAlign="Left" />
                <ItemStyle HorizontalAlign="Left" />
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

        <div><a href="#" id="AddComment" class="ButtonSmall"><i class="fa fa-plus-square"></i>&nbsp;Add Report</a></div>

        <div class="hr-cbp-mc-form" id="CommentZone" style="display:none">
            <div class="hr-cbp-mc-column">                            
                <div class="hr-cbp-mc-column-inner">
                    <asp:TextBox type="text" id="txtRefPoint" placeholder="Referral Point" CssClass="inputfieldSmall" TabIndex="2"  runat="server"  ValidationGroup="LMSPayment" />
                    <asp:RequiredFieldValidator ID="RequiredAmount" ValidationGroup="LMSPayment" runat="server" ErrorMessage="*" Display="Dynamic" ControlToValidate="txtRefPoint" CssClass="mandatory"></asp:RequiredFieldValidator> 
                </div>
                <div class="hr-cbp-mc-column-inner">
                    <asp:TextBox type="text" id="txtReferredBy" placeholder="Referred By" CssClass="inputfieldSmall" TabIndex="3"  runat="server"  ValidationGroup="LMSPayment" />
                    <asp:RequiredFieldValidator ID="RequiredInstrument" ValidationGroup="LMSPayment" runat="server" ErrorMessage="*" Display="Dynamic" ControlToValidate="txtReferredBy" CssClass="mandatory"></asp:RequiredFieldValidator> 
                </div>                                
                <div class="hr-cbp-mc-column-inner">
                    <asp:LinkButton ID="ReferSubmit" runat="server" CssClass="ButtonSmall" TabIndex="10" OnClick="ReferSubmit_click" ValidationGroup="LMSPayment">Add</asp:LinkButton>
                </div>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
