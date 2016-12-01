<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Payment.aspx.cs" Inherits="advisory_Payment" %>

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
                                            <label for="couponCode">Amount</label>
                                            <input type="text" class="form-control" name="couponCode" value="RS. 1149" disabled="disabled"/>
											Rs. 1149 = Rs. 999 + 15% tax (14.5% service tax + .5% Krishi Cess)
                                            <asp:Label ID="lblamount" runat="server" Text="1149.00" Visible="false"></asp:Label>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-xs-12">
                                        <div class="form-group">
                                            <label for="couponCode">Bank</label>
                                            <asp:DropDownList ID="ddl_bank" runat="server" CssClass="form-control dropdown">
                                                <asp:ListItem Value="ADB" Text="Andhra Bank"></asp:ListItem>
                                                <asp:ListItem Value="ALB" Text="Allahabad Bank"></asp:ListItem>
                                                <asp:ListItem Value="AXC" Text="Axis Bank Corporate"></asp:ListItem>
                                                <asp:ListItem Value="BBC" Text="Bank of Baroda Corporate"></asp:ListItem>
                                                <asp:ListItem Value="BBK" Text="Bank of Bahrain and Kuwait"></asp:ListItem>
                                                <asp:ListItem Value="BBR" Text="Bank of Baroda Retail"></asp:ListItem>
                                                <asp:ListItem Value="BMN" Text="Bhartiya Mahila Bank"></asp:ListItem>
                                                <asp:ListItem Value="BOI" Text="Bank Of India"></asp:ListItem>
                                                <asp:ListItem Value="BOM" Text="Bank of Maharashtra"></asp:ListItem>
                                                <asp:ListItem Value="CBI" Text="Central Bank of India"></asp:ListItem>
                                                <asp:ListItem Value="CNB" Text="Canara Bank"></asp:ListItem>
                                                <asp:ListItem Value="COB" Text="Cosmos Bank"></asp:ListItem>
                                                <asp:ListItem Value="CPN" Text="Corporate Punjab National Bank"></asp:ListItem>
                                                <asp:ListItem Value="CRP" Text="Corporation Bank"></asp:ListItem>
                                                <asp:ListItem Value="CSB" Text="Catholic Syrian Bank"></asp:ListItem>
                                                <asp:ListItem Value="CUB" Text="City Union Bank"></asp:ListItem>
                                                <asp:ListItem Value="DBK" Text="Deutsche Bank"></asp:ListItem>
                                                <asp:ListItem Value="DBS" Text="DIGI Bank"></asp:ListItem>
                                                <asp:ListItem Value="DC2" Text="DCB Corporate Netbanking"></asp:ListItem>
                                                <asp:ListItem Value="DCB" Text="Development Credit Bank"></asp:ListItem>
                                                <asp:ListItem Value="DEN" Text="Dena Bank Netbanking"></asp:ListItem>
                                                <asp:ListItem Value="DLB" Text="Dhanlaxmi"></asp:ListItem>
                                                <asp:ListItem Value="FBK" Text="Federal Bank"></asp:ListItem>
                                                <asp:ListItem Value="HDF" Text="HDFC Bank Limited"></asp:ListItem>
                                                <asp:ListItem Value="ICI" Text="ICICI Bank"></asp:ListItem>
                                                <asp:ListItem Value="IDB" Text="IDBI Bank"></asp:ListItem>
                                                <asp:ListItem Value="IDN" Text="IDFC Bank Netbanking"></asp:ListItem>
                                                <asp:ListItem Value="IDS" Text="IndusInd Bank"></asp:ListItem>
                                                <asp:ListItem Value="INB" Text="Indian Bank"></asp:ListItem>
                                                <asp:ListItem Value="IOB" Text="Indian Overseas Bank"></asp:ListItem>
                                                <asp:ListItem Value="JKB" Text="Jammu and Kashmir Bank Limited"></asp:ListItem>
                                                <asp:ListItem Value="JSB" Text="Janata Sahakari Bank"></asp:ListItem>
                                                <asp:ListItem Value="KBL" Text="Karnataka Bank"></asp:ListItem>
                                                <asp:ListItem Value="KVB" Text="Karur Vysya Bank Limited"></asp:ListItem>
                                                <asp:ListItem Value="162" Text="Kotak Bank"></asp:ListItem>
                                                <asp:ListItem Value="LVC" Text="Lakshmi Vilas Bank Corporate"></asp:ListItem>
                                                <asp:ListItem Value="LVR" Text="Lakshmi Vilas Bank Retail"></asp:ListItem>
                                                <asp:ListItem Value="NKB" Text="NKGSB Bank"></asp:ListItem>
                                                <asp:ListItem Value="OBC" Text="ORIENTAL BANK OF COMMERCE"></asp:ListItem>
                                                <asp:ListItem Value="PMC" Text="Punjab & Maharashtra Co-operative Bank"></asp:ListItem>
                                                <asp:ListItem Value="PNB" Text="Punjab National Bank"></asp:ListItem>
                                                <asp:ListItem Value="PSB" Text="Punjab & Sind Bank"></asp:ListItem>
                                                <asp:ListItem Value="RBS" Text="The Royal Bank of Scotland"></asp:ListItem>
                                                <asp:ListItem Value="RTN" Text="Ratnakar Bank"></asp:ListItem>
                                                <asp:ListItem Value="SBH" Text="State Bank of Hyderabad"></asp:ListItem>
                                                <asp:ListItem Value="SBI" Text="State Bank of India"></asp:ListItem>
                                                <asp:ListItem Value="SBJ" Text="State Bank of Bikaner and Jaipur"></asp:ListItem>
                                                <asp:ListItem Value="SBM" Text="State Bank of Mysore"></asp:ListItem>
                                                <asp:ListItem Value="SBP" Text="State Bank of Patiala"></asp:ListItem>
                                                <asp:ListItem Value="SBT" Text="State Bank of Travancore"></asp:ListItem>
                                                <asp:ListItem Value="SCB" Text="SCB NetBanking"></asp:ListItem>
                                                <asp:ListItem Value="SIB" Text="South Indian Bank Ltd"></asp:ListItem>
                                                <asp:ListItem Value="SVC" Text="Shamrao Vithal Co-operative Bank Ltd"></asp:ListItem>
                                                <asp:ListItem Value="SWB" Text="Saraswat Bank"></asp:ListItem>
                                                <asp:ListItem Value="SYD" Text="Syndicate Bank"></asp:ListItem>
                                                <asp:ListItem Value="TJB" Text="TJSB"></asp:ListItem>
                                                <asp:ListItem Value="TMB" Text="Tamilnad Mercantile Bank Ltd"></asp:ListItem>
                                                <asp:ListItem Value="TNC" Text="TNSC Bank"></asp:ListItem>
                                                <asp:ListItem Value="UBI" Text="Union Bank of India"></asp:ListItem>
                                                <asp:ListItem Value="UCO" Text="UCO Bank"></asp:ListItem>
                                                <asp:ListItem Value="UNI" Text="United Bank of India"></asp:ListItem>
                                                <asp:ListItem Value="UTI" Text="Axis Bank"></asp:ListItem>
                                                <asp:ListItem Value="VJB" Text="Vijaya Bank"></asp:ListItem>
                                                <asp:ListItem Value="YBK" Text="YES Bank"></asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-12">
                                        <asp:Button ID="btnpay" CssClass="btn btn-success btn-lg btn-block" runat="server" Text="Pay" OnClick="btnpay_Click" />
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
