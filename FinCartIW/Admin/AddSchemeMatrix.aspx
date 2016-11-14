<%@ Page Title="Scheme Matrix" Language="C#" MasterPageFile="~/Admin/AdminDashBoard.master" AutoEventWireup="true" CodeFile="AddSchemeMatrix.aspx.cs" Inherits="Admin_AddSchemeMatrix" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AdminContentPlaceHolder" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>  
    <asp:UpdatePanel ID="UpdatePanelUser" runat="server">
            <ContentTemplate>
                <div class="hr-cbp-mc-form" id="WSCourseEntry" runat="server">
                    <h1>Add Schemes for Matrix</h1>                        
                        <div class="hr-normal-cbp-mc-column">
                            <div class="hr-normal-cbp-mc-column-inner">
                                <label for="courseprice" >AMC Name</label>
                                <asp:DropDownList ID="ddAMC" name="courseprice" TabIndex="1" CssClass="inputfield" runat="server" OnSelectedIndexChanged="ddAMC_change"  AutoPostBack="true" ValidationGroup="schemematrix" >                                    
                                </asp:DropDownList>                                
                            </div>   
                            <div class="hr-normal-cbp-mc-column-inner">
                                <label for="courseprice" >Category Name</label>
                                <asp:DropDownList ID="ddCategory" name="courseprice" TabIndex="2" CssClass="inputfield" OnSelectedIndexChanged="ddCategory_change"  AutoPostBack="true" runat="server" ValidationGroup="schemematrix" >                                    
                                </asp:DropDownList>                                                                
                            </div>  
                            <div class="hr-normal-cbp-mc-column-inner">
                                <label for="courseprice" >Scheme Name</label>
                                <asp:DropDownList ID="ddScheme" name="courseprice" TabIndex="3" CssClass="inputfield" runat="server" ValidationGroup="schemematrix" >                                               
                                </asp:DropDownList>                                                                
                            </div>  
                            <div class="hr-normal-cbp-mc-column-inner">
                                <asp:LinkButton ID="SchemeSubmit" runat="server" CssClass="DBbuttonSmall" TabIndex="4" OnClick="SchemeSubmit_click" ValidationGroup="schemematrix">Add</asp:LinkButton>
                            </div>                                                     
                        </div>                                                                    
                                          
                    </div>
                    <br />
                    <div class="GV-Area">
                        <asp:GridView ID="GridViewSchemeMatrix" runat="server" AutoGenerateColumns="False" GridLines="None" 
                                 DataKeyNames="Code"  Width="100%" OnRowDeleting="GridViewSchemeMatrix_RowDeleting">
                                <Columns> 
                                    <asp:BoundField DataField="" Visible="false"  />                                   
                                    <asp:BoundField DataField="Category" HeaderText="Category" HeaderStyle-HorizontalAlign="Left" ControlStyle-Width="70" ControlStyle-CssClass="GV-ControlStyle"/>
                                    <asp:BoundField DataField="Sname"  HeaderText="Scheme Name" HeaderStyle-HorizontalAlign="Left" ControlStyle-CssClass="GV-ControlStyle" />                                    
                                    <asp:TemplateField HeaderText="Action" HeaderStyle-HorizontalAlign="Left"  >
	                                    <ItemTemplate>		                                    
                                            <asp:ImageButton ID="delButton" runat="server" CommandName="Delete" ImageUrl="~/images/delete.png"
                                                OnClientClick="return confirm('Are you sure you want to delete this Workshop Course?');" />
	                                    </ItemTemplate>
                                    </asp:TemplateField>                                                                      
                                </Columns>
                                <AlternatingRowStyle CssClass="GV-AlternatingRowStyle" />
                                <EditRowStyle CssClass="GV-EditRow" />                                    
                                <HeaderStyle CssClass="GV-HeaderStyle" />
                                <PagerStyle CssClass="GV-PagerStyle" />
                                <RowStyle CssClass="GV-RowStyle" />
                                <SelectedRowStyle CssClass="GV-SelectedRowStyle" /> 
                            </asp:GridView>
                    </div>
               
            </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

