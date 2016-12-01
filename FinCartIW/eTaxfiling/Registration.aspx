<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Registration.aspx.cs" Inherits="eTaxfilling_Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>eTaxFiling | Fincart</title>

    <link href="images/favi.png" rel="shortcut icon" type="image/x-icon" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="format-detection" content="telephone=no" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <link href="../css/bootstap.min.css" rel="stylesheet" />

    <link rel="stylesheet" href="css/reset.css" type="text/css" media="all" />
    <link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
    <link href="../css/style.css" rel="stylesheet" type="text/css" media="all" />
    <link href="../css/website.css" rel="stylesheet" type="text/css" media="all" />
    <link href="../css/style420.css" rel="stylesheet" type="text/css" media="all" />
    <link href="../css/style768.css" rel="stylesheet" type="text/css" media="all" />
    <link href="../css/style1024.css" rel="stylesheet" type="text/css" media="all" />
    <link href="../css/formitems.css" rel="stylesheet" type="text/css" media="all" />
    <link href='https://fonts.googleapis.com/css?family=Roboto' rel='stylesheet' type='text/css' />
    <link href="../css/font-awesome.css" type="text/css" rel="stylesheet" />
    <link href="../css/font-awesome.min.css" type="text/css" rel="stylesheet" />
    <script src="../js/jquery.min.js"></script>
    <script src="../testimonials/pauseScroller.js" type="text/javascript"></script>
    <script src="../testimonials/scroll.js" type="text/javascript"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

    <style type="text/css">
        #pscroller1 {
            PADDING-TOP: 3px;
            width: 100%;
            HEIGHT: 160px;
            text-align: justify;
        }

        .modal {
            text-align: center;
            padding: 0 !important;
        }

            .modal:before {
                content: '';
                display: inline-block;
                height: 100%;
                vertical-align: middle;
                margin-right: -4px;
            }

        .modal-dialog {
            display: inline-block;
            text-align: left;
            vertical-align: middle;
        }

        a:focus, a:hover {
            color: #337ab7;
        }
    </style>

    <link href="css/form-elements.css" rel="stylesheet" />
    <link href="css/form-style.css" rel="stylesheet" />

    <script>
        function closepopup() {
            $('#alertpopup').slideUp('slow');
        }
        function openforgetpass(action) {
            if (action === 'login') {
                $('#loginModal').slideDown('slow');
                $('#forgetpassModal').slideUp('slow');
            }
            else {
                $('#loginModal').slideUp('slow');
                $('#forgetpassModal').slideDown('slow');
            }
        }
        </script>
</head>
<body>
    <form id="form1" runat="server">

        <div>
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <!-- -----------------------------------start header -->
            <div class="header-top" style="border-bottom: none;">
                <div class="header-inner">
                    <div class="logo">
                        <a href="../Default.aspx">
                            <img src="images/rsz_logo_fincart_190x55.png" alt="" /></a>
                    </div>
                    <div class="guest">
                        <asp:Label ID="lblWelcome" runat="server"></asp:Label>
                    </div>
                    <div class="h_menu4">
                        <a class="toggleMenu" href="#"><i class="fa fa-bars fa-2x"></i></a>
                        <script type="text/javascript" src="js/nav.js"></script>
                    </div>
                    <div class="clear"></div>
                </div>
                <!-- -----------------------------------start we featured in -->
                <div class="clear"></div>

                <!-- -----------------------------------end we featured in -->
            </div>
            <!-- -----------------------------------end header -->

            <div class="bodyContainer" style="background: rgba(0, 0, 0, 0) url('../images/banner_bg2--.jpg') no-repeat fixed center center / 100% 100%; margin-bottom: 25px; top: 25px;">
                <div style="background: rgba(0, 0, 0, 0.5);">
                    <div class="container">
                        <h1 class="heading-primary">TAX Filing</h1>
                        <h4 class="heading-primary2">File Your Tax With Few Clicks</h4>
                        <div class="row">
                            <asp:Label ID="lbl_error" runat="server"></asp:Label>

                            <div class="col-sm-5">
                                <div class="form-box" id="loginModal">
                                    <div class="form-top">
                                        <div class="form-top-left">
                                            <h3>Login to our site</h3>
                                            <p>Enter username and password to log on:</p>
                                        </div>
                                        <div class="form-top-right">
                                            <i class="fa fa-lock"></i>
                                        </div>

                                    </div>
                                    <div class="form-bottom">
                                        <div class="login-form">
                                            <div class="form-group">
                                                <label class="sr-only" for="form-username">Email ID</label>
                                                <asp:TextBox type="text" name="eusername" runat="server" TabIndex="1" ID="eusername" CssClass="form-username form-control" placeholder="Enter Email" />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="*Email Required" ControlToValidate="eusername" Display="Dynamic" ValidationGroup="SubmitInfo" Style="color: #f2dede;"></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ErrorMessage="*Invalid Email" ControlToValidate="eusername" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$" Display="Dynamic" ValidationGroup="SubmitInfo" Style="color: #f2dede;"></asp:RegularExpressionValidator>
                                            </div>
                                            <div class="form-group">
                                                <label class="sr-only" for="form-password">Password</label>
                                                <asp:TextBox type="password" name="epassword" runat="server" TabIndex="2" ID="epassword" CssClass="form-password form-control" placeholder="Enter Password" />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ErrorMessage="*Password Required" ControlToValidate="epassword" Display="Dynamic" ValidationGroup="SubmitInfo" Style="color: #f2dede;"></asp:RequiredFieldValidator>
                                            </div>
                                            <asp:LinkButton ID="LoginButton" runat="server" ValidationGroup="SubmitInfo" class="btn btn-warning btn-block btn-md" OnClick="LoginButton_Click">Sign in!</asp:LinkButton>
                                            <a href="javascript:openforgetpass('forgot');" style="color: #fff;">Forgot Password?</a>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-box" id="forgetpassModal" style="display: none;">
                                    <div class="form-top">
                                        <div class="form-top-left">
                                            <h3>Recover Password</h3>
                                        </div>
                                    </div>
                                    <div class="form-bottom">
                                        <div class="login-form">
                                            <div class="form-group">
                                                <label class="sr-only" for="form-username">Email ID</label>
                                                <asp:TextBox type="text" name="txtEmailID" runat="server" TabIndex="1" ID="txtEmailID" placeholder="Enter Email" CssClass="form-username form-control" />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ErrorMessage="*Email Required" ControlToValidate="txtEmailID" Display="Dynamic" ValidationGroup="forgotp" Style="color: #f2dede;"></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ErrorMessage="*Invalid Email" ControlToValidate="txtEmailID" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$" Display="Dynamic" ValidationGroup="forgotp" Style="color: #f2dede;"></asp:RegularExpressionValidator>
                                            </div>
                                            <asp:LinkButton ID="forgetButton" runat="server" ValidationGroup="forgotp" class="btn btn-warning btn-block btn-md" OnClick="forgetButton_Click">Recover</asp:LinkButton>
                                            <a href="javascript:openforgetpass('login');" style="color: #fff;">Sign in</a>
                                        </div>
                                    </div>
                                </div>

                            </div>

                            <div class="col-sm-1 middle-border"></div>
                            <div class="col-sm-1"></div>

                            <div class="col-sm-5">

                                <div class="form-box">
                                    <div class="form-top">
                                        <div class="form-top-left">
                                            <h3>Sign up now</h3>
                                            <p>Fill in the form below to get instant access:</p>
                                        </div>
                                        <div class="form-top-right">
                                            <i class="fa fa-pencil"></i>
                                        </div>
                                    </div>
                                    <div class="form-bottom">
                                        <div class="registration-form">
                                            <div class="form-group">
                                                <label class="sr-only" for="form-first-name">Name</label>
                                                <asp:TextBox type="text" name="name" runat="server" placeholder="Enter Name" ID="name" CssClass="form-first-name form-control" ValidationGroup="RegisterInfo" MaxLength="30" />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="RegisterInfo" Display="Dynamic" ErrorMessage="*Name Required" ControlToValidate="name" Style="color: #f2dede;"></asp:RequiredFieldValidator>
                                            </div>
                                            <div class="form-group">
                                                <label class="sr-only" for="form-last-name">Mobile</label>
                                                <asp:TextBox type="text" name="mobile" ID="mobile" Placeholder="Enter Mobile No." runat="server" CssClass="form-last-name form-control" MaxLength="10" ValidationGroup="RegisterInfo" />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="RegisterInfo" Display="Dynamic" ErrorMessage="*Mobile Required" ControlToValidate="mobile" Style="color: #f2dede;"></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator_mobile" runat="server" ControlToValidate="mobile" ErrorMessage="*Invalid Mobile" ValidationExpression="[0-9]{10}" Display="Dynamic" ValidationGroup="RegisterInfo" Style="color: #f2dede;"></asp:RegularExpressionValidator>
                                            </div>
                                            <div class="form-group">
                                                <label class="sr-only" for="form-email">Email</label>
                                                <asp:TextBox type="text" name="email" ID="email" runat="server" placeholder="Enter Email" CssClass="form-email form-control" ValidationGroup="RegisterInfo" MaxLength="50" />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" Display="Dynamic" runat="server" ValidationGroup="RegisterInfo" ErrorMessage="*Email Required" ControlToValidate="email" Style="color: #f2dede;"></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="validateEmail" runat="server" ErrorMessage="*Invalid Email" ControlToValidate="email" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$" Display="Dynamic" ValidationGroup="RegisterInfo" Style="color: #f2dede;"></asp:RegularExpressionValidator>
                                            </div>
                                            <div class="form-group">
                                                <label class="sr-only" for="form-about-yourself">Password</label>
                                                <asp:TextBox type="password" name="password" ID="password" runat="server" placeholder="Enter Password" CssClass="form-about-yourself form-control" ValidationGroup="RegisterInfo" MaxLength="30" />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" Display="Dynamic" runat="server" ValidationGroup="RegisterInfo" ErrorMessage="*Password Required" ControlToValidate="password" Style="color: #f2dede;"></asp:RequiredFieldValidator>
                                            </div>
                                            <asp:LinkButton ID="RegisterButton" runat="server" ValidationGroup="RegisterInfo" class="btn btn-warning btn-block btn-md" OnClick="RegisterButton_Click">Sign me up!</asp:LinkButton>

                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>



                    </div>
                </div>



            </div>

            <!-- -----------------------------------footer starts-->
            <div class="footer">
                <div class="wrap2">
                    <div class="footer-grid">
                        <h4>Reach us at</h4>
                        <div class="recent-tweet">
                            <p>T: (91) 11 30018181</p>
                        </div>
                        <div class="clear"></div>

                        <div class="recent-tweet">
                            <p>E: <a href="mailto:info@fincart.com">info@fincart.com</a></p>
                        </div>
                        <div class="clear"></div>

                        <div class="recent-tweet">
                            <p>E: <a href="mailto:careers@fincart.com">careers@fincart.com</a></p>
                        </div>
                        <div class="clear"></div>

                        <div class="recent-tweet">
                            <p><a href="#" class="md-trigger" data-modal="Modal-CallMe">Call Me</a></p>
                        </div>
                        <div class="clear"></div>
                        <br>
                    </div>


                    <div class="footer-grid" style="display: none">
                        <h4>Products</h4>
                        <div class="recent-tweet">
                            <p><a href="Products.aspx">Mutual Fund</a></p>
                        </div>
                        <div class="clear"></div>

                        <div class="recent-tweet">
                            <p><a href="InstaSip.aspx">InstaSIP</a></p>
                        </div>
                        <div class="clear"></div>

                        <div class="recent-tweet">
                            <p><a href="LifeInsurance.aspx">Term Insurance</a></p>
                        </div>
                        <div class="clear"></div>

                        <div class="recent-tweet">
                            <p><a href="HealthInsurance.aspx">Health Insurance</a></p>
                        </div>
                        <div class="clear"></div>

                        <div class="recent-tweet">
                            <p><a href="#">Fixed Deposits</a></p>
                        </div>
                        <div class="clear"></div>

                        <div class="recent-tweet">
                            <p><a href="TaxSaving.aspx">Tax-Saving Option</a></p>
                        </div>
                        <div class="clear"></div>

                        <div class="recent-tweet">
                            <p><a href="NPS.aspx">New Pension Scheme</a></p>
                        </div>
                        <div class="clear"></div>

                        <br>

                        <h4>Services</h4>
                        <div class="recent-tweet">
                            <p><a href="FinancialPlanning.aspx">Financial Planning</a></p>
                        </div>
                        <div class="clear"></div>

                        <div class="recent-tweet">
                            <p><a href="InsurancePlanning.aspx">Insurance Planning</a></p>
                        </div>
                        <div class="clear"></div>

                        <div class="recent-tweet">
                            <p><a href="InvestmentPlanning.aspx">Investment Planning</a></p>
                        </div>
                        <div class="clear"></div>

                        <div class="recent-tweet">
                            <p><a href="#">Tax Planning</a></p>
                        </div>
                        <div class="clear"></div>

                        <div class="recent-tweet">
                            <p><a href="RetirementPlanning.aspx">Retirement Planning</a></p>
                        </div>
                        <div class="clear"></div>
                    </div>


                    <div class="footer-grid">
                        <h4>Resources</h4>
                        <div class="recent-tweet">
                            <p><a href="Media.aspx">Media</a></p>
                        </div>
                        <div class="clear"></div>

                        <div class="recent-tweet">
                            <p><a href="Blog.aspx">Blog</a></p>
                        </div>
                        <div class="clear"></div>

                        <div class="recent-tweet">
                            <p><a href="FCVideo.aspx">Video</a></p>
                        </div>
                        <div class="clear"></div>
                        <br>
                    </div>

                    <div class="footer-grid">
                        <h4>Legal</h4>
                        <div class="recent-tweet">
                            <p><a href="TermsOfUse.aspx">Terms of Use</a></p>
                        </div>
                        <div class="clear"></div>

                        <div class="recent-tweet">
                            <p><a href="PrivacyPolicy.aspx">Privacy Policy</a></p>
                        </div>
                        <div class="clear"></div>
                    </div>

                    <div class="footer-grid-last">
                        <h4>Reviews</h4>
                        <br>
                        <p>
                            <script type="text/javascript">new pausescroller(pausecontent_LIFE, "pscroller1", "someclass", 7000)</script>
                        </p>
                    </div>
                    <div class="clear"></div>
                </div>
            </div>
            <!-- -----------------------------------footer ends-->

            <!-- -----------------------------------footer bottom starts-->
            <div class="footer-bottom">
                <div class="wrap2">
                    <div class="copy">
                        <p>
                            Fincart is an online initiative of 3E Advisors Private Limited. 3E refers to Educate, Empower and Enable. Our vision is to be the most ethical personal finance portal that helps people make great progress with money by educating investors, empowering to make informed decisions and enabling with an online platform to help Plan, Transact and Track your life investments.<br>
                            CIN # U74140DL2012PTC245046 | ARN # 86903 | Logo Trademark # 2523746 | ISO 9001:2000  Registration # PCMS/QMS/2019-2013
                        </p>
                        <br>
                        <div style="margin: auto; text-align: center; width: 100px">
                        </div>
                        <br />
                        <p>
                            Fincart.com TM + © 2012-2015. All rights reserved. Last Update: 15 October 2015.<br>
                        </p>
                    </div>

                    <div class="social">
                        <ul>
                            <li class="facebook"><a href="https://www.facebook.com/Fincartfp" target="_blank"><span></span></a></li>
                            <li class="linkedin"><a href="https://www.linkedin.com/profile/view?id=377256067" target="_blank"><span></span></a></li>
                            <li class="twitter"><a href="https://twitter.com/Fincartfp" target="_blank"><span></span></a></li>
                            <li class="youtube"><a href="https://www.youtube.com/channel/UCPgKy0xW3ysR4aAJkwh0oEg/videos" target="_blank"><span></span></a></li>
                            <li class="googleplus"><a href="https://plus.google.com/+Fincartfpc" target="_blank"><span></span></a></li>
                        </ul>
                    </div>
                    <div class="clear"></div>
                </div>
            </div>
            <!-- -----------------------------------footer bottom ends-->

            <!-- -----------------------------------footer fixed starts-->
            <div class="footer-fixed">
                <div class="footer-inner">
                    <div class="footer-fixed1">Call (91) 11 30018181</div>
                    <div class="footer-fixed2">
                        <a href="#" class="md-trigger" data-modal="Modal-CallMe">Call Me</a>
                        <div class="md-modal md-effect-1" id='Modal-CallMe'>
                            <div class="md-content">
                                <h3>Call Me Request<span><a href="#" class="md-close" style="text-decoration: none;">X</a></span></h3>
                                <div>
                                    <asp:UpdatePanel ID="upMain" runat="server">
                                        <ContentTemplate>
                                            <div id="formtop" runat="server">
                                                <asp:TextBox ID="txtCountryCode" Text="+91" runat="server" class="inputfield" Width="20" MaxLength="3" ValidationGroup="callback"></asp:TextBox>
                                                <asp:TextBox ID="txtMobile" runat="server" MaxLength="10" placeholder="Mobile" class="inputfield" Width="75" ValidationGroup="callback"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredMobile" runat="server" Display="Dynamic" ValidationGroup="callback" EnableClientScript="false" ErrorMessage="*" ControlToValidate="txtMobile" CssClass="mandatory"></asp:RequiredFieldValidator>
                                                <asp:TextBox ID="txtName" runat="server" placeholder="Name" class="inputfield" Width="120" ValidationGroup="callback"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredName" runat="server" Display="Dynamic" ValidationGroup="callback" EnableClientScript="false" ErrorMessage="*" ControlToValidate="txtName" CssClass="mandatory"></asp:RequiredFieldValidator>
                                                <asp:TextBox ID="txtEmail" runat="server" placeholder="Email" class="inputfield" Width="210" ValidationGroup="callback"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredEmail" runat="server" Display="Dynamic" ValidationGroup="callback" EnableClientScript="false" ErrorMessage="*" ControlToValidate="txtEmail" CssClass="mandatory"></asp:RequiredFieldValidator>
                                                <asp:LinkButton ID="CallBackSubmit" runat="server" class="MainButton" ValidationGroup="callback">Submit</asp:LinkButton>
                                            </div>
                                            <asp:Label ID="lblCallBackSubmit" Text="" runat="server"></asp:Label>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </div>
                            </div>
                        </div>
                        <div class="md-overlay"></div>
                        <!-- the overlay element -->
                    </div>
                    <div class="footer-fixed3"><a href="feedback.aspx">Feedback</a></div>
                    <%--<div class="footer-fixed4">Newsletter</div>--%>
                    <div class="footer-fixed5">
                        <asp:UpdatePanel ID="UpdatePanelSubscription" runat="server">
                            <ContentTemplate>
                                <asp:Label ID="subscribeSuccess" runat="server" CssClass="fixedfrmSubmit" Text="Subscription Done Successfully" Visible="false"></asp:Label>
                                <asp:TextBox ID="newsletter" CssClass="fixedfrmSubmit" placeholder=" Enter Email ID for Newsletter" runat="server" ValidationGroup="subscription" Style="border-radius: 3px; border: 0;"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RFNewsletter" ValidationGroup="subscription" runat="server" ErrorMessage="*" Display="Dynamic" ControlToValidate="newsletter" CssClass="mandatory"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2"
                                    runat="server" ErrorMessage="Please Enter Valid Email ID"
                                    ValidationGroup="subscription" ControlToValidate="newsletter" Display="Dynamic"
                                    CssClass="mandatoryfooter"
                                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
                                </asp:RegularExpressionValidator>
                                <asp:ImageButton ID="butNewsletter" runat="server" ImageUrl="~/images/go1.png" ValidationGroup="subscription" />

                            </ContentTemplate>
                        </asp:UpdatePanel>

                    </div>
                    <%--<div class="footer-fixed6"><a href="#">Message Us</a></div>--%>
                </div>
            </div>
            <!-- -----------------------------------footer fixed ends-->


            <script src="js/index.js"></script>
        </div>
    </form>
</body>
</html>
