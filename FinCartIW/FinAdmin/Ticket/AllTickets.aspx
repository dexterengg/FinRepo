<%@ Page Title="" Language="C#" MasterPageFile="~/FinAdmin/MasterPage.master" AutoEventWireup="true" CodeFile="AllTickets.aspx.cs" Inherits="FinAdmin_Ticket_AllTickets" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentPlaceHolder" runat="Server">
    <title>Fincart Workcenter | All Tickets</title>
    <!-- JQuery DataTable Css -->
    <link href="/FinAdmin/plugins/jquery-datatable/skin/bootstrap/css/dataTables.bootstrap.css" rel="stylesheet" />
    <!-- Light Gallery Plugin Css -->
    <link href="/FinAdmin/plugins/light-gallery/css/lightgallery.css" rel="stylesheet" />
    <!-- Jquery DataTable Plugin Js -->
    <script src="/FinAdmin/plugins/jquery-datatable/jquery.dataTables.js"></script>
    <script src="/FinAdmin/plugins/jquery-datatable/skin/bootstrap/js/dataTables.bootstrap.js"></script>
    <script src="/FinAdmin/plugins/jquery-datatable/extensions/export/dataTables.buttons.min.js"></script>
    <script src="/FinAdmin/plugins/jquery-datatable/extensions/export/buttons.flash.min.js"></script>
    <script src="/FinAdmin/plugins/jquery-datatable/extensions/export/jszip.min.js"></script>
    <script src="/FinAdmin/plugins/jquery-datatable/extensions/export/pdfmake.min.js"></script>
    <script src="/FinAdmin/plugins/jquery-datatable/extensions/export/vfs_fonts.js"></script>
    <script src="/FinAdmin/plugins/jquery-datatable/extensions/export/buttons.html5.min.js"></script>
    <script src="/FinAdmin/plugins/jquery-datatable/extensions/export/buttons.print.min.js"></script>
    <script src="/FinAdmin/js/pages/tables/jquery-datatable.js"></script>
    <!-- Light Gallery Plugin Js -->
    <script src="/FinAdmin/plugins/light-gallery/js/lightgallery-all.js"></script>
    <script src="Ticket.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <section class="content">
        <div class="container-fluid">
            <div class="block-header">
            </div>
            <!-- Striped Rows -->
            <div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header">
                            <h2>
                                <asp:Label ID="lbltickets" runat="server"></asp:Label>
                            </h2>
                            <ul class="header-dropdown m-r--5">
                                <li class="dropdown">
                                    <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                                        <i class="material-icons">more_vert</i>
                                    </a>
                                    <ul class="dropdown-menu pull-right">
                                        <li>
                                            <asp:LinkButton ID="ALinkButton" runat="server" OnClick="ALinkButton_Click">Tickets Assign To Me</asp:LinkButton>
                                        </li>
                                        <li>
                                            <asp:LinkButton ID="RLinkButton" runat="server" OnClick="RLinkButton_Click">Tickets Report To Me</asp:LinkButton>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                        <!-- Exportable Table -->
                        <div class="body">
                            <div id="tableReport" runat="server">
                            <table class="table table-bordered table-striped table-hover dataTable js-exportable">
                                <thead>
                                    <tr>
                                        <th>Ticket ID</th>
                                        <th>Query</th>
                                        <th>Attachment</th>
                                        <th>Department</th>
                                        <th>Designation</th>
                                        <th>Creator</th>
                                        <th>Assignee</th>
                                        <th>Status</th>
                                        <th>Priority</th>
                                        <th>Last Updated</th>
                                    </tr>
                                </thead>
                                <asp:Repeater ID="ReportTicketsRepeater" runat="server" OnItemCommand="TicketsRepeater_ItemCommand">
                                    <ItemTemplate>
                                        <tr>
                                            <td><%#Eval("TicketId") %></td>
                                            <td><%#Eval("Query").ToString().Length<10?Eval("Query").ToString():Eval("Query").ToString().Substring(0,10)+" ...." %></td>
                                            <td>
                                                <div class="aniimated-thumbnials list-unstyled row clearfix">
                                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                        <a href="<%#Eval("Attachment") %>" data-sub-html="<%#Eval("Attachment").ToString().Substring(Eval("Attachment").ToString().IndexOf('_') + 1).Replace("_"," ") %>">
                                                            <img class="img-responsive thumbnail" src="<%#Eval("Attachment") %>" style="max-width: 40px;">
                                                        </a>
                                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                                    </div>
                                                </div>
                                            </td>
                                            <td><%#Eval("DepName") %></td>
                                            <td><%#Eval("Role") %></td>
                                            <td><%#Eval("CreatorName") %></td>
                                            <td><%#Eval("AssignToName") %></td>
                                            <td>
                                                <div class="btn-group">
                                                    <%#Eval("Status").ToString()=="0"?"<button class='btn bg-green waves-effect' type='button' disabled='disabled'>OPEN</button>":"<button class='btn bg-red waves-effect' type='button' disabled='disabled'>Closed</button>" %>
                                                </div>
                                                <div class="btn-group">
                                                    <br />
                                                    <br />
                                                </div>
                                                <div class="btn-group">
                                                    <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                        Action <span class="caret"></span>
                                                    </button>
                                                    <ul class="dropdown-menu">
                                                        <li><a href="javascript:void(0);">View</a></li>
                                                        <li><a href="javascript:void(0);">Update</a></li>
                                                        <li>
                                                            <asp:LinkButton ID="LinkButtonDelete" runat="server" CommandName="D" CommandArgument='<%#Eval("TicketId") %>' OnClientClick="delcofirm()">Delete</asp:LinkButton></li>
                                                    </ul>
                                                </div>
                                            </td>
                                            <td><%#Convert.ToInt32(Eval("Priority"))<1?"<button class='btn bg-pink btn-circle waves-effect waves-circle waves-float' type='button'><i class='material-icons'>H</i></button>":Convert.ToInt32(Eval("Priority"))>1?"<button class='btn bg-green btn-circle waves-effect waves-circle waves-float' type='button'><i class='material-icons'>L</i></button>":"<button class='btn bg-orange btn-circle waves-effect waves-circle waves-float' type='button'><i class='material-icons'>M</i></button>" %></td>
                                            <td><%#Eval("UpdateDate") %></td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </table>
                                </div>
                            <div id="tableAssign" runat="server">
                            <table class="table table-bordered table-striped table-hover dataTable js-exportable">
                                <thead>
                                    <tr>
                                        <th>Ticket ID</th>
                                        <th>Query</th>
                                        <th>Attachment</th>
                                        <th>Department</th>
                                        <th>Designation</th>
                                        <th>Creator</th>
                                        <th>Assignee</th>
                                        <th>Status</th>
                                        <th>Priority</th>
                                        <th>Last Updated</th>
                                    </tr>
                                </thead>
                                <asp:Repeater ID="AssignTicketsRepeater" runat="server">
                                    <ItemTemplate>
                                        <tr>
                                            <td><%#Eval("TicketId") %></td>
                                            <td><%#Eval("Query").ToString().Length<10?Eval("Query").ToString():Eval("Query").ToString().Substring(0,10)+" ...." %></td>
                                            <td>
                                                <div class="aniimated-thumbnials list-unstyled row clearfix">
                                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                        <a href="<%#Eval("Attachment") %>" data-sub-html="<%#Eval("Attachment").ToString().Substring(Eval("Attachment").ToString().IndexOf('_') + 1).Replace("_"," ") %>">
                                                            <img class="img-responsive thumbnail" src="<%#Eval("Attachment") %>" style="max-width: 40px;">
                                                        </a>
                                                    </div>
                                                </div>
                                            </td>
                                            <td><%#Eval("DepName") %></td>
                                            <td><%#Eval("Role") %></td>
                                            <td><%#Eval("CreatorName") %></td>
                                            <td><%#Eval("AssignToName") %></td>
                                            <td>
                                                <%#Eval("Status").ToString()=="0"?"<button class='btn bg-green waves-effect' type='button' disabled='disabled'>OPEN</button>":"<button class='btn bg-red waves-effect' type='button' disabled='disabled'>Closed</button>" %>
                                            </td>
                                            <td><%#Convert.ToInt32(Eval("Priority"))<1?"<button class='btn bg-pink btn-circle waves-effect waves-circle waves-float' type='button'><i class='material-icons'>H</i></button>":Convert.ToInt32(Eval("Priority"))>1?"<button class='btn bg-green btn-circle waves-effect waves-circle waves-float' type='button'><i class='material-icons'>L</i></button>":"<button class='btn bg-orange btn-circle waves-effect waves-circle waves-float' type='button'><i class='material-icons'>M</i></button>" %></td>
                                            <td><%#Eval("UpdateDate") %></td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </table>
                                </div>
                        </div>
                        <!-- #END# Exportable Table -->
                    </div>
                </div>
            </div>
            <!-- #END# Striped Rows -->
        </div>
    </section>
</asp:Content>

