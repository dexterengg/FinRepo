<%@ Page Title="Planner LMS" Language="C#" MasterPageFile="~/Admin/AdminDashBoard.master" AutoEventWireup="true" CodeFile="PlannerLMS.aspx.cs" Inherits="Admin_PlannerLMS" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajax" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AdminContentPlaceHolder" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>   
    <link rel="stylesheet" href="../css/datepicker.css" type="text/css" />
    <script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
    <script type="text/javascript" >
        $(document).ready(function () {
            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
            Sys.WebForms.PageRequestManager.getInstance().beginAsyncPostBack();
            function EndRequestHandler(sender, args) {
                $("#AdminContentPlaceHolder_searchDate").datepicker({
                    changeMonth: true,
                    changeYear: true,
                    dateFormat: 'dd-mm-yy'
                });

            }
        });
</script>
    <div class="pageHeaderSection">
            <div class="col-header-left">
                Today's Activity
            </div>
            <div class="col-header-right">
                <label>Search Activity</label>
                <asp:TextBox ID="searchDate" runat="server" Width="100px" CssClass="inputfieldSmall"></asp:TextBox>
                <%--<ajax:CalendarExtender ID="CESrchActivity" runat="server" TargetControlID="searchDate" 
                                                        PopupButtonID="searchDate" Format="dd-MM-yyyy">
                                </ajax:CalendarExtender>--%>
                <asp:LinkButton ID="btnActivitySearch" runat="server" OnClick="btnActivitySearch_Click"><i class="fa fa-search fa-2x"></i></asp:LinkButton>
            </div>
    </div>
    <div class="clear"></div>
    <div class="GV-Area">
        <asp:GridView ID="GVToDaysActivity" runat="server" AutoGenerateColumns="false" Width="100%" OnRowDataBound="GVToDaysActivity_OnRowDataBound" OnRowEditing="GVToDaysActivity_RowEditing" OnRowUpdating="GVToDaysActivity_RowUpdating" OnRowCancelingEdit="GVToDaysActivity_RowCancelingEdit"  DataKeyNames="Code" GridLines="None" >
            <Columns>
                <asp:BoundField DataField="Code" Visible="false"  />               
                <asp:TemplateField HeaderText="Action Date" ItemStyle-HorizontalAlign="Center" >
                   <ItemTemplate >
                      <asp:Label ID="lblNextADate" runat="server" Text='<%# Eval("NextADate") %>' >
		        </asp:Label>
                   </ItemTemplate>
                   <EditItemTemplate >
                       <asp:TextBox ID="txtActionDate" Width="100" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "NextADate") %>'></asp:TextBox>
                        <ajax:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtActionDate" 
                                                PopupButtonID="txtActionDate" Format="dd-MM-yyyy">
                        </ajax:CalendarExtender>
                   </EditItemTemplate>
               </asp:TemplateField>

                  
                <asp:BoundField DataField="ActionTime" HeaderText="Action Time"  ControlStyle-Width="100"  >
                <HeaderStyle HorizontalAlign="Center" />
                <ItemStyle HorizontalAlign="Center" />

                </asp:BoundField>                            
                <asp:TemplateField HeaderText = "Activity" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <asp:Label ID="lblCActivity" runat="server" Text='<%# Eval("Activity") %>' Visible = "true" />
                        <asp:Label ID="lblActivityCode" runat="server" Text='<%# Eval("ActivityCode") %>' Visible = "false" />                         
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:DropDownList ID="ddCActivity" runat="server"  CssClass="GV-Combo">
                        </asp:DropDownList>
                    </EditItemTemplate>

                </asp:TemplateField>               
                <asp:BoundField DataField="ClientName" HeaderText="Name" HeaderStyle-HorizontalAlign="Left" ReadOnly="true" ItemStyle-HorizontalAlign="Left"  >
                <HeaderStyle HorizontalAlign="Left" />
                <ItemStyle HorizontalAlign="Left" />
                </asp:BoundField>                           
                <asp:BoundField DataField="ClientPhone" HeaderText="Phone" HeaderStyle-HorizontalAlign="center" ReadOnly="true" ItemStyle-HorizontalAlign="center" >
                <HeaderStyle HorizontalAlign="Center" />
                <ItemStyle HorizontalAlign="Center" />                            
                </asp:BoundField>
                <asp:BoundField DataField="ClientEmail" HeaderText="Email" HeaderStyle-HorizontalAlign="Left" ReadOnly="true" ItemStyle-HorizontalAlign="Left"  >
                <HeaderStyle HorizontalAlign="Left" />
                <ItemStyle HorizontalAlign="Left" />
                </asp:BoundField> 
                <asp:TemplateField HeaderText = "Status" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <asp:Label ID="lblStatus" runat="server" Text='<%# Eval("AMStatus") %>' />
                        
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:DropDownList ID="ddStatus" runat="server"  CssClass="GV-Combo">                            
                            <asp:ListItem Value="Open">Open</asp:ListItem>
                            <asp:ListItem Value="Close">Close</asp:ListItem>                            
                        </asp:DropDownList>
                    </EditItemTemplate>
                </asp:TemplateField>     
                <asp:TemplateField HeaderText="SMS" HeaderStyle-Width="100px" ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <asp:Button ID="btnReminder" runat="server" CssClass="GV-ButtonEdit" Text="Send Reminder" CommandArgument='<%#Eval("Code") %>' />
                    </ItemTemplate>
                </asp:TemplateField>                                         
                <asp:CommandField EditImageUrl="~/images/edit.png"  ButtonType="Image"  ShowEditButton="true" UpdateImageUrl="~/images/updates.png" CancelImageUrl="~/images/cancel.png" >
                                        
                </asp:CommandField>                    
            </Columns>
            <AlternatingRowStyle CssClass="GV-AlternatingRowStyle" />
            <EditRowStyle CssClass="GV-EditRow" />                                                                       
            <HeaderStyle CssClass="GV-HeaderStyleModal" />
            <PagerStyle CssClass="GV-PagerStyle" />
            <RowStyle CssClass="GV-RowStyle" />
            <SelectedRowStyle CssClass="GV-SelectedRowStyle" />    
        </asp:GridView>

    </div>


</asp:Content>

