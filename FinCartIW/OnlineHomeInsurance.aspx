<%@ Page Title="" Language="C#" MasterPageFile="~/Insurance.master" AutoEventWireup="true" CodeFile="OnlineHomeInsurance.aspx.cs" Inherits="OnlineHomeInsurance" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Fincart | Online Home Insurance</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link href="InsuranceCss/home/css/bootstap.min.css" rel="stylesheet" />
    <link href="InsuranceCss/home/css/layout.css" rel="stylesheet" />

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
    <div id="iframeModal" class="modal fade" role="dialog" style="z-index: 99999">
        <div class="modal-dialog" style="width: 100%;">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Buy Home Insurance</h4>
                </div>
                <div class="modal-body">
                    <div style="background: url(InsuranceCss/loader.gif) center center no-repeat;">
                        <iframe id="carframe" width="100%" height="600px" frameborder="0" src="http://insurance.policybazaar.com/home-insurance/home-insurance-indiaframe.aspx?utm_source=FINCART&utm_campaign=WEBIFRAME&utm_medium=STRATPART&utm_term=NOTTOALLOC&name=<%=Session["LeadName"]!=null?Session["LeadName"].ToString():"" %>&email=<%=Session["LeadEmail"]!=null?Session["LeadEmail"].ToString():"" %>&mobileNo=<%=Session["LeadMobile"]!=null?Session["LeadMobile"].ToString():"" %>"></iframe>
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
        <div class="container" style="width: 63%;">
            <div class="row">
                <div class="col-md-12">
                    <h4>Helping you feel safe all the time </h4>
                    <h2>Buy home insurance and relax  </h2>
                </div>
            </div>

            <div class="row">
                <div class="col-md-6"><span class="radio"></span></div>
                <div class="col-md-6"></div>
            </div>

           
            <div id="logedout" runat="server">
                <div class="row">
                    <div class="col-md-6">

                        <div class="row">
                            <a href="javascript:void(0)" onclick="toggeluser('existinguser')">
                                <div class="col-md-12">
                                    <img src="InsuranceCss/home/images/existing-customer-yes.png" style="float: right;" id="existing-customer-yes">
                                    <img src="InsuranceCss/home/images/existing-customer-no.png" style="float: right; display: none" id="existing-customer-no" />

                                </div>
                            </a>
                        </div>

                    </div>

                    <div class="col-md-6">

                        <div class="row">
                            <a href="javascript:void(0)" onclick="toggeluser('newuser')">
                                <div class="col-md-12">
                                    <img src="InsuranceCss/home/images/new-customer-yes.png" style="float: left; display: none" id="new-customer-yes">
                                    <img src="InsuranceCss/home/images/new-customer-no.png" style="float: left;" id="new-customer-no" />
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
                                    <img src="InsuranceCss/home/images/name-icon.png" style="float: left">
                                </span>
                                <asp:TextBox type="text" name="name" runat="server" placeholder="Your Name" ID="name" class="form-control " ValidationGroup="RegisterInfo" MaxLength="30" Style="width: 74%; float: right; height: 45px; background-color: Transparent; border: none" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="RegisterInfo" Display="Dynamic" ErrorMessage="*Name Required" ControlToValidate="name" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>

                            <div class="col-md-3" style="border-right: 1px solid #2c2622; padding: 0px; margin: 0px">
                                <span>
                                    <img src="InsuranceCss/home/images/mobile-icon.png" style="float: left">
                                </span>
                                <asp:TextBox type="text" name="mobile" ID="mobile" Placeholder="Mobile No." runat="server" class="form-control " MaxLength="10" ValidationGroup="RegisterInfo" Style="width: 74%; float: left; height: 45px; background-color: Transparent; border: none" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="RegisterInfo" Display="Dynamic" ErrorMessage="*Mobile Required" ControlToValidate="mobile" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator_mobile" runat="server" ControlToValidate="mobile" ErrorMessage="*Invalid Mobile" ValidationExpression="[0-9]{10}" Display="Dynamic" ValidationGroup="RegisterInfo" ForeColor="Red"></asp:RegularExpressionValidator>
                            </div>

                            <div class="col-md-3" style="border-right: 1px solid #2c2622; padding: 0px; margin: 0px">
                                <span>
                                    <img src="InsuranceCss/home/images/email-id.png" style="float: left;">
                                </span>
                                <asp:TextBox type="text" name="email" ID="email" runat="server" placeholder="Email Id" class="form-control " ValidationGroup="RegisterInfo" MaxLength="50" Style="width: 74%; height: 45px; background-color: Transparent; border: none" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" Display="Dynamic" runat="server" ValidationGroup="RegisterInfo" ErrorMessage="*Email Required" ControlToValidate="email" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="validateEmail" runat="server" ErrorMessage="*Invalid Email" ControlToValidate="email" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$" Display="Dynamic" ValidationGroup="RegisterInfo" ForeColor="Red"></asp:RegularExpressionValidator>
                            </div>

                            <div class="col-md-3" style="padding: 0px; margin: 0px">
                                <span>
                                    <img src="InsuranceCss/home/images/password-icon.png" style="float: left">
                                </span>
                                <asp:TextBox type="password" name="password" ID="password" runat="server" placeholder="Password" class="form-control " ValidationGroup="RegisterInfo" MaxLength="30" Style="width: 74%; float: left; height: 45px; background-color: Transparent; border: none" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" Display="Dynamic" runat="server" ValidationGroup="RegisterInfo" ErrorMessage="*Password Required" ControlToValidate="password" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>

                        </div>



                        <div class="row">
                            <div class="col-md-6"></div>
                            <div class="col-md-6">
                                <asp:LinkButton ID="RegisterButton" runat="server" ValidationGroup="RegisterInfo" OnClick="RegisterButton_Click"><img src="InsuranceCss/home/images/submit.png" style="float: right; margin-right: 16%; margin-top: 2%;"></asp:LinkButton>
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
                            <asp:LinkButton ID="LoginButton" runat="server" ValidationGroup="SubmitInfo" OnClick="LoginButton_Click"><img src="InsuranceCss/home/images/submit.png" style="float: right; margin-right: 16%; margin-top: 2%;"></asp:LinkButton>
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

    <div class="container-fluid thirt-portion">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h3 style="color: #fff; font-weight: normal;">What is home Insurance 
                    </h3>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <p>
                        What great pleasure lies in the often repeated statement, ‘I am home’.
          A home is a place of rest, sanctuary and the word itself signals peace and finality.
           A house also entails a tremendous expenditure of money, emotions and time- a onetime investment 
           in many of our lives. Thus, securing this symbol of independence and achievement,
            against natural calamities and man-made conditions, is an extremely important concern. 
         Ergo, the need for a good, comprehensive and timely Home Insurance Policy.
                    </p>
                </div>
            </div>

            <div class="row" style="font-weight: bold;">
                <div class="col-md-3">
                    I WANT TO COVER MY
                </div>

                <div class="col-md-3">
                    <table>
                        <tr>
                            <td style="padding: 4px">
                                <input type="radio" name="gender" value="male">
                            </td>
                            <td>BUILDING ONLY </td>
                        </tr>
                    </table>
                </div>

                <div class="col-md-3">
                    <input type="radio" name="gender" value="female" style="margin-top: 4px;">
                    CONTANT ONLY 
                </div>

                <div class="col-md-3">
                    <input type="radio" name="gender" value="other" style="margin-top: 4px;">
                    BUILDING & CONTENT
                </div>
            </div>

            <div class="row">
                <div class="col-md-12">
                    <asp:Literal ID="lit_buynow" runat="server"></asp:Literal>
                </div>
            </div>

        </div>
    </div>

    <!--<-----finish third portion------->

    <!--<--------start fourth portion----------->
    <div class="container-fluid fourth-portion">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h3>Benefits Of Home Insurance  </h3>
                </div>
            </div>

            <div class="row">
                <div class="col-md-4">
                    <table>
                        <tr>
                            <td>
                                <img src="InsuranceCss/home/images/home-img.PNG" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span><a href="#">READ MORE </a></span>
                            </td>
                        </tr>
                    </table>
                </div>

                <div class="col-md-4">
                    <table>
                        <tr>
                            <td>
                                <img src="InsuranceCss/home/images/building-img.PNG" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span><a href="#">READ MORE </a></span>
                            </td>
                        </tr>
                    </table>
                </div>

                <div class="col-md-4">
                    <table>
                        <tr>
                            <td>
                                <img src="InsuranceCss/home/images/security-img.PNG" />
                            </td>
                        </tr>
                        <tr>
                            <td><span><a href="#">READ MORE </a></span>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <!--<---------pending text------------------>

    <div class="container-fluid fifth-portion">
        <div class="row">
            <div class="col-md-12">
                Lorem Ipsum is simply dummy text of the printing and typesetting industry.
Lorem Ipsum has been the industry's standard dummy text ever since the 1500s
Pending Text from client End
            </div>
        </div>
    </div>



    <!--<--------six-portion---------------->
    <div class="container-fluid sixe-portion">
        <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md-6">
                <img src="InsuranceCss/home/images/have-qustion.png" class="img-responsive">
            </div>
            <div class="col-md-3"></div>
        </div>

    </div>


    <!--<-----------seven-portion------------->

<%--    <div class="container-fluid seven-portion">

        <div class="container">

            <div class="row">
                <div class="col-md-12">
                    <h2 style="text-align: center; padding-right: 100px; padding-bottom: 20px">What Out Client Say </h2>
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

