<%@ Page Title="Subscription List" Language="C#" MasterPageFile="~/Admin/AdminDashBoard.master" AutoEventWireup="true" CodeFile="SubscriptionList.aspx.cs" Inherits="Admin_SubscriptionList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
   <meta name="description" content="Newsletter Subscription" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AdminContentPlaceHolder" Runat="Server">
    <div class="pageHeaderSection">
        <div class="col-header-left">
            Newsletter Subscription List
        </div>            
    </div>

    <br />
    <div class="GV-Area">
        <asp:GridView ID="GridViewSubscription" runat="server" AutoGenerateColumns="False" GridLines="None" 
                Width="100%" AllowPaging ="true" PageSize="10" OnPageIndexChanging="OnPaging" >
                <Columns>
                    <asp:BoundField DataField="Code" Visible="false"  />
                    <asp:BoundField DataField="Email" HeaderText="Email ID" HeaderStyle-HorizontalAlign="Left" ControlStyle-Width="100" />
                    <asp:BoundField DataField="SubscribeDate" HeaderText="Subscribe Date" HeaderStyle-HorizontalAlign="Left" ControlStyle-Width="100" />
                </Columns>
                <AlternatingRowStyle CssClass="GV-AlternatingRowStyle" />
                <EditRowStyle CssClass="GV-EditRow" />                                    
                <HeaderStyle CssClass="GV-HeaderStyle" />
                <PagerStyle CssClass="GV-PagerStyle" />
                <RowStyle CssClass="GV-RowStyle" />
                <SelectedRowStyle CssClass="GV-SelectedRowStyle" /> 
            </asp:GridView>
    </div>
</asp:Content>

