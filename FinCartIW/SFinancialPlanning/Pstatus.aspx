<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Pstatus.aspx.cs" Inherits="advisory_Pstatus" %>

<!DOCTYPE html>

<html class="full">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fincart Financial Planning</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="assets/css/form-elements.css">
    <link rel="stylesheet" href="assets/css/style.css">
    <script src="Scripts/jquery-1.9.1.js"></script>
    <style>
        .full {
            background: url(images/background_1680x1050.jpg) no-repeat center center fixed;
            -webkit-background-size: cover;
            -moz-background-size: cover;
            -o-background-size: cover;
            background-size: cover;
        }
    </style>
</head>

<body style="background: none;">
    <form id="form1" runat="server" method="post">
        <!-- Top menu -->
        <nav class="navbar navbar-inverse navbar-no-bg" role="navigation">
            <div class="container">
                <div class="navbar-header">
                    <a class="navbar-brand" style="height: 55px;" href="#"></a>
                </div>
                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="top-navbar-1">
                    <ul class="nav navbar-nav navbar-right">
                        <li>
                            <span class="li-text"></span>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <div class="container">
            <div class="row">
                <h1 style="color: #ffffff;">Your Financial Plan Selfie (# FPSelfie)</h1>
                <div class="col-sm-12">
                    <div class="col-sm-2"></div>
                    <div class="col-sm-8">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title">Payment Details</h3>
                            </div>
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-xs-12">
                                        <div class="form-group">
                                            <label for="couponCode">
                                                <asp:Literal ID="litPaymentStatus" runat="server"></asp:Literal>
                                            </label>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-12">
                                        <div class="form-group">
                                            <label for="couponCode">
                                                <asp:Literal ID="litTransactionNo" runat="server"></asp:Literal>
                                            </label>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-12">
                                        <div class="form-group">
                                            <label for="couponCode">
                                                <asp:Literal ID="litAction" runat="server"></asp:Literal>
                                            </label>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-12">
                                        <asp:Button ID="btnProceed" CssClass="btn btn-success btn-lg btn-block" runat="server" Text="Proceed" Visible="false" OnClick="btnProceed_Click"/>
                                        <asp:Button ID="btnRetry" CssClass="btn btn-danger btn-lg btn-block" runat="server" Text="Retry"  Visible="false" OnClick="btnRetry_Click"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-2"></div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
