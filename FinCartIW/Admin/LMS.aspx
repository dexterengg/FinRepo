<%@ Page Title="LMS Screen" Language="C#" MasterPageFile="~/Admin/AdminDashBoard.master" AutoEventWireup="true" EnableEventValidation="false" CodeFile="LMS.aspx.cs" Inherits="Admin_LMS" %>

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
        <h4>Search Investor</h4>
        <div class="searchItem">
            <%--<asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>  --%>
            <label>Search By</label>
            <asp:DropDownList ID="DDSearchList" runat="server" CssClass="inputfield" OnSelectedIndexChanged="DDSearchList_change" AutoPostBack="true" ValidationGroup="searchItem">
                <asp:ListItem Value="0">--Select Search Item--</asp:ListItem>
                <asp:ListItem Value="UN">User Name</asp:ListItem>
                <%--<asp:ListItem Value="PR">Profile</asp:ListItem>
                        <asp:ListItem Value="INV">Investments</asp:ListItem>
                        <asp:ListItem Value="DOC">Documents</asp:ListItem>
                        <asp:ListItem Value="PAY">Payments</asp:ListItem>
                        <asp:ListItem Value="PRD">Products</asp:ListItem>
                        <asp:ListItem Value="PLANR">Planners</asp:ListItem>
                        <asp:ListItem Value="LPSP">Leads per specific Planner</asp:ListItem>
                        <asp:ListItem Value="LPP">Leads per Planner</asp:ListItem>
                        <asp:ListItem Value="PP">Plans Prepared</asp:ListItem>
                        <asp:ListItem Value="PA">Plans Approved</asp:ListItem>
                        <asp:ListItem Value="RU">Registered Users</asp:ListItem>
                        <asp:ListItem Value="AC">Advisory Clients</asp:ListItem>
                        <asp:ListItem Value="NAC">Non-Advisory Clients</asp:ListItem>
                        <asp:ListItem Value="TA">Transacting Accounts</asp:ListItem>
                        <asp:ListItem Value="PAC">Paid Accounts</asp:ListItem>     --%>
            </asp:DropDownList>
            <asp:TextBox ID="txtSearchItem" runat="server" CssClass="inputfield" Width="100px" Visible="false" ValidationGroup="searchItem"></asp:TextBox>
            <asp:RadioButton ID="RadioButton1" GroupName="r1" runat="server" Visible="false" ValidationGroup="searchItem" />
            <asp:RadioButton ID="RadioButton2" GroupName="r1" runat="server" Visible="false" ValidationGroup="searchItem" />
            <asp:LinkButton ID="SearchSubmit" runat="server" CssClass="ButtonSmall" OnClick="SearchSubmit_Click" ValidationGroup="searchItem">Search</asp:LinkButton>&nbsp;&nbsp;
                    <asp:CheckBox ID="callbackRequest" Text="Callback Request" runat="server" />&nbsp;&nbsp;
                    <asp:CheckBox ID="customer" Text="Customer" runat="server" />&nbsp;&nbsp;
                    <asp:CheckBox ID="leads" Text="Leads" runat="server" />&nbsp;&nbsp;
                    <asp:DropDownList ID="DDLeadType" runat="server" CssClass="inputfield" ValidationGroup="searchItem">
                    </asp:DropDownList>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button id="btn_trash" Text="Move To Trash" runat="server" OnClick="btn_trash_Click" CssClass="MainButton" Style="padding:5px 20px;background-color:red;border-radius:24px;"  OnClientClick="return confirm('Are you sure you want to move these leads to trash?');" Enabled="false"/>

            <%-- </ContentTemplate>           
                </asp:UpdatePanel>--%>
        </div>
    </div>
    <%--<asp:UpdatePanel ID="FamilyDetailPanel" runat="server">
        <ContentTemplate>--%>
    <div class="GV-Area">
        <asp:GridView ID="GridViewLMS" runat="server" RowStyle-Wrap="false" HeaderStyle-Wrap="false" RowStyle-Height="23px"
            AutoGenerateColumns="False" OnRowDataBound="GridViewLMS_OnRowDataBound" DataKeyNames="PlannerCode"
            OnRowCreated="GridViewLMS_RowCreated" Width="100%" GridLines="None" AllowPaging="true"
            PageSize="10" OnPageIndexChanging="OnPaging">
            <Columns>
                <%--Cell No 0--%>
                <asp:TemplateField ItemStyle-Width="20px">

                    <ItemTemplate>
                        <asp:CheckBox ID="chkRow" runat="server"/>
                        <asp:HiddenField id="HF_DEL_LEAD" Value='<%# Eval("Code") %>' runat="server"/>
                        <a id="link1" href="JavaScript:divexpandcollapse('div<%# Eval("Code") %>');">

                            <img id='imgdiv<%# Eval("Code") %>' width="16" height="16" border="0" src="images/plus.gif"
                                alt="" /></a>


                    </ItemTemplate>

                    <ItemStyle Width="20px" VerticalAlign="Middle"></ItemStyle>

                </asp:TemplateField>
                <asp:TemplateField HeaderText="Code" Visible="false">
                    <ItemTemplate>
                        <asp:Label ID="lblcodeID" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Code") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:BoundField DataField="Code" Visible="false" />

                <asp:TemplateField HeaderText="" HeaderStyle-Width="100px" ItemStyle-HorizontalAlign="left">
                    <ItemTemplate>
                        <a href='LeadDetails.aspx?clientcode=<%# Eval("Code") %>' target="_blank">
                            <asp:Label ID="lblName" runat="server" Text='<%# Eval("Name")%>'></asp:Label></a>
                    </ItemTemplate>
                </asp:TemplateField>

                <%--<asp:BoundField DataField="Name" HeaderText="Name" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left"  >
                            <HeaderStyle HorizontalAlign="Left" />
                            <ItemStyle HorizontalAlign="Left" />
                            </asp:BoundField>--%>

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
                <asp:BoundField DataField="EntryDate" HeaderText="Entry Date" HeaderStyle-HorizontalAlign="center" ItemStyle-HorizontalAlign="center">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <%--Cell No 9--%>
                <asp:TemplateField HeaderText="Lead Type" HeaderStyle-HorizontalAlign="Left">
                    <ItemTemplate>
                        <asp:Label ID="lblLeadType" runat="server" Text='<%# Eval("LeadType") %>' Visible="false" />
                        <asp:DropDownList ID="ddLeadType" runat="server" CssClass="GV-Combo">
                        </asp:DropDownList>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Last Activity" HeaderStyle-Width="100px" ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <a href="#" id="link2" class="md-trigger" data-modal="Modal-Activity<%# Eval("Code") %>"><%#Eval("LastActivityDate") %></a>
                        <div class="md-modalBig md-effect-1" id='Modal-Activity<%# Eval("Code") %>'>
                            <div class="md-content">
                                <h3>Activity Monitor<span><a href="#" class="md-close" style="text-decoration: none;">X</a></span></h3>
                                <div>
                                    <iframe src="ActivityMonitoring.aspx?clientcode=<%# Eval("Code") %>&plannercode=<%# Eval("PlannerCode") %>" width="100%" height="400px" scrolling="auto" frameborder="0"></iframe>
                                </div>
                            </div>
                        </div>
                        <div class="md-overlay"></div>
                        <!-- the overlay element -->

                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Planner" HeaderStyle-HorizontalAlign="Left">
                    <ItemTemplate>
                        <asp:Label ID="lblIM" runat="server" Text='<%# Eval("PlannerCode") %>' Visible="false" />
                        <asp:DropDownList ID="ddlIM" runat="server" CssClass="GV-Combo">
                        </asp:DropDownList>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Operator" HeaderStyle-HorizontalAlign="Left">
                    <ItemTemplate>
                        <asp:Label ID="lblOperatorC" runat="server" Text='<%# Eval("OperatorCode") %>' Visible="false" />
                        <asp:DropDownList ID="ddOperatorCode" runat="server" CssClass="GV-Combo">
                        </asp:DropDownList>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="" HeaderStyle-Width="100px" ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <asp:Button ID="btnPlannerUpdate" runat="server" OnClick="OnUpdateClick" CssClass="GV-ButtonEdit" Text="Update" CommandArgument='<%#Eval("Code") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <%--Cell No 14--%>
                <asp:TemplateField HeaderText="" HeaderStyle-Width="100px" ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <asp:Button ID="btnAccept" runat="server" OnClick="OnAcceptClick" CssClass="GV-ButtonEdit" Text="Accept" CommandArgument='<%#Eval("Code") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <%--Cell No 15--%>
                <asp:TemplateField HeaderText="" HeaderStyle-Width="100px" ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <asp:Button ID="btnRelease" runat="server" OnClick="OnReleaseClick" CssClass="GV-ButtonDelete" Text="Release" CommandArgument='<%#Eval("Code") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <%--Cell No 16--%>
                <asp:TemplateField HeaderText="" ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <a href="#" id="link2" class="md-trigger" data-modal="Modal-LMSEdit<%# Eval("Code") %>">
                            <asp:Image ImageUrl="~/images/edit.png" runat="server" /></a>
                        <div class="md-modalBig md-effect-1" id='Modal-LMSEdit<%# Eval("Code") %>'>
                            <div class="md-content">
                                <h3>LMS Edit Zone<span><a href="#" class="md-close" style="text-decoration: none;">X</a></span></h3>
                                <div>
                                    <iframe src="LMSEdit.aspx?clientcode=<%# Eval("Code") %>" width="100%" height="350px" scrolling="no" frameborder="0"></iframe>
                                </div>
                            </div>
                        </div>
                        <div class="md-overlay"></div>
                        <!-- the overlay element -->

                    </ItemTemplate>
                </asp:TemplateField>
                <%--<asp:CommandField ShowDeleteButton="true" ButtonType="Image" DeleteImageUrl="~/images/delete.png" >
                                        
                            </asp:CommandField> --%>
                <asp:TemplateField>

                    <ItemTemplate>

                        <tr>

                            <td colspan="100%" style="background: #F5F5F5">

                                <div id='div<%# Eval("Code") %>' style="overflow: auto; display: none; position: relative; left: 15px; overflow: auto">

                                    <%--<asp:DetailsView id="DetailsView1" DataKeyNames="Code" Runat="server" Width="300px" Font-Names="Calibri"/>--%>

                                    <div class="md-modalBig md-effect-1" id="modal-1<%# Eval("Code") %>">
                                        <div class="md-content">
                                            <h3>Update Payment Details<span><a href="#" class="md-close" style="text-decoration: none;">X</a></span></h3>
                                            <div>
                                                <iframe src="LMSPayment.aspx?clientcode=<%# Eval("Code") %>&plannercode=<%# Eval("PlannerCode") %>" width="100%" height="400px" scrolling="auto" frameborder="0"></iframe>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="md-modalBig md-effect-1" id="Modal-Finametrica1<%# Eval("Code") %>">
                                        <div class="md-content">
                                            <h3>Finametrica Report<span><a href="#" class="md-close" style="text-decoration: none;">X</a></span></h3>
                                            <div>
                                                <iframe src="LMSFinametrica.aspx?clientcode=<%# Eval("Code") %>&plannercode=<%# Eval("PlannerCode") %>" width="100%" height="400px" scrolling="auto" frameborder="0"></iframe>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="md-modalBig md-effect-1" id="Modal-Documents1<%# Eval("Code") %>">
                                        <div class="md-content">
                                            <h3>Documents Upload<span><a href="#" class="md-close" style="text-decoration: none;">X</a></span></h3>
                                            <div>
                                                <iframe src="LMSDocument.aspx?clientcode=<%# Eval("Code") %>&plannercode=<%# Eval("PlannerCode") %>" width="100%" height="400px" scrolling="auto" frameborder="0"></iframe>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="md-modalBig md-effect-1" id="Modal-ReferPoint<%# Eval("Code") %>">
                                        <div class="md-content">
                                            <h3>Referal Points<span><a href="#" class="md-close" style="text-decoration: none;">X</a></span></h3>
                                            <div>
                                                <iframe src="LMSReferPoint.aspx?clientcode=<%# Eval("Code") %>&plannercode=<%# Eval("PlannerCode") %>" width="100%" height="400px" scrolling="auto" frameborder="0"></iframe>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="innerGrid">
                                        <div class="resultBody">

                                            <div class="TableHeader">
                                                <div class="col">Allocation Date</div>
                                                <div class="col">Source1</div>
                                                <div class="col">Source2</div>
                                                <div class="col">Site A/C</div>
                                                <div class="col">Txn A/C</div>
                                                <div class="col">Op Type1</div>
                                                <div class="col">Op Type2</div>
                                                <div class="col">Payments</div>
                                                <div class="col">Finametrica</div>
                                                <div class="col">Documents</div>
                                                <div class="col">Referral Pt</div>
                                                <div class="col">City</div>
                                                <div class="col">Remarks</div>
                                            </div>
                                            <div class="TableRow">
                                                <div class="col">
                                                    <asp:Label ID="lblAllocationDt" runat="server" Text='<%# Eval("AllocateDate") %>'></asp:Label></div>
                                                <div class="col">
                                                    <asp:Label ID="lblSource1" runat="server" Text='<%# Eval("Source1") %>'></asp:Label></div>
                                                <div class="col">
                                                    <asp:Label ID="lblSource2" runat="server" Text='<%# Eval("Source2") %>'></asp:Label></div>
                                                <div class="col">
                                                    <asp:Label ID="lblSiteAC" runat="server" Text='<%# Eval("SiteAC") %>'></asp:Label></div>
                                                <div class="col">
                                                    <asp:Label ID="lblTxnAC" runat="server" Text='<%# Eval("TxnAC") %>'></asp:Label></div>
                                                <div class="col">
                                                    <asp:Label ID="lblOpType1" runat="server" Text='<%# Eval("OpType1") %>'></asp:Label></div>
                                                <div class="col">
                                                    <asp:Label ID="lblOpType2" runat="server" Text='<%# Eval("OpType2") %>'></asp:Label></div>
                                                <div class="col"><a href="#" class="md-trigger md-trigger-style" data-modal="modal-1<%# Eval("Code") %>">
                                                    <asp:Label ID="lblPaymentEdit" runat="server" Text='Edit'></asp:Label></a></div>
                                                <div class="col"><a href="#" class="md-trigger md-trigger-style" data-modal="Modal-Finametrica1<%# Eval("Code") %>">
                                                    <asp:Label ID="lblFinametrica" runat="server" Text='Edit'></asp:Label></a></div>
                                                <div class="col"><a href="#" class="md-trigger md-trigger-style" data-modal="Modal-Documents1<%# Eval("Code") %>">
                                                    <asp:Label ID="lblDocuments" runat="server" Text='Edit'></asp:Label></a></div>
                                                <div class="col"><a href="#" class="md-trigger md-trigger-style" data-modal="Modal-ReferPoint<%# Eval("Code") %>">
                                                    <asp:Label ID="lblReferalPt" runat="server" Text='Edit'></asp:Label></a></div>
                                                <div class="col">
                                                    <asp:Label ID="lblSystemDate" runat="server" Text='<%# Eval("City") %>'></asp:Label></div>
                                                <div class="col">
                                                    <asp:Label ID="txtRemarks" runat="server" Text='<%# Eval("Remarks") %>'></asp:Label></div>
                                            </div>
                                        </div>

                                    </div>

                                    <div class="md-overlay"></div>
                                    <!-- the overlay element -->
                                </div>
                            </td>

                        </tr>

                    </ItemTemplate>

                </asp:TemplateField>
                <asp:BoundField DataField="PlannerLock" />
            </Columns>
            <AlternatingRowStyle CssClass="GV-AlternatingRowStyle" />
            <EditRowStyle CssClass="GV-EditRow" />
            <HeaderStyle CssClass="GV-HeaderStyle" />
            <PagerStyle CssClass="GV-PagerStyle" />
            <RowStyle CssClass="GV-RowStyle" />
            <SelectedRowStyle CssClass="GV-SelectedRowStyle" />
        </asp:GridView>
    </div>
    <%-- </ContentTemplate>           
</asp:UpdatePanel>--%>
    <br />
    <div><a href="AddLead.aspx" class="MainButton">Add Lead</a></div>
    <asp:Label id="lblmsg" runat="server" CssClass="MainButton" Style="padding:5px 20px;background-color:transparent;color:red;" ></asp:Label>

    <script src="../modal/js/classie.js"></script>
    <script src="../modal/js/modalEffects.js"></script>
    <script>
        // this is important for IEs
        var polyfilter_scriptpath = 'modal/js/';
    </script>
    <script src="../modal/js/cssParser.js"></script>
    <script src="../modal/js/css-filters-polyfill.js"></script>
</asp:Content>

