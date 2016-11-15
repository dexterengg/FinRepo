<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<!DOCTYPE html>

<html>
<head runat="server">

    <link href="images/favi.png" rel="shortcut icon" type="image/x-icon" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="format-detection" content="telephone=no" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="css/website.css" rel="stylesheet" type="text/css" media="all" />
    <link rel="stylesheet" href="home-fincart/css/bootstap.min.css" type="text/css">
    <link rel="stylesheet" href="home-fincart/css/layout.css" type="text/css">

    <link href='https://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Titillium+Web' rel='stylesheet' type='text/css'>

    <script src="../js/jquery.min.js"></script>
    <style type="text/css">
        #pscroller1 {
            PADDING-TOP: 3px;
            width: 100%;
            HEIGHT: 160px;
            text-align: left;
            color: #ffffff;
            line-height: 1.5em;
            font-size: 12px;
            margin-top: 3%;
        }
    </style>

    <script src="testimonials/pauseScroller.js" type="text/javascript"></script>
    <script src="testimonials/scroll.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="modal/css/component.css" />
    <script src="modal/js/modernizr.custom.js"></script>

    <script type="text/javascript">//<![CDATA[
        var tlJsHost = ((window.location.protocol == "https:") ? "https://secure.comodo.com/" : "http://www.trustlogo.com/");
        document.write(unescape("%3Cscript src='" + tlJsHost + "trustlogo/javascript/trustlogo.js' type='text/javascript'%3E%3C/script%3E"));
        //]]>
    </script>
    <style>
        .container {
            background: transparent none repeat scroll 0 0;
        }
    </style>
    <title>Fincart</title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

        <div>
            <div class="outer">

                <div class="col-md-12" style="position: fixed; top: 0; width: 100%; z-index: 99999; padding-left: 0px; padding-right: 0px;">

                    <div class="col-md-12" style="padding-left: 0px; padding-right: 0px;">
                        <div class="container-fluid top-header">
                            <div class="container" style="padding: 10px;">
                                <div class="row">
                                    <div class="col-md-6" style="padding-top: 10px;">
                                        <a href="index.aspx">
                                            <img src="home-fincart/images/image007.png" style="float: left;"></a>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="row">
                                            <div class="col-lg-12">
                                                <span style="float: right; color: #108ecb; padding-right: 10px;">
                                                    <asp:Label ID="lblWelcome" runat="server" Text="Welcome Guest"></asp:Label>
                                                </span>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-12">
                                                <div class="menu-right">
                                                    <ul>
                                                        <li><a href="OurStory.aspx">Our Story  </a></li>
                                                        <li><a href="WorkShop.aspx">Workshop </a></li>
                                                        <li>
                                                            <asp:LinkButton ID="signin" runat="server" OnClick="signin_Click">Log IN</asp:LinkButton>
                                                            <asp:LinkButton ID="LoginD" runat="server" OnClick="LoginD_Click">Logout</asp:LinkButton>
                                                        </li>
                                                        <li><a href="Blog.aspx">Blog </a></li>

                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>

                    <div id="header" class="col-md-12" style="padding-left: 0px; padding-right: 0px; display: none;">
                        <div class="container-fluid second-header">
                            <div class="container">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="menu-right-second">
                                            <ul>
                                                <li id="FP"><a href="javascript:void(0);">Financial Planning</a></li>
                                                <li id="INS"><a href="javascript:void(0);">Insurance</a></li>
                                                <%--<li><a href="#">Investment    </a></li>
                                        <li><a href="#">Home Loan   </a></li>--%>
                                                <li style="border: none;"><a href="eTaxfiling/Filetax.aspx">Tax</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div id="subheaderFP" class="col-md-12" style="padding-left: 0px; padding-right: 0px; display: none;">
                        <div class="container-fluid submenu-header">
                            <div class="container">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="submenu-right">
                                            <ul>
                                                <li><a href="Plan/instaSIP.aspx">IP SELFIE</a></li>
                                                <li><a href="SFinancialPlanning/FPSelfie.aspx">FP SELFIE</a></li>
                                                <li style="border: none;"><a href="Plan/Login.aspx">CFP</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div id="subheaderINS" class="col-md-12" style="padding-left: 0px; padding-right: 0px; display: none;">
                        <div class="container-fluid submenu-header">
                            <div class="container">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="submenu-right">
                                            <ul>
                                                <li><a href="OnlineTermInsurance.aspx">Term</a></li>
                                                <li><a href="OnlineHealthInsurance.aspx">Health</a></li>
                                                <li><a href="OnlineCarInsurance.aspx">Auto</a></li>
                                                <li style="border: none;"><a href="OnlineTravelInsurance.aspx">Travel</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>

                <!--<----banner blue portion------->

                <div class="container-fluid banner-img" style="margin-top: 3%;">
                    <div class="container">
                        <div class="row ">
                            <div class="col-md-12">
                                <h2 style="color: #fff; font-size: 32px;">One stop shop for your personal finance </h2>
                            </div>
                        </div>
                        <div class="row icons-cls">
                            <div class="col-md-2"></div>
                            <div class="col-md-1"></div>
                            <div class="col-md-1"></div>
                            <div class="col-md-1" id="divFP">
                                <a id="iconFP" href="javascript:void(0);">
                                    <img src="home-fincart/images/icon-1.PNG" /></a>
                                <dl class="list maki" id="listFP" style="display:none;">
                                    <dd><a href="Plan/instaSIP.aspx">IP SELFIE</a></dd>
                                    <dd><a href="SFinancialPlanning/FPSelfie.aspx">FP SELFIE</a></dd>
                                    <dd><a href="Plan/Login.aspx">CFP</a></dd>
                                </dl>
                            </div>
                            <div class="col-md-1"></div>
                            <div class="col-md-1" id="divINS">
                                <a id="iconINS" href="javascript:void(0);">
                                    <img src="home-fincart/images/icon-2.PNG" /></a>
                                <dl class="list taki" id="listINS" style="display:none;">
                                    <dd><a href="OnlineTermInsurance.aspx">Term</a></dd>
                                    <dd><a href="OnlineHealthInsurance.aspx">Health</a></dd>
                                    <dd><a href="OnlineCarInsurance.aspx">Auto</a></dd>
                                    <dd><a href="OnlineTravelInsurance.aspx">Travel</a></dd>
                                </dl>
                            </div>
                            <%--<div class="col-md-1"></div>
                            <div class="col-md-1">
                                <img src="home-fincart/images/icon-3.PNG" />
                            </div>
                            <div class="col-md-1"></div>
                            <div class="col-md-1">
                                <img src="home-fincart/images/icon-4.PNG" />
                            </div>--%>
                            <div class="col-md-1"></div>
                            <div class="col-md-1">
                                <a href="eTaxfiling/Filetax.aspx">
                                    <img src="home-fincart/images/icon-last.PNG" /></a>
                            </div>
                            <div class="col-md-2"></div>
                        </div>
                    </div>
                </div>


                <!--<-----finish third portion------->

                <div class="container-fluid thirt-portion">
                    <div class="container" style="width: 92%; padding-right: 10%">
                        <div class="ROW" style="margin: 40px 0px 100px 0px;">
                            <div class="col-md-12">
                                <table align="center">
                                    <tr>
                                        <td>
                                            <p style="color: #fff; font-weight: bold; font-size: 36px">CHOOSE THE ONE  </p>
                                        </td>
                                        <td>
                                            <p style="color: #fff; font-weight: normal; font-size: 32px; padding-left: 20px">THAT SUITS YOU BEST  </p>
                                        </td>
                                    </tr>
                                </table>

                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <div class="row">
                                    <div class="col-md-12">
                                        <table style="color: #FFF">
                                            <tr>
                                                <td>
                                                    <h2>IP SELFIE </h2>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <p style="padding: 20px 40px 80px 30px; font-size: 14px">
                                                        The Investment plan is based on an algorithm that suggests <b>top 3 best               investment choices </b>based on your answers               
                                                    </p>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <a href="Plan/instaSIP.aspx">
                                                        <img src="home-fincart/images/sign-up-button.PNG" style="margin-bottom: 40PX;" />
                                                    </a>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="row">
                                    <div class="col-md-12">
                                        <table style="color: #FFF">
                                            <tr>
                                                <td>
                                                    <h2>FP SELFIE </h2>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <p style="padding: 20px 40px 80px 30px; font-size: 14px">
                                                        Robo-Advisory helps us make <b>great quality financial plan </b>accessible at                affordable price. 
                                                        <br />
                                                        <br />
                                                    </p>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <a href="SFinancialPlanning/FPSelfie.aspx">
                                                        <img src="home-fincart/images/sign-up-button.PNG" style="margin-bottom: 40PX;" />
                                                    </a>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="row">
                                    <div class="col-md-12">
                                        <table style="color: #FFF">
                                            <tr>
                                                <td>
                                                    <h2>CFP </h2>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <p style="padding: 20px 40px 80px 30px; font-size: 14px">
                                                        It provide a detailed perspective of your finances - does <b style="text-decoration: none;">Your Insurance,                Goal, Retirement Planning </b>including the accumulative & distribution phase              
                                                    </p>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <a href="Plan/Login.aspx">
                                                        <img src="home-fincart/images/sign-up-button.PNG" style="margin-bottom: 40PX;" />
                                                    </a>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!--<--------start fourth portion----------->

                <div class="container-fluid fourth-portion">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12">
                                <h2><span style="font-weight: 800;">INVEST <span style="font-weight: 100; color: #696a6b">FEARLESSLY </span></span></h2>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-12">
                                <img src="home-fincart/images/HAND.PNG" />
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-12">
                                <p style="color: #4790cb; font-size: 30px; font-weight: 100;">
                                    Simple DO-IT-YOUR-SELF Investment and Financial Plan
                                </p>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-12">
                                <p style="text-align: center; font-size: 17px; font-weight: 600;">
                                    Most people are afraid of investing beyond conventional product fearing loss of money.
                                    <br />
                                    Not anymore, our algorithm suggests scheme that most likely will protect capital for the time horizon selected.         
                                </p>
                            </div>
                        </div>

                        <div class="row" style="margin: 40px 0px">
                            <div class="col-md-12">
                                <a href="Plan/instaSIP.aspx">
                                    <img src="home-fincart/images/get-start.PNG" />
                                </a>
                            </div>
                        </div>

                    </div>
                </div>

                <!--<---------fifth portion------------------>

                <div class="container-fluid fifth-portion">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-3"></div>
                            <div class="col-md-6">
                                <img src="home-fincart/images/how-it-works.PNG" class="img-responsive" style="margin-bottom: 60px" />
                            </div>
                            <div class="col-md-3"></div>
                        </div>

                        <div class="row">
                            <div class="col-md-12">
                                <img src="home-fincart/images/alaram.PNG" class="img-responsive" />
                            </div>
                        </div>


                    </div>
                </div>

                <!--<--------six-portion---------------->

                <div class="container-fluid sixe-portion">
                </div>
                <!--<-----------seven-portion------------->

                <div class="container-fluid seven-portion">
                    <div class="row seven-contant">
                        <div class="col-md-12">
                            <img src="home-fincart/images/secure.PNG" />
                        </div>
                    </div>
                    <div class="container">
                        <div class="row ">
                            <div class="col-md-4">
                                <img src="home-fincart/images/your-personal-data.PNG" class="img-responsive" />
                            </div>
                            <div class="col-md-4">
                                <img src="home-fincart/images/customer-ID.PNG" class="img-responsive" />
                            </div>
                            <div class="col-md-4">
                                <img src="home-fincart/images/confidential.PNG" class="img-responsive" />
                            </div>
                        </div>
                    </div>
                </div>


                <div class="container-fluid eight-portion">
                    <div class="container" style="width: 90%">
                        <div class="row">
                            <div class="col-md-12">
                                <h2 style="color: #707578;">Domian <span style="color: #4f5052;">Expertise </span>earns Media Coverage </h2>
                                <br />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <div style="border: #353b47 0px solid; border-radius: 10px; padding: 0px">
                                    <iframe src="https://player.vimeo.com/video/139189295" name="tvshows" webkitallowfullscreen="" mozallowfullscreen="" allowfullscreen="" frameborder="0" height="300" width="100%" style="border: #7a7e88 4px solid; border-radius: 10px; padding: 0px"></iframe>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div style="border: #353b47 0px solid; border-radius: 10px;">
                                    <iframe src="https://player.vimeo.com/video/139052824" name="tvshows" webkitallowfullscreen="" mozallowfullscreen="" allowfullscreen="" frameborder="0" height="300" width="100%" style="border: #7a7e88 4px solid; border-radius: 10px; padding: 0px"></iframe>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div style="border: #353b47 0px solid; border-radius: 10px;">
                                    <iframe src="https://player.vimeo.com/video/139188250" name="tvshows" webkitallowfullscreen="" mozallowfullscreen="" allowfullscreen="" frameborder="0" height="300" width="100%" style="border: #7a7e88 4px solid; border-radius: 10px; padding: 0px"></iframe>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="container-fluid nine-portion">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12" style="color: #fff">
                                <h1>TRUST IS EARNED </h1>
                                <br />
                                <h4>Fincart – The First & Only company to offer phone based investment counseling.
                                    <br />
                                    <br />
                                    We record the conversation and share it with our clients. 
                                </h4>
                            </div>
                        </div>

                        <div class="row" style="color: #fff">
                            <div class="col-md-12">
                                <h3>Building TRUST thought transparency. </h3>
                            </div>
                        </div>
                    </div>
                </div>


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
                                <p><a class="md-trigger" data-modal="Modal-CallMe">Call Me</a></p>
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
                                <p><a href="http://fincart.my-portfolio.in/" target="_blank">Track Portfolio</a></p>
                            </div>
                            <div class="clear"></div>

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
                            <div>
                                <p>
                                    <script type="text/javascript">new pausescroller(pausecontent_LIFE, "pscroller1", "someclass", 7000)</script>
                                </p>
                            </div>

                        </div>
                        <p></p>

                        <div class="clear"></div>
                    </div>
                </div>


                <div class="footer-bottom">
                    <div class="container">
                        <div class="wrap2">
                            <div class="copy">
                                <p>
                                    Fincart is an online initiative of 3E Advisors Private Limited. 3E refers to Educate, Empower and Enable. Our vision is to be the most ethical personal finance portal that helps people make great progress with money by educating investors, empowering to make informed decisions and enabling with an online platform to help Plan, Transact and Track your life investments.<br>
                                    CIN # U74140DL2012PTC245046 | ARN # 86903 | Logo Trademark # 2523746 | ISO 9001:2000  Registration # PCMS/QMS/2019-2013
                                </p>
                                <br>

                                <div style="margin: auto; text-align: center; width: 100px">
                                    <script language="JavaScript" type="text/javascript">
                                        TrustLogo("http://www.fincart.com/Plan/images/comodo_sa_52x63_white.png", "SC5", "none");
                                    </script>
                                </div>
                                <br>
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


                </div>

                <!-- -----------------------------------footer fixed starts-->
                <div class="footer-fixed">
                    <div class="footer3">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-4" style="text-align: center;">
                                    <!--<ul class="navbar-nav">
	   <li><a href="#"><img src="howitworks/image/fff.png" alt="fff" style="margin:5px"></a></li>	 
	   <li><a href="#"><img src="howitworks/image/ttt.png" alt="ttt" style="margin:5px"></a></li>	 
	   <li><a href="#"><img src="howitworks/image/inn.png" alt="inn" style="margin:5px"></a></li>	 
	   <li><a href="#"><img src="howitworks/image/ggg.png" alt="ggg" style="margin:5px"></a></li>	 
	   </ul>  
 -->
                                </div>

                                <div class="col-md-8" style="text-align: center; margin-top: 3px;">

                                    <p>
                                        <asp:UpdatePanel ID="UpdatePanelSubscription" runat="server">
                                            <ContentTemplate>
                                                <span style="color: #fff">Call (91) 11 30018181 |</span>
                                                <a href="javascript:void(0);" class="md-trigger" data-modal="Modal-CallMe">Call Me |</a>
                                                <a href="feedback.aspx">Feedback |</a>
                                                <asp:Label ID="subscribeSuccess" runat="server" Style="color: #bdf567;" Text="Subscription Done Successfully" Visible="false"></asp:Label>
                                                <asp:TextBox ID="newsletter" placeholder="Email ID for Newsletter" runat="server" ValidationGroup="subscription" Style="margin-left: 20px; color: #555555"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RFNewsletter" ValidationGroup="subscription" runat="server" ErrorMessage="*" Display="Dynamic" ControlToValidate="newsletter" Style="color: red;"></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2"
                                                    runat="server" ErrorMessage="Please Enter Valid Email ID"
                                                    ValidationGroup="subscription" ControlToValidate="newsletter" Display="Dynamic"
                                                    Style="color: red; font-size: 12px;"
                                                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
                                                </asp:RegularExpressionValidator>
                                                <asp:Button ID="butNewsletter" runat="server" Text="Subscribe" OnClick="butNewsletter_Click1" ValidationGroup="subscription" CssClass="btn btn-warning btn-xs" Style="background-color: #1168d5; border: none;" />
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- -----------------------------------footer fixed ends-->

            </div>
        </div>


        <div class="md-modal md-effect-1" id='Modal-CallMe'>
            <div class="md-content">
                <h3>Call Me Request<span><a href="#" class="md-close" style="text-decoration: none;">X</a></span></h3>
                <div>
                    <asp:UpdatePanel ID="upMain" runat="server">
                        <ContentTemplate>
                            <div id="formtop" runat="server">
                                <asp:TextBox ID="txtCountryCode" Text="+91" runat="server" CssClass="inputfield" Width="40px" MaxLength="3" ReadOnly="true"></asp:TextBox>
                                <asp:TextBox ID="txtMobile" runat="server" MaxLength="10" placeholder="Mobile" class="inputfield" Width="75"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredMobile" runat="server" Display="Dynamic" ValidationGroup="callback" ErrorMessage="*" ControlToValidate="txtMobile" Style="color: red;"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator_mobile" runat="server" ControlToValidate="txtMobile" ErrorMessage="*Invalid Mobile" ValidationExpression="[0-9]{10}" Display="Dynamic" ValidationGroup="callback" Style="color: red; font-size: 12px; transition: all 0.5s ease 0s; width: 50%;"></asp:RegularExpressionValidator>
                                <asp:TextBox ID="txtName" runat="server" placeholder="Name" CssClass="inputfield" Width="120"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredName" runat="server" Display="Dynamic" ValidationGroup="callback" ErrorMessage="*" ControlToValidate="txtName" Style="color: red;"></asp:RequiredFieldValidator>
                                <asp:TextBox ID="txtEmail" runat="server" placeholder="Email" CssClass="inputfield" Width="170"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredEmail" runat="server" Display="Dynamic" ValidationGroup="callback" ErrorMessage="*" ControlToValidate="txtEmail" Style="color: red;"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="validateEmail" runat="server" ErrorMessage="*Invalid Email" ControlToValidate="txtEmail" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$" Display="Dynamic" ValidationGroup="callback" Style="color: red; font-size: 12px; transition: all 0.5s ease 0s; width: 50%;" />
                                <asp:LinkButton ID="CallBackSubmit" runat="server" class="MainButton" ValidationGroup="callback" OnClick="CallBackSubmit_Click">Submit</asp:LinkButton>
                            </div>
                            <asp:Label ID="lblCallBackSubmit" Text="" runat="server"></asp:Label>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>
        <div class="md-overlay"></div>
        <!-- the overlay element -->
        <link href="home-fincart/css/pageroll.css" rel="stylesheet" />
        <script src="home-fincart/js/pageroll.js"></script>
    </form>
    <script>
        if ($.fn.makisu.enabled) {
            var $maki = $('.maki');
            var $taki = $('.taki');
            // Create Makisus
            $maki.makisu({
                selector: 'dd',
                overlap: 0.6,
                speed: 0.85
            });
            $taki.makisu({
                selector: 'dd',
                overlap: 0.6,
                speed: 0.85
            });


            $('#iconFP').hover(function () {
                $('#listFP').css('display', 'block');
                $('.list').makisu('open');
            }, function () {
                $('#divFP').hover(function () {
                    $('#listFP').css('display', 'block');
                }, function () {
                    $('.list').makisu('close');
                    $('#listFP').css('display', 'none');
                })
            })
            
            $('#iconINS').hover(function () {
                $('#listINS').css('display', 'block');
                $('.list').makisu('open');
            }, function () {
                $('#divINS').hover(function () {
                    $('#listINS').css('display', 'block');
                }, function () {
                    $('.list').makisu('close');
                    $('#listINS').css('display', 'none');
                })
            })
        } </script>
    <script>

        $(window).scroll(function () {
            if ($(this).scrollTop() > 400) {
                $('#header').slideDown();
            } else if ($(this).scrollTop() <= 400) {
                $('#header').slideUp();
                $('#subheaderFP').slideUp();
                $('#subheaderINS').slideUp();
                $('#listINS').css('display', 'none');
                $('#listFP').css('display', 'none');
            }
        });

        $('#FP').hover(function () {
            $('#subheaderFP').slideDown();
            $('#subheaderINS').slideUp();
        }, function () {
            $('#subheaderFP').hover(function () {
                $('#subheaderFP').css('diplay', 'block');
            }, function () {
                $('#subheaderFP').slideUp();
            });
        });
        $('#INS').hover(function () {
            $('#subheaderINS').slideDown();
            $('#subheaderFP').slideUp();
        }, function () {
            $('#subheaderINS').hover(function () {
                $('#subheaderINS').css('diplay', 'block');
            }, function () {
                $('#subheaderINS').slideUp();
            });
        });
    </script>
    <script src="modal/js/classie.js"></script>
    <script src="modal/js/modalEffects.js"></script>
    <script>
        // this is important for IEs
        var polyfilter_scriptpath = 'modal/js/';
    </script>
    <script src="modal/js/cssParser.js"></script>
    <script src="modal/js/css-filters-polyfill.js"></script>

    <!--Start of Zopim Live Chat Script-->

    <!--End of Zopim Live Chat Script-->

    <!-- Code for cross browser login check -->
    <script type="text/javascript">
        var clicked = false;
        var xmlHttp
        var browser = navigator.appName;


        function CheckBrowser() {


            if (clicked == false) {
                xmlHttp = GetXmlHttpObject();
                xmlHttp.open("GET", "SessionEnd.aspx", true);
                xmlHttp.onreadystatechange = function () {
                    if (xmlHttp.readyState == 4) {
                        // alert(xmlhttp.responseText)
                    }
                }
                xmlHttp.send(null)
                if (browser == "Chrome") {
                    window.location = "Plan/SessionExpired.aspx";
                    alert("Browser Terminated");
                    openInNewWindow();
                }
            }
            else {
                //alert("Redirected");
                clicked = false;
            }
        }


        function GetXmlHttpObject() {
            var xmlHttp = null;
            try {
                // Firefox, Opera 8.0+, Safari
                xmlHttp = new XMLHttpRequest();
            }
            catch (e) {
                //Internet Explorer
                try {
                    xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
                }
                catch (e) {
                    xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
                }
            }
            return xmlHttp;
        }


        function openInNewWindow() {
            // Change "_blank" to something like "newWindow" to load all links in the same new window
            var newWindow = window.open("Plan/SessionExpired.aspx");
            newWindow.focus();
            return false;
        }


    </script>
</body>
</html>
