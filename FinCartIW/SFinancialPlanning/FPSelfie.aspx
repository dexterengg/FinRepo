<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FPSelfie.aspx.cs" Inherits="SFinancialPlanning_FPSelfie" %>

<!DOCTYPE html>

<html class="full">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fincart Financial Planning</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="assets/css/form-elements.css">
    <link rel="stylesheet" href="assets/css/style.css">
    <script src="assets/js/jquery-1.11.1.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
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
    <form id="form1" runat="server">
        <!-- Top menu -->
        <nav class="navbar navbar-inverse navbar-no-bg" role="navigation">
            <div class="container">
                <div class="navbar-header">
                    <a class="navbar-brand" style="height: 55px;" href="../Default.aspx"></a>
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
                <h3 align="center">Get your customized financial plan in just few clicks.</h3>
                <div class="col-sm-12 form-bottom">
                    <div class="col-sm-8">
                        <div class="">
                            <!--<div id="chartdiv"></div>-->
                            <div align="center">
                                <img src="images/Financial-Planning-Pyramid.png" class="img-responsive" style="max-height: 350px;" />
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="">
                            <div class="form-group">
                                <input type="text" id="Name" class="form-control" placeholder="Name..." runat="server" maxlength="30">
                                <div class="alert-danger" style="text-align: center; border-radius: 5px; margin-top: 2px;">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator_name" runat="server" ErrorMessage="*Name Required" ControlToValidate="Name" Display="Dynamic" ValidationGroup="Reg"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="form-group">
                                <input type="text" id="Email" class="form-control" placeholder="Email..." runat="server" maxlength="30">
                                <div class="alert-danger" style="text-align: center; border-radius: 5px; margin-top: 2px;">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator_email" runat="server" ErrorMessage="*Email Required" ControlToValidate="Email" Display="Dynamic" ValidationGroup="Reg"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="validateEmail" runat="server" ErrorMessage="*Invalid Email" ControlToValidate="Email" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$" Display="Dynamic" ValidationGroup="Reg" />
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="input-group">
                                    <div class="input-group-addon">
                                        +91
                                    </div>
                                    <input type="text" id="Mobile" class="form-control" placeholder="Mobile..." runat="server" maxlength="10">
                                </div>
                                <div class="alert-danger" style="text-align: center; border-radius: 5px; margin-top: 2px;">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator_Mobile" runat="server" ErrorMessage="*Mobile Required" ControlToValidate="Mobile" Display="Dynamic" ValidationGroup="Reg"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator_mobile" runat="server" ControlToValidate="Mobile" ErrorMessage="*Invalid Mobile" ValidationExpression="[0-9]{10}" Display="Dynamic" ValidationGroup="Reg"></asp:RegularExpressionValidator>
                                </div>
                            </div>
                            <div class="form-group">
                                <input type="password" id="Password" class="form-control" placeholder="Password..." runat="server" maxlength="15">
                                <div class="alert-danger" style="text-align: center; border-radius: 5px; margin-top: 2px;">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*Password Required" ControlToValidate="Password" Display="Dynamic" ValidationGroup="Reg"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="form-group">
                                <asp:Literal ID="lit_sucess" runat="server" Visible="false"></asp:Literal>
                                </div>
                            <asp:Button ID="btn_submit" runat="server" Text="Experience Now" OnClick="btn_submit_Click" CssClass="btn btn-primary" ValidationGroup="Reg" Style="background: #0db9f0 none repeat scroll 0 0; border: 0 none; border-radius: 4px; box-shadow: none; color: #fff; font-family: 'Roboto',sans-serif; font-size: 16px; font-weight: 300; height: 50px; line-height: 50px; margin: 0; padding: 0 20px; text-shadow: none; transition: all 0.3s ease 0s; vertical-align: middle;" />

                            <div class="form-group">
                                <div style="text-align: center; border-radius: 5px; margin-top: 2px;background-color:transparent;color:#fff;text-decoration:underline;" class="alert-danger">
                                    Already member? 
                                    <a style="color:#0db9f0" href="javascript:openlogin('lit_sucess');">Log IN</a>
                                </div>
                                </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>


        <asp:HiddenField ID="hfval" runat="server" />
        <!-- Modal login-->
        <div id="loginModal" class="modal fade" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Sign In</h4>
                    </div>
                    <div class="modal-body">
                        <div role="form">
                            <div class="form-group">
                                <label for="email">Email ID</label>
                                <asp:TextBox type="text" name="eusername" runat="server" TabIndex="1" ID="eusername" class="form-control" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="*Email Required" ControlToValidate="eusername" Display="Dynamic" ValidationGroup="SubmitInfo" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ErrorMessage="*Invalid Email" ControlToValidate="eusername" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$" Display="Dynamic" ValidationGroup="SubmitInfo" ForeColor="Red"></asp:RegularExpressionValidator>
                            </div>
                            <div class="form-group">
                                <label for="pwd">Password&nbsp;&nbsp;(<a href="javascript:openforgetpass();" class="underlineLink">Forgot Password?</a>)</label>
                                <asp:TextBox type="password" name="epassword" runat="server" TabIndex="2" ID="epassword" class="form-control" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ErrorMessage="*Password Required" ControlToValidate="epassword" Display="Dynamic" ValidationGroup="SubmitInfo" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group">
                                <asp:Button ID="LoginButton" TabIndex="4" runat="server" class="btn btn-info btn-block" Text="Login" ValidationGroup="SubmitInfo" OnClick="LoginButton_Click" />
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <script>
            function openlogin(hfv) {
                $("#<%=hfval.ClientID%>").val(hfv);
                $('#loginModal').modal({ backdrop: 'static', keyboard: true, show: true });
            }
            function openforgetpass() {
                $('#loginModal').modal('hide');
                $('#forgetpassModal').modal({ backdrop: 'static', keyboard: true, show: true });
            }
        </script>

        <!-- Modal forgetpass-->
        <div id="forgetpassModal" class="modal fade" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Forget Password</h4>
                    </div>
                    <div class="modal-body">
                        <div role="form">
                            <div class="form-group">
                                <label for="txtEmailID">Email ID</label>
                                <asp:TextBox type="text" name="txtEmailID" runat="server" TabIndex="1" ID="txtEmailID" class="form-control" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ErrorMessage="*Email Required" ControlToValidate="txtEmailID" Display="Dynamic" ValidationGroup="forgotp" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ErrorMessage="*Invalid Email" ControlToValidate="txtEmailID" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$" Display="Dynamic" ValidationGroup="forgotp" ForeColor="Red"></asp:RegularExpressionValidator>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12">
                                <asp:Button ID="forgetButton" runat="server" Text="Submit" CssClass="btn btn-info btn-block" ValidationGroup="forgotp" OnClick="forgetButton_Click" />
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>


    </form>
</body>

</html>
