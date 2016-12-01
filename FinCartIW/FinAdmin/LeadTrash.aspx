<%@ Page Title="" Language="C#" MasterPageFile="~/FinAdmin/MasterPage.master" AutoEventWireup="true" CodeFile="LeadTrash.aspx.cs" Inherits="FinAdmin_LeadTrash" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajxct" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentPlaceHolder" runat="server">

    <!-- JQuery DataTable Css -->
    <link href="plugins/jquery-datatable/skin/bootstrap/css/dataTables.bootstrap.css" rel="stylesheet">

    <!-- Jquery DataTable Plugin Js -->
    <script src="plugins/jquery-datatable/jquery.dataTables.js"></script>
    <script src="plugins/jquery-datatable/skin/bootstrap/js/dataTables.bootstrap.js"></script>
    <script src="plugins/jquery-datatable/extensions/export/dataTables.buttons.min.js"></script>
    <script src="plugins/jquery-datatable/extensions/export/buttons.flash.min.js"></script>
    <script src="plugins/jquery-datatable/extensions/export/jszip.min.js"></script>
    <script src="plugins/jquery-datatable/extensions/export/pdfmake.min.js"></script>
    <script src="plugins/jquery-datatable/extensions/export/vfs_fonts.js"></script>
    <script src="plugins/jquery-datatable/extensions/export/buttons.html5.min.js"></script>
    <script src="plugins/jquery-datatable/extensions/export/buttons.print.min.js"></script>

    <script src="js/pages/tables/jquery-datatable.js"></script>

    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <!-- JQuery DataTable Css -->
    

        <section class="content">
        <div class="container-fluid">

              <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="searchArea">
        <h4>Select Lead For Permanent delete</h4>
        <div class="searchItem">
            <label>Enter Pin</label>
                        <asp:TextBox ID="txtpin" runat="server" CssClass="inputfield" Width="100px"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <asp:Button id="btn_trash" Text="Delete" runat="server" OnClick="btn_trash_Click" CssClass="MainButton" Style="padding:5px 20px;background-color:red;border-radius:24px;"  OnClientClick="return confirm('Are you sure you want to Remove Lead Permanently?');"/>
        </div>
    </div>
   

     <!-- Basic Examples -->
            <div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header">
                            <h2>
                               Trash 
                            </h2>
                            <ul class="header-dropdown m-r--5">
                                <li class="dropdown">
                                    <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                                        <i class="material-icons">more_vert</i>
                                    </a>
                                    <ul class="dropdown-menu pull-right">
                                        <li><a href="javascript:void(0);">Action</a></li>
                                        <li><a href="javascript:void(0);">Another action</a></li>
                                        <li><a href="javascript:void(0);">Something else here</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                        <div class="body">

                             
        <asp:GridView ID="GridViewLMS" runat="server" RowStyle-Wrap="false" HeaderStyle-Wrap="false" RowStyle-Height="23px"
            AutoGenerateColumns="False" OnRowDataBound="GridViewLMS_OnRowDataBound" DataKeyNames="PlannerCode"
            OnRowCreated="GridViewLMS_RowCreated" Width="100%" GridLines="None" AllowPaging="true"
            PageSize="10" OnPageIndexChanging="OnPaging" CssClass="table table-bordered table-striped table-hover js-basic-example dataTable">
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

                <asp:BoundField DataField="Gender" HeaderText="M/F" HeaderStyle-HorizontalAlign="Left" ReadOnly="true" ItemStyle-HorizontalAlign="Left" Visible="false">
                    <HeaderStyle HorizontalAlign="Left" />
                    <ItemStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="Age" HeaderText="Age" HeaderStyle-HorizontalAlign="center" ReadOnly="true" ItemStyle-HorizontalAlign="center" Visible="false">
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
                        <asp:DropDownList ID="ddLeadType" runat="server" class="selectpicker">
                        </asp:DropDownList>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Last Activity" HeaderStyle-Width="100px" ItemStyle-HorizontalAlign="Center"  Visible="false">
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
                        

                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Planner" HeaderStyle-HorizontalAlign="Left">
                    <ItemTemplate>
                        <asp:Label ID="lblIM" runat="server" Text='<%# Eval("PlannerCode") %>' Visible="false" />
                        <asp:DropDownList ID="ddlIM" runat="server" CssClass="GV-Combo">
                        </asp:DropDownList>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Operator" HeaderStyle-HorizontalAlign="Left"  Visible="false">
                    <ItemTemplate>
                        <asp:Label ID="lblOperatorC" runat="server" Text='<%# Eval("OperatorCode") %>' Visible="false" />
                        <asp:DropDownList ID="ddOperatorCode" runat="server" CssClass="GV-Combo">
                        </asp:DropDownList>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="" HeaderStyle-Width="100px" ItemStyle-HorizontalAlign="Center"  Visible="false">
                    <ItemTemplate>
                        <asp:Button ID="btnPlannerUpdate" runat="server" OnClick="OnUpdateClick" CssClass="GV-ButtonEdit" Text="Update" CommandArgument='<%#Eval("Code") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <%--Cell No 14--%>
                <asp:TemplateField HeaderText="" HeaderStyle-Width="100px" ItemStyle-HorizontalAlign="Center"  Visible="false">
                    <ItemTemplate>
                        <asp:Button ID="btnAccept" runat="server" OnClick="OnAcceptClick" CssClass="GV-ButtonEdit" Text="Accept" CommandArgument='<%#Eval("Code") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <%--Cell No 15--%>
                <asp:TemplateField HeaderText="" HeaderStyle-Width="100px" ItemStyle-HorizontalAlign="Center"  Visible="false">
                    <ItemTemplate>
                        <asp:Button ID="btnRelease" runat="server" OnClick="OnReleaseClick" CssClass="GV-ButtonDelete" Text="Release" CommandArgument='<%#Eval("Code") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <%--Cell No 16--%>
                <asp:TemplateField HeaderText="" ItemStyle-HorizontalAlign="Center"  Visible="false">
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

                        <%--<tr>

                            <td colspan="100%" style="background: #F5F5F5">

                                <div id='div<%# Eval("Code") %>' style="overflow: auto; display: none; position: relative; left: 15px; overflow: auto">

                                  

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
                                   
                                </div>
                            </td>

                        </tr>--%>

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
    

    <br />
    <asp:Label id="lblmsg" runat="server" CssClass="MainButton" Style="padding:5px 20px;background-color:transparent;color:red;" ></asp:Label>

                        </div>
                    </div>
                </div>
            </div>

  

</div>
            </section>

  
</asp:Content>

