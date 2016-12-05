<%@ Page Title="" Language="C#" MasterPageFile="~/FinAdmin/MasterPage.master" AutoEventWireup="true" CodeFile="Tickets.aspx.cs" Inherits="FinAdmin_Tickets" EnableEventValidation="false"%>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentPlaceHolder" runat="Server">
    <!-- Bootstrap Select Css -->
    <link href="plugins/bootstrap-select/css/bootstrap-select.css" rel="stylesheet" />
    <script src="js/Ticket.js"></script>
    <style>
        .preloaderoverlay {
            height: 100%;
            width: 100%;
            top: 0;
            left: 0;
            z-index: 9;
            opacity: 0.8;
            background-color: #ccc;
            position: absolute;
            color:#f44336;
        }
    </style>
    <script type="text/javascript">
        $(document).ready(function () {
            bindDepartment($('#<%=ddlDepartment.ClientID%>'));
        });

        function fillDesignation() {
            departmentChange($('#<%=ddlDepartment.ClientID%>'), $('#<%=ddlDesignation.ClientID%>'), $('#<%=ddlAssignTo.ClientID%>'), $('#<%=ddlReportTo.ClientID%>'));
        }

        function fillAssignTo() {
            designationChange($('#<%=ddlDesignation.ClientID%>'), $('#<%=ddlAssignTo.ClientID%>'), $('#<%=ddlReportTo.ClientID%>'));
        }

        function fillReportTo() {
            assignToChange($('#<%=ddlDepartment.ClientID%>'), $('#<%=ddlAssignTo.ClientID%>'), $('#<%=ddlReportTo.ClientID%>'));
        }

        function changeReportTo() {
            reportToToChange($('#<%=ddlReportTo.ClientID%>'));
        }

        function addticket() {
            createticket($('#<%=txtquery.ClientID%>'), $('#<%=ddlDepartment.ClientID%>'), $('#<%=ddlDesignation.ClientID%>'), $('#<%=ddlAssignTo.ClientID%>'), $('#<%=ddlReportTo.ClientID%>'), $('#<%=ddlStatus.ClientID%>'), $('#<%=ddlPriority.ClientID%>'), $('#<%=fileattachment.ClientID%>'));
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <section class="content">
        <div class="container-fluid">
            <!-- Color Pickers -->
            <div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div id='preloaderoverlay'>
                        <div class="card">
                            <div class="header">
                                <h2>Create New Ticket
                            </h2>
                            </div>
                            <div class="body">

                                <div class="row clearfix">
                                    <div class="col-md-8">
                                        <p>
                                            <b>Query</b>
                                        </p>
                                        <div class="form-group">
                                            <div class="form-line">
                                                <textarea id="txtquery" runat="server" rows="4" class="form-control no-resize" placeholder="Type Your Query......"></textarea>
                                            </div>
                                        </div>

                                    </div>

                                      <div class="col-md-4">
                                        <p>
                                            <b>Attachment (Optional)</b>
                                        </p>
                                        <asp:FileUpload ID="fileattachment" runat="server" CssClass="form-control" />
                                    </div>

                                    </div>

                                <div class="row clearfix">
                                    <div class="col-md-4">
                                        <p>
                                            <b>Department</b>
                                        </p>
                                        <asp:DropDownList ID="ddlDepartment" runat="server" CssClass="form-control show-tick" onchange="fillDesignation()">
                                            <asp:ListItem>Select Department</asp:ListItem>
                                        </asp:DropDownList>

                                    </div>
                                    <div class="col-md-4">
                                        <p>
                                            <b>Designation</b>
                                        </p>
                                        <asp:DropDownList ID="ddlDesignation" runat="server" CssClass="form-control show-tick" onchange="fillAssignTo()">
                                            <asp:ListItem>Select Designation</asp:ListItem>
                                        </asp:DropDownList>

                                    </div>
                                    <div class="col-md-4">
                                        <p>
                                            <b>Assign To</b>
                                        </p>
                                        <asp:DropDownList ID="ddlAssignTo" runat="server" CssClass="form-control show-tick" onchange="fillReportTo()">
                                            <asp:ListItem>Select Assign To</asp:ListItem>
                                        </asp:DropDownList>

                                    </div>
                                </div>

                                <div class="row clearfix">
                                    <div class="col-md-4">
                                        <p>
                                            <b>Report To</b>
                                        </p>
                                        <asp:DropDownList ID="ddlReportTo" runat="server" CssClass="form-control show-tick" onchange="changeReportTo()">
                                            <asp:ListItem>Select Report To</asp:ListItem>
                                        </asp:DropDownList>

                                    </div>
                                    <div class="col-md-4">
                                        <p>
                                            <b>Status</b>
                                        </p>
                                        <asp:DropDownList ID="ddlStatus" runat="server" CssClass="form-control show-tick">
                                            <asp:ListItem Value="0">Open</asp:ListItem>
                                            <asp:ListItem Value="1">Close</asp:ListItem>
                                        </asp:DropDownList>

                                    </div>
                                    <div class="col-md-4">
                                        <p>
                                            <b>Priority</b>
                                        </p>
                                        <asp:DropDownList ID="ddlPriority" runat="server" CssClass="form-control show-tick">
                                            <asp:ListItem Value="0">High</asp:ListItem>
                                            <asp:ListItem Value="1" Selected="True">Moderate</asp:ListItem>
                                            <asp:ListItem Value="2">Low</asp:ListItem>
                                        </asp:DropDownList>

                                    </div>
                                </div>

                                <div class="row clearfix">
                                    <div class="col-md-12" style="text-align: right">
                                        <asp:Button ID="btn_submit" runat="server" Text="Submit" CssClass="btn btn-success" OnClientClick="addticket(); return false;"/>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </section>
</asp:Content>

