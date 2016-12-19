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
    <script src="Ticket.js"></script>
    <style>
        .flip-clock-wrapper ul {
            width: 20px;
            height: 30px;
            margin: 0 2px;
            padding: 0px;
            background-color: aqua;
        }

            .flip-clock-wrapper ul li {
                line-height: 30px;
            }

                .flip-clock-wrapper ul li a div div.inn {
                    font-size: 20px;
                }

                .flip-clock-wrapper ul, .flip-clock-wrapper ul li a div div.inn {
                    border-radius: 4px;
                }

                    .flip-clock-wrapper ul li a div.down {
                        border-bottom-left-radius: 4px;
                        border-bottom-right-radius: 4px;
                    }

                    .flip-clock-wrapper ul li a div.up:after {
                        top: 23px;
                    }

        .flip-clock-dot.top {
            top: 8px;
        }

        .flip-clock-dot.bottom {
            top: 15px;
        }

        .flip-clock-dot {
            width: 4px;
            height: 5px;
            left: 2px;
        }

        .flip-clock-divider {
            width: 8px;
            padding: 0px;
            margin: 0 auto;
        }

        .flip-clock-wrapper ul li a div {
            width: 100%;
        }


        .flip-clock-divider .flip-clock-label {
            right: -40px;
        }

        .flip-clock-divider.minutes .flip-clock-label {
            right: -45px;
        }

        .flip-clock-divider.seconds .flip-clock-label {
            right: -45px;
        }
    </style>
    <script>
        $(document).ready(function () {
            $('#mainmenu li.active').removeClass('active');
            $('#liTickets').addClass('active');
            $('#liTickets').children(":first").addClass("menu-toggle waves-effect waves-block toggled");
            $('#liTickets').children(":nth-child(2)").css("display", "block");
            $('#liAllTicket').addClass('active');
            $('#liAllTicket').children(":first").addClass("toggled waves-effect waves-block");
            // 220880
        });

        function settime(clockid, msgid) {
            var clock;
            clock = $('#' + clockid).FlipClock({
                clockFace: 'HourlyCounter',
                autoStart: false,
                callbacks: {
                    stop: function () {
                        $('#' + msgid).html('Time Over!')
                        $('#' + clockid).css("display", "none");
                    }
                }
            });

            clock.setTime(10);
            clock.setCountdown(true);
            clock.start();
            // 220880
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
                                                                <li><a href="javascript:void(0);" onclick="viewTicket('<%#Eval("TicketId") %>','<%#Eval("CreatorEmail") %>')">View</a></li>
                                                                <li><a href="javascript:void(0);">Update</a></li>
                                                                <li>
                                                                    <asp:LinkButton ID="LinkButtonDelete" runat="server" CommandName="D" CommandArgument='<%#Eval("TicketId") %>' OnClientClick="delcofirm()">Delete</asp:LinkButton></li>
                                                            </ul>
                                                        </div>
                                                    </td>
                                                    <%--<td><%#Convert.ToInt32(Eval("Priority"))<1?"<button class='btn bg-pink btn-circle waves-effect waves-circle waves-float' type='button'><i class='material-icons'>H</i></button>":Convert.ToInt32(Eval("Priority"))>1?"<button class='btn bg-green btn-circle waves-effect waves-circle waves-float' type='button'><i class='material-icons'>L</i></button>":"<button class='btn bg-orange btn-circle waves-effect waves-circle waves-float' type='button'><i class='material-icons'>M</i></button>" %></td>
                                                    <td><%#Eval("UpdateDate") %></td>--%>
                                                    <td>
                                                        <div id="clock<%#Eval("TicketId") %>"></div>
                                                        <div id="message<%#Eval("TicketId") %>"></div>

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
                                                        <a href="javascript:void(0);" onclick="viewTicket('<%#Eval("TicketId") %>','<%#Eval("CreatorEmail") %>')">
                                                            <div class="demo-google-material-icon">
                                                                <i class="material-icons">pageview</i>
                                                            </div>
                                                        </a>
                                                    </td>
                                                    <td><%#Convert.ToInt32(Eval("Priority"))<1?"<button class='btn bg-pink btn-circle waves-effect waves-circle waves-float' type='button'><i class='material-icons'>H</i></button>":Convert.ToInt32(Eval("Priority"))>1?"<button class='btn bg-green btn-circle waves-effect waves-circle waves-float' type='button'><i class='material-icons'>L</i></button>":"<button class='btn bg-orange btn-circle waves-effect waves-circle waves-float' type='button'><i class='material-icons'>M</i></button>" %></td>
                                                    <td><%#Eval("UpdateDate") %></td>
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

    <!-- Modal -->
    <div class="modal fade" id="viewTicketPanel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card" id="cardLoader">
                        <div class="header bg-light-blue">
                            <h2>
                                <%--<span class="pull-right">
                                    Status - <span class='badge bg-green waves-effect'  id="statusopen">Open</span>
                                    <span class='badge bg-red waves-effect' id="statusclose">Close</span>

                                    Priority - <span class='badge bg-red waves-effect' id="phigh">High</span>
                                    <span class='badge bg-orange waves-effect' id="pmoderate">Moderate</span>
                                    <span class='badge bg-green waves-effect' id="plow">Low</span>
                                </span>--%>
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

                        </div>
                        <div class="header">
                            <a href="javascript:void(0)" onclick="closeTicketPanel()" class="btn btn-warning pull-right">ok</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

