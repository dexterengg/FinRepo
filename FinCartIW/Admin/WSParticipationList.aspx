<%@ Page Title="Workshop Participation List" Language="C#" MasterPageFile="~/Admin/AdminDashBoard.master" AutoEventWireup="true" CodeFile="WSParticipationList.aspx.cs" Inherits="Admin_WSParticipationList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AdminContentPlaceHolder" Runat="Server">
    <div class="pageHeaderSection">
            <div class="col-header-left">
                Participation List
            </div>
            <div class="col-header-right">
                <label>
                    <asp:LinkButton ID="exportPDF" runat="server"  onclick="exportPDF_Click"><i class="fa fa-file-pdf-o fa-2x"></i></asp:LinkButton></label>               
                <label>
                    <asp:LinkButton ID="exportExl" runat="server" onclick="exportExl_Click" ><i class="fa fa-file-excel-o fa-2x"></i></asp:LinkButton></label>
            </div>
    </div>
    
    
                    <br />
                    <div class="GV-Area">
                        <asp:GridView ID="GridViewParticipant" runat="server" AutoGenerateColumns="False" GridLines="None" 
                                Width="100%" >
                                <Columns>
                                    <asp:BoundField DataField="Code" Visible="false"  />
                                    <asp:BoundField DataField="FullName" HeaderText="Full Name" HeaderStyle-HorizontalAlign="Left" ControlStyle-Width="100" />       
                                    <asp:BoundField DataField="City" HeaderText="City" HeaderStyle-HorizontalAlign="Left" ControlStyle-Width="100" /> 
                                    <asp:BoundField DataField="Email" HeaderText="Email" HeaderStyle-HorizontalAlign="Left" ControlStyle-Width="70" />
                                    <asp:BoundField DataField="Mobile"  HeaderText="Mobile" HeaderStyle-HorizontalAlign="Left" ControlStyle-CssClass="GV-ControlStyle" />                                        
                                    <asp:BoundField DataField="CourseName" HeaderText="Workshop Name" HeaderStyle-HorizontalAlign="left" ControlStyle-Width="80" />
                                    <asp:BoundField DataField="InfoFrom" HeaderText="Info From" HeaderStyle-HorizontalAlign="left" ItemStyle-HorizontalAlign="left" ControlStyle-Width="100" />                                        
                                   
                                    <asp:BoundField DataField="InfoCancellation" HeaderText="If Cancel" HeaderStyle-HorizontalAlign="Left"  />
                                    <asp:BoundField DataField="RegDate" HeaderText="Reg. Date" HeaderStyle-HorizontalAlign="Left"  />                                                                                                
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

