<%@ Page Title="" Language="C#" MasterPageFile="~/Insurance.master" AutoEventWireup="true" CodeFile="OnlineTravelInsurance.aspx.cs" Inherits="OnlineTravelInsurance" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Fincart | Online Travel Insurance</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link href="InsuranceCss/travel/css/bootstap.min.css" rel="stylesheet" />
    <link href="InsuranceCss/travel/css/layout.css" rel="stylesheet" />

    <style>
        .social {
            width: 60%;
            text-align: center;
            margin-top: 10px;
        }
    </style>

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
    <div id="iframeModal" class="modal fade" role="dialog"  style="z-index:99999">
        <div class="modal-dialog" style="width: 100%;">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Buy Car Insurance</h4>
                </div>
                <div class="modal-body">
                    <div style="background: url(InsuranceCss/loader.gif) center center no-repeat;">
                        <iframe id="carframe" width="100%" height="600px" frameborder="0" src="http://travel.policybazaar.com/prequote/partner?iframe&utm_source=FINCART&utm_campaign=WEBIFRAME&utm_medium=STRATPART&utm_term=NOTTOALLOC&name=<%=Session["LeadName"]!=null?Session["LeadName"].ToString():"" %>&email=<%=Session["LeadEmail"]!=null?Session["LeadEmail"].ToString():"" %>&mobileNo=<%=Session["LeadMobile"]!=null?Session["LeadMobile"].ToString():"" %>"></iframe>
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
        <div class="container" style="width: 66%;">

            <div class="row" style="margin-top: 10px">
                <div class="col-md-12">
                    <h2 style="color: #fff" class="heading-text">You make new discoveries... we’ll ensure you’re covered.</h2>
                    <h3 style="color: #fff; font-size: 16px;" class="heading-text">Going away for a city weekend break, family holiday or honeymoon?
                        <br />
                        We have the perfect travel insurance for you.
                    </h3>
                </div>
            </div>


            <div id="logedout" runat="server">

                <div class="row">
                    <div class="col-md-6">

                        <div class="row">
                            <a href="javascript:void(0)" onclick="toggeluser('existinguser')">
                                <div class="col-md-12">
                                    <img src="InsuranceCss/travel/images/existing-customer-yes.png" style="float: right;" id="existing-customer-yes">
                                    <img src="InsuranceCss/travel/images/existing-customer-no.png" style="float: right; display: none" id="existing-customer-no" />

                                </div>
                            </a>
                        </div>

                    </div>

                    <div class="col-md-6">

                        <div class="row">
                            <a href="javascript:void(0)" onclick="toggeluser('newuser')">
                                <div class="col-md-12">
                                    <img src="InsuranceCss/travel/images/new-customer-yes.png" style="float: left; display: none" id="new-customer-yes">
                                    <img src="InsuranceCss/travel/images/new-customer-no.png" style="float: left;" id="new-customer-no" />
                                </div>
                            </a>
                        </div>


                    </div>
                </div>


                <div class="row" id="newuser" style="display: none;">
                    <div class="col-md-12">
                        <div class="row" style="border: 1px solid #2c2622; border-radius: 6px">
                            <div class="col-md-6" style="border-right: 1px solid #2c2622;">
                                <span>
                                    <img src="InsuranceCss/travel/images/name-icon.png">
                                </span>
                                <asp:TextBox type="text" name="name" runat="server" placeholder="Your Name" ID="name" class="form-control new-cutomer-input" ValidationGroup="RegisterInfo" MaxLength="30" Style="width: 82%; float: right; height: 48px; margin-right: 10px; background-color: Transparent; border: none" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="RegisterInfo" Display="Dynamic" ErrorMessage="*Name Required" ControlToValidate="name" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>

                            <div class="col-md-6" style="border-right: 1px solid #2c2622;">
                                <span>
                                    <img src="InsuranceCss/travel/images/mobile-icon.png" align="left">
                                </span>
                                <asp:TextBox type="text" name="mobile" ID="mobile" Placeholder="Mobile No." runat="server" class="form-control new-cutomer-input" MaxLength="10" ValidationGroup="RegisterInfo" Style="width: 82%; float: left; height: 48px; margin-right: 10px; background-color: Transparent; border: none" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="RegisterInfo" Display="Dynamic" ErrorMessage="*Mobile Required" ControlToValidate="mobile" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator_mobile" runat="server" ControlToValidate="mobile" ErrorMessage="*Invalid Mobile" ValidationExpression="[0-9]{10}" Display="Dynamic" ValidationGroup="RegisterInfo" ForeColor="Red"></asp:RegularExpressionValidator>
                            </div>
                        </div>

                        <div class="row" style="border: 1px solid #2c2622; border-radius: 6px; margin-top: 20px">
                            <div class="col-md-6" style="border-right: 1px solid #2c2622;">
                                <span>
                                    <img src="InsuranceCss/travel/images/email-id.png">
                                </span>
                                <asp:TextBox type="text" name="email" ID="email" runat="server" placeholder="Email Id" class="form-control new-cutomer-input" ValidationGroup="RegisterInfo" MaxLength="50" Style="width: 82%; float: right; height: 48px; margin-right: 10px; background-color: Transparent; border: none" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" Display="Dynamic" runat="server" ValidationGroup="RegisterInfo" ErrorMessage="*Email Required" ControlToValidate="email" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="validateEmail" runat="server" ErrorMessage="*Invalid Email" ControlToValidate="email" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$" Display="Dynamic" ValidationGroup="RegisterInfo" ForeColor="Red"></asp:RegularExpressionValidator>
                            </div>

                            <div class="col-md-6">
                                <span>
                                    <img src="InsuranceCss/travel/images/password-icon.png" align="left">
                                </span>
                                <asp:TextBox type="password" name="password" ID="password" runat="server" placeholder="Password" class="form-control new-cutomer-input" ValidationGroup="RegisterInfo" MaxLength="30" Style="width: 82%; float: left; height: 48px; margin-right: 10px; background-color: Transparent; border: none" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" Display="Dynamic" runat="server" ValidationGroup="RegisterInfo" ErrorMessage="*Password Required" ControlToValidate="password" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6"></div>
                            <div class="col-md-6">
                                <asp:LinkButton ID="RegisterButton" runat="server" ValidationGroup="RegisterInfo" OnClick="RegisterButton_Click"><img src="InsuranceCss/travel/images/submit.png" style="float: right; margin-right: 16%; margin-top: 2%;"></asp:LinkButton>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="row" id="existinguser" style="margin-top: 10px;">
                    <div class="col-md-6">
                        <div class="row">
                            <div class="col-md-12">
                                <asp:TextBox type="text" name="eusername" runat="server" ID="eusername" class="form-control" placeholder="Email Id" Style="width: 96%; float: right; margin-right: 2px; height: 50px; font-size: 16px; font-weight: 550px; background-color: Transparent; border-color: #1d6cab" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="*Email Required" ControlToValidate="eusername" Display="Dynamic" ValidationGroup="SubmitInfo" ForeColor="Red" Style="float: right; margin-right: 35%;"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ErrorMessage="*Invalid Email" ControlToValidate="eusername" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$" Display="Dynamic" ValidationGroup="SubmitInfo" ForeColor="Red" Style="float: right; margin-right: 35%;"></asp:RegularExpressionValidator>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="row">
                            <div class="col-md-12">
                                <asp:TextBox type="password" name="epassword" runat="server" ID="epassword" class="form-control" placeholder="Password" Style="width: 96%; float: left; margin-left: 10px; height: 50px; font-size: 16px; font-weight: 550px; background-color: Transparent; border-color: #1d6cab" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ErrorMessage="*Password Required" ControlToValidate="epassword" Display="Dynamic" ValidationGroup="SubmitInfo" ForeColor="Red" Style="float: left; margin-left: 30%;"></asp:RequiredFieldValidator>
                            </div>
                        </div>

                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <a href="javascript:void(0);" class="btn btn-link btn-md" data-toggle="modal" data-target="#forgetpassModal">Forget Password?</a>
                        </div>
                        <div class="col-md-6">
                            <asp:LinkButton ID="LoginButton" runat="server" ValidationGroup="SubmitInfo" OnClick="LoginButton_Click"><img src="InsuranceCss/travel/images/submit.png" style="float: right; margin-right: 16%; margin-top: 2%;"></asp:LinkButton>
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
        <div class="container" style="width: 80%;">
            <div class="row">
                <div class="col-md-12">
                    <h2 style="color: #1071a4">Who doesn't look forward to travelling overseas? </h2>
                    <p style="font-weight: 600; font-size: 14px;">
                        Buying travel insurance secures you against on-travel risks ranging from medical emergencies to
                        <br />
                        baggage loss or stolen passports, ensuring that the happiness always stays alive.
                    </p>

                </div>
            </div>

            <div class="row" style="margin-top: 30px;">
                <div class="col-md-4">
                    <table>
                        <tr>
                            <td><b style="float: left; font-size: 18px">SINGLE TRIP POLICY </b></td>
                        </tr>
                        <tr>
                            <td>
                                <p style="text-align: justify; font-size: 14px; font-weight: 300">
                                    <br />
                                    This policy works for that once-in-a-while trip. It can last a maximum of 180 days, which may be extended after requesting the insurance company. So, have you packed your bags yet?
                                </p>
                            </td>
                        </tr>
                    </table>
                </div>

                <div class="col-md-4">
                    <img src="InsuranceCss/travel/images/main.PNG" />
                </div>

                <div class="col-md-4">
                    <table>
                        <tr>
                            <td><b style="float: left; font-size: 18px">ANNUAL MULTI-TRIP POLICY </b></td>
                        </tr>
                        <tr>
                            <td>
                                <p style="text-align: justify; font-size: 14px; text-align: left; font-weight: 300">
                                    <br />
                                    This policy is ideal for frequent travellers or globetrotters. It's valid for making several trips during the year, each one ranging from 30-45 days, rewarding you with suitcases full of memories.
                                </p>
                            </td>
                        </tr>
                    </table>
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
                    <h2>Benefits of Insured Travelling  </h2>
                </div>
            </div>

            <div class="row">
                <div class="col-md-4">
                    <div class="row">
                        <div class="col-md-12">
                            <img src="InsuranceCss/travel/images/Medical-treatment.png" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <p>
                                A overseas medical treatment costs about $2280 on an average. 
                    Getting emergency medical assistance while you are on a trip abroad could drain your wallet. 
                    You can easily prevent this risk if you are covered under a comprehensive medical insurance scheme.
                            </p>
                        </div>
                    </div>

                </div>

                <div class="col-md-4">
                    <div class="row">
                        <div class="col-md-12">
                            <img src="InsuranceCss/travel/images/cover-for-amergency.png" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <p>
                                Not only unexpected medical emergencies,
                                 other events like flight cancellation, missed flights, 
                                 loss of personal baggage and trip cancellation are also 
                                 included in most of the travel insurance policies. 
                                 When you face such sudden contingencies, having a travel 
                                 insurance will ensure proper assistance and will also save 
                                 your precious time and money.
                            </p>
                        </div>
                    </div>

                </div>

                <div class="col-md-4">
                    <div class="row">
                        <div class="col-md-12">
                            <img src="InsuranceCss/travel/images/loss-theft.png" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <p>
                                Losing a passport or a personal belonging while 
                               travelling can pose an array of problems, especially when you 
                               are in a foreign land. Also, the person will have to undergo a 
                               
                               considerable amount of mental trauma and spend a lot of money 
                               to get the documents back. Having a travel insurance will let 
                               you confidently face such problems.
                            </p>
                        </div>
                    </div>

                </div>
            </div>

            <div id="logedin" runat="server">
                <div class="row">
                    <div class="col-md-12">
                        <asp:Literal ID="lit_buynow" runat="server"></asp:Literal>
                    </div>
                </div>
            </div>

        </div>
    </div>

    <!--<---------pending text------------------>





    <!--<--------six-portion---------------->

    <div class="container-fluid cll-bg">
        <div class="ROW">
            <div class="COL-MD-12">
                <h2 class="heading-text" style="color: #1071a4">Have Quick Question About Travel Insuranc </h2>
            </div>
        </div>

        <div class="ROW">
            <div class="COL-MD-12">
                <h2 class="heading-text" style="color: #1071a4; font-size: 20px">Talk to our experts to have all your Questions answered </h2>
            </div>
        </div>

        <div class="row" style="margin-top: 30px">
            <div class="COL-MD-12">
                <span class="number-call">CALL NOW  +91-11-30018181 </span>
            </div>
        </div>
    </div>


    <!--<-----------seven-portion------------->

    <!--<div class="container-fluid seven-portion">
        
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
        </div>-->
</asp:Content>

