<%@ Page Title="" Language="C#" MasterPageFile="~/Insurance.master" AutoEventWireup="true" CodeFile="OnlineTermInsurance.aspx.cs" Inherits="OnlineTermInsurance" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Fincart | Online Term Insurance</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link href="InsuranceCss/term/css/style.css" rel="stylesheet" />
    <link href="InsuranceCss/term/css/style2.css" rel="stylesheet" />
    <link rel="stylesheet" href="http://glyphsearch.com/bower_components/font-awesome/css/font-awesome.min.css">
    <link href='https://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>
    <style>
        .blink_me {
            animation: blinker 1s linear infinite;
        }

        @keyframes blinker {
            50% {
                opacity: 0.0;
            }
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

        function FV(rate, nper, pmt, pv, type) {
            var pow = Math.pow(1 + rate, nper),
               fv;
            if (rate) {
                fv = (pmt * (1 + rate * type) * (1 - pow) / rate) - pv * pow;
            } else {
                fv = -1 * (pv + pmt * nper);
            }
            return fv.toFixed(0);
        }

        function calculateterm() {
            var age = parseInt($('#age').val());
            var expense = parseInt($('#expense').val());
            var investment = parseInt($('#investment').val());
            var loan = parseInt($('#loan').val());

            if (!$.isNumeric(age)) {
                $('#agemsg').css('display', 'block');
            }
            else {
                $('#agemsg').css('display', 'none');
            }

            if (!$.isNumeric(expense)) {
                $('#expensemsg').css('display', 'block');
            }
            else {
                $('#expensemsg').css('display', 'none');
            }

            if (!$.isNumeric(investment)) {
                $('#investmentmsg').css('display', 'block');
            }
            else {
                $('#investmentmsg').css('display', 'none');
            }

            if (!$.isNumeric(loan)) {
                $('#loanmsg').css('display', 'block');
            }
            else {
                $('#loanmsg').css('display', 'none');
            }

            if ($.isNumeric(age) && $.isNumeric(expense) && $.isNumeric(investment) && $.isNumeric(loan)) {
                var exixtinginsurance = 0;
                var inflation = 6 * 0.01;
                var rtrn = 8 * 0.01;
                var rate = ((1 + rtrn) / (1 + inflation)) - 1;
                var nper = 65 - age;
                var futurevalue = FV(rate, nper, expense, 0, 1);
                var totalinsurance = (-(futurevalue) / Math.pow(1 + rate, nper)).toFixed(0);
                var additionalinsurance = totalinsurance - exixtinginsurance - investment + loan;

                $('#amount').val("Rs. " + totalinsurance);
                $('#term').val(nper + " years");

                $('#calculator').slideUp();
                $('#result').slideDown();
            }
        }

        function recalculate() {
            $('#result').slideUp();
            $('#calculator').slideDown();
        }

        (function blink() {
            $('.blink_me').fadeOut(500).fadeIn(500, blink);
        })();

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
    <div id="iframeModal" class="modal fade" role="dialog" style="z-index: 99999">
        <div class="modal-dialog" style="width: 100%;">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Buy Term Insurance</h4>
                </div>
                <div class="modal-body">
                    <div style="background: url(InsuranceCss/loader.gif) center center no-repeat;">
                        <iframe id="carframe" width="100%" height="600px" frameborder="0" src="http://termlife.policybazaar.com/partner?utm_source=FINCART&utm_campaign=WEBIFRAME&utm_medium=STRATPART&utm_term=NOTTOALLOC&name=<%=Session["LeadName"]!=null?Session["LeadName"].ToString():"" %>&email=<%=Session["LeadEmail"]!=null?Session["LeadEmail"].ToString():"" %>&mobileNo=<%=Session["LeadMobile"]!=null?Session["LeadMobile"].ToString():"" %>"></iframe>
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

    <!-- -----------------------------------middle section starts-->
    <div class="section contentone">
        <div class="slider-item">
            <div id="alertmsglocation"></div>
            <div class="section sectionone">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-8 col-lg-offset-2 text-center headerone">
                            <h1>Why is it Important to buy Life Insurances?</h1>
                            <p style="font-weight: bold; font-size: 14px; color: #414040">Motor Insurance is mandatory by regulation hence most of them are forced to buy but fail to buy a good Term Insurance. </p>
                            <p style="font-weight: bold; font-size: 14px; color: #414040">For a moment pause and reflect; which is more important – The Motor Car or Your Life?</p>
                        </div>
                    </div>
                </div>


                <div class="container" id="logedout" runat="server">
                    <div class="row">
                        <div class="col-md-12 ">
                            <div class="formregisterlogin">
                                <div class="form-heading">

                                    <div class="row">
                                        <div class="col-lg-6 col-md-6 existing">
                                            <a href="javascript:void(0)" onclick="toggeluser('existinguser')">
                                                <img src="InsuranceCss/term/images/existing-customer-yes.png" class="img-responsive" style="float: right;" id="existing-customer-yes">
                                                <img src="InsuranceCss/term/images/existing-customer-no.png" class="img-responsive" style="float: right; display: none" id="existing-customer-no" />
                                            </a>
                                        </div>
                                        <div class="col-lg-6 col-md-6 new">
                                            <a href="javascript:void(0)" onclick="toggeluser('newuser')">
                                                <img src="InsuranceCss/term/images/new-customer-yes.png" class="img-responsive" style="float: left; display: none" id="new-customer-yes">
                                                <img src="InsuranceCss/term/images/new-customer-no.png" class="img-responsive" style="float: left;" id="new-customer-no" />
                                            </a>
                                        </div>
                                    </div>




                                </div>

                                <div class="loginfeild">
                                    <div class="row">
                                        <div class="register" id="newuser" style="display: none;">
                                            <div class="registerone col-lg-12">
                                                <div class="row">
                                                    <div class="col-md-3" style="border-right: 1px solid #474c54; padding: 0px; margin: 0px">
                                                        <span>
                                                            <img src="InsuranceCss/term/images/name-icon.PNG" style="border-radius: 8px;">
                                                        </span>
                                                        <asp:TextBox type="text" name="name" runat="server" placeholder="Your Name" ID="name" class="new-cutomer-input" ValidationGroup="RegisterInfo" MaxLength="30" Style="width: 74%; float: right; height: 46px; color: #fff" />
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="RegisterInfo" Display="Dynamic" ErrorMessage="*Name Required" ControlToValidate="name" ForeColor="Red"></asp:RequiredFieldValidator>

                                                    </div>

                                                    <div class="col-md-3" style="border-right: 1px solid #474c54; padding: 0px; margin: 0px">
                                                        <span>
                                                            <img src="InsuranceCss/term/images/mobile-icon.PNG" style="float: left;">
                                                        </span>
                                                        <asp:TextBox type="text" name="email" ID="email" runat="server" placeholder="Email Address" class="new-cutomer-input" ValidationGroup="RegisterInfo" MaxLength="30" Style="width: 78%; float: left; height: 46px; color: #fff" />
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" Display="Dynamic" runat="server" ValidationGroup="RegisterInfo" ErrorMessage="*Email Required" ControlToValidate="email" ForeColor="Red"></asp:RequiredFieldValidator>
                                                        <asp:RegularExpressionValidator ID="validateEmail" runat="server" ErrorMessage="*Invalid Email" ControlToValidate="email" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$" Display="Dynamic" ValidationGroup="RegisterInfo" ForeColor="Red"></asp:RegularExpressionValidator>
                                                    </div>

                                                    <div class="col-md-3" style="border-right: 1px solid #474c54; padding: 0px; margin: 0px">
                                                        <span>
                                                            <img src="InsuranceCss/term/images/email-icon.PNG" style="float: left;">
                                                        </span>
                                                        <asp:TextBox type="text" name="mobile" ID="mobile" Placeholder="Mobile" runat="server" class="new-cutomer-input" MaxLength="30" ValidationGroup="RegisterInfo" Style="width: 78%; float: left; height: 46px; color: #fff" />
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="RegisterInfo" Display="Dynamic" ErrorMessage="*Mobile Required" ControlToValidate="mobile" ForeColor="Red"></asp:RequiredFieldValidator>
                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator_mobile" runat="server" ControlToValidate="mobile" ErrorMessage="*Invalid Mobile" ValidationExpression="[0-9]{10}" Display="Dynamic" ValidationGroup="RegisterInfo" ForeColor="Red"></asp:RegularExpressionValidator>
                                                    </div>

                                                    <div class="col-md-3" style="border-right: 0px solid #474c54; padding: 0px; margin: 0px">
                                                        <span>
                                                            <img src="InsuranceCss/term/images/password-icon.PNG" style="float: left;">
                                                        </span>
                                                        <asp:TextBox type="password" name="password" ID="password" runat="server" placeholder="Password" class="new-cutomer-input" ValidationGroup="RegisterInfo" MaxLength="30" Style="width: 78%; float: left; height: 46px; color: #fff" />
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" Display="Dynamic" runat="server" ValidationGroup="RegisterInfo" ErrorMessage="*Password Required" ControlToValidate="password" ForeColor="Red"></asp:RequiredFieldValidator>
                                                    </div>

                                                </div>

                                            </div>

                                            <div class="row">
                                                <div class="col-sm-6 col-md-offset-6">
                                                    <asp:LinkButton ID="RegisterButton" runat="server" ValidationGroup="RegisterInfo" OnClick="RegisterButton_Click" CssClass="btn-register col-md-offset-6">Submit</asp:LinkButton>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="login" id="existinguser">

                                            <div class="col-lg-6">
                                                <asp:TextBox type="text" name="eusername" runat="server" ID="eusername" class="login11" placeholder="Email Id" Style="float: right;" />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="*Email Required" ControlToValidate="eusername" Display="Dynamic" ValidationGroup="SubmitInfo" ForeColor="Red" Style="float: right; margin-right: 35%;"></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ErrorMessage="*Invalid Email" ControlToValidate="eusername" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$" Display="Dynamic" ValidationGroup="SubmitInfo" ForeColor="Red" Style="float: right; margin-right: 35%;"></asp:RegularExpressionValidator>
                                            </div>
                                            <div class="col-lg-6">
                                                <asp:TextBox type="password" name="epassword" runat="server" ID="epassword" class="login11" placeholder="Password" Style="float: left;" />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ErrorMessage="*Password Required" ControlToValidate="epassword" Display="Dynamic" ValidationGroup="SubmitInfo" ForeColor="Red" Style="float: left; margin-left: 30%;"></asp:RequiredFieldValidator>
                                            </div>
                                            <div class="col-lg-6">
                                                <a href="javascript:void(0);" class="btn btn-link btn-md" data-toggle="modal" data-target="#forgetpassModal">Forget Password?</a>
                                            </div>
                                            <div class="col-lg-5">
                                                <asp:LinkButton ID="LoginButton" runat="server" ValidationGroup="SubmitInfo" OnClick="LoginButton_Click" CssClass="btn-login" Style="margin-right: 80px"> Submit </asp:LinkButton>
                                            </div>
                                            <div class="col-md-1"></div>
                                        </div>


                                    </div>

                                </div>
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
    </div>



    <div class="section sectiontwo">
        <div class="container">
            <div class="row">
                <div class="col-lg-12  text-center headertwo">
                    <h2>How much Life Insurance Cover should I have?</h2>

                    <div class="center" id="calculator">

                        <div class="form-group col-md-6">
                            <div class="input-group input-group-lg">
                                <span class="input-group-addon"><i class="fa fa-birthday-cake"></i></span>
                                <div class="icon-addon addon-lg">
                                    <input type="text" placeholder="Current Age" class="form-control inputtext" id="age" />
                                </div>
                            </div>
                            <span>Between: 18 yrs to 65 yrs.(eg. 20)</span>
                            <span id="agemsg" style="display: none;" class="blink_me">Invalid Input Current Age.</span>
                        </div>

                        <div class="form-group col-md-6">
                            <div class="input-group input-group-lg">
                                <span class="input-group-addon"><i class="fa fa-inr"></i></span>
                                <div class="icon-addon addon-lg">
                                    <input type="text" placeholder="Current Annual Expense" class="form-control inputtext" id="expense" />
                                </div>
                            </div>
                            <span>Between: Rs. 2,40,000 to 48,00,000. (eg. 240000)</span>
                            <span id="expensemsg" style="display: none;" class="blink_me">Invalid Input Current Annual Expense.</span>
                        </div>

                        <div class="form-group col-md-6">
                            <div class="input-group input-group-lg">
                                <span class="input-group-addon"><i class="fa fa-credit-card"></i></span>
                                <div class="icon-addon addon-lg">
                                    <input type="text" placeholder="Existing Investment" class="form-control inputtext" id="investment" />
                                </div>
                            </div>
                            <span>Existing Total Investment. (eg. 30000)</span>
                            <span id="investmentmsg" style="display: none;" class="blink_me">Invalid Input Existing Investment.</span>
                        </div>

                        <div class="form-group col-md-6">
                            <div class="input-group input-group-lg">
                                <span class="input-group-addon"><i class="fa fa-money"></i></span>
                                <div class="icon-addon addon-lg">
                                    <input type="text" placeholder="Loan and Liabilities" class="form-control inputtext" id="loan" />
                                </div>
                            </div>
                            <span>Have any Loans & Liabilities? (eg. 400000)</span>
                            <span id="loanmsg" style="display: none;" class="blink_me">Invalid Input Loan and Liabilities.</span>
                        </div>

                        <center>
                        <div class="form-group col-md-12">
                            <div class="input-group input-group-lg">
                                <div class="icon-addon addon-lg">
                                    <a href="javascript:void(0);" class="btn-log5" onclick="calculateterm()" style="text-align:center;text-decoration:none;color:#fff !important;">PROCEED</a>
                                </div>
                            </div>
                        </div>
                       </center>

                    </div>

                    <div class="center" id="result" style="display: none;">

                        <div class="form-group col-md-12">
                            <br />
                        </div>

                        <div class="form-group col-md-8">
                            <div class="input-group input-group-lg">
                                <span class="input-group-addon" style="font-size: 15px; padding-left: 6px; background: none; color: #fff;">Total Life Cover Need</span>
                                <div class="icon-addon addon-lg">
                                    <input type="text" class="form-control inputtext" value="" readonly="readonly" id="amount" />
                                </div>
                            </div>
                        </div>

                        <div class="form-group col-md-4">
                            <div class="input-group input-group-lg">
                                <span class="input-group-addon" style="font-size: 15px; padding-left: 6px; background: none; color: #fff;">Term</span>
                                <div class="icon-addon addon-lg">
                                    <input type="text" class="form-control inputtext" value="" readonly="readonly" id="term" />
                                </div>
                            </div>
                        </div>

                        <div class="form-group col-md-12">
                            <br />
                        </div>
                        <center>
                        <div class="form-group col-md-12">
                                    <a href="javascript:void(0);" class="btn-log5" onclick="recalculate()" style="text-align:center;text-decoration:none;color:#fff !important;">RE-CALCULATE</a>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <asp:Literal ID="lit_compare" runat="server"></asp:Literal>
                        </div>
                       </center>

                    </div>

                </div>
            </div>
        </div>
    </div>


    <div class="section sectionthree">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2 text-center headerthree">
                    <h2>What kind of Life Insurances Should You buy?</h2>
                    <ul style="font-family: 'Lato', sans-serif; line-height: 2px; font-weight: bold;">
                        <li>Pay very low premium, get high insurance Cover and save tax under section 80C too.</li>
                        <li>Online Term Insurance is the best form of Life Insurance one should buy.</li>
                        <li>Other Life Insurance options are not advisable.</li>
                    </ul>
                    <asp:Literal ID="lit_buynow1" runat="server"></asp:Literal>
                    <div class="button">
                        <asp:Literal ID="lit_buynow2" runat="server"></asp:Literal>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="section sectionfour">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2 text-center headerfour">
                    <h2>How Fincart will help You...</h2>
                    <p>Premium should not be the only benchmark to evaluate the best policy; our advisors </p>
                    <p>can help you choose the best Insurance Policies based on your requirement.</p>
                    <div class="button">
                        <asp:Literal ID="lit_buynow3" runat="server"></asp:Literal>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- -----------------------------------middle section ends-->
</asp:Content>







