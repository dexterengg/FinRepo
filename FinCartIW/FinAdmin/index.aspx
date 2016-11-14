<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="FinAdmin_index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

     
     
    <link href="css/preview.css" rel="stylesheet" />
</head>


<body>
    <form id="form1" runat="server">
     
    <div class="container-fluid">

        <header class="header-bg"> 
         <div class="logo"> 
             <img src="images/fincart.png" />
         </div>
       
        </header>

        <section>
            <div class="container"> 
            <div class="login-form-section" >
                <div class="login-content  animated bounceIn" data-animation="bounceIn">
                    <form>
                        <div class="section-title">
                            <h3>LogIn to your Account</h3>
                        </div>
                        <div class="textbox-wrap">
                            <div class="input-group">
                                <span class="input-group-addon "><i class="icon-user icon-color"></i></span>
                                <input required="required" class="form-control" placeholder="Username" type="text">
                            </div>
                        </div>
                        <div class="textbox-wrap">
                            <div class="input-group">
                                <span class="input-group-addon "><i class="icon-key icon-color"></i></span>
                                <input required="required" class="form-control " placeholder="Password" type="password">
                            </div>
                        </div>
                        <div class="login-form-action clearfix">
                            <div class="checkbox pull-left">
                                <div class="custom-checkbox">
                                    <div class="icheckbox_square-blue checked" style="position: relative;">
                                        <div class="icheckbox_square-blue checked" style="position: relative;">
                                            <input checked="checked" name="iCheck" style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255) none repeat scroll 0% 0%; border: 0px none; opacity: 0;" type="checkbox">
                                            <ins class="iCheck-helper" style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255) none repeat scroll 0% 0%; border: 0px none; opacity: 0;"></ins></div>
                                        <ins class="iCheck-helper" style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255) none repeat scroll 0% 0%; border: 0px none; opacity: 0;"></ins></div>
                                </div>
                                <span class="checkbox-text pull-left">&nbsp;Remember Me</span>
                            </div>
                            <button type="submit" class="btn btn-success pull-right green-btn">LogIn &nbsp; <i class="icon-chevron-right"></i></button>
                        </div>
                    </form>
                </div>
                <div class="login-form-links link1  animated fadeInLeftBig" data-animation="fadeInLeftBig" data-animation-delay=".2s" style="animation-delay: 0.2s;">
                    <h4 class="blue">Don't have an Account?</h4>
                    <span>No worry</span>
                    <a href="#demo2" class="blue">Click Here</a>
                    <span>to Register</span>
                </div>
                <div class="login-form-links link2  animated fadeInRightBig" data-animation="fadeInRightBig" data-animation-delay=".4s" style="animation-delay: 0.4s;">
                    <h4 class="green">Forget your Password?</h4>
                    <span>Dont worry</span>
                    <a href="#demo3" class="green">Click Here</a>
                    <span>to Get New One</span>
                </div>
            </div>
                </div>
        </section>
    </div>
  </form>
</body>
</html>
