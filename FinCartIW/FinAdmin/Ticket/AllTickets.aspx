<%@ Page Title="" Language="C#" MasterPageFile="~/FinAdmin/MasterPage.master" AutoEventWireup="true" CodeFile="AllTickets.aspx.cs" Inherits="FinAdmin_Ticket_AllTickets" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentPlaceHolder" runat="Server">
    <title>Fincart Workcenter | All Tickets</title>
    <!-- JQuery DataTable Css -->
    <link href="/FinAdmin/plugins/jquery-datatable/skin/bootstrap/css/dataTables.bootstrap.css" rel="stylesheet" />
    <!-- Light Gallery Plugin Css -->
    <link href="/FinAdmin/plugins/light-gallery/css/lightgallery.css" rel="stylesheet" />
    <!--WaitMe Css-->
    <link href="/FinAdmin/plugins/waitme/waitMe.css" rel="stylesheet" />
    <!-- JQuery Counter Css -->
    <link href="/FinAdmin/plugins/countdown/countdown.css" rel="stylesheet" />
    <!-- Bootstrap Select Css -->
    <link href="/FinAdmin/plugins/bootstrap-select/css/bootstrap-select.css" rel="stylesheet" />
    <!-- Bootstrap Datetime Picker Css -->
    <link href="/FinAdmin/plugins/bootstrap-material-datetimepicker/css/bootstrap-datepicker.css" rel="stylesheet" />
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
    <!-- Jquery counter Plugin Js -->
    <script src="/FinAdmin/plugins/countdown/countdown.js"></script>
    <!-- Light Gallery Plugin Js -->
    <script src="/FinAdmin/plugins/light-gallery/js/lightgallery-all.js"></script>
    <!-- Wait Me Plugin Js -->
    <script src="/FinAdmin/plugins/waitme/waitMe.js"></script>
    <!-- Moment Plugin Js -->
    <script src="/FinAdmin/plugins/momentjs/moment.js"></script>
    <!-- Bootstrap Datetime Picker Plugin Js -->
    <script src="/FinAdmin/plugins/bootstrap-material-datetimepicker/js/bootstrap-datetimepicker.js"></script>

    <link href="Ticket.css" rel="stylesheet" />
    <script src="Ticket.js"></script>

    <script>
        $(document).ready(function () {
            $('#mainmenu li.active').removeClass('active');
            $('#liTickets').addClass('active');
            $('#liTickets').children(":first").addClass("menu-toggle waves-effect waves-block toggled");
            $('#liTickets').children(":nth-child(2)").css("display", "block");
            $('#liAllTicket').addClass('active');
            $('#liAllTicket').children(":first").addClass("toggled waves-effect waves-block");
            $('#datetimepicker').datetimepicker();
            // 220880
        });

        function txtchange(val) {
            if (val === "Q") {
                querychange($('#txtquery'));
            }
            else if (val === "S") {
                subchange($('#txtSubject'))
            }
            else {
                tatchange($('#txtTat'))
            }
        }

        function fileattachmentchange() {
            imageuploadchange($('#<%=fileattachment.ClientID%>'));
        }

        function removeimagefile() {
            removefile($('#<%=fileattachment.ClientID%>'));
        }

        function alterticket() {
            updateticket($('#hfid'), $('#txtSubject'), $('#txtTat'), $('#txtquery'), $('#ddlStatus'), $('#ddlPriority'), $('#<%=fileattachment.ClientID%>'), $('#hfsrc'), $('#hftat'));
        }
    </script>
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
                                <div class="table-responsive">
                                    <table class="table table-bordered table-striped table-hover dataTable js-exportable">
                                        <thead>
                                            <tr>
                                                <th>Ticket ID</th>
                                                <th>Subject</th>
                                                <th>Attachment</th>
                                                <th>Department</th>
                                                <th>Designation</th>
                                                <th>Creator</th>
                                                <th>Assignee</th>
                                                <th>Status</th>
                                                <%-- <th>Priority</th>--%>
                                                <th>TAT</th>
                                            </tr>
                                        </thead>
                                        <asp:Repeater ID="ReportTicketsRepeater" runat="server">
                                            <ItemTemplate>
                                                <tr>
                                                    <td><a onclick="viewTicket('<%#Eval("TicketId") %>','<%#Eval("CreatorEmail") %>','V')" href="javascript:void(0);"><%#Eval("TicketId") %></a></td>
                                                    <%--<td><%#Eval("Query").ToString().Length<10?Eval("Query").ToString():Eval("Query").ToString().Substring(0,10)+" ...." %></td>--%>
                                                    <td><%#Eval("Subject") %></td>
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
                                                                <li><a href="javascript:void(0);" onclick="viewTicket('<%#Eval("TicketId") %>','<%#Eval("CreatorEmail") %>','U')">Update</a></li>
                                                                <li><a href="javascript:void(0);" onclick="delconfrim('<%#Eval("TicketId") %>')">Delete</a></li>
                                                            </ul>
                                                        </div>
                                                    </td>
                                                    <%--<td><%#Convert.ToInt32(Eval("Priority"))<1?"<button class='btn bg-pink btn-circle waves-effect waves-circle waves-float' type='button'><i class='material-icons'>H</i></button>":Convert.ToInt32(Eval("Priority"))>1?"<button class='btn bg-green btn-circle waves-effect waves-circle waves-float' type='button'><i class='material-icons'>L</i></button>":"<button class='btn bg-orange btn-circle waves-effect waves-circle waves-float' type='button'><i class='material-icons'>M</i></button>" %></td>--%>
                                                    <td>
                                                        <div style="visibility: hidden"><%#Eval("UpdateDate") %></div>
                                                        <div id="clock<%#Eval("TicketId") %>"></div>
                                                        <div id="message<%#Eval("TicketId") %>" class="badge bg-red"></div>
                                                        <script>
                                                            $(document).ready(function () {
                                                                bindTat('#clock<%#Eval("TicketId") %>', '#message<%#Eval("TicketId") %>', "<%#Eval("Tat") %>");
                                                            });
                                                        </script>
                                                    </td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </table>
                                </div>
                            </div>

                            <div id="tableAssign" runat="server">
                                <div class="table-responsive">
                                    <table class="table table-bordered table-striped table-hover dataTable js-exportable">
                                        <thead>
                                            <tr>
                                                <th>Ticket ID</th>
                                                <th>Subject</th>
                                                <th>Attachment</th>
                                                <th>Department</th>
                                                <th>Designation</th>
                                                <th>Creator</th>
                                                <th>Assignee</th>
                                                <th>Status</th>
                                                <%--<th>Priority</th>--%>
                                                <th>TAT</th>
                                            </tr>
                                        </thead>
                                        <asp:Repeater ID="AssignTicketsRepeater" runat="server">
                                            <ItemTemplate>
                                                <tr>
                                                    <td><a onclick="viewTicket('<%#Eval("TicketId") %>','<%#Eval("CreatorEmail") %>','V')" href="javascript:void(0);"><%#Eval("TicketId") %></a></td>
                                                    <td><%#Eval("Subject") %></td>
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
                                                    <td><%#Eval("Status").ToString()=="0"?"<button class='btn bg-green waves-effect' type='button' disabled='disabled'>OPEN</button>":"<button class='btn bg-red waves-effect' type='button' disabled='disabled'>Closed</button>" %></td>
                                                    <%--<td><%#Convert.ToInt32(Eval("Priority"))<1?"<button class='btn bg-pink btn-circle waves-effect waves-circle waves-float' type='button'><i class='material-icons'>H</i></button>":Convert.ToInt32(Eval("Priority"))>1?"<button class='btn bg-green btn-circle waves-effect waves-circle waves-float' type='button'><i class='material-icons'>L</i></button>":"<button class='btn bg-orange btn-circle waves-effect waves-circle waves-float' type='button'><i class='material-icons'>M</i></button>" %></td>--%>
                                                    <td>
                                                        <div style="visibility: hidden"><%#Eval("UpdateDate") %></div>
                                                        <div id="clock<%#Eval("TicketId") %>"></div>
                                                        <div id="message<%#Eval("TicketId") %>" class="badge bg-red"></div>
                                                        <script>
                                                            $(document).ready(function () {
                                                                bindTat('#clock<%#Eval("TicketId") %>', '#message<%#Eval("TicketId") %>', "<%#Eval("Tat") %>");
                                                            });
                                                        </script>
                                                    </td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </table>
                                </div>
                            </div>

                        </div>
                        <!-- #END# Exportable Table -->
                    </div>
                </div>
            </div>
            <!-- #END# Striped Rows -->
        </div>
    </section>

    <!-- Modal View-->
    <div class="modal fade" id="viewTicketPanel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card" id="vcardLoader">
                        <div class="header bg-light-blue">
                            <h2>
                                <span class="pull-right">
                                    <span class='badge bg-red waves-effect' id="phigh">High Priority</span>
                                    <span class='badge bg-orange waves-effect' id="pmoderate">Moderate Priority</span>
                                    <span class='badge bg-green waves-effect' id="plow">Low Priority</span>
                                    <%--Status - <span class='badge bg-green waves-effect'  id="statusopen">Open</span>
                                    <span class='badge bg-red waves-effect' id="statusclose">Close</span>--%>
                                </span>
                                Ticket ID - <span id="lbltickedid"></span><small>Last Updated: <span id="lbllastupdated"></span></small>
                            </h2>
                        </div>
                        <div class="body">

                            <div class="row clearfix">
                                <div class="col-md-4">
                                    <p>
                                        <b>Department: </b><span id="lblDepartment"></span>
                                    </p>
                                </div>
                                <div class="col-md-4">
                                    <p>
                                        <b>Creator: </b><span id="lblCreatedby"></span>
                                    </p>
                                </div>
                                <div class="col-md-4">
                                    <p>
                                        <b>Assignee: </b><span id="lblAssignTo"></span>
                                    </p>
                                </div>
                            </div>

                            <div class="row clearfix">
                                <div class="col-md-12">
                                    <p>
                                        <b>Subject: </b>
                                    </p>
                                    <span id="lblSubject"></span>
                                </div>
                            </div>

                            <div class="row clearfix">
                                <div class="col-md-12">
                                    <p>
                                        <b>Query: </b>
                                    </p>
                                    <span id="lblquery"></span>
                                </div>
                            </div>

                            <div class="row clearfix">
                                <div class="col-md-12">
                                    <p>
                                        <b>Attachment: </b>
                                    </p>
                                    <img class="img-responsive" id="imgattachment" style="max-width: 80%;" />
                                </div>
                            </div>

                            <%--<div class="row clearfix">
                                <div class="col-md-12">
                                    <p>
                                        <b>TAT: </b>
                                    </p>
                                    <div id="modaltatclock"></div>
                                    <div id="modaltatmessage"></div>
                                </div>
                            </div>--%>
                        </div>
                        <div class="header">
                            <a href="javascript:void(0)" onclick="closeTicketPanel('V')" class="btn btn-warning pull-right">ok</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal Update-->
    <div class="modal fade" id="updateTicketPanel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card" id="ucardLoader">
                        <div class="header bg-light-green">
                            <div class="switch pull-right">
                                        <label>No<input type="checkbox" id="istat"><span class="lever switch-col-deep-orange"></span>Yes</label>
                                <br />
                                <small>Wanna Change TAT??</small>
                                    </div>
                            <h2>Ticket ID - <span id="ulbltickedid"></span><small>Last Updated: <span id="ulbllastupdated"></span></small></h2>
                        </div>
                        <div class="body">

                            <div class="row clearfix">
                                <div class="col-sm-6">
                                    <p>
                                        <b>Subject <span id="rqSubject" class="badge bg-red"></span></b>
                                    </p>
                                    <div class="form-group">
                                        <div class="form-line">
                                            <textarea rows="1" class="form-control no-resize" placeholder="Enter Subject...." id="txtSubject" onchange="txtchange('S')"></textarea>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <p>
                                        <b>TAT <span id="rqTAT" class="badge bg-red"></span></b>
                                    </p>
                                    <div class="form-group">
                                        <div class="form-line">
                                            <div class='input-group date' id='datetimepicker'>
                                                <input type="text" class="datetimepicker form-control" placeholder="Please choose date & time..." id="txtTat" onblur="txtchange('T')" />
                                                <span class="input-group-addon">
                                                    <span class="glyphicon glyphicon-calendar"></span>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row clearfix">
                                <div class="col-md-12">
                                    <p>
                                        <b>Query <span id="rqtxtquery" class="badge bg-red"></span></b>
                                    </p>
                                    <div class="form-group">
                                        <div class="form-line">
                                            <textarea id="txtquery" rows="1" class="form-control no-resize" placeholder="Type Your Query......" onchange="txtchange('Q')"></textarea>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row clearfix">
                                <div class="col-md-6">
                                    <p>
                                        <b>Status</b>
                                    </p>
                                    <select id="ddlStatus" class="form-control show-tick">
                                        <option value="0">Open</option>
                                        <option value="1">Close</option>
                                    </select>
                                </div>
                                <div class="col-md-6">
                                    <p>
                                        <b>Priority</b>
                                    </p>
                                    <select id="ddlPriority" class="form-control show-tick">
                                        <option value="0">High</option>
                                        <option value="1">Moderate</option>
                                        <option value="2">Low</option>
                                    </select>

                                </div>
                            </div>

                            <div class="row clearfix">
                                <div class="col-md-12">
                                    <p>
                                        <b>Attachment (Optional) <span id="rqfileattachment" class="badge bg-red"></span></b>
                                    </p>
                                    <asp:FileUpload ID="fileattachment" runat="server" CssClass="form-control" onchange="fileattachmentchange()" />
                                </div>
                            </div>

                            <div class="row clearfix">
                                <input type="hidden" id="hfid" />
                                <input type="hidden" id="hfsrc" />
                                <input type="hidden" id="hftat" />
                                <img class="img-responsive" id="uimgattachment" style="max-width: 30%;" />
                                <div class="col-md-12" style="text-align: right">
                                    <a href="javascript:void(0);" class="btn btn-danger" onclick="closeTicketPanel('U');">Cancel</a>
                                    <a href="javascript:void(0);" class="btn btn-success" onclick="alterticket();">Submit</a>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

      <!-- Modal Delete-->
    <div class="modal fade" id="deleteTicketPanel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card" id="dcardLoader">
                        <div class="header bg-light-red">
                            <h2>Are you sure to remove this Ticket??</h2>
                        </div>
                        <div class="body">
                            <div class="row clearfix">
                                <div class="col-md-12" style="text-align: right">
                                    <input type="hidden" id="hftid"/>
                                    <a href="javascript:void(0);" class="btn btn-danger" onclick="closeTicketPanel('D');">No</a>
                                    <a href="javascript:void(0);" class="btn btn-success" onclick="deleteTicket();">Yes</a>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

