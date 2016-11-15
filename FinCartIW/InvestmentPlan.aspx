<%@ Page Language="C#" AutoEventWireup="true" CodeFile="InvestmentPlan.aspx.cs" Inherits="InvestmentPlan" %>

 <!DOCTYPE html>
<html lang="en">
<head runat="server">
  <title>How it Works?</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="howitworks/css/style.css">
  <link rel="stylesheet" href="css/bootstap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="https://arrow.scrolltotop.com/arrow26.js"></script>
  
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
<div class="wrap1">
 <div class="container">
 
 </div>
</div>

<nav class="navbar navbar-inverse navbar-fixed-top" style="background:url(howitworks/image/header-bg.JPG); background-repeat:repeat-x; height:63px; border:none; padding:0px;">
      <div class="container">
        <div class="navbar-header" >
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#" style="padding:0px;"><img src="howitworks/image/logo_fincart_190x55.png" alt="logo" class="img-responsive" style="width:100%; height:48px; margin-top:8px;"></a>
        </div>
        <div id="navbar" class="collapse navbar-collapse" >
         <!-- <ul class="nav navbar-nav navbar-right">
            <li><a href="#contact"><b>Sign UP</b></a></li>
			<li><a href="#contact"><b>Sign IN</b></a></li>
          </ul> -->
        </div><!--/.nav-collapse -->
      </div>
    </nav>

	<div class="slide">
	<div class="container ips-bg" style="border:0px solid #0033CC;"> 
   <div class="row">
   <div class="col-lg-6 col-md-6 col-sm-12 hidden-xs">  
   <table style="text-align:center; width:90%; margin:0 auto; padding:0; margin-top:5px">   
  <tr> 
  <td> <span class="ips-text"> #IPSELFIE  </span> </td>
  </tr>
  <tr> <td> <h2 style=" text-align:left; color:#FFFFFF; font-size:40px; padding:0px; padding-top:10px; margin:0; height:auto;">   
  Your self-constructed Investment Plan    </h2> </td> </tr>
  <tr> <td> <h3 style=" text-align:left; color:#FFFFFF; font-size:23px; padding:12px 0px 15px 0px; margin:0; height:auto; font-weight:normal"> 
  Get your customized Investment Plan in just few clicks </h3>  </td>  </tr>
  <tr>  
  <td> 
  <h3 style=" text-align:left; color:#FFFFFF; font-size:17px; padding:0px; margin:0; height:auto; font-weight:normal"> 
  Simple multiple choice behavioral questions that assess your need & risk tolerance level and
suggests best 3 investment choices based on the analysis and time horizon selected.
   </h3> 
 </td> </tr>
  </table>
   </div>  
   
   <div class="col-lg-6 col-md-6 col-sm-12 hidden-xs" style="padding-top:60px; padding-left:40px;">  
   <img src="howitworks/image/get-start.png" style="height:auto; width:auto;" />
   <table> 
   <tr> 
   <td> 
       
       <input type="text" id="Name" placeholder="NAME" runat="server" maxlength="30" class="input-bg"/>
                            <div class="alert-danger" style="text-align: center; border-radius: 5px; margin-top: 2px;background-color:#fff;color:#ff0000;" >
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator_name" runat="server" ErrorMessage="*Name Required" ControlToValidate="Name" Display="Dynamic" ValidationGroup="user"></asp:RequiredFieldValidator>
                                </div>
   </td>
   </tr>
   <tr> 
      <td> 

          <input type="text" id="Email" placeholder="EMAIL ID" runat="server" maxlength="50" class="input-bg"/>
                            <div class="alert-danger" style="text-align: center; border-radius: 5px; margin-top: 2px;background-color:#fff;color:#ff0000;" >
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator_email" runat="server" ErrorMessage="*Email Required" ControlToValidate="Email" Display="Dynamic" ValidationGroup="user"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="validateEmail" runat="server" ErrorMessage="*Invalid Email" ControlToValidate="Email" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$" Display="Dynamic" ValidationGroup="user" ></asp:RegularExpressionValidator>
                                </div>

      </td>
   </tr>
   <tr> 
      <td> 

<input type="text" id="Mobile" placeholder="MOBILE NO" runat="server" maxlength="10" class="input-bg"/>
                            <div class="alert-danger" style="text-align: center; border-radius: 5px; margin-top: 2px;background-color:#fff;color:#ff0000;" >
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator_Mobile" runat="server" ErrorMessage="*Mobile Required" ControlToValidate="Mobile" Display="Dynamic" ValidationGroup="user"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator_mobile" runat="server" ControlToValidate="Mobile" ErrorMessage="*Invalid Mobile" ValidationExpression="[0-9]{10}" Display="Dynamic" ValidationGroup="user"></asp:RegularExpressionValidator>
                                </div>
      </td>
   </tr>
       <tr> 
      <td> 

<input type="password" id="password" placeholder="PASSWORD" runat="server" maxlength="30" class="input-bg"/>
                            <div class="alert-danger" style="text-align: center; border-radius: 5px; margin-top: 2px;background-color:#fff;color:#ff0000;" >
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="*Password Required" ControlToValidate="password" Display="Dynamic" ValidationGroup="user"></asp:RequiredFieldValidator>
                                </div>
      </td>
   </tr>
  </table>
  
  <div> 
  <table>  
  <tr> 
  <td colspan="" style="text-align:center"> <img src="howitworks/image/comodo_logo.jpg" style="height:50px; width:55px; margin-left:6px;"> </td> 
  <td> 
  <span style="color:#FFFFFF; font-size:15px; font-weight:bold; text-align:left; margin:0px; padding-left:9px; padding-right:10px;"> 
  Open Your Secure and free online acount </span>
 </td>  
  </tr>
  <tr> 
  <td colspan="2"> 
      <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="howitworks/image/exeperience-now.PNG" style="width:373px; height:60px; margin-left:2px; margin-top:10px" OnClick="ImageButton1_Click" ValidationGroup="user" />
                                <asp:Literal ID="lit_sucess" runat="server" Visible="false"></asp:Literal>
      </td>
  </tr>
  </table>
  </div>
   </div>  
   
   
   
  </div>
  
  <%----- hidden-xs -----%>
  
  <div class="row">
   <div class="hidden-lg hidden-md hidden-sm col-xs-12">  
   <table style="text-align:center; width:98%; margin:0 auto; padding:0; margin-top:5px">   
  <tr> 
  <td> <span class="ips-text"> #IPSELFIE  </span> </td>
  </tr>
  <tr> <td> <h2 style=" text-align:left; color:#FFFFFF; font-size:25px; padding:0px; padding-top:10px; margin:0; height:auto;">   
  Your self-constructed Investment Plan    </h2> </td> </tr>
  <tr> <td> <h3 style=" text-align:left; color:#FFFFFF; font-size:20px; padding:12px 0px 15px 0px; margin:0; height:auto; font-weight:normal"> 
  Get your customized Investment Plan in just few clicks </h3>  </td>  </tr>
  <tr>  
  <td> 
  <h3 style=" text-align:left; color:#FFFFFF; font-size:13px; padding:0px; margin:0; height:auto; font-weight:normal"> 
  Simple multiple choice behavioral questions that assess your need & risk tolerance level and
suggests best 3 investment choices based on the analysis and time horizon selected.
   </h3> 
 </td> </tr>
  </table>
   </div>  
   
   <div class="hidden-lg hidden-md hidden-sm col-xs-12" style="padding-top:20px; padding-left:5px;">  
   <img src="howitworks/image/get-start.png" style="height:auto; width:300px;" />
   <table> 
   <tr> 
   <td> 
       <input type="text" id="Namexs" placeholder="NAME" runat="server" maxlength="30" class="input-bg" style="width:290px;"/>
       <div class="alert-danger" style="text-align: center; border-radius: 5px; margin-top: 2px;background-color:#fff;color:#ff0000;" >
       <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*Name Required" ControlToValidate="Namexs" Display="Dynamic" ValidationGroup="userxs"></asp:RequiredFieldValidator>
       </div>
   </td>
   </tr>
   <tr> 
      <td> 

          <input type="text" id="Emailxs" placeholder="EMAIL ID" runat="server" maxlength="50" class="input-bg" style="width:290px;"/>
                            <div class="alert-danger" style="text-align: center; border-radius: 5px; margin-top: 2px;background-color:#fff;color:#ff0000;" >
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*Email Required" ControlToValidate="Emailxs" Display="Dynamic" ValidationGroup="userxs"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="*Invalid Email" ControlToValidate="Emailxs" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$" Display="Dynamic" ValidationGroup="userxs" ></asp:RegularExpressionValidator>
                                </div>

      </td>
   </tr>
   <tr> 
      <td> 

<input type="text" id="Mobilexs" placeholder="MOBILE NO" runat="server" maxlength="10" class="input-bg" style="width:290px;"/>
                            <div class="alert-danger" style="text-align: center; border-radius: 5px; margin-top: 2px;background-color:#fff;color:#ff0000;" >
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*Mobile Required" ControlToValidate="Mobilexs" Display="Dynamic" ValidationGroup="userxs"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="Mobilexs" ErrorMessage="*Invalid Mobile" ValidationExpression="[0-9]{10}" Display="Dynamic" ValidationGroup="userxs"></asp:RegularExpressionValidator>
                                </div>
      </td>
   </tr>
       <tr> 
      <td> 

<input type="password" id="passwordxs" placeholder="PASSWORD" runat="server" maxlength="30" class="input-bg" style="width:290px;"/>
                            <div class="alert-danger" style="text-align: center; border-radius: 5px; margin-top: 2px;background-color:#fff;color:#ff0000;" >
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="*Password Required" ControlToValidate="passwordxs" Display="Dynamic" ValidationGroup="userxs"></asp:RequiredFieldValidator>
                                </div>
      </td>
   </tr>
  </table>
  
  <div> 
  <table>  
  <tr> 
  <td colspan="" style="text-align:center"> <img src="howitworks/image/comodo_logo.jpg" style="height:50px; width:55px; margin-left:6px;"> </td> 
  <td> 
  <span style="color:#FFFFFF; font-size:13px; font-weight:normal; text-align:center; margin:0px; padding-left:9px; padding-right:10px;"> 
  Open Your Secure and free online acount </span>
 </td>  
  </tr>
  <tr> 
  <td colspan="2"> 
      <asp:ImageButton ID="ImageButton3" runat="server" ImageUrl="howitworks/image/exeperience-now.PNG" style="width:280px; height:50px; margin-left:2px; margin-top:10px" OnClick="ImageButton3_Click" ValidationGroup="userxs" />
                                <asp:Literal ID="lit_sucessxs" runat="server" Visible="false"></asp:Literal>
      </td>
  </tr>
  </table>
  </div>
   </div>  
   
   
   
  </div>
  
  

    </div>
    
	<!-- <div class="carousel-caption" id="caption">
        <p class="size">Save Tax</p>
		<p class="size2">Upto 46,350* and</p>
		<p class="size">Create Wealth</p>
      </div> -->
	</div>
    
    <div class="container" style="margin-top:50px; margin-bottom:50px;">
	<div class="row">
    <div class="col-md-12 col-sm-12 col-xs-12">
    <video autoplay = "autoplay" width="100%" style="border-radius:5px; border: solid 10px #cccccc;">
  <source src="howitworks/image/FINCART-v4.mp4" type="video/mp4">
  <source src="howitworks/image/FINCART-v4.ogg" type="video/ogg">
  </video>

<!--<p>
Video courtesy of 
<a href="http://www.bigbuckbunny.org/" target="_blank">Big Buck Bunny</a>.
</p> -->
    
	<!--<div class="vedio">
 <iframe width="100%" height="400" src="https://www.youtube.com/watch?v=XJ1VlXJ3qig&feature=youtu.be" frameborder="0" allowfullscreen></iframe>
	</div> -->
    </div>
    </div>
    </div>
	
    <div class="key-future"> 
    <div class="container">    
    
    <div class="row">   
    <div class="col-md-12 col-sm-12 hidden-xs" style="text-align:left;">  <h2> Key Features </h2>  </div>
    </div>
    
    <div class="row" style="margin-top:30px; padding-left:20px"> 
    <div class="col-md-6 col-sm-12 hidden-xs">   
    <table style="text-align:left; font-family:Verdana, Arial, Helvetica, sans-serif; font-size:20px; font-weight:normal; width:90%;">   
    	<tr style="height:80px;"> 
        <td style="vertical-align: text-top;"> <img src="howitworks/image/key-frame1.PNG">  </td> <td width="10"> </td>   
        <td  style="vertical-align: text-top;"> Be Your Own Advisor  </td>  </tr>
       
        <tr style="height:80px;"> 
        <td style="vertical-align: text-top;"> <img src="howitworks/image/key-frame2.PNG">  </td>  <td width="10"> </td>  
        <td style="vertical-align: text-top;"> Customised Investment Solution </td>  </tr>
        
        <tr style="height:80px;"> 
        <td style="vertical-align: text-top;"> <img src="howitworks/image/key-frame3.PNG">  </td>  <td width="10"> </td>  <td style="vertical-align: text-top;"> The Suggested fund most often not only protect your hard earned money but also 
 delivers better post-tax returns  </td>  </tr>
    </table>
                        
    </div>
       
    <div class="col-md-6 col-sm-12 hidden-xs selfi-bg">   
    <table> 
    <tr> 
    <td colspan="2"> <h2 style="color:#ed1c24; text-align:left; padding:0px; margin:0px;"> Investment Plan Selfie (#IPSELFIE)  </h2>  </td>
    </tr>
    <tr> 
    <td colspan="2">  <span style="color:#FFFFFF; font-size:15px; margin-top:-50px; text-align:center; margin:0px; padding:0px;"> Get Your Investment Plan Now! </span> </td>
    </tr>
    
   <tr> 
   <td colspan="2"> 
       <input type="text" id="Name1" placeholder="NAME" runat="server" maxlength="30" class="investmentinput-bg"/>
             <div class="alert-danger" style="text-align: center; border-radius: 5px; margin-top: 2px;background-color:#fff;color:#ff0000;" >
             <asp:RequiredFieldValidator ID="RequiredFieldValidator_name1" runat="server" ErrorMessage="*Name Required" ControlToValidate="Name1" Display="Dynamic" ValidationGroup="user1"></asp:RequiredFieldValidator>
        </div>
   </td>
   </tr>
   <tr> 
      <td colspan="2"> 
<input type="text" id="Email1" placeholder="EMAIL ID" runat="server" maxlength="50" class="investmentinput-bg"/>
                            <div class="alert-danger" style="text-align: center; border-radius: 5px; margin-top: 2px;background-color:#fff;color:#ff0000;" >
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator_email1" runat="server" ErrorMessage="*Email Required" ControlToValidate="Email1" Display="Dynamic" ValidationGroup="user1"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="validateEmail1" runat="server" ErrorMessage="*Invalid Email" ControlToValidate="Email1" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$" Display="Dynamic" ValidationGroup="user1" ></asp:RegularExpressionValidator>
                                </div>
      </td>
   </tr>
   <tr> 
      <td colspan="2"> 
          <input type="text" id="Mobile1" placeholder="MOBILE NO" runat="server" maxlength="10" class="investmentinput-bg"/>
                            <div class="alert-danger" style="text-align: center; border-radius: 5px; margin-top: 2px;background-color:#fff;color:#ff0000;" >
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator_Mobile1" runat="server" ErrorMessage="*Mobile Required" ControlToValidate="Mobile1" Display="Dynamic" ValidationGroup="user1"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator_mobile1" runat="server" ControlToValidate="Mobile1" ErrorMessage="*Invalid Mobile" ValidationExpression="[0-9]{10}" Display="Dynamic" ValidationGroup="user1"></asp:RegularExpressionValidator>
                                </div>
      </td>
   </tr>
        <tr> 
      <td colspan="2"> 
          <input type="password" id="password1" placeholder="Password" runat="server" maxlength="30" class="investmentinput-bg"/>
                            <div class="alert-danger" style="text-align: center; border-radius: 5px; margin-top: 2px;background-color:#fff;color:#ff0000;" >
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="*Password Required" ControlToValidate="password1" Display="Dynamic" ValidationGroup="user1"></asp:RequiredFieldValidator>
                                </div>
      </td>
   </tr>
   <tr> 
   <td> 
             <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="howitworks/image/know-button.png" style="width:310px; margin-right:10px" OnClick="ImageButton2_Click" ValidationGroup="user1"/>
                                <asp:Literal ID="lit_sucess1" runat="server" Visible="false"></asp:Literal>
   </td>  
   <td>  
   <div>  
   <table>
   	<tr> 
    	<td> <img src="howitworks/image/comodo_logo.jpg" style="height:55px;"> </td> 
        <td> <p style="color:#FFFFFF; text-align:justify; line-height:normal; word-spacing:0.1px;  font-size:9.5px; padding-left:5px;"> 
</p>  </td>

    </tr>
   </table>
   </div>
   </td>
   <td> </td>
   </tr>
   <tr> 
   <td>  </td>
   <td> </td>
   </tr>
  </table>
    </div>
    </div>
    
    <%--...for Mobile Device XS-mobile.....--%>
    
    
    
    <div class="row">   
    <div class="hidden-lg hidden-md hidden-sm col-xs-12" style="text-align:left;">  <h2> Key Features </h2>  </div>
    </div>
    
    <div class="row" style="margin-top:20px; padding-left:5px; padding-right:5px;"> 
    <div class="hidden-lg hidden-md hidden-sm col-xs-12">   
    <table style="text-align:left; font-family:Verdana, Arial, Helvetica, sans-serif; font-size:13px; font-weight:normal; width:96%;">   
    	<tr style="height:80px;"> 
        <td style="vertical-align: text-top;"> <img src="howitworks/image/key-frame1.PNG">  </td> <td width="10"> </td>   
        <td  style="vertical-align: text-top;"> Be Your Own Advisor  </td>  </tr>
       
        <tr style="height:80px;"> 
        <td style="vertical-align: text-top;"> <img src="howitworks/image/key-frame2.PNG">  </td>  <td width="10"> </td>  
        <td style="vertical-align: text-top;"> Customised Investment Solution </td>  </tr>
        
        <tr style="height:80px;"> 
        <td style="vertical-align: text-top;"> <img src="howitworks/image/key-frame3.PNG">  </td>  <td width="10"> </td>  
        <td style="vertical-align: text-top;"> The Suggested fund most often not only protect your hard earned money but also 
 delivers better post-tax returns  </td>  </tr>
    </table>                     
    </div>
       
    <div class=" hidden-lg hidden-md hidden-sm col-xs-12 selfi-bg">   
    <table> 
    <tr> 
    <td colspan="2"> <h2 style="color:#ed1c24; text-align:center; padding:0px; margin:0px; font-size:15px;"> Investment Plan Selfie (#IPSELFIE)  </h2>  </td>
    </tr>
    <tr> 
    <td colspan="2">  <span style="color:#FFFFFF; font-size:12px; margin-top:-50px; text-align:center; margin:0px; padding:0px;"> Get Your Investment Plan Now! </span> </td>
    </tr>
    
   <tr> 
   <td colspan="2"> 
       <input type="text" id="Name1xs" placeholder="NAME" runat="server" maxlength="20" class="investmentinput-bg" style="width:290px;"/>
             <div class="alert-danger" style="text-align: center; border-radius: 5px; margin-top: 2px;background-color:#fff;color:#ff0000;" >
             <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*Name Required" ControlToValidate="Name1xs" Display="Dynamic" ValidationGroup="user1xs"></asp:RequiredFieldValidator>
        </div>
   </td>
   </tr>
   <tr> 
      <td colspan="2"> 
<input type="text" id="Email1xs" placeholder="EMAIL ID" runat="server" maxlength="20" class="investmentinput-bg" style="width:290px;"/>
                            <div class="alert-danger" style="text-align: center; border-radius: 5px; margin-top: 2px;background-color:#fff;color:#ff0000;" >
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*Email Required" ControlToValidate="Email1xs" Display="Dynamic" ValidationGroup="user1xs"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="*Invalid Email" ControlToValidate="Email1xs" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$" Display="Dynamic" ValidationGroup="user1xs" ></asp:RegularExpressionValidator>
                                </div>
      </td>
   </tr>
   <tr> 
      <td colspan="2"> 
          <input type="text" id="Mobile1xs" placeholder="MOBILE NO" runat="server"  class="investmentinput-bg" style="width:290px;"/>
                            <div class="alert-danger" style="text-align: center; border-radius: 5px; margin-top: 2px;background-color:#fff;color:#ff0000;" >
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*Mobile Required" ControlToValidate="Mobile1xs" Display="Dynamic" ValidationGroup="user1xs"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="Mobile1xs" ErrorMessage="*Invalid Mobile" ValidationExpression="[0-9]{10}" Display="Dynamic" ValidationGroup="user1xs"></asp:RegularExpressionValidator>
                                </div>
      </td>
   </tr>
        <tr> 
      <td colspan="2"> 
          <input type="password" id="password1xs" placeholder="PASSWORD" runat="server"  class="investmentinput-bg" style="width:290px;"/>
                            <div class="alert-danger" style="text-align: center; border-radius: 5px; margin-top: 2px;background-color:#fff;color:#ff0000;" >
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="*Password Required" ControlToValidate="password1xs" Display="Dynamic" ValidationGroup="user1xs"></asp:RequiredFieldValidator>
                                </div>
      </td>
   </tr>
   <tr> 
   <td> 
             <asp:ImageButton ID="ImageButton4" runat="server" ImageUrl="howitworks/image/know-button.png" style="width:210px; margin-right:10px" OnClick="ImageButton4_Click" ValidationGroup="user1xs"/>
                                <asp:Literal ID="lit_sucess1xs" runat="server" Visible="false"></asp:Literal>
   </td>  
   <td>  
   <div>  
   <table>
   	<tr> 
    	<td> <img src="howitworks/image/comodo_logo.jpg" style="height:55px;"> </td> 
        <td> <p style="color:#FFFFFF; text-align:justify; line-height:normal; word-spacing:0.1px;  font-size:9.5px; padding-left:5px;"> 
</p>  </td>

    </tr>
   </table>
   </div>
   </td>
   <td> </td>
   </tr>
   <tr> 
   <td>  </td>
   <td> </td>
   </tr>
  </table>
    </div>
    </div>
    
    
    
    </div>
    </div>
    
	<div class="know">
	 <div class="container">
	 <div class="row"> 
	 <div class="col-lg-12 col-md-12 col-sm-12 hidden-xs"> 
	 <h2><b>FinALI-Spreading the light of financial freedom</b></h2>
	  <b class="btn btn-lg"> Preferred panel speaker and columnist across leading electronic & print media.</b>
	 </div>
	 </div>
	 
	 <%--....Mobile-Device------%>
	 
	 <div class="row"> 
	 <div class="hidden-lg hidden-md hidden-sm col-xs-12"> 
	 <h2><b style="font-size:20px;">FinALI-Spreading the light of financial freedom</b></h2>
	  <b class="btn btn-lg" style="text-align:center; font-size:13px;"> Preferred panel speaker and columnist across <br />  leading electronic & print media.</b>
	 </div>
	 </div>
	   
	 </div>
	</div>
	
	<div class="work">
	 <div class="container">
	  <div class="row" style="background-color:#FFFFFF;">
	   <div class="col-md-2 col-sm-6 hidden-xs">
		<img src="howitworks/image/awaz-logo.PNG" class="img-responsive" style="border-radius:5px;" alt="news">  
	   </div>	 
	   <div class="col-md-3 col-sm-6 hidden-xs">
		<img src="howitworks/image/money-control.JPG" class="img-responsive" style="border-radius:5px;" alt="money">  
	   </div>	 
	   <div class="col-md-1 col-sm-6 hidden-xs">
		<img src="howitworks/image/Zee_Business.png" class="img-responsive" style="border-radius:5px;" alt="zee">  
	   </div>	 
	   <div class="col-md-3 col-sm-6 hidden-xs">
		<img src="howitworks/image/the-times.png" class="img-responsive" style="border-radius:5px;" alt="ti">  
	   </div>	 
	   <div class="col-md-3 col-sm-6 hidden-xs">
		<img src="howitworks/image/the-economic.JPG" class="img-responsive" style="border-radius:5px;" alt="te">  
	   </div>	 
	  </div>
	  
	  <%--.....Mobile Device.....--%>
	  
	  <div class="row" style="background-color:#FFFFFF;">
	   <div class="hidden-lg hidden-md hidden-sm col-xs-10">
		<img src="howitworks/image/awaz-logo.PNG" class="img-responsive" style="border-radius:5px; width:auto;" alt="news">  
	   </div>	 
	   <div class="hidden-lg hidden-md hidden-sm col-xs-10">
		<img src="howitworks/image/money-control.JPG" class="img-responsive" style="border-radius:5px; width:auto;" alt="money">  
	   </div>	 
	   <div class="hidden-lg hidden-md hidden-sm col-xs-10">
		<img src="howitworks/image/Zee_Business.png" class="img-responsive" style="border-radius:5px; width:auto" alt="zee">  
	   </div>	 
	   <div class="hidden-lg hidden-md hidden-sm col-xs-10">
		<img src="howitworks/image/the-times.png" class="img-responsive" style="border-radius:5px; width:auto" alt="ti">  
	   </div>	 
	   <div class="hidden-lg hidden-md hidden-sm col-xs-10">
		<img src="howitworks/image/the-economic.JPG" class="img-responsive" style="border-radius:5px; width:auto" alt="te">  
	   </div>	 
	  </div>
	  
	 </div>
	</div>
	
	<div class="footer">
	 <div class="container">
	  <div class="row">
	   <div class="col-md-2 col-sm-2 col-xs-6">
		 <h4>Reach us at</h4>
         <p> 
		 <span>T: (91) 11 30018181</span><br>
		 <a>E: info@fincart.com</a><br>
		 <a>E: careers@fincart.com</a><br>	
		 <a >Call Me</a>
         </p>
	   </div>	 
	   <div class="col-md-2">
		<h4>Resources</h4>
        <p> 
		 <a >Media</a><br>
		 <a >Blog</a>  <br /> 
		 <a>Video</a>
         </p>  
	   </div>	 
	   <div class="col-md-2">
		 <h4>Legal</h4>
         <p>
		 <a>Terms of Use</a><br>
		 <a >Privacy Policy</a>
	    </p>
       </div>	 
	   <div class="col-md-6">
		<h4>Reviews</h4>
		<p>1. The advisors carefully listened and understood my requirements 2. They were patient and professional even             during the free demo phase 3. Advice given based on the needs of the client.
        Nikhil Kumble, Bangalore</p>
	   </div>	 
	  </div>	
     </div>
	</div>
	
	<div class="footer2">
	 <div class="container">
	  <p <p class="footerContent" style="color: #cccccc; font-size: 0.85em; text-align: center;">
Fincart is an online initiative of 3E Advisors Private Limited. 3E refers to Educate, Empower and Enable. Our vision is to be the most ethical personal finance portal that helps people make great progress with money by 
<br> educating investors, empowering to make informed decisions and enabling with an online platform to help Plan, Transact and Track your life investments. <br> 
CIN # U74140DL2012PTC245046 | ARN # 86903 | Logo Trademark # 2523746 | ISO 9001:2000 Registration # PCMS/QMS/2019-2013
  </p>
     
	  <img src="howitworks/image/comodo_logo.jpg" alt="lock" style="width:auto; height:65px; margin:auto;">
	 
     <p class="footerContent" style="color: #cccccc; font-size: 0.85em; text-align: center; margin-top:10px;">
  Fincart.com TM + C 2012-2015. All rights reserved. Last Update: 15 October 2015
  </p>
      
	 </div>
     <div class="socialConnect">
  <center>
   <table align="center">
    <tr>
     <td>
      <a target="_blank" href="https://www.facebook.com/Fincartfp"><img src="howitworks/image/facebook.jpg" alt=""></a>
     </td>
     <td>
      <a target="_blank" href="https://www.linkedin.com/start/join?trk=login_reg_redirect&session_redirect=https%3A%2F%2Fwww.linkedin.com%2Fprofile%2Fview%3Fid%3D377256067">
      <img src="howitworks/image/linkedin.jpg" alt=""></a>
     </td>
     <td>
      <a target="_blank" href="https://twitter.com/Fincartfp"><img src="howitworks/image/twitter.jpg" alt=""></a>
     </td>
     <td>
      <a target="_blank" href="https://www.youtube.com/channel/UCPgKy0xW3ysR4aAJkwh0oEg/videos"><img src="howitworks/image/youtube.jpg" alt=""></a>
     </td>
     <td>
      <a target="_blank" href="https://plus.google.com/+Fincartfpc"><img src="howitworks/image/google_plus.jpg" alt=""></a>
     </td>
    </tr>
   </table>
   </center>	
  </div>
	</div>
	
    
    <div class="footer-fixed">
	<div class="footer3">
	 <div class="container">
	  <div class="row"> 
	   <div class="col-md-6" style="text-align:center;">
	   <!--<ul class="navbar-nav">
	   <li><a href="#"><img src="howitworks/image/fff.png" alt="fff" style="margin:5px"></a></li>	 
	   <li><a href="#"><img src="howitworks/image/ttt.png" alt="ttt" style="margin:5px"></a></li>	 
	   <li><a href="#"><img src="howitworks/image/inn.png" alt="inn" style="margin:5px"></a></li>	 
	   <li><a href="#"><img src="howitworks/image/ggg.png" alt="ggg" style="margin:5px"></a></li>	 
	   </ul>  
 -->	   </div>
		  
	   <div class="col-md-6" style="text-align:center; margin-top:3px;">
               <asp:UpdatePanel ID="UpdatePanelSubscription" runat="server">
                    <ContentTemplate>
       <p>
	   <span>Call (91) 11 30018181 |</span> <a href="#">Call ME |</a> <a href="feedback.aspx">Feedback |</a> 
	    
                        <asp:Label ID="subscribeSuccess" runat="server" Text="Subscription Done Successfully" Visible="false" style="color:#b0ec4b;"></asp:Label>
                        <asp:TextBox ID="newsletter" placeholder=" Enter Email ID" runat="server" ValidationGroup="subscription" style="margin-left:20px;color:#555555"></asp:TextBox>                        
                        <asp:RequiredFieldValidator ID="RFNewsletter" ValidationGroup="subscription" runat="server" ErrorMessage="*" Display="Dynamic" ControlToValidate="newsletter" CssClass="mandatory"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" 
                runat="server" ErrorMessage="Please Enter Valid Email ID"
                    ValidationGroup="subscription" ControlToValidate="newsletter" Display="Dynamic"                     
                    CssClass="mandatoryfooter" 
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
                    </asp:RegularExpressionValidator>
                        <asp:Button ID="butNewsletter" runat="server" OnClick="butNewsletter_Click" Text="Subscribe" ValidationGroup="subscription" CssClass="btn btn-warning btn-xs" style="background-color:#1168d5; border:none;"/>                        

	   </p>
           
                    </ContentTemplate>
                </asp:UpdatePanel>
       </div>	 
	  </div>	
	 </div>
     </div>
	</div>
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
