<%@ Page Title="" Language="C#" MasterPageFile="~/Insurance.master" AutoEventWireup="true" CodeFile="OnlineCarInsurance.aspx.cs" Inherits="OnlineCarInsurance" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Fincart | Online Car Insurance</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
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
    </script>

    <style>
        .btn-warning {
            color: #fff;
            background-color: #28729e;
            border-color: #7bc1e7;
            margin-bottom: 20px;
        }

            .btn-warning :hover {
                color: #fff;
                background-color: #fff;
                border-color: #7bc1e7;
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
    <div id="iframeModal" class="modal fade" role="dialog">
        <div class="modal-dialog" style="width: 100%;">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Buy Car Insurance</h4>
                </div>
                <div class="modal-body">
                    <div style="background: url(InsuranceCss/loader.gif) center center no-repeat;">
                        <iframe id="carframe" width="100%" height="600px" frameborder="0" src="http://partners.policybazaar.com/question?utm_source=FINCART&utm_medium=STRATPART&utm_term=NOTTOALLOC&utm_campaign=WEBIFRAME&name=<%=Session["LeadName"]!=null?Session["LeadName"].ToString():"" %>&email=<%=Session["LeadEmail"]!=null?Session["LeadEmail"].ToString():"" %>&mobileNo=<%=Session["LeadMobile"]!=null?Session["LeadMobile"].ToString():"" %>"></iframe>
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
                    <asp:TextBox type="text" name="txtEmailID" runat="server" ID="txtEmailID" class="form-control" placeholder="Email ID" Style="width: 83%" />
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
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h2>Choose Your <span style="font-weight: bold">Auto Insurance </span></h2>
                </div>
            </div>

            <div class="row">
                <div class="col-md-5">
                    <img src="InsuranceCss/images/car.png" style="float: right;">
                </div>
                <div class="col-md-2">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </div>
                <div class="col-md-5">
                    <img src="InsuranceCss/images/two-wheeler.png" style="float: left;">
                </div>
            </div>

            <div class="row">
                <div class="col-md-5">
                    <span class="radio" style="float: right; margin-bottom: 12%; margin-right: 9%">
                        <asp:RadioButton ID="RadioButtonCar" runat="server" Checked="true" />
                    </span>
                </div>
                <div class="col-md-2">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </div>
                <div class="col-md-5">
                    <span class="radio" style="float: left; margin-bottom: 12%; margin-left: 25%">
                        <asp:RadioButton ID="RadioButtonTwowheeler" runat="server" OnCheckedChanged="RadioButtonTwowheeler_CheckedChanged" AutoPostBack="true" />
                    </span>
                </div>
            </div>

            <div id="logedout" runat="server">
                <div class="row">
                    <div class="col-md-6">

                        <div class="row">
                            <a href="javascript:void(0)" onclick="toggeluser('existinguser')">
                                <div class="col-md-12">
                                    <img src="InsuranceCss/images/existing-customer-yes.png" style="float: right;" id="existing-customer-yes">
                                    <img src="InsuranceCss/images/existing-customer-no.png" style="float: right; display: none" id="existing-customer-no" />

                                </div>
                            </a>
                        </div>

                    </div>

                    <div class="col-md-6">

                        <div class="row">
                            <a href="javascript:void(0)" onclick="toggeluser('newuser')">
                                <div class="col-md-12">
                                    <img src="InsuranceCss/images/new-customer-yes.png" style="float: left; display: none" id="new-customer-yes">
                                    <img src="InsuranceCss/images/new-customer-no.png" style="float: left;" id="new-customer-no" />
                                </div>
                            </a>
                        </div>


                    </div>
                </div>


                <div class="row" id="newuser" style="display: none; margin-top: 20px">
                    <div class="col-md-12">
                        <div class="row" style="background-color: #2698d4; border-radius: 5px; padding-top: 1px">
                            <div class="col-md-3" style="border-right: 1px solid #2985b8; padding: 0px; margin: 0px">
                                <span>
                                    <img src="InsuranceCss/images/name-icon.png" style="float: left; border-radius: 8px;">
                                </span>
                                <asp:TextBox type="text" name="name" runat="server" placeholder="Your Name" ID="name" class=" new-cutomer-input" ValidationGroup="RegisterInfo" MaxLength="30" Style="width: 79%; float: left; height: 46px; color: #fff" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="RegisterInfo" Display="Dynamic" ErrorMessage="*Name Required" ControlToValidate="name" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                            <div class="col-md-3" style="border-right: 1px solid #2985b8; padding: 0px; margin: 0px">
                                <span>
                                    <img src="InsuranceCss/images/mobile-icon.png" style="float: left;">
                                </span>
                                <asp:TextBox type="text" name="mobile" ID="mobile" Placeholder="Mobile No." runat="server" class=" new-cutomer-input" MaxLength="10" ValidationGroup="RegisterInfo" Style="width: 79%; height: 46px; color: #fff" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="RegisterInfo" Display="Dynamic" ErrorMessage="*Mobile Required" ControlToValidate="mobile" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator_mobile" runat="server" ControlToValidate="mobile" ErrorMessage="*Invalid Mobile" ValidationExpression="[0-9]{10}" Display="Dynamic" ValidationGroup="RegisterInfo" ForeColor="Red"></asp:RegularExpressionValidator>
                            </div>

                            <div class="col-md-3" style="background-color: #2698d4; border-right: 1px solid #2985b8; padding: 0px; margin: 0px">
                                <span>
                                    <img src="InsuranceCss/images/email-id.png" style="float: left;">
                                </span>
                                <asp:TextBox type="text" name="email" ID="email" runat="server" placeholder="Email Id" class=" new-cutomer-input" ValidationGroup="RegisterInfo" MaxLength="50" Style="width: 79%; float: right; height: 46px; color: #fff" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" Display="Dynamic" runat="server" ValidationGroup="RegisterInfo" ErrorMessage="*Email Required" ControlToValidate="email" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="validateEmail" runat="server" ErrorMessage="*Invalid Email" ControlToValidate="email" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$" Display="Dynamic" ValidationGroup="RegisterInfo" ForeColor="Red"></asp:RegularExpressionValidator>
                            </div>

                            <div class="col-md-3" style="border-radius: 5px; padding: 0px; margin: 0px">
                                <span>
                                    <img src="InsuranceCss/images/password-icon.png" style="float: left;">
                                </span>
                                <asp:TextBox type="password" name="password" ID="password" runat="server" placeholder="Password" class=" new-cutomer-input" ValidationGroup="RegisterInfo" MaxLength="30" Style="width: 79%; float: left; height: 46px; color: #fff" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" Display="Dynamic" runat="server" ValidationGroup="RegisterInfo" ErrorMessage="*Password Required" ControlToValidate="password" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>


                        </div>



                        <div class="row">
                            <div class="col-md-6"></div>
                            <div class="col-md-6">
                                <asp:LinkButton ID="RegisterButton" runat="server" ValidationGroup="RegisterInfo" OnClick="RegisterButton_Click"><img src="InsuranceCss/images/submit.png" style="float: right; margin-right: 16%; margin-top: 2%;"></asp:LinkButton>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="row" id="existinguser">
                    <div class="col-md-6">
                        <div class="row">
                            <div class="col-md-12">
                                <asp:TextBox type="text" name="eusername" runat="server" ID="eusername" class="form-control" placeholder="Email Id" Style="width: 68%; float: right; margin-right: 4px; height: 50px; font-size: 16px; font-weight: 550px;" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="*Email Required" ControlToValidate="eusername" Display="Dynamic" ValidationGroup="SubmitInfo" ForeColor="Red" Style="float: right; margin-right: 35%;"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ErrorMessage="*Invalid Email" ControlToValidate="eusername" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$" Display="Dynamic" ValidationGroup="SubmitInfo" ForeColor="Red" Style="float: right; margin-right: 35%;"></asp:RegularExpressionValidator>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="row">
                            <div class="col-md-12">
                                <asp:TextBox type="password" name="epassword" runat="server" ID="epassword" class="form-control" placeholder="Password" Style="width: 68%; float: left; margin-left: 4px; height: 50px; font-size: 16px; font-weight: 550px;" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ErrorMessage="*Password Required" ControlToValidate="epassword" Display="Dynamic" ValidationGroup="SubmitInfo" ForeColor="Red" Style="float: left; margin-left: 30%;"></asp:RequiredFieldValidator>
                            </div>
                        </div>

                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <a href="javascript:void(0);" class="btn btn-link btn-md" data-toggle="modal" data-target="#forgetpassModal">Forget Password?</a>
                        </div>
                        <div class="col-md-6">
                            <asp:LinkButton ID="LoginButton" runat="server" ValidationGroup="SubmitInfo" OnClick="LoginButton_Click"><img src="InsuranceCss/images/submit.png" style="float: right; margin-right: 16%; margin-top: 2%;"></asp:LinkButton>
                        </div>
                    </div>

                </div>

                <div class="row" style="margin-top: 2%;">
                    <asp:Label ID="lbl_error" runat="server"></asp:Label>
                </div>
            </div>
        </div>

    </div>

    <!--<----third blue portion------->

    <div class="container-fluid thirt-portion">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h3 style="color: #fff; font-weight: normal;">Save money by Getting Quotes </h3>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <img src="InsuranceCss/images/Get-lowst.png">
                </div>
                <div class="col-md-4">
                    <img src="InsuranceCss/images/claims-support.png">
                    <div id="logedin" runat="server">
                        <div class="row">
                            <div class="col-md-12">
                                <asp:Literal ID="lit_buynow" runat="server"></asp:Literal>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <img src="InsuranceCss/images/express-claims.png">
                </div>
            </div>
        </div>
    </div>

    <!--<-----finish third portion------->
    <!--<--------start fourth portion----------->
    <div class="container-fluid fourth-portion">
        <div class="row">
            <div class="col-md-12">
                <h3>By Confidently  </h3>
            </div>
        </div>

        <div class="row">
            <div class="col-md-6">
                <img src="InsuranceCss/images/logos-name.png" style="float: right;">
            </div>

            <div class="col-md-6">
                <img src="InsuranceCss/images/logos-name-2.png" style="float: left;">
            </div>
        </div>

        <div class="row">
            <div class="col-md-6">
                <img src="InsuranceCss/images/logos-second.png" style="float: right;">
            </div>
            <div class="col-md-6">
                <img src="InsuranceCss/images/logos-second-2.png" style="float: left;">
            </div>
        </div>

        <div class="row">
            <div class="col-md-12">
                <img src="InsuranceCss/images/line.png">
            </div>
        </div>

        <div class="row">
            <div class="col-md-12">
                <img src="InsuranceCss/images/Buy-insurance.png">
            </div>
        </div>


    </div>

    <!--<---------pending text------------------>

    <div class="container-fluid fifth-portion">
        <div class="container">
            <div class="row" style="margin-bottom: 40px">
                <div class="col-md-12">
                    <h2 style="color: #fff; padding-top: 10px">Become a smart buyer  </h2>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <img src="InsuranceCss/images/complet-corect-diclaration.PNG" />
                </div>
                <div class="col-md-4">
                    <img src="InsuranceCss/images/renew-ontime.PNG" />
                </div>
                <div class="col-md-4">
                    <img src="InsuranceCss/images/renew.PNG" />
                </div>
            </div>
        </div>
    </div>



    <!--<--------six-portion---------------->
    <div class="container-fluid sixe-portion">
        <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md-6">
                <img src="InsuranceCss/images/have-qustion.png" class="img-responsive">
            </div>
            <div class="col-md-3"></div>
        </div>

    </div>


    <!--<-----------seven-portion------------->

    <%--<div class="container-fluid seven-portion">

        <div class="container">

            <div class="row">
                <div class="col-md-12">
                    <h2 style="text-align: center; padding-right: 100px; padding-bottom: 20px;">What Out Client Say </h2>
                </div>
            </div>

            <div class="row">
                <div class="col-md-1"></div>
                <div class="col-md-3">
                    <div class="client-says1">
                        <p style="text-align: center; color: #09a4f5; line-height: 25px; font-size: 16px">
                            '' 
                            <br>
                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce non porta nisl. Proin a efficitur odio. Cras fermentum enim ac mi pellentesque, quis tristique ex sollicitudin. Donec semper odio nec justo pretium, 
                            <br>
                            ''
                                <br>
                            <span style="color: #323436;">Neque porro quisquam 
                                <br>
                            </span>
                        </p>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="client-says1">
                        <p style="text-align: center; color: #09a4f5; line-height: 25px; font-size: 16px">
                            '' 
                            <br>
                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce non porta nisl. Proin a efficitur odio. Cras fermentum enim ac mi pellentesque, quis tristique ex sollicitudin. Donec semper odio nec justo pretium, 
                            <br>
                            ''
                                <br>
                            <span style="color: #323436;">Neque porro quisquam 
                                <br>
                            </span>
                        </p>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="client-says1">
                        <p style="text-align: center; color: #09a4f5; line-height: 25px; font-size: 16px">
                            '' 
                            <br>
                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce non porta nisl. Proin a efficitur odio. Cras fermentum enim ac mi pellentesque, quis tristique ex sollicitudin. Donec semper odio nec justo pretium, 
                            <br>
                            ''
                                <br>
                            <span style="color: #323436;">Neque porro quisquam 
                                <br>
                            </span>
                        </p>
                    </div>
                </div>
                <div class="col-md-1"></div>
            </div>
        </div>
    </div>--%>
</asp:Content>

