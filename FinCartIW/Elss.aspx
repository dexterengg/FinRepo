<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Elss.aspx.cs" Inherits="Elss" %>

<!DOCTYPE HTML>
<html>
<head runat="server">
<meta charset="utf-8">
<title>Elss</title>

<!-- Metas -->
<meta name="keywords" content="Fincart" />
<meta name="description" content="Business Finance">
<meta name="author" content="Fincart">

<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0;"> <!-- Responsive Meta Tag -->
<meta http-equiv="X-UA-Compatible" content="IE=edge"> <!-- enable media queries for windows phone 8 -->
<meta name="format-detection" content="telephone=no"> <!-- disable auto telephone linking in iOS -->
<!-- Metas end-->

<!-- style sheets -->
          <link rel="stylesheet" href="css/bootstap.min.css">


<link rel="stylesheet" type="text/css" href="elsscss/resources/default_style.css">
<link rel="stylesheet" type="text/css" href="elsscss/resources/normalize.css">


 <link rel='stylesheet'  href="elsscss/css/camera.css" type='text/css' media='all'>

<!-- style sheets end-->

<!-- Favicons -->
<link rel="shortcut icon" href="img/favicon.ico">
<!-- Favicons end-->


 <style>
		
		.fluid_container {
			margin: 40 auto;
			max-width: 1000px;
			width: 90%;
		}
	</style>

<!--[if lt IE 9]>
<script src="dist/html5shiv.js"></script>
<![endif]-->


<!-- scripts -->
<script src="elsscss/js/html5shiv.min.js" type="text/javascript"></script>

<script type='text/javascript' src='elsscss/scripts/jquery.min.js'></script>
    <script type='text/javascript' src='elsscss/scripts/jquery.mobile.customized.min.js'></script>
    <script type='text/javascript' src='elsscss/scripts/jquery.easing.1.3.js'></script> 
    <script type='text/javascript' src='elsscss/scripts/camera.min.js'></script> 
    <script>
        jQuery(function () {

            jQuery('#camera_wrap_1').camera({
                thumbnails: true
            });

            jQuery('#camera_wrap_2').camera({
                height: '400px',
                loader: 'bar',
                pagination: false,
                thumbnails: true
            });
        });
	</script>

      <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</head>

<body>
    <form id="form1" runat="server">
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
                                      <asp:TextBox type="text" name="eusername" runat="server" TabIndex="1" id="eusername" class="form-control"  />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="*Email Required" ControlToValidate="eusername" Display="Dynamic" ValidationGroup="SubmitInfo" ForeColor="Red"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ErrorMessage="*Invalid Email" ControlToValidate="eusername" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$" Display="Dynamic" ValidationGroup="SubmitInfo"  ForeColor="Red"></asp:RegularExpressionValidator>
                                    </div>
                                    <div class="form-group">
                                      <label for="pwd">Password&nbsp;&nbsp;(<a href="javascript:openforgetpass();" class="underlineLink">Forgot Password?</a>)</label>
                                      <asp:TextBox type="password" name="epassword" runat="server" TabIndex="2" id="epassword" class="form-control" />
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ErrorMessage="*Password Required" ControlToValidate="epassword" Display="Dynamic" ValidationGroup="SubmitInfo"  ForeColor="Red"></asp:RequiredFieldValidator>
                                    </div> 
                                    <div class="form-group">                                                                       
                                    <asp:Button id="LoginButton" TabIndex="4" runat="server" class="btn btn-info btn-block" Text="Login" ValidationGroup="SubmitInfo" OnClick="LoginButton_Click" />
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
                                        <asp:TextBox type="text" name="txtEmailID" runat="server" TabIndex="1" id="txtEmailID" class="form-control"  />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ErrorMessage="*Email Required" ControlToValidate="txtEmailID" Display="Dynamic" ValidationGroup="forgotp"  ForeColor="Red"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ErrorMessage="*Invalid Email" ControlToValidate="txtEmailID" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$" Display="Dynamic" ValidationGroup="forgotp"  ForeColor="Red"></asp:RegularExpressionValidator>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-12">
                                    <asp:Button ID="forgetButton" runat="server" Text="Submit" CssClass="btn btn-info btn-block" ValidationGroup="forgotp"  OnClick="forgetButton_Click"/>
                                    </div>
                                </div>
      </div>
    </div>

  </div>
</div>

                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <!-- mainWrap -->
        <div class="mainWrap">

            <!-- siteWrap -->
            <div class="siteWrap">
                <!-- header -->
                <header>
                    <div class="headerContent">
                        <div class="logo">
                            <img src="howitworks/image/logo_fincart_190x55.png" alt="" width="150"></div>
                        <div class="loginStat">Welcome Guest</div>
                        <div class="clearFix"></div>
                        <!--<nav class="menu">
   <ul>
    <li>
   <a href="https://fincart.com/OurStory.aspx">  Our Story </a>    </li>
    <li>
  <a href="https://fincart.com/WorkShop.aspx">  Work Shop </a>    </li>
    <li>
    <a href="https://fincart.com/Plan/Registration.aspx"> Sign Up  </a>    </li>
    <li>
    <a href="https://fincart.com/Plan/Login.aspx">  Sign In  </a>    </li>
   </ul>
  </nav> -->
                        <div class="clearFix"></div>
                    </div>

                </header>
                <!-- header end -->

                <!-- flashContent -->
                <div class="flashContent">
                    <div class="fContent">
                        <img src="elsscss/img/banner.jpg" alt="" class="bannerImg">
                        <h1>Save Tax <span>Upto 46,350* and</span> Create Wealth
                        </h1>

                        <div class="getstartedForm">
                            <div style="margin-bottom: -5px;">
                                <img src="elsscss/img/get-start.png" style="width: 100%;">
                            </div>
                            <input type="text" id="Name" placeholder="Name" runat="server" maxlength="30" ValidationGroup="user"/>
                            <div class="alert-danger" style="text-align: center; border-radius: 5px; margin-top: 2px;background-color:#fff;color:#ff0000;" >
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator_name" runat="server" ErrorMessage="*Name Required" ControlToValidate="Name" Display="Dynamic" ValidationGroup="user"></asp:RequiredFieldValidator>
                                </div>
                            <input type="text" id="Email" placeholder="Email ID" runat="server" maxlength="50" ValidationGroup="user"/>
                            <div class="alert-danger" style="text-align: center; border-radius: 5px; margin-top: 2px;background-color:#fff;color:#ff0000;" >
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator_email" runat="server" ErrorMessage="*Email Required" ControlToValidate="Email" Display="Dynamic" ValidationGroup="user"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="validateEmail" runat="server" ErrorMessage="*Invalid Email" ControlToValidate="Email" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$" Display="Dynamic" ValidationGroup="user" ></asp:RegularExpressionValidator>
                                </div>
                            <input type="text" id="Mobile" placeholder="Mobile No." runat="server" maxlength="10" ValidationGroup="user"/>
                            <div class="alert-danger" style="text-align: center; border-radius: 5px; margin-top: 2px;background-color:#fff;color:#ff0000;" >
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator_Mobile" runat="server" ErrorMessage="*Mobile Required" ControlToValidate="Mobile" Display="Dynamic" ValidationGroup="user"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator_mobile" runat="server" ControlToValidate="Mobile" ErrorMessage="*Invalid Mobile" ValidationExpression="[0-9]{10}" Display="Dynamic" ValidationGroup="user"></asp:RegularExpressionValidator>
                                </div>
                            <input type="password" id="password" placeholder="Password" runat="server" maxlength="30" ValidationGroup="user" style="background: rgba(0, 0, 0, 0) url(elsscss//img/form_input_bg.png) repeat-x scroll 0 0;border: medium none;color: #464646;margin: 5px 0;padding: 13px 10px;width: 378px;"/>
                            <div class="alert-danger" style="text-align: center; border-radius: 5px; margin-top: 2px;background-color:#fff;color:#ff0000;" >
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*Password Required" ControlToValidate="password" Display="Dynamic" ValidationGroup="user"></asp:RequiredFieldValidator>
                                </div>
                            <div class="comodo">
                                <img src="elsscss/img/comodo_logo.jpg" alt="">
                                <span style="color:#FFFFFF; font-size:15px; font-weight:bold; text-align:left; margin:0px; padding-left:9px; padding-right:10px; padding-top:20px;"> 
  Open Your Secure and free online acount </span>
                            </div>
                        <asp:Button ID="btn_submit" runat="server" Text="Experience Now" OnClick="btn_submit_Click" Style="background: rgba(0, 0, 0, 0) url('elsscss/img/button_orange_bg.jpg') repeat-x scroll 0 0;border: medium none;color: #ffffff;font: bold 36px arial;height: 71px;margin: 10px 0;width: 402px;border-radius:4px;" ValidationGroup="user"/>                            
                            <asp:Literal ID="lit_sucess" runat="server" Visible="false"></asp:Literal>
                        </div>
                        <div class="clearFix"></div>
                        <h3>Watch the Slide below to know how it works! </h3>
                    </div>
                </div>
                <!-- flashContent end -->

                <!-- infoVideo -->
                <div class="infoVideo">
                    <div class="vContent">
                        <center>
<div class="fluid_container" style="padding-top:40px">
    	        <div class="camera_wrap camera_azure_skin" id="camera_wrap_1">
            <div data-thumb="elsscss/img/ppt-1.jpg" data-src="elsscss/img/ppt-1.jpg">
<!--                <div class="camera_caption fadeFromBottom">
Fincart<em style="margin-left:20px">Financial Planing</em>
                </div>
 -->            </div>
            <div data-thumb="elsscss/img/ppt-2.jpg" data-src="elsscss/img/ppt-2.jpg">
               <!-- <div class="camera_caption fadeFromBottom">
   What Makes ELSS the Best Tax- Saving 
   <em style="margin-left:20px;"> Investment For Indians?</em>
                </div> -->
            </div>
            <div data-thumb="elsscss/img/ppt-3.jpg" data-src="elsscss/img/ppt-3.jpg">
                <!--<div class="camera_caption fadeFromBottom">
                    <em>It's completely free</em> (even if a donation is appreciated)
                </div>
 -->            </div>
            <div data-thumb="elsscss/img/ppt-4.jpg" data-src="elsscss/img/ppt-4.jpg">
                <!--<div class="camera_caption fadeFromBottom">
                    Camera slideshow provides many options <em>to customize your project</em> as more as possible
                </div>
 -->            </div>
            <div data-thumb="elsscss/img/pppt-5.jpg" data-src="elsscss/img/pppt-5.jpg">
                <!--<div class="camera_caption fadeFromBottom">
                    It supports captions, HTML elements and videos and <em>it's validated in HTML5</em> (<a href="http://validator.w3.org/check?uri=http%3A%2F%2Fwww.pixedelic.com%2Fplugins%2Fcamera%2F&amp;charset=%28detect+automatically%29&amp;doctype=Inline&amp;group=0&amp;user-agent=W3C_Validator%2F1.2" target="_blank">have a look</a>)
                </div> -->
            </div>
            <div data-thumb="elsscss/img/ppt-6.jpg" data-src="elsscss/img/ppt-6.jpg">
<!--                <div class="camera_caption fadeFromBottom">
                    Different color skins and layouts available, <em>fullscreen ready too</em>
                </div>
 -->            </div>


                <div data-thumb="elsscss/img/ppt-7.jpg" data-src="elsscss/img/ppt-7.jpg">
<!--                <div class="camera_caption fadeFromBottom">
                    Different color skins and layouts available, <em>fullscreen ready too</em>
                </div>
 -->            </div>

       

        </div><!-- #camera_wrap_1 -->

    	<!-- #camera_wrap_2 -->
    </div><!-- .fluid_container -->
  </center>
                    </div>
                </div>
                <!-- infoVideo end -->

                <!-- elessknowMore -->
                <div class="elessknowMore" style="height:auto;margin-bottom:-20px;">
                    <h2>The Best Filtered ELSS Schemes...</h2>
                    <input type="button" value="Know More" class="border-radius">
                </div>
                <!-- elessknowMore end -->

                <!-- featurednewsChannels -->
                <div class="featurednewsChannels">
                    <div class="contentCarousel">
                        <h3 style="color: #FFFFFF;">We have been featured in various leading news channels and dalies</h3>
                        <div class="clients" style="width: 100%">
                            <!--<img src="img/clients.jpg" alt="" width="900"> -->
                            <div>
                                <span>
                                    <img src="elsscss/img/awaz-logo.PNG" style="height: 80px; border-color: #c9c8c8; border-radius: 5px">
                                </span>
                                <span>
                                    <img src="elsscss/img/money-control.JPG" style="height: 80px; border-color: #c9c8c8; border-radius: 5px">
                                </span>
                                <span>
                                    <img src="elsscss/img/Zee_Business.png" style="height: 80px; border-color: #c9c8c8; border-radius: 5px">
                                </span>
                                <span>
                                    <img src="elsscss/img/the-times.png" style="height: 80px; border-color: #c9c8c8; border-radius: 5px">
                                </span>
                                <span>
                                    <img src="elsscss/img/the-economic.JPG" style="height: 80px; border-color: #c9c8c8; border-radius: 5px">
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- featurednewsChannels end -->

                <!-- footer -->
                <footer>
                    <div class="footerOnewrap">
                        <div class="footerOne">
                            <p class="footerContent" style="margin-right: 80px; color: #fff;">
                                <span>Reach us at</span><br>
                                T:(+91) 11 3001345456<br>
                                E:info@fincart.com
                                <br>
                                E: careers@fincart.com
                                <br>
                                Call Me
                            </p>
                            <p class="footerContent" style="margin-right: 80px; color: #fff; line-height: 20px">
                                <span>Resources</span><br>
                                Media
                                <br>
                                Blog<br>
                                Video
                            </p>
                            <p class="footerContent" style="margin-right: 80px;">
                                <span>Legal</span><br>
                                <br>
                                Terms of Use
                                <br>
                                Privacy Policy
                            </p>
                            <p class="footerContent">
                                <span>Reviews</span><br>
                                <span style="width: 520px; top: 0px;">
                                    <marquee direction="up" scrollamount="4" onmouseover="this.stop();" onmouseout="this.start();" scrolldelay="5" height="150" style="color: #cccccc; font-size: 0.85em;">
  I like your company services for the following: (1) Dedicated person guiding me on fulfilling my financial needs based on my income (2) Making more effective output on my financial investments (3) Hassle-free transactions and I do not worry about every month's transactions (4) Fincart provides me the complete overview of my investments and provides me the ease to know how my funds are progressing.
<br>
Raghu Amudha, Bengaluru
<br> <br> 
  For a young entrepreneur like myself who is starting a business, Fincart comes across as an ally than just a financial planning company. The USP being the online platform of course that not only provides the detailed accounting of the various investments made but its dynamic natures helps save a significant amount of both my time and energy.
  </marquee>
                                </span>
                            </p>
                        </div>
                        <div class="clearFix"></div>
                    </div>

                    <div class="footerTwowrap">
                        <div class="footerTwo">
                            <p class="footerContent" style="color: #cccccc; font-size: 0.75em; text-align: center;">
                                Fincart is an online initiative of 3E Advisors Private Limited. 3E refers to Educate, Empower and Enable. Our vision is to be the most ethical personal finance portal that helps people make great progress with money by 
                                <br>
                                educating investors, empowering to make informed decisions and enabling with an online platform to help Plan, Transact and Track your life investments.
                                <br>
                                CIN # U74140DL2012PTC245046 | ARN # 86903 | Logo Trademark # 2523746 | ISO 9001:2000 Registration # PCMS/QMS/2019-2013
                            </p>
                            <div class="poweredBy">
                            <a target="_blank" href="https://secure.comodo.com/ttb_searcher/trustlogo?v_querytype=W&v_shortname=SC5&v_search=https://fincart.com/&x=6&y=5">
                                <img src="img/comodo_logo.jpg" alt="">
                            </a></div>
                            <p class="footerContent" style="color: #cccccc; font-size: 0.75em; text-align: center;">
                                Fincart.com TM + C 2012-2015. All rights reserved. Last Update: 15 October 2015
                            </p>
                            <div class="socialConnect" style="padding-bottom:20px;">
                                <center>
   <table align="center" >
    <tr>
     <td>
      <a target="_blank" href="https://www.facebook.com/Fincartfp"><img src="img/facebook.jpg" alt=""></a>
     </td>
     <td>
      <a target="_blank" href="https://www.linkedin.com/start/join?trk=login_reg_redirect&session_redirect=https%3A%2F%2Fwww.linkedin.com%2Fprofile%2Fview%3Fid%3D377256067"><img src="img/linkedin.jpg" alt=""></a>
     </td>
     <td>
      <a target="_blank" href="https://twitter.com/Fincartfp"><img src="img/twitter.jpg" alt=""></a>
     </td>
     <td>
      <a target="_blank" href="https://www.youtube.com/channel/UCPgKy0xW3ysR4aAJkwh0oEg/videos"><img src="img/youtube.jpg" alt=""></a>
     </td>
     <td>
      <a target="_blank" href="https://plus.google.com/+Fincartfpc"><img src="img/google_plus.jpg" alt=""></a>
     </td>
    </tr>
   </table>
   </center>
                            </div>
                        </div>
                    </div>
                      
                      <div class="footer-fixed"> 
                    <div class="footerThreewrap">
                    <div style="width:70%; text-align:right; float:left;"> 
                    <div style="float:right;"> 
                    <div class="footer-fixed1">Call (91) 11 30018181</div>
 <div class="footer-fixed1"> <a href="#" style="color:#fff;text-decoration:none;">Call Me</a> </div>
 <div class="footer-fixed1"><a href="feedback.aspx" style="color:#fff;text-decoration:none;"> Feedback </a></div>
                   </div>
                   </div>

                            <asp:UpdatePanel ID="UpdatePanelSubscription" runat="server">
                    <ContentTemplate>                   
                   
                   <div style="width:auto; float:right; text-align:left; padding-right:100px;"> 
                        <div class="footerThree">


                            <asp:Label ID="subscribeSuccess" runat="server" Text="Subscription Done Successfully" Visible="false" style="color:#b0ec4b;"></asp:Label>
                        <asp:TextBox ID="newsletter" placeholder="Enter Email ID for Newsletter" runat="server" ValidationGroup="subscription" style="margin-left:20px;color:#555555"></asp:TextBox>                        
                        <asp:RequiredFieldValidator ID="RFNewsletter" ValidationGroup="subscription" runat="server" ErrorMessage="*" Display="Dynamic" ControlToValidate="newsletter" style="color:#ff0000;"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" 
                runat="server" ErrorMessage="Please Enter Valid Email ID"
                    ValidationGroup="subscription" ControlToValidate="newsletter" Display="Dynamic"                     
                     style="color:#ff0000;"
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
                    </asp:RegularExpressionValidator>
                        <asp:Button ID="butNewsletter" runat="server" OnClick="butNewsletter_Click" Text="Subscribe" ValidationGroup="subscription" CssClass="btn btn-warning btn-xs" style="background: #1b6ed7 none repeat scroll 0 0;border: medium none;color: #ffffff;font-size: 14px;padding: 5px 10px;cursor:pointer;"/>
                        </div>
                   </div>

                       </ContentTemplate>
                                </asp:UpdatePanel>
                    </div>
                    </div>

                </footer>
                <!-- footer end -->

            </div>
            <!-- siteWrap end -->
        </div>
        <!-- mainWrap end -->

    </form>
    
    <script>
        (function (i, s, o, g, r, a, m) {
            i['GoogleAnalyticsObject'] = r; i[r] = i[r] || function () {
                (i[r].q = i[r].q || []).push(arguments)
            }, i[r].l = 1 * new Date(); a = s.createElement(o),
            m = s.getElementsByTagName(o)[0]; a.async = 1; a.src = g; m.parentNode.insertBefore(a, m)
        })(window, document, 'script', 'https://www.google-analytics.com/analytics.js', 'ga');

        ga('create', 'UA-46302294-1', 'auto');
        ga('send', 'pageview');

</script>
    
</body>
</html>

