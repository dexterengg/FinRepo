<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminDashBoard.master" AutoEventWireup="true" CodeFile="PlannerTrack.aspx.cs" Inherits="Admin_PlannerTrack" EnableEventValidation="false"%>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajxct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AdminContentPlaceHolder" runat="Server">
    <script language="javascript" type="text/javascript">

        function divexpandcollapse(divname) {

            var div = document.getElementById(divname);

            var img = document.getElementById('img' + divname);

            if (div.style.display == "none") {

                div.style.display = "inline";

                img.src = "images/minus.gif";

            } else {

                div.style.display = "none";

                img.src = "images/plus.gif";

            }

        }

    </script>

    <link rel="stylesheet" type="text/css" href="../modal/css/component.css" />
    <script src="../modal/js/modernizr.custom.js"></script>

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="searchArea">
        <h4>Track All Planners Activities</h4>
        <div class="searchItem">
            <label>Planner: &nbsp;&nbsp;</label>
            <asp:DropDownList ID="ddlplanner" runat="server" CssClass="inputfield" ValidationGroup="searchItem">
            </asp:DropDownList>
            &nbsp;&nbsp;&nbsp;&nbsp;
                    <label>Lead Type: &nbsp;&nbsp;</label>
            <asp:DropDownList ID="DDLeadType" runat="server" CssClass="inputfield" ValidationGroup="searchItem">
            </asp:DropDownList>
            &nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:LinkButton ID="SearchSubmit" runat="server" CssClass="ButtonSmall" OnClick="SearchSubmit_Click" ValidationGroup="searchItem">Search</asp:LinkButton>
        </div>
        <div style="float: right">
            <a href="javascript:void(0)" title="Download Activities Excel">
                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="images/excel_icon-150x150.png" style="height: 46px; width: 46px;" OnClick="ImageButton1_Click"/>
            </a>
        </div>
    </div>
    <div class="GV-Area">
        <asp:GridView ID="GridViewLMS" runat="server" RowStyle-Wrap="false" HeaderStyle-Wrap="false" RowStyle-Height="23px"
            AutoGenerateColumns="False" OnRowDataBound="GridViewLMS_OnRowDataBound" DataKeyNames="PlannerCode"
            OnRowCreated="GridViewLMS_RowCreated" Width="100%" GridLines="None" AllowPaging="True" OnPageIndexChanging="OnPaging" CellPadding="4" ForeColor="#333333">
            <Columns>
                <%--Cell No 0--%>
                <asp:TemplateField ItemStyle-Width="80px" HeaderText="Track Activity">
                    <ItemTemplate>
                        <a id="link1" href="JavaScript:divexpandcollapse('div<%# Eval("Code") %>');">
                            <img id='imgdiv<%# Eval("Code") %>' width="16" height="16" border="0" src="images/plus.gif" alt="" />
                        </a>
                    </ItemTemplate>
                    <ItemStyle Width="20px" VerticalAlign="Middle"></ItemStyle>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Code" Visible="false">
                    <ItemTemplate>
                        <asp:Label ID="lblcodeID" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Code") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:BoundField DataField="Code" Visible="false" />

                <asp:TemplateField HeaderText="Name" HeaderStyle-Width="100px" ItemStyle-HorizontalAlign="left">
                    <ItemTemplate>
                        <a href='LeadDetails.aspx?clientcode=<%# Eval("Code") %>' target="_blank">
                            <asp:Label ID="lblName" runat="server" Text='<%# Eval("Name")%>'></asp:Label></a>
                    </ItemTemplate>

                    <HeaderStyle Width="100px"></HeaderStyle>

                    <ItemStyle HorizontalAlign="Left"></ItemStyle>
                </asp:TemplateField>

                <asp:BoundField DataField="Gender" HeaderText="M/F" HeaderStyle-HorizontalAlign="Left" ReadOnly="true" ItemStyle-HorizontalAlign="Left">
                    <HeaderStyle HorizontalAlign="Left" />
                    <ItemStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="Age" HeaderText="Age" HeaderStyle-HorizontalAlign="center" ReadOnly="true" ItemStyle-HorizontalAlign="center">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="Mobile1" HeaderText="Mobile" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left">
                    <HeaderStyle HorizontalAlign="Left" />
                    <ItemStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="Email1" HeaderText="EmailID" HeaderStyle-HorizontalAlign="center" ReadOnly="true" ItemStyle-HorizontalAlign="center">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="Source1" HeaderText="Source1" HeaderStyle-HorizontalAlign="center" ReadOnly="true" ItemStyle-HorizontalAlign="center">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="Source2" HeaderText="Source2" HeaderStyle-HorizontalAlign="center" ReadOnly="true" ItemStyle-HorizontalAlign="center">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="Source3" HeaderText="Source3" HeaderStyle-HorizontalAlign="center" ReadOnly="true" ItemStyle-HorizontalAlign="center">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="EntryDate" HeaderText="Entry Date" HeaderStyle-HorizontalAlign="center" ItemStyle-HorizontalAlign="center">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <%--Cell No 9--%>
                <asp:TemplateField HeaderText="Lead Type" HeaderStyle-HorizontalAlign="Left">
                    <ItemTemplate>
                        <asp:Label ID="lblLeadType" runat="server" Text='<%# Eval("LeadType") %>' Visible="false" />
                        <asp:DropDownList ID="ddLeadType" runat="server" CssClass="GV-Combo" Enabled="false">
                        </asp:DropDownList>
                    </ItemTemplate>

                    <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Last Activity" HeaderStyle-Width="100px" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>                                            
                                            <%#Eval("LastActivityDate") %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                <asp:TemplateField>

                    <ItemTemplate>

                        <tr>

                            <td colspan="100%" style="background: #F5F5F5">

                                <div id='div<%# Eval("Code") %>' style="overflow: auto; display: none; position: relative; left: 15px; overflow: auto">

                                    <div class="innerGrid">
                                        <div class="resultBody">
                                            <asp:Label ID="lblclientcode" runat="server" Text='<%# Eval("Code") %>' Visible="false" />
                                            <asp:GridView ID="GridViewActivity" runat="server" AutoGenerateColumns="False" Width="100%" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black">
                                                <Columns>
                                                    <asp:BoundField DataField="Code" Visible="false" />
                                                    <asp:BoundField DataField="CDate" HeaderText="Date" HeaderStyle-HorizontalAlign="Left" ReadOnly="true" ItemStyle-HorizontalAlign="Left">
                                                        <HeaderStyle HorizontalAlign="Left" />
                                                        <ItemStyle HorizontalAlign="Left" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="Comment" HeaderText="Comment" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left">
                                                        <HeaderStyle HorizontalAlign="Left" />
                                                        <ItemStyle HorizontalAlign="Left" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="EnteredBy" HeaderText="Enter By" HeaderStyle-HorizontalAlign="center" ReadOnly="true" ItemStyle-HorizontalAlign="center">
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="NextADate" HeaderText="Next Action Date" HeaderStyle-HorizontalAlign="Left" ReadOnly="true" ItemStyle-HorizontalAlign="Left">
                                                        <HeaderStyle HorizontalAlign="Left" />
                                                        <ItemStyle HorizontalAlign="Left" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="ActionTime" HeaderText="Action Time" HeaderStyle-HorizontalAlign="center" ReadOnly="true" ItemStyle-HorizontalAlign="center">
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="Activity" HeaderText="Activity" HeaderStyle-HorizontalAlign="Left" ReadOnly="true" ItemStyle-HorizontalAlign="Left">
                                                        <HeaderStyle HorizontalAlign="Left" />
                                                        <ItemStyle HorizontalAlign="Left" />
                                                    </asp:BoundField>
                                                </Columns>
                                                <AlternatingRowStyle CssClass="GV-AlternatingRowStyle" />
                                                <EditRowStyle CssClass="GV-EditRow" />
                                                <FooterStyle BackColor="#CCCCCC" />
                                                <HeaderStyle CssClass="GV-HeaderStyleModal" BackColor="Black" Font-Bold="True" ForeColor="White" />
                                                <PagerStyle CssClass="GV-PagerStyle" BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                                                <RowStyle CssClass="GV-RowStyle" BackColor="White" />
                                                <SelectedRowStyle CssClass="GV-SelectedRowStyle" BackColor="#000099" Font-Bold="True" ForeColor="White" />
                                                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                                <SortedAscendingHeaderStyle BackColor="#808080" />
                                                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                                <SortedDescendingHeaderStyle BackColor="#383838" />
                                            </asp:GridView>

                                        </div>

                                    </div>

                                    <div class="md-overlay"></div>
                                    <!-- the overlay element -->
                                </div>
                            </td>

                        </tr>

                    </ItemTemplate>

                </asp:TemplateField>

            </Columns>
            <AlternatingRowStyle CssClass="GV-AlternatingRowStyle" BackColor="White" />
            <EditRowStyle CssClass="GV-EditRow" />
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle CssClass="GV-HeaderStyle" BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <PagerStyle CssClass="GV-PagerStyle" BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle CssClass="GV-RowStyle" BackColor="#FFFBD6" ForeColor="#333333" />
            <SelectedRowStyle CssClass="GV-SelectedRowStyle" BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <SortedAscendingCellStyle BackColor="#FDF5AC" />
            <SortedAscendingHeaderStyle BackColor="#4D0000" />
            <SortedDescendingCellStyle BackColor="#FCF6C0" />
            <SortedDescendingHeaderStyle BackColor="#820000" />
        </asp:GridView>
    </div>
    <br />
    <br />
    <div class="GV-Area" style="visibility:hidden;">
        <asp:GridView ID="GridViewLMS_excel" runat="server" RowStyle-Wrap="false" HeaderStyle-Wrap="false" RowStyle-Height="23px"
            AutoGenerateColumns="False" OnRowDataBound="GridViewLMS_excel_RowDataBound" DataKeyNames="PlannerCode"
            Width="100%" GridLines="None" CellPadding="4" ForeColor="#333333">
            <Columns>
                <%--Cell No 0--%>
                <asp:TemplateField ItemStyle-Width="80px" HeaderText="Track Activity">
                    <ItemTemplate>
                        <a id="link1" href="JavaScript:divexpandcollapse('div<%# Eval("Code") %>');">
                            <img id='imgdiv<%# Eval("Code") %>' width="16" height="16" border="0" src="images/plus.gif" alt="" />
                        </a>
                    </ItemTemplate>
                    <ItemStyle Width="20px" VerticalAlign="Middle"></ItemStyle>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Code" Visible="false">
                    <ItemTemplate>
                        <asp:Label ID="lblcodeID" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Code") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:BoundField DataField="Code" Visible="false" />

                <asp:TemplateField HeaderText="Name" HeaderStyle-Width="100px" ItemStyle-HorizontalAlign="left">
                    <ItemTemplate>
                        <a href='LeadDetails.aspx?clientcode=<%# Eval("Code") %>' target="_blank">
                            <asp:Label ID="lblName" runat="server" Text='<%# Eval("Name")%>'></asp:Label></a>
                    </ItemTemplate>

                    <HeaderStyle Width="100px"></HeaderStyle>

                    <ItemStyle HorizontalAlign="Left"></ItemStyle>
                </asp:TemplateField>

                <asp:BoundField DataField="Gender" HeaderText="M/F" HeaderStyle-HorizontalAlign="Left" ReadOnly="true" ItemStyle-HorizontalAlign="Left">
                    <HeaderStyle HorizontalAlign="Left" />
                    <ItemStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="Age" HeaderText="Age" HeaderStyle-HorizontalAlign="center" ReadOnly="true" ItemStyle-HorizontalAlign="center">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="Mobile1" HeaderText="Mobile" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left">
                    <HeaderStyle HorizontalAlign="Left" />
                    <ItemStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="Email1" HeaderText="EmailID" HeaderStyle-HorizontalAlign="center" ReadOnly="true" ItemStyle-HorizontalAlign="center">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="Source1" HeaderText="Source1" HeaderStyle-HorizontalAlign="center" ReadOnly="true" ItemStyle-HorizontalAlign="center">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="Source2" HeaderText="Source2" HeaderStyle-HorizontalAlign="center" ReadOnly="true" ItemStyle-HorizontalAlign="center">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="Source3" HeaderText="Source3" HeaderStyle-HorizontalAlign="center" ReadOnly="true" ItemStyle-HorizontalAlign="center">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="EntryDate" HeaderText="Entry Date" HeaderStyle-HorizontalAlign="center" ItemStyle-HorizontalAlign="center">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <%--Cell No 9--%>
                <asp:TemplateField HeaderText="Lead Type" HeaderStyle-HorizontalAlign="Left">
                    <ItemTemplate>
                        <asp:Label ID="lblLeadType" runat="server" Text='<%# Eval("LeadType") %>' Visible="false" />
                        <asp:Label ID="LeadType" runat="server" Text='<%# Eval("LeadType") %>'/>
                    </ItemTemplate>

                    <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Last Activity" HeaderStyle-Width="100px" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>                                            
                                            <%#Eval("LastActivityDate") %>
                                        </ItemTemplate>
                                    </asp:TemplateField> 

                <asp:TemplateField>

                    <ItemTemplate>

                        <tr>

                            <td colspan="100%" style="background: #F5F5F5">

                                <div id='div<%# Eval("Code") %>' style="overflow: auto; display: none; position: relative; left: 15px; overflow: auto">

                                    <div class="innerGrid">
                                        <div class="resultBody">
                                            <asp:Label ID="lblclientcode" runat="server" Text='<%# Eval("Code") %>' Visible="false" />
                                            <asp:GridView ID="GridViewActivity" runat="server" AutoGenerateColumns="False" Width="100%" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black">
                                                <Columns>
                                                    <asp:BoundField DataField="Code" Visible="false" />
                                                    <asp:BoundField DataField="CDate" HeaderText="Date" HeaderStyle-HorizontalAlign="Left" ReadOnly="true" ItemStyle-HorizontalAlign="Left">
                                                        <HeaderStyle HorizontalAlign="Left" />
                                                        <ItemStyle HorizontalAlign="Left" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="Comment" HeaderText="Comment" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left">
                                                        <HeaderStyle HorizontalAlign="Left" />
                                                        <ItemStyle HorizontalAlign="Left" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="EnteredBy" HeaderText="Enter By" HeaderStyle-HorizontalAlign="center" ReadOnly="true" ItemStyle-HorizontalAlign="center">
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="NextADate" HeaderText="Next Action Date" HeaderStyle-HorizontalAlign="Left" ReadOnly="true" ItemStyle-HorizontalAlign="Left">
                                                        <HeaderStyle HorizontalAlign="Left" />
                                                        <ItemStyle HorizontalAlign="Left" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="ActionTime" HeaderText="Action Time" HeaderStyle-HorizontalAlign="center" ReadOnly="true" ItemStyle-HorizontalAlign="center">
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="Activity" HeaderText="Activity" HeaderStyle-HorizontalAlign="Left" ReadOnly="true" ItemStyle-HorizontalAlign="Left">
                                                        <HeaderStyle HorizontalAlign="Left" />
                                                        <ItemStyle HorizontalAlign="Left" />
                                                    </asp:BoundField>
                                                </Columns>
                                                <AlternatingRowStyle CssClass="GV-AlternatingRowStyle" />
                                                <EditRowStyle CssClass="GV-EditRow" />
                                                <FooterStyle BackColor="#CCCCCC" />
                                                <HeaderStyle CssClass="GV-HeaderStyleModal" BackColor="Black" Font-Bold="True" ForeColor="White" />
                                                <PagerStyle CssClass="GV-PagerStyle" BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                                                <RowStyle CssClass="GV-RowStyle" BackColor="White" />
                                                <SelectedRowStyle CssClass="GV-SelectedRowStyle" BackColor="#000099" Font-Bold="True" ForeColor="White" />
                                                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                                <SortedAscendingHeaderStyle BackColor="#808080" />
                                                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                                <SortedDescendingHeaderStyle BackColor="#383838" />
                                            </asp:GridView>

                                        </div>

                                    </div>

                                    <div class="md-overlay"></div>
                                    <!-- the overlay element -->
                                </div>
                            </td>

                        </tr>

                    </ItemTemplate>

                </asp:TemplateField>

            </Columns>
            <AlternatingRowStyle CssClass="GV-AlternatingRowStyle" BackColor="White" />
            <EditRowStyle CssClass="GV-EditRow" />
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle CssClass="GV-HeaderStyle" BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <PagerStyle CssClass="GV-PagerStyle" BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle CssClass="GV-RowStyle" BackColor="#FFFBD6" ForeColor="#333333" />
            <SelectedRowStyle CssClass="GV-SelectedRowStyle" BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <SortedAscendingCellStyle BackColor="#FDF5AC" />
            <SortedAscendingHeaderStyle BackColor="#4D0000" />
            <SortedDescendingCellStyle BackColor="#FCF6C0" />
            <SortedDescendingHeaderStyle BackColor="#820000" />
        </asp:GridView>
    </div>
    <script src="../modal/js/classie.js"></script>
    <script src="../modal/js/modalEffects.js"></script>
    <script>
        // this is important for IEs
        var polyfilter_scriptpath = 'modal/js/';
    </script>
    <script src="../modal/js/cssParser.js"></script>
    <script src="../modal/js/css-filters-polyfill.js"></script>
</asp:Content>


