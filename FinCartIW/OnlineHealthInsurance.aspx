<%@ Page Title="" Language="C#" MasterPageFile="~/Insurance.master" AutoEventWireup="true" CodeFile="OnlineHealthInsurance.aspx.cs" Inherits="OnlineHealthInsurance" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Fincart | Online Health Insurance</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link href="InsuranceCss/health/css/bootstap.min.css" rel="stylesheet" />
    <link href="InsuranceCss/health/css/layout.css" rel="stylesheet" />


    <script>
        function toggeluser(type) {
            if (type === 'newuser') {
                $('#newuser').slideDown('slow');
                $('#existinguser').slideUp('slow');

                $('#new-customer-no').css('display', 'none');
                $('#new-customer-yes').css('display', 'block');

                $('#existing-customer-yes').css('display', 'none');
                $('#existing-customer-no').css('display', 'block');

            }
            else {
                $('#newuser').slideUp('slow');
                $('#existinguser').slideDown('slow');

                $('#existing-customer-no').css('display', 'none');
                $('#existing-customer-yes').css('display', 'block');

                $('#new-customer-yes').css('display', 'none');
                $('#new-customer-no').css('display', 'block');
            }
        }

        function closepopup() {
            $('#alertpopup').slideUp('slow');
        }
        function loginmsgopen() {
            $('#alertmsglocation')[0].scrollIntoView(true);
            $('#alertmsg').slideDown('slow');
        }
        function loginmsgclose() {
            $('#alertmsg').slideUp('slow');
        }
    </script>

    <style>
        .social {
            width: 60%;
            text-align: center;
            margin-top: 10px;
        }
    </style>


    <!-- Message Modal -->
    <div id="MessageModal" class="modal fade" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Please Register Or Login First!!</h4>
                </div>
            </div>

        </div>
    </div>

    <!-- iframe Modal -->
    <div id="iframeModal" class="modal fade" role="dialog" style="z-index:99999">
        <div class="modal-dialog" style="width: 100%;">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Buy Health Insurance</h4>
                </div>
                <div class="modal-body">
                    <div style="background: url(InsuranceCss/loader.gif) center center no-repeat;">
                        <iframe id="carframe" width="100%" height="600px" frameborder="0" src="http://health.policybazaar.com/partner?frame=true&utm_source=FINCART&utm_medium=STRATPART&utm_term=NOTTOALLOC&utm_campaign=WEBIFRAME&name=<%=Session["LeadName"]!=null?Session["LeadName"].ToString():"" %>&email=<%=Session["LeadEmail"]!=null?Session["LeadEmail"].ToString():"" %>&mobileNo=<%=Session["LeadMobile"]!=null?Session["LeadMobile"].ToString():"" %>"></iframe>
                    </div>
                </div>
            </div>

        </div>
    </div>

    <!-- forgetpass Modal -->
    <div id="forgetpassModal" class="modal fade" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Recover Password</h4>
                </div>
                <div class="modal-body">
                    <label for="email">Email ID</label>
                    <asp:TextBox type="text" name="txtEmailID" runat="server" ID="txtEmailID" class="form-control" placeholder="Email ID" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ErrorMessage="*Email Required" ControlToValidate="txtEmailID" Display="Dynamic" ValidationGroup="forgotp" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ErrorMessage="*Invalid Email" ControlToValidate="txtEmailID" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$" Display="Dynamic" ValidationGroup="forgotp" ForeColor="Red"></asp:RegularExpressionValidator>
                </div>
                <div class="modal-footer">
                    <asp:LinkButton ID="forgetButton" runat="server" ValidationGroup="forgotp" class="form-control btn btn-primary" OnClick="forgetButton_Click">Recover</asp:LinkButton>
                </div>
            </div>

        </div>
    </div>

    <div class="container-fluid banner-img">
        <div id="alertmsglocation"></div>
        <div class="container">
            <div class="row" style="margin-top: 10px; padding-top: 40px">
                <div class="col-md-12">
                    <h3 style="color: #1b1614; text-shadow: 2px 2px 3px #727272;" class="heading-text">We will help you choose the best health insurance plan and 
                        <br />
                        save taxes up to ` 16,500/- </h3>

                    <h3 style="color: #1b1614; text-shadow: 2px 2px 3px #727272;" class="heading-text">Speak with our financial advisors NOW
                    </h3>
                </div>
            </div>


            <div id="logedout" runat="server">
                <div class="row">
                    <div class="col-md-6">

                        <div class="row">
                            <a href="javascript:void(0)" onclick="toggeluser('existinguser')">
                                <div class="col-md-12">
                                    <img src="InsuranceCss/health/images/existing-customer-yes.png" style="float: right;" id="existing-customer-yes">
                                    <img src="InsuranceCss/health/images/existing-customer-no.png" style="float: right; display: none" id="existing-customer-no" />

                                </div>
                            </a>
                        </div>

                    </div>

                    <div class="col-md-6">

                        <div class="row">
                            <a href="javascript:void(0)" onclick="toggeluser('newuser')">
                                <div class="col-md-12">
                                    <img src="InsuranceCss/health/images/new-customer-yes.png" style="float: left; display: none" id="new-customer-yes">
                                    <img src="InsuranceCss/health/images/new-customer-no.png" style="float: left;" id="new-customer-no" />
                                </div>
                            </a>
                        </div>


                    </div>
                </div>


                <div class="row" id="newuser" style="display: none;">
                    <div class="col-md-12">
                        <div class="row" style="border: 1px solid #2c2622; border-radius: 6px">
                            <div class="col-md-3" style="border-right: 1px solid #2c2622; padding: 0px; margin: 0px">
                                <span>
                                    <img src="InsuranceCss/health/images/name-icon.png" style="float: left">
                                </span>
                                <asp:TextBox type="text" name="name" runat="server" placeholder="Your Name" ID="name" class="form-control " ValidationGroup="RegisterInfo" MaxLength="30" Style="width: 74%; float: right; height: 45px; background-color: Transparent; border: none" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="RegisterInfo" Display="Dynamic" ErrorMessage="*Name Required" ControlToValidate="name" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>

                            <div class="col-md-3" style="border-right: 1px solid #2c2622; padding: 0px; margin: 0px">
                                <span>
                                    <img src="InsuranceCss/health/images/mobile-icon.png" style="float: left">
                                </span>
                                <asp:TextBox type="text" name="mobile" ID="mobile" Placeholder="Mobile No." runat="server" class="form-control " MaxLength="10" ValidationGroup="RegisterInfo" Style="width: 74%; float: left; height: 45px; background-color: Transparent; border: none" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="RegisterInfo" Display="Dynamic" ErrorMessage="*Mobile Required" ControlToValidate="mobile" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator_mobile" runat="server" ControlToValidate="mobile" ErrorMessage="*Invalid Mobile" ValidationExpression="[0-9]{10}" Display="Dynamic" ValidationGroup="RegisterInfo" ForeColor="Red"></asp:RegularExpressionValidator>
                            </div>

                            <div class="col-md-3" style="border-right: 1px solid #2c2622; padding: 0px; margin: 0px">
                                <span>
                                    <img src="InsuranceCss/health/images/email-id.png" style="float: left;">
                                </span>
                                <asp:TextBox type="text" name="email" ID="email" runat="server" placeholder="Email Id" class="form-control " ValidationGroup="RegisterInfo" MaxLength="50" Style="width: 74%; height: 45px; background-color: Transparent; border: none" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" Display="Dynamic" runat="server" ValidationGroup="RegisterInfo" ErrorMessage="*Email Required" ControlToValidate="email" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="validateEmail" runat="server" ErrorMessage="*Invalid Email" ControlToValidate="email" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$" Display="Dynamic" ValidationGroup="RegisterInfo" ForeColor="Red"></asp:RegularExpressionValidator>
                            </div>

                            <div class="col-md-3" style="padding: 0px; margin: 0px">
                                <span>
                                    <img src="InsuranceCss/health/images/password-icon.png" style="float: left">
                                </span>
                                <asp:TextBox type="password" name="password" ID="password" runat="server" placeholder="Password" class="form-control " ValidationGroup="RegisterInfo" MaxLength="30" Style="width: 74%; float: left; height: 45px; background-color: Transparent; border: none" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" Display="Dynamic" runat="server" ValidationGroup="RegisterInfo" ErrorMessage="*Password Required" ControlToValidate="password" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>

                        </div>



                        <div class="row">
                            <div class="col-md-6"></div>
                            <div class="col-md-6">
                                <asp:LinkButton ID="RegisterButton" runat="server" ValidationGroup="RegisterInfo" OnClick="RegisterButton_Click"><img src="InsuranceCss/health/images/submit.png" style="float: right; margin-right: 16%; margin-top: 2%;"></asp:LinkButton>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="row" id="existinguser" style="margin-top: 10px">
                    <div class="col-md-6">
                        <div class="row">
                            <div class="col-md-12">
                                <asp:TextBox type="text" name="eusername" runat="server" ID="eusername" class="form-control" placeholder="Email Id" Style="width: 68%; float: right; margin-right: 0px; height: 50px; font-size: 16px; font-weight: 550px; background-color: Transparent;" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="*Email Required" ControlToValidate="eusername" Display="Dynamic" ValidationGroup="SubmitInfo" ForeColor="Red" Style="float: right; margin-right: 35%;"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ErrorMessage="*Invalid Email" ControlToValidate="eusername" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$" Display="Dynamic" ValidationGroup="SubmitInfo" ForeColor="Red" Style="float: right; margin-right: 35%;"></asp:RegularExpressionValidator>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="row">
                            <div class="col-md-12">
                                <asp:TextBox type="password" name="epassword" runat="server" ID="epassword" class="form-control" placeholder="Password" Style="width: 68%; float: left; margin-left: 0px; height: 50px; font-size: 16px; font-weight: 300px; background-color: Transparent" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ErrorMessage="*Password Required" ControlToValidate="epassword" Display="Dynamic" ValidationGroup="SubmitInfo" ForeColor="Red" Style="float: left; margin-left: 30%;"></asp:RequiredFieldValidator>
                            </div>
                        </div>

                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <a href="javascript:void(0);" class="btn btn-link btn-md" data-toggle="modal" data-target="#forgetpassModal">Forget Password?</a>
                        </div>
                        <div class="col-md-6">
                            <asp:LinkButton ID="LoginButton" runat="server" ValidationGroup="SubmitInfo" OnClick="LoginButton_Click"><img src="InsuranceCss/health/images/submit.png" style="float: right; margin-right: 16%; margin-top: 2%;"></asp:LinkButton>
                        </div>
                    </div>

                </div>

                <div class="row" style="margin-top: 2%;">
                    <asp:Label ID="lbl_error" runat="server"></asp:Label>
                </div>

                <div id="alertmsg" class="row" style="margin-top: 2%; display: none;">
                    <div class="panel panel-success" style="color: #ff0000 !important;">
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div style="float: right">
                                        <span onclick="loginmsgclose()" style="cursor: pointer; color: #000 !important;">X</span>
                                    </div>
                                    <div class="text-center">
                                        <b>New User Register and Existing User login !!</b>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>



    </div>

    <!--<----third blue portion------->

    <div class="container-fluid thirt-portion">
        <div class="container">
            <div class="row" style="margin-top: 40px">
                <div class="col-md-12">
                    <div class="row">
                        <div class="col-md-3"></div>
                        <div class="col-md-8">
                            <h4 style="padding: 0px; margin: 0px; color: #27878b; font-weight: 600; font-size: 24px" class="heading-text">GET HIGH MEDICAL INSURANCE COVER </h4>
                            <h1 style="padding: 0px; margin: 0px; color: #248287; font-weight: 400; font-size: 55px" class="heading-text">PAY LOW PREMIUM  </h1>
                            <p class="heading-text" style="font-size: 27px">it doesn't cost much to get an adequate </p>
                        </div>
                        <div class="col-md-1"></div>
                    </div>


                    <div class="row">
                        <div class="col-md-3"></div>
                        <div class="col-md-8">
                            <h4 class="heading-text" style="color: #268188; font-weight: 400; font-size: 22px">HOW YOU WILL BENEFIT ?</h4>
                        </div>
                        <div class="col-md-1"></div>
                    </div>

                    <div class="row">
                        <div class="col-md-3"></div>
                        <div class="col-md-8">
                            <div class="row">
                                <div class="col-md-4">
                                    <img src="InsuranceCss/health/images/low-peremium.PNG" />
                                </div>
                                <div class="col-md-4">
                                    <img src="InsuranceCss/health/images/high-health-img.PNG" />
                                </div>
                                <div class="col-md-4">
                                    <img src="InsuranceCss/health/images/save-tax.PNG" />
                                </div>
                            </div>
                        </div>
                        <div class="col-md-1"></div>
                    </div>

                    <div class="row">
                        <div class="col-md-3"></div>
                        <div class="col-md-8">
                            <asp:Literal ID="lit_buynow1_text" runat="server"></asp:Literal>
                        </div>
                        <div class="col-md-1"></div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-3"></div>
                    <div class="col-md-8">
                        <asp:Literal ID="lit_buynow1" runat="server"></asp:Literal>
                    </div>
                    <div class="col-md-1"></div>
                </div>
            </div>


        </div>
    </div>

    <!--<-----finish third portion------->

    <%--    <div class="container-fluid seven-portion">
        
        <div class="container"> 
        
        <div class="row">
        <div class="col-md-12"> 
        <h2 style="text-align:center; padding-right:100px; padding-bottom:20px">  
        What Out Client Say </h2> 
        </div>
        </div>
        
        <div class="row">
        <div class="col-md-1">  </div>
        <div class="col-md-3">       
        <div class="client-says1"> 
        <p style="text-align:center; color:#09a4f5; line-height:25px; font-size:16px">
        ''  <br> 
        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce non porta nisl. Proin a efficitur odio. Cras fermentum enim ac mi pellentesque, quis tristique ex sollicitudin. Donec semper odio nec justo pretium,  <br> 
        ''
        <br> 
        <span style="color:#323436;"> Neque porro quisquam  <br>  </span>
        </p>
        </div>
        </div>
        <div class="col-md-3">   
        <div class="client-says1"> 
        <p style="text-align:center; color:#09a4f5; line-height:25px; font-size:16px">
        ''  <br> 
        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce non porta nisl. Proin a efficitur odio. Cras fermentum enim ac mi pellentesque, quis tristique ex sollicitudin. Donec semper odio nec justo pretium,  <br> 
        ''
        <br> 
        <span style="color:#323436;"> Neque porro quisquam  <br>  </span>
        </p>
        </div>
        </div>
        <div class="col-md-3">   
        <div class="client-says1"> 
        <p style="text-align:center; color:#09a4f5; line-height:25px; font-size:16px">
        ''  <br> 
        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce non porta nisl. Proin a efficitur odio. Cras fermentum enim ac mi pellentesque, quis tristique ex sollicitudin. Donec semper odio nec justo pretium,  <br> 
        ''
        <br> 
        <span style="color:#323436;"> Neque porro quisquam  <br>  </span>
        </p>
        </div>
        </div>
        <div class="col-md-1">  </div>
        </div>
        </div>
        </div>--%>
    <!--<--------start fourth portion----------->
    <div class="container-fluid fourth-portion">
        <div class="container" style="padding-top: 320px">
            <div class="row">
                <div class="col-md-12">
                    <img src="InsuranceCss/health/images/compare.PNG" />
                </div>
            </div>

            <div class="row">
                <div class="col-md-12">
                    <p style="text-align: center; color: #fff">
                        Many a times we plan to buy medical insurance at a later stage in life,
   thinking that medical insurance may not
                        <br />
                        affect but life is uncertain, don’t keep 
   the risk open. It may happen that one may not  
    get the Health Insurance
                        <br />
                        Cover at a 
   later stage if one is diagnosed with some disease, leaving exposed to sever financial 
   risk.
                    </p>
                </div>
            </div>

            <div class="row">
                <div class="col-md-12">
                    <asp:Literal ID="lit_buynow" runat="server"></asp:Literal>
                </div>
            </div>
        </div>

    </div>

</asp:Content>



