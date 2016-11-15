<%@ Page Language="C#" AutoEventWireup="true" CodeFile="financialplan.aspx.cs" Inherits="financialplan" %>

<!DOCTYPE html >
<html >

<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title> financial-plan | Fincart</title>
    <link rel="stylesheet" href="Financial-Plan/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="Financial-Plan/css/bootstrap-theme.min.css" type="text/css">
    <link rel="stylesheet" href="Financial-Plan/css/layout.css" type="text/css">
    
    <link href='https://fonts.googleapis.com/css?family=Montserrat' rel='stylesheet' type='text/css'>

    <link href='https://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
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
                                      <label for="pwd">Password&nbsp;&nbsp;(<a href="javascript:openforgetpass();" class="underlineLink" style="color:#23527c;">Forgot Password?</a>)</label>
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

    <header>
    <div class="top-header">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                       <a href="../Default.aspx"><img src="Financial-Plan/images/logo_fincart_190x55.png" style="float: left; height: 45px;"></a> 
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                       <!-- <img src="mentor/images/Mentor_Graphics_Logo.png" style="float: right; height:47px;" />-->
                    </div>
                </div>
            </div>
        </div>
    </header>
    
    
    <banner>
    <div class="scroll-three-bg"> 
        <div class="container">
         <div class="row"> 
         		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="color:#fff;"> 
                <h1> Your Financial Plan Selfie (#FPSelfie) </h1>
                Don’t leave your finances to chances, plan for it.
                </div>
                
            
            <div class="register-bg" style="margin-top:100px; margin-bottom:100px;"> 
            	<div class="row"> 
                	<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                    <img src="Financial-Plan/images/Financial-Planning-Pyramid.png" class="img-responsive">
                    </div>
                    
                    <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                            <div class="form-group" style="margin-top:30px;">
                                <input type="text" id="Name1" class="form-control" placeholder="Name..." runat="server" maxlength="30" style="width:60%;">
                                <div class="alert-danger" style="text-align: center; border-radius: 5px; margin-top: 2px;width:60%;">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*Name Required" ControlToValidate="Name1" Display="Dynamic" ValidationGroup="Reg"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="form-group">
                                <input type="text" id="Email1" class="form-control" placeholder="Email..." runat="server" maxlength="30" style="width:60%;">
                                <div class="alert-danger" style="text-align: center; border-radius: 5px; margin-top: 2px;width:60%;">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*Email Required" ControlToValidate="Email1" Display="Dynamic" ValidationGroup="Reg"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="*Invalid Email" ControlToValidate="Email1" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$" Display="Dynamic" ValidationGroup="Reg" />
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="input-group">
                                    <div class="input-group-addon">
                                        +91
                                    </div>
                                    <input type="text" id="Mobile1" class="form-control" placeholder="Mobile..." runat="server" maxlength="10" style="width:55%;">
                                </div>
                                <div class="alert-danger" style="text-align: center; border-radius: 5px; margin-top: 2px;width:60%;">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="*Mobile Required" ControlToValidate="Mobile1" Display="Dynamic" ValidationGroup="Reg"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="Mobile1" ErrorMessage="*Invalid Mobile" ValidationExpression="[0-9]{10}" Display="Dynamic" ValidationGroup="Reg"></asp:RegularExpressionValidator>
                                </div>
                            </div>
                            <div class="form-group">
                                <input type="password" id="Password1" class="form-control" placeholder="Password..." runat="server" maxlength="15" style="width:60%;">
                                <div class="alert-danger" style="text-align: center; border-radius: 5px; margin-top: 2px;width:60%;">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="*Password Required" ControlToValidate="Password1" Display="Dynamic" ValidationGroup="Reg"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="form-group" style="width:60%;">
                                <asp:Literal ID="lit_sucess1" runat="server" Visible="false"></asp:Literal>
                                </div>
                           <div style="background-color:#666666; float:left;">
                                <asp:Button ID="btn_submit1" runat="server" Text="Experience Now" OnClick="btn_submit1_Click" CssClass="btn btn-primary" ValidationGroup="Reg" Style="background: #0db9f0 none repeat scroll 0 0; border: 0 none; border-radius: 4px; box-shadow: none; color: #fff; font-family: 'Roboto',sans-serif; font-size: 16px; font-weight: 300; height: 50px; line-height: 50px; margin: 0; padding: 0 20px; text-shadow: none; transition: all 0.3s ease 0s; vertical-align: middle;" />
                               </div>
                            
                               </div>

                   </div>
                </div>
            </div>
            </div>
         </div>
    
    
    </banner>
    
    
    

     
    
    <!--<secod-scrollfinish------------->

    <artical>
	<div class="container">
    <div class="row"> 
    <div class="col-lg-1"> </div>
         <div class="col-lg-10">    
            <h2 style="color:#40a2f5; text-decoration:none; text-align:center; font-size:25px;"> <u> Goals – define to achieve more </u> </h2>    
            <p style="text-align:left;"> 
            An interesting study was conducted with 100 students of the Harvard University – batch of 1997. <br />  Each student were asked 2 questions – 
            </p>
        </div>  
        <div class="col-lg-1"> </div>  
    </div>
    <div class="row">
    <div class="col-lg-1">  </div>
    <div class="col-lg-10">
    	<table style="text-align:left; margin-left:0px;">
        <tr> 
         <td width="40"> <img src="Financial-Plan/images/number-1.png" class="img-responsive" style="height:30px;"> </td>   
         <td style="padding-left:10px;"> If they had planned any Goal </td>  <td width="100">  </td>   
        </tr>
        
        <tr> 
        <td width="40"> <img src="Financial-Plan/images/number-2.PNG" class="img-responsive" style="height:30px; margin-top:5px;"> </td>   
         <td style="padding-left:10px;">	Did they write these Goals down?  </td>
        </tr>
        
        </table>
    </div>
    <div class="col-lg-1">  </div>
    </div>
    
    <div class="row" style="margin-top:50px;">
    <div class="col-lg-1"> </div> 
    <div class="col-lg-10" style="text-align:left;"> <b> The batch finally got segregated into 3 batches – </b> </div>
    <div class="col-lg-1"> </div>
    </div>
    
    <div class="row"> 
    <div class="col-lg-1"> </div>
    <div class="col-lg-10"> 
    <table  style="text-align:left;"> 
    <tr> 
    <td width="20"> A. </td> <td> There were 84 students who did not have any set Goals. </td>
    </tr>
    <tr> 
    <td width="20"> B. </td> <td> There were 13 students who had set Goals but they did not write or planned a road-map </td>
    </tr>
    <tr> 
    <td width="20"> C. </td> <td> Only 3 students had Written Goals. </td>
    </tr>
    </table>
    </div>
    <div class="col-lg-1"> </div>
    </div>
    
    <div class="row" style="margin-top:50px;"> 
    <div class="col-lg-1"> </div>
    <div class="col-lg-11"> 
   <p style="text-align:left;">
    After 10 years the team assessed how these students fared in life. The students who had merely decided some Goals in their mind achieved twice as much as their counter-parts who did not have any Goals but the students who had Goals and had written them down achieved 10 times more than the entire A + B groups put together.  
    </p>
    </div>
    </div>
    
    
   
    <div class="row">
    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12"> 
    <u style="color:#0099FF; font-weight:bold;"> Group I </u> <br />
    <img src="Financial-Plan/images/aero-1.PNG"> <br /> 
    <p style="color:#616261; font-weight:600"> Achieved "X" </p>
    </div>
    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12"> 
    <u style="color:#0099FF; font-weight:bold;"> Group II </u> <br />
    <img src="Financial-Plan/images/aero-2.PNG"> <br /> 
    <p style="color:#616261; font-weight:600"> Achieved "2X" </p>
    </div>
    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12"> 
    <u style="color:#0099FF; font-weight:bold;"> Group III </u> <br />
    <img src="Financial-Plan/images/aero-3.PNG"> <br /> 
    <p style="color:#616261; font-weight:600"> Achieved 10 times more than I & II group put together   </p>
     </div>
    </div>
    
	</div>
    </artical>


   <div class="container-fluid key-future">
        <div class="container">
            <div style="margin-top: 100px; margin-bottom: 30px;" class="register-bg">
                <div class="row">
                    <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12">
                        <table>
                            <tr>
                                <td colspan="2">
                                    <h2>Start your Financial Progress Now with Tanwir Alam </h2>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <img src="Financial-Plan/images/tanwir.png" />
                                </td>
                                <td>
                                    <p style="text-align: justify; padding: 0px 25px 0px 25px;">
                                        Elite Panel Speaker with <a style="color: #00aeef; font-weight: bold">
                                        http://www.moneycontrol.com/ </a>
                                        <br />
                                        Preferred Speaker with 
            
             <a style="color: #00aeef; font-weight: bold">CNBC TV18, CNBC Awaaz, Zee Business. </a>Preferred Columnist with leading print media 
                                    </p>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <h2>If you have any query speak to our advisors at</h2>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <h2>011-30018181 </h2>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <h2> 
                                    Or 
                                    <br /> <br /> 
                                    Drop an email at Info@fincart.com
                                    </h2>
                                </td>
                            </tr>
                        </table>
                    </div>

                    <div class="col-lg-5 col-md-5 col-sm-12 col-xs-12">
                        <table>
                                <tr>
                                    <td style="padding-bottom: 10px;">
                                        <img src="Financial-Plan/images/get-start.png" class="img-responsive">
                                    </td>
                                </tr>
          
          <tr> 
         <td> 
       
       <input type="text" id="Name" placeholder="NAME" runat="server" maxlength="30" class="input-bg"/>
                            <div class="alert-danger" style="text-align: center; border-radius: 5px; margin-top: 2px;background-color:#fff;color:#ff0000;" >
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*Name Required" ControlToValidate="Name" Display="Dynamic" ValidationGroup="user"></asp:RequiredFieldValidator>
                                </div>
   </td>
   </tr>
   <tr> 
      <td> 

          <input type="text" id="Email" placeholder="EMAIL ID" runat="server" maxlength="50" class="input-bg"/>
                            <div class="alert-danger" style="text-align: center; border-radius: 5px; margin-top: 2px;background-color:#fff;color:#ff0000;" >
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*Email Required" ControlToValidate="Email" Display="Dynamic" ValidationGroup="user"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="*Invalid Email" ControlToValidate="Email" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$" Display="Dynamic" ValidationGroup="user" ></asp:RegularExpressionValidator>
                                </div>

      </td>
   </tr>
   <tr> 
      <td> 

<input type="text" id="Mobile" placeholder="MOBILE NO" runat="server" maxlength="10" class="input-bg"/>
                            <div class="alert-danger" style="text-align: center; border-radius: 5px; margin-top: 2px;background-color:#fff;color:#ff0000;" >
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*Mobile Required" ControlToValidate="Mobile" Display="Dynamic" ValidationGroup="user"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="Mobile" ErrorMessage="*Invalid Mobile" ValidationExpression="[0-9]{10}" Display="Dynamic" ValidationGroup="user"></asp:RegularExpressionValidator>
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
                    <tr>
                    <td style="padding-top: 10px;">                    
                   <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="Financial-Plan/images/exeperience-now.PNG" style="width:373px; height:60px; margin-left:2px; margin-top:10px" OnClick="ImageButton1_Click" ValidationGroup="user" />
                                <asp:Literal ID="lit_sucess" runat="server" Visible="false"></asp:Literal>
                    </td>
                    </tr>
                    </tbody>
                    </table>
                    </div>
                </div>

                <div class="row">
                <div class="col-lg-12" style="padding-top: 10px;">
                     <!--Detailed Tax E-filling Worth <span class="amount-cros"> Rs 1149/- </span>  FREE - Ask us how you can avail this for FREE.-->
        Financial Planning worth <span class="amount-cros"> Rs 1149/- </span> Rs. 999 free (limited period)
                <h2 style="text-align: center;">*Note : We are not selling any financial Products or services! </h2>
                </div>
                </div>
                </div>
                </div>
                </div>
         



    <div class="know" style="background-color: #fff; color: #248ce4">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12 hidden-sm hidden-xs">
                    <h2 style="text-align: center; color: #248ce4; font-size: 25px;">FinALI-Spreading the light of financial freedom </h2>
                    <b class="btn btn-lg" style="color: #248ce4; font-size: 20px;">Preferred panel speaker and columnist across leading electronic &amp; print media.</b>
                </div>
            </div>


            <div class="row">
                <div class="hidden-lg hidden-md col-sm-12 col-xs-12">
                    <h2 style="text-align: center; color: #248ce4; font-size: 20px;">FinALI –Seperading the light of financial freedom </h2>
                    <b class="btn btn-lg" style="text-align: center; font-size: 17px;">Preferred panel speaker and columnist across
                        <br>
                        leading electronic &amp; print media.</b>
                </div>
            </div>
        </div>
    </div>


    <div class="work">
        <div class="container">

            <div class="row" style="background-color: #FFFFFF;">
                <div class="col-md-2 col-sm-6 hidden-xs">
                    <img src="Financial-Plan/images/awaz-logo.PNG" class="img-responsive" style="border-radius: 5px; height: 90px" alt="news">
                </div>
                <div class="col-md-3 col-sm-6 hidden-xs">
                    <img src="Financial-Plan/images/money-control.JPG" class="img-responsive" style="border-radius: 5px;" alt="money">
                </div>
                <div class="col-md-1 col-sm-6 hidden-xs">
                    <img src="Financial-Plan/images/Zee_Business.png" class="img-responsive" style="border-radius: 5px;" alt="zee">
                </div>
                <div class="col-md-3 col-sm-6 hidden-xs">
                    <img src="Financial-Plan/images/the-times.png" class="img-responsive" style="border-radius: 5px;" alt="ti">
                </div>
                <div class="col-md-3 col-sm-6 hidden-xs">
                    <img src="Financial-Plan/images/the-economic.JPG" class="img-responsive" style="border-radius: 5px;" alt="te">
                </div>
            </div>

           

            <div class="row" style="background-color: #FFFFFF;">
                <div class="hidden-lg hidden-md hidden-sm col-xs-6">
                    <img src="Financial-Plan/images/awaz-logo.PNG" class="img-responsive" style="border-radius: 5px; width: auto;  text-align:center;" alt="news" >
                </div>
                <div class="hidden-lg hidden-md hidden-sm col-xs-6">
                    <img src="Financial-Plan/images/money-control.JPG" class="img-responsive" style="border-radius: 5px; width: auto; text-align:center;" alt="money">
                </div>
                <div class="hidden-lg hidden-md hidden-sm col-xs-6">
                    <img src="Financial-Plan/images/Zee_Business.png" class="img-responsive" style="border-radius: 5px; width: auto; text-align:center;" alt="zee">
                </div>
                <div class="hidden-lg hidden-md hidden-sm col-xs-6">
                    <img src="Financial-Plan/images/the-times.png" class="img-responsive" style="border-radius: 5px; width: auto; text-align:center;" alt="ti">
                </div>
                <div class="hidden-lg hidden-md hidden-sm col-xs-6">
                    <img src="Financial-Plan/images/the-economic.JPG" class="img-responsive" style="border-radius: 5px; width: auto; text-align:center;" alt="te">
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
                        <a>T: (91) 11 30018181</a><br>
                        <a>E: info@fincart.com</a><br>
                        <a>E: careers@fincart.com</a><br>
                        <a>Call Me</a>
                    </p>
                </div>
                <div class="col-md-2 col-sm-2 col-xs-6">
                    <h4>Resources</h4>
                    <p>
                        <a>Media</a><br>
                        <a>Blog</a>
                        <br>
                        <a>Video</a>
                    </p>
                </div>
                <div class="col-md-2 col-sm-6 col-xs-6">
                    <h4>Legal</h4>
                    <p>
                        <a>Terms of Use</a><br>
                        <a>Privacy Policy</a>
                    </p>
                </div>
                <div class="col-md-6 col-sm-6 col-xs-6">
                    <h4>Reviews</h4>
                    <p class="font-text">
                        <marquee behavior="scroll" direction="up" scrollamount="2"> 
		1. The advisors carefully listened and understood my requirements 2. They were patient and professional even             during the free demo phase 3. Advice given based on the needs of the client.
        Nikhil Kumble, Bangalore
        </marquee>
                    </p>
                </div>
            </div>
        </div>
    </div>


    <div class="footer-fixed">
        <div class="footer3">
            <div class="container">
                <div class="row">
                    <div class="col-md-6" style="text-align: center;">
                        <!--<ul class="navbar-nav">
	   <li><a href="#"><img src="howitworks/image/fff.png" alt="fff" style="margin:5px"></a></li>	 
	   <li><a href="#"><img src="howitworks/image/ttt.png" alt="ttt" style="margin:5px"></a></li>	 
	   <li><a href="#"><img src="howitworks/image/inn.png" alt="inn" style="margin:5px"></a></li>	 
	   <li><a href="#"><img src="howitworks/image/ggg.png" alt="ggg" style="margin:5px"></a></li>	 
	   </ul>  
 -->
                    </div>

                    <div class="col-md-6" style="text-align: center; margin-top: 3px;">
                        <div id="UpdatePanelSubscription">

                            <p class="font-text">
                                <span>Call (91) 11 30018181 |</span> <a href="#">Call ME |</a> <a href="feedback.aspx">Feedback |</a>


                                <input name="newsletter" type="text" id="newsletter" placeholder=" Enter Email ID" style="margin-left: 20px; color: #555555">
                                <span id="RFNewsletter" class="mandatory" style="display: none;">*</span>
                                <span id="RegularExpressionValidator2" class="mandatoryfooter" style="display: none;">Please Enter Valid Email ID</span>
                                <input type="submit" name="butNewsletter" value="Subscribe" onClick="javascript:WebForm_DoPostBackWithOptions(new WebForm_PostBackOptions(&quot;butNewsletter&quot;, &quot;&quot;, true, &quot;subscription&quot;, &quot;&quot;, false, false))" id="butNewsletter" class="btn btn-warning btn-xs" style="background-color: #1168d5; border: none;">
                            </p>


                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

           </form>
</body>




</html>

