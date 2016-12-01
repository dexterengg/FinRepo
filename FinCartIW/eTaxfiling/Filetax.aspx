<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Filetax.aspx.cs" Inherits="eTaxfilling_Filetax" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>eTaxFiling | Fincart</title>

    <link href="images/favi.png" rel="shortcut icon" type="image/x-icon" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="format-detection" content="telephone=no" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <link href="../css/bootstap.min.css" rel="stylesheet" />

    <link rel="stylesheet" href="css/reset.css" type="text/css" media="all" />
    <link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
    <link href="../css/style.css" rel="stylesheet" type="text/css" media="all" />
    <link href="../css/website.css" rel="stylesheet" type="text/css" media="all" />
    <link href="../css/style420.css" rel="stylesheet" type="text/css" media="all" />
    <link href="../css/style768.css" rel="stylesheet" type="text/css" media="all" />
    <link href="../css/style1024.css" rel="stylesheet" type="text/css" media="all" />
    <link href="../css/formitems.css" rel="stylesheet" type="text/css" media="all" />
    <link href='https://fonts.googleapis.com/css?family=Roboto' rel='stylesheet' type='text/css' />
    <link href="../css/font-awesome.css" type="text/css" rel="stylesheet" />
    <link href="../css/font-awesome.min.css" type="text/css" rel="stylesheet" />
    <script src="../js/jquery.min.js"></script>
    <style type="text/css">
        #pscroller1 {
            PADDING-TOP: 3px;
            width: 100%;
            HEIGHT: 160px;
            text-align: justify;
        }
    </style>

    <script src="../testimonials/pauseScroller.js" type="text/javascript"></script>
    <script src="../testimonials/scroll.js" type="text/javascript"></script>

    <script>
        function fireValidation() {

            if (Page_ClientValidate("taxfile")) {

            } else {

                    document.getElementById('accordion1head').className = 'accordion-title accordionTitle js-accordionTrigger is-collapsed is-expanded'
                    document.getElementById('accordion1').className = 'accordion-content accordionItem is-expanded animateIn'


                    document.getElementById('accordion2head').className = 'accordion-title accordionTitle js-accordionTrigger is-collapsed is-expanded'
                    document.getElementById('accordion2').className = 'accordion-content accordionItem is-expanded animateIn'


                    document.getElementById('accordion3head').className = 'accordion-title accordionTitle js-accordionTrigger is-collapsed is-expanded'
                    document.getElementById('accordion3').className = 'accordion-content accordionItem is-expanded animateIn'


                    document.getElementById('accordion4head').className = 'accordion-title accordionTitle js-accordionTrigger is-collapsed is-expanded'
                    document.getElementById('accordion4').className = 'accordion-content accordionItem is-expanded animateIn'

            }



        }

        function tabclick(tabno) {

            if (tabno === 1) {
                document.getElementById('accordion2head').className = 'accordion-title accordionTitle js-accordionTrigger'
                document.getElementById('accordion2').className = 'accordion-content accordionItem is-collapsed'


                document.getElementById('accordion3head').className = 'accordion-title accordionTitle js-accordionTrigger'
                document.getElementById('accordion3').className = 'accordion-content accordionItem is-collapsed'


                document.getElementById('accordion4head').className = 'accordion-title accordionTitle js-accordionTrigger'
                document.getElementById('accordion4').className = 'accordion-content accordionItem is-collapsed'

            }
            else if (tabno === 2) {
                document.getElementById('accordion1head').className = 'accordion-title accordionTitle js-accordionTrigger'
                document.getElementById('accordion1').className = 'accordion-content accordionItem is-collapsed'


                document.getElementById('accordion3head').className = 'accordion-title accordionTitle js-accordionTrigger'
                document.getElementById('accordion3').className = 'accordion-content accordionItem is-collapsed'


                document.getElementById('accordion4head').className = 'accordion-title accordionTitle js-accordionTrigger'
                document.getElementById('accordion4').className = 'accordion-content accordionItem is-collapsed'

            }
            else if (tabno === 3) {
                document.getElementById('accordion1head').className = 'accordion-title accordionTitle js-accordionTrigger'
                document.getElementById('accordion1').className = 'accordion-content accordionItem is-collapsed'


                document.getElementById('accordion2head').className = 'accordion-title accordionTitle js-accordionTrigger'
                document.getElementById('accordion2').className = 'accordion-content accordionItem is-collapsed'


                document.getElementById('accordion4head').className = 'accordion-title accordionTitle js-accordionTrigger'
                document.getElementById('accordion4').className = 'accordion-content accordionItem is-collapsed'

            }
            else {

                document.getElementById('accordion1head').className = 'accordion-title accordionTitle js-accordionTrigger'
                document.getElementById('accordion1').className = 'accordion-content accordionItem is-collapsed'


                document.getElementById('accordion2head').className = 'accordion-title accordionTitle js-accordionTrigger'
                document.getElementById('accordion2').className = 'accordion-content accordionItem is-collapsed'


                document.getElementById('accordion3head').className = 'accordion-title accordionTitle js-accordionTrigger'
                document.getElementById('accordion3').className = 'accordion-content accordionItem is-collapsed'

            }
        }

    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <!-- -----------------------------------start header -->
            <div class="header-top" style="border-bottom: none;">
                <div class="header-inner">
                    <div class="logo"><a href="../Default.aspx">
                        <img src="images/rsz_logo_fincart_190x55.png" alt="" /></a></div>
                    <div class="guest">
                        <asp:Label ID="lblWelcome" runat="server"></asp:Label></div>
                    <div class="h_menu4">
                        <a class="toggleMenu" href="#"><i class="fa fa-bars fa-2x"></i></a>
                        <script type="text/javascript" src="js/nav.js"></script>
                    </div>
                    <div class="clear"></div>
                </div>
                <!-- -----------------------------------start we featured in -->
                <div class="clear"></div>

                <!-- -----------------------------------end we featured in -->
            </div>
            <!-- -----------------------------------end header -->

            <div class="bodyContainer" style="background: rgba(0, 0, 0, 0) url('../images/banner_bg2--.jpg') no-repeat fixed center center / 100% 100%; margin-bottom: 25px; top: 25px;">
                <div style="background: rgba(0, 0, 0, 0.5);">
                    <div class="container">
                        <h1 class="heading-primary">TAX Filing</h1>
                        <h4 class="heading-primary2">File Your Tax With Few Clicks</h4>
                        <div class="accordion">
                            <dl id="divprocessing" runat="server" visible="false">
                                <dd class="heading-primary" style="text-align:center;background:rgba(0, 0, 0, 0.5);">
                                    <img src="images/Processing.gif" />
                                </dd>
                            </dl>
                            <dl id="divthankyou" runat="server" visible="false">
                                <dt style="text-align:center;">
                                 <h1 style="font-size:50px;" id="sucsess" runat="server" visible="false">
                                     Your Tax filing Request has been Processed!
                                     Thank you!
                                 </h1>
                                    <h1 style="font-size:50px;color:#db2222;" id="failure" runat="server" visible="false">
                                     Some Error Occured While Processing!
                                        Please Retry!
                                 </h1>
                                </dt>
                                <dd>
                                    <div class="col-sm-6 heading-primary">
                     <asp:LinkButton ID="lnkbtn_refile" runat="server" class="btn btn-finish btn-fill btn-warning btn-wd btn-lg" OnClick="lnkbtn_refile_Click">Re-File Tax</asp:LinkButton>
                                    </div>
                                    <div class="col-sm-6 heading-primary">
                     <asp:LinkButton ID="lnkbtn_home" runat="server" class="btn btn-finish btn-fill btn-warning btn-wd btn-lg" OnClick="lnkbtn_home_Click">Go To Home</asp:LinkButton>
                                    </div>
                                </dd>
                            </dl>
                            <dl id="divmain" runat="server" visible="true">
                                <dt onclick="tabclick(1);">
                                    <a href="#accordion1" aria-expanded="true" aria-controls="accordion1" class="accordion-title accordionTitle js-accordionTrigger is-collapsed is-expanded" id="accordion1head">Personal Details</a>
                                </dt>
                                <dd class="accordion-content accordionItem is-expanded animateIn" id="accordion1" aria-hidden="false">
                                    <div style="margin-top: 20px;" id="accordion1content">
                                        <div class="col-sm-4">
                                            <div class="form-group">
                                                <label>First Name
                                                    <small><asp:RegularExpressionValidator ID="RegularExpressionValidator1" Display="Dynamic" runat="server" ValidationGroup="taxfile" ValidationExpression="[a-zA-Z0-9,_, ]*$" ErrorMessage="(AlphaNumeric only)" ControlToValidate="firstname" style="color:#a94442;"></asp:RegularExpressionValidator></small>
                                                </label>
                                                <input id="firstname" type="text" class="form-control" placeholder="First Name..." runat="server" maxlength="25"/>
                                            </div>
                                        </div>
                                        <div class="col-sm-4">
                                            <div class="form-group">
                                                <label>Middle  Name
                                                    <small><asp:RegularExpressionValidator ID="RegularExpressionValidator3" Display="Dynamic" runat="server" ValidationGroup="taxfile" ValidationExpression="[a-zA-Z0-9,_, ]*$" ErrorMessage="(AlphaNumeric only)" ControlToValidate="middlename" style="color:#a94442;"></asp:RegularExpressionValidator></small>
                                                </label>
                                                <input id="middlename" type="text" class="form-control" placeholder="Middle  Name..." runat="server" maxlength="25"/>
                                            </div>
                                        </div>
                                        <div class="col-sm-4">
                                            <div class="form-group">
                                                <label>Last Name  
                                                    <small><asp:RequiredFieldValidator ID="RequiredFieldValidator4" Display="Dynamic" runat="server" ValidationGroup="taxfile" ErrorMessage="(Mandatory)" ControlToValidate="lastname" style="color:#a94442;"></asp:RequiredFieldValidator></small>
                                                    <small><asp:RegularExpressionValidator ID="RegularExpressionValidator4" Display="Dynamic" runat="server" ValidationGroup="taxfile" ValidationExpression="[a-zA-Z0-9,_, ]*$" ErrorMessage="(AlphaNumeric only)" ControlToValidate="lastname" style="color:#a94442;"></asp:RegularExpressionValidator></small>
                                                </label>
                                                <input id="lastname" type="text" class="form-control" placeholder="Last Name..." runat="server" maxlength="75"/>
                                            </div>
                                        </div>
                                        <div class="col-sm-4">
                                            <div class="form-group">
                                                <label>Email Address Personal 
                                                    <small><asp:RequiredFieldValidator ID="RequiredFieldValidator1" Display="Dynamic" runat="server" ValidationGroup="taxfile" ErrorMessage="(Mandatory)" ControlToValidate="emailaddresspersonal" style="color:#a94442;"></asp:RequiredFieldValidator></small>
                                                    <small><asp:RegularExpressionValidator ID="RegularExpressionValidator5" Display="Dynamic" runat="server" ValidationGroup="taxfile" ValidationExpression="^([\.a-zA-Z0-9_\-])+@([a-zA-Z0-9_\-])+(([a-zA-Z0-9_\-])*\.([a-zA-Z0-9_\-])+)+$" ErrorMessage="(AlphaNumeric only)" ControlToValidate="emailaddresspersonal" style="color:#a94442;"></asp:RegularExpressionValidator></small>
                                                </label>
                                                <input id="emailaddresspersonal" type="text" class="form-control" placeholder="Email Address Personal..." runat="server" readonly="true" maxlength="125"/>
                                            </div>
                                        </div>
                                        <div class="col-sm-4">
                                            <div class="form-group">
                                                <label>Mobile Number 
                                                    <small><asp:RequiredFieldValidator ID="RequiredFieldValidator2" Display="Dynamic" runat="server" ValidationGroup="taxfile" ErrorMessage="(Mandatory)" ControlToValidate="mobilenumber" style="color:#a94442;"></asp:RequiredFieldValidator></small>
                                                    <small><asp:RegularExpressionValidator ID="RegularExpressionValidator7" Display="Dynamic" runat="server" ValidationGroup="taxfile" ValidationExpression="^[1-9]{1}[0-9]{9}$" ErrorMessage="(Invalid Date)" ControlToValidate="mobilenumber" style="color:#a94442;"></asp:RegularExpressionValidator></small>
                                                </label>
                                                <input id="mobilenumber" type="text" class="form-control" placeholder="Mobile Number..." runat="server" maxlength="10"/>
                                            </div>
                                        </div>
                                        <div class="col-sm-4">
                                            <div class="form-group">
                                                <label>DOB (eg. 01-JAN-1920) 
                                                    <small><asp:RequiredFieldValidator ID="RequiredFieldValidator3" Display="Dynamic" runat="server" ValidationGroup="taxfile" ErrorMessage="(Mandatory)" ControlToValidate="dob" style="color:#a94442;"></asp:RequiredFieldValidator></small>
                                                    <small><asp:RegularExpressionValidator ID="RegularExpressionValidator6" Display="Dynamic" runat="server" ValidationGroup="taxfile" ValidationExpression="^(0[1-9]|[1-9]|[12][0-9]|3[01])-([Jj][Aa][Nn]|[Ff][Ee][Bb]|[Mm][Aa][Rr]|[Aa][Pp][Rr]|[Mm][Aa][Yy]|[Jj][Uu][Nn]|[Jj][Uu][Lj]|[Aa][Uu][Gg]|[Ss][Ee][Pp]|[Oo][Cc][Tt]|[Nn][Oo][Vv]|[Dd][Ee][Cc])-(19|20)\d\d$" ErrorMessage="(DD-MMM-YYYY Format only)" ControlToValidate="dob" style="color:#a94442;"></asp:RegularExpressionValidator></small>
                                                </label>
                                                <input id="dob" type="text" class="form-control" runat="server" maxlength="11" placeholder="DD-MMM-YYYY"/>
                                            </div>
                                        </div>
                                        <div class="col-sm-4">
                                            <div class="form-group">
                                                <label>Pan Card 
                                                    <small><asp:RequiredFieldValidator ID="RequiredFieldValidator14" Display="Dynamic" runat="server" ValidationGroup="taxfile" ErrorMessage="(Mandatory)" ControlToValidate="pancard" style="color:#a94442;"></asp:RequiredFieldValidator></small>
                                                    <small><asp:RegularExpressionValidator ID="RegularExpressionValidator8" Display="Dynamic" runat="server" ValidationGroup="taxfile" ValidationExpression="[a-zA-Z0-9,_, ]*$" ErrorMessage="(AlphaNumeric only)" ControlToValidate="pancard" style="color:#a94442;"></asp:RegularExpressionValidator></small>
                                                </label>
                                                <input id="pancard" type="text" class="form-control" placeholder="Pan Card..." runat="server" maxlength="10"/>
                                            </div>
                                        </div>
                                    </div>
                                </dd>
                                <dt onclick="tabclick(2);">
                                    <a href="#accordion2" aria-expanded="false" aria-controls="accordion2" class="accordion-title accordionTitle js-accordionTrigger" id="accordion2head">Address Details</a>
                                </dt>
                                <dd class="accordion-content accordionItem is-collapsed" id="accordion2" aria-hidden="true">
                                    <div style="margin-top: 20px;">
                                        <div class="col-sm-4">
                                            <div class="form-group">
                                                <label>Flat Door 
                                                    <small><asp:RequiredFieldValidator ID="RequiredFieldValidator5" Display="Dynamic" runat="server" ValidationGroup="taxfile" ErrorMessage="(Mandatory)" ControlToValidate="flatdoor" style="color:#a94442;"></asp:RequiredFieldValidator></small>
                                                    <small><asp:RegularExpressionValidator ID="RegularExpressionValidator9" Display="Dynamic" runat="server" ValidationGroup="taxfile" ValidationExpression="[a-zA-Z0-9,_, ]*$" ErrorMessage="(AlphaNumeric only)" ControlToValidate="flatdoor" style="color:#a94442;"></asp:RegularExpressionValidator></small>
                                                </label>
                                                <input id="flatdoor" type="text" class="form-control" placeholder="Flat Door..." runat="server" maxlength="50"/>
                                            </div>
                                        </div>
                                        <div class="col-sm-4">
                                            <div class="form-group">
                                                <label>Building 
                                                    <small><asp:RegularExpressionValidator ID="RegularExpressionValidator20" Display="Dynamic" runat="server" ValidationGroup="taxfile" ValidationExpression="[a-zA-Z0-9,_, ]*$" ErrorMessage="(AlphaNumeric only)" ControlToValidate="Building" style="color:#a94442;"></asp:RegularExpressionValidator></small>
                                                </label>
                                                <input id="Building" type="text" class="form-control" placeholder="Building..." runat="server" maxlength="50"/>
                                            </div>
                                        </div>
                                        <div class="col-sm-4">
                                            <div class="form-group">
                                                <label>Road Street
                                                    <small><asp:RegularExpressionValidator ID="RegularExpressionValidator10" Display="Dynamic" runat="server" ValidationGroup="taxfile" ValidationExpression="[a-zA-Z0-9,_, ]*$" ErrorMessage="(AlphaNumeric only)" ControlToValidate="roadstreet" style="color:#a94442;"></asp:RegularExpressionValidator></small>
                                                </label>
                                                <input id="roadstreet" type="text" class="form-control" placeholder="Road Street..." runat="server" maxlength="50"/>
                                            </div>
                                        </div>
                                        <div class="col-sm-4">
                                            <div class="form-group">
                                                <label>Area Locality 
                                                   <small><asp:RequiredFieldValidator ID="RequiredFieldValidator6" Display="Dynamic" runat="server" ValidationGroup="taxfile" ErrorMessage="(Mandatory)" ControlToValidate="arealocality" style="color:#a94442;"></asp:RequiredFieldValidator></small>
                                                    <small><asp:RegularExpressionValidator ID="RegularExpressionValidator11" Display="Dynamic" runat="server" ValidationGroup="taxfile" ValidationExpression="[a-zA-Z0-9,_, ]*$" ErrorMessage="(AlphaNumeric only)" ControlToValidate="arealocality" style="color:#a94442;"></asp:RegularExpressionValidator></small>
                                                </label>
                                                <input id="arealocality" type="text" class="form-control" placeholder="Area Locality..." runat="server" maxlength="50"/>
                                            </div>
                                        </div>

                                        <div class="col-sm-4">
                                            <div class="form-group">
                                                <label>City 
                                                    <small><asp:RequiredFieldValidator ID="RequiredFieldValidator7" Display="Dynamic" runat="server" ValidationGroup="taxfile" ErrorMessage="(Mandatory)" ControlToValidate="city" style="color:#a94442;"></asp:RequiredFieldValidator></small>
                                                    <small><asp:RegularExpressionValidator ID="RegularExpressionValidator12" Display="Dynamic" runat="server" ValidationGroup="taxfile" ValidationExpression="[a-zA-Z0-9,_, ]*$" ErrorMessage="(AlphaNumeric only)" ControlToValidate="city" style="color:#a94442;"></asp:RegularExpressionValidator></small>
                                                </label>
                                                <input id="city" type="text" class="form-control" placeholder="City..." runat="server" maxlength="50"/>
                                            </div>
                                        </div>
                                        <div class="col-sm-4">
                                            <div class="form-group">
                                                <label>State 
                                                    <small><asp:RequiredFieldValidator ID="RequiredFieldValidator8" Display="Dynamic" runat="server" ValidationGroup="taxfile" ErrorMessage="(Mandatory)" ControlToValidate="state" style="color:#a94442;"></asp:RequiredFieldValidator></small>
                                                    <small><asp:RegularExpressionValidator ID="RegularExpressionValidator13" Display="Dynamic" runat="server" ValidationGroup="taxfile" ValidationExpression="[a-zA-Z0-9,_, ]*$" ErrorMessage="(AlphaNumeric only)" ControlToValidate="state" style="color:#a94442;"></asp:RegularExpressionValidator></small>
                                                </label>
                                                <input id="state" type="text" class="form-control" placeholder="State..." runat="server" maxlength="50"/>
                                            </div>
                                        </div>
                                        <div class="col-sm-4">
                                            <div class="form-group">
                                                <label>Pincode 
                                                    <small><asp:RequiredFieldValidator ID="RequiredFieldValidator9" Display="Dynamic" runat="server" ValidationGroup="taxfile" ErrorMessage="(Mandatory)" ControlToValidate="pincode" style="color:#a94442;"></asp:RequiredFieldValidator></small>
                                                    <small><asp:RegularExpressionValidator ID="RegularExpressionValidator15" Display="Dynamic" runat="server" ValidationGroup="taxfile" ValidationExpression="\d{6}-?(\d{4})?$" ErrorMessage="(Number only)" ControlToValidate="pincode" style="color:#a94442;"></asp:RegularExpressionValidator></small>
                                                </label>
                                                <input id="pincode" type="text" class="form-control" placeholder="Pincode..." runat="server" maxlength="6"/>
                                            </div>
                                        </div>
                                        <div class="col-sm-4">
                                            <div class="form-group">
                                                <label>Country  
                                                    <small><asp:RequiredFieldValidator ID="RequiredFieldValidator10" Display="Dynamic" runat="server" ValidationGroup="taxfile" ErrorMessage="(Mandatory)" ControlToValidate="country" style="color:#a94442;"></asp:RequiredFieldValidator></small>
                                                    <small><asp:RegularExpressionValidator ID="RegularExpressionValidator14" Display="Dynamic" runat="server" ValidationGroup="taxfile" ValidationExpression="[a-zA-Z0-9,_, ]*$" ErrorMessage="(AlphaNumeric only)" ControlToValidate="country" style="color:#a94442;"></asp:RegularExpressionValidator></small>
                                                </label>
                                                <input id="country" type="text" class="form-control" placeholder="Country..." runat="server" maxlength="50"/>
                                            </div>
                                        </div>
                                    </div>
                                </dd>
                                <dt onclick="tabclick(3);">
                                    <a href="#accordion3" aria-expanded="false" aria-controls="accordion3" class="accordion-title accordionTitle js-accordionTrigger" id="accordion3head">Upload Form 16</a>
                                </dt>
                                <dd class="accordion-content accordionItem is-collapsed" id="accordion3" aria-hidden="true">
                                    <div style="margin-top: 20px;">
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <label>Select Form 16 PDF 
                                                 <small><asp:RequiredFieldValidator ID="RequiredFieldValidator15" Display="Dynamic" runat="server" ValidationGroup="taxfile" ErrorMessage="(Mandatory)" ControlToValidate="FileUpload1" style="color:#a94442;"></asp:RequiredFieldValidator></small>
                                                    <small><asp:RegularExpressionValidator ID="RegularExpressionValidator19" Display="Dynamic" runat="server" ValidationGroup="taxfile" ValidationExpression="([a-zA-Z0-9\s_\\.\-:])+(.pdf)$" ErrorMessage="(pdf file only)" ControlToValidate="FileUpload1" style="color:#a94442;"></asp:RegularExpressionValidator></small>
                                                </label>
                                                <asp:FileUpload ID="FileUpload1" runat="server" />
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <label>Enter password of pdf file (if password protected)</label>
                                                <input id="pdfpassword" type="text" class="form-control" placeholder="PDF Password..." runat="server" maxlength="50"/>
                                            </div>
                                        </div>
                                    </div>
                                </dd>
                                <dt onclick="tabclick(4);">
                                    <a href="#accordion4" aria-expanded="false" aria-controls="accordion4" class="accordion-title accordionTitle js-accordionTrigger" id="accordion4head">Bank Details</a>
                                </dt>
                                <dd class="accordion-content accordionItem is-collapsed" id="accordion4" aria-hidden="true">
                                    <div style="margin-top: 20px;">
                                        <div class="col-sm-4">
                                            <div class="form-group">
                                                <label>Bank Account Number 
                                                    <small><asp:RequiredFieldValidator ID="RequiredFieldValidator11" Display="Dynamic" runat="server" ValidationGroup="taxfile" ErrorMessage="(Mandatory)" ControlToValidate="bankaccountnumber" style="color:#a94442;"></asp:RequiredFieldValidator></small>
                                                    <small><asp:RegularExpressionValidator ID="RegularExpressionValidator17" Display="Dynamic" runat="server" ValidationGroup="taxfile" ValidationExpression="^[a-zA-Z0-9]([/-]?(((\d*[1-9]\d*)*[a-zA-Z/-])|(\d*[1-9]\d*[a-zA-Z]*))+)*[0-9]*$" ErrorMessage="(AlphaNumeric only)" ControlToValidate="bankaccountnumber" style="color:#a94442;"></asp:RegularExpressionValidator></small>
                                                </label>
                                                <input id="bankaccountnumber" type="text" class="form-control" placeholder="Bank Account Number..." runat="server" maxlength="20"/>
                                            </div>
                                        </div>
                                        <div class="col-sm-4">
                                            <div class="form-group">
                                                <label>IFSC Code
                                                    <small><asp:RequiredFieldValidator ID="RequiredFieldValidator12" Display="Dynamic" runat="server" ValidationGroup="taxfile" ErrorMessage="(Mandatory)" ControlToValidate="IFSCcode" style="color:#a94442;"></asp:RequiredFieldValidator></small>
                                                    <small><asp:RegularExpressionValidator ID="RegularExpressionValidator18" Display="Dynamic" runat="server" ValidationGroup="taxfile" ValidationExpression="^[A-Z]{4}[0][A-Z0-9]{6}$" ErrorMessage="(AlphaNumeric only)" ControlToValidate="IFSCcode" style="color:#a94442;"></asp:RegularExpressionValidator></small>
                                                </label>
                                                <input id="IFSCcode" type="text" class="form-control" placeholder="IFSC Code for the Bank..." runat="server" maxlength="11"/>
                                            </div>
                                        </div>
                                        <div class="col-sm-4">
                                            <div class="form-group">
                                                <label>BANK Name 
                                                    <small><asp:RequiredFieldValidator ID="RequiredFieldValidator13" Display="Dynamic" runat="server" ValidationGroup="taxfile" ErrorMessage="(Mandatory)" ControlToValidate="bankname" style="color:#a94442;"></asp:RequiredFieldValidator></small>
                                                    <small><asp:RegularExpressionValidator ID="RegularExpressionValidator16" Display="Dynamic" runat="server" ValidationGroup="taxfile" ValidationExpression="[a-zA-Z0-9,_, ]*$" ErrorMessage="(AlphaNumeric only)" ControlToValidate="bankname" style="color:#a94442;"></asp:RegularExpressionValidator></small>
                                                </label>
                                                <input id="bankname" type="text" class="form-control" placeholder="BANK Name..." runat="server" maxlength="125"/>
                                            </div>
                                        </div>
                                        <div class="col-sm-4">
                                            <div class="form-group">
                                                <label>Primary Account</label>
                                                <br>
                                                <asp:DropDownList ID="dd_primaryaccount" runat="server" CssClass="form-control">
                                                    <asp:ListItem Value="true" Text="Yes"></asp:ListItem>
                                                    <asp:ListItem Value="false" Text="No"></asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="col-sm-4">
                                            <div class="form-group">
                                                <label>Account Type</label>
                                                <br>
                                                <asp:DropDownList ID="dd_accounttype" runat="server" CssClass="form-control">
                                                    <asp:ListItem Value="SAV" Text="Savings"></asp:ListItem>
                                                    <asp:ListItem Value="CUR" Text="Current"></asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                    </div>
                                </dd>
                            </dl>
                        </div>
                          <div class="heading-primary">
                     <asp:LinkButton ID="taxfileButton" runat="server" ValidationGroup="taxfile" class="btn btn-finish btn-fill btn-warning btn-wd btn-lg" OnClientClick="fireValidation();" OnClick="taxfileButton_Click">Submit</asp:LinkButton>
                                    </div>
                    </div>
                </div>
            </div>

            <!-- -----------------------------------footer starts-->
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
                            <p><a href="#" class="md-trigger" data-modal="Modal-CallMe">Call Me</a></p>
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
                        <br>
                        <p>
                            <script type="text/javascript">new pausescroller(pausecontent_LIFE, "pscroller1", "someclass", 7000)</script>
                        </p>
                    </div>
                    <div class="clear"></div>
                </div>
            </div>
            <!-- -----------------------------------footer ends-->

            <!-- -----------------------------------footer bottom starts-->
            <div class="footer-bottom">
                <div class="wrap2">
                    <div class="copy">
                        <p>
                            Fincart is an online initiative of 3E Advisors Private Limited. 3E refers to Educate, Empower and Enable. Our vision is to be the most ethical personal finance portal that helps people make great progress with money by educating investors, empowering to make informed decisions and enabling with an online platform to help Plan, Transact and Track your life investments.<br>
                            CIN # U74140DL2012PTC245046 | ARN # 86903 | Logo Trademark # 2523746 | ISO 9001:2000  Registration # PCMS/QMS/2019-2013
                        </p>
                        <br>
                        <div style="margin: auto; text-align: center; width: 100px">
                        </div>
                        <br />
                        <p>Fincart.com TM + © 2012-2015. All rights reserved. Last Update: 15 October 2015.<br>
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
            <!-- -----------------------------------footer bottom ends-->

            <!-- -----------------------------------footer fixed starts-->
            <div class="footer-fixed">
                <div class="footer-inner">
                    <div class="footer-fixed1">Call (91) 11 30018181</div>
                    <div class="footer-fixed2">
                        <a href="#" class="md-trigger" data-modal="Modal-CallMe">Call Me</a>
                        <div class="md-modal md-effect-1" id='Modal-CallMe'>
                            <div class="md-content">
                                <h3>Call Me Request<span><a href="#" class="md-close" style="text-decoration: none;">X</a></span></h3>
                                <div>
                                    <asp:UpdatePanel ID="upMain" runat="server">
                                        <ContentTemplate>
                                            <div id="formtop" runat="server">
                                                <asp:TextBox ID="txtCountryCode" Text="+91" runat="server" class="inputfield" Width="20" MaxLength="3" ValidationGroup="callback"></asp:TextBox>
                                                <asp:TextBox ID="txtMobile" runat="server" MaxLength="10" placeholder="Mobile" class="inputfield" Width="75" ValidationGroup="callback"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredMobile" runat="server" Display="Dynamic" ValidationGroup="callback" EnableClientScript="false" ErrorMessage="*" ControlToValidate="txtMobile" CssClass="mandatory"></asp:RequiredFieldValidator>
                                                <asp:TextBox ID="txtName" runat="server" placeholder="Name" class="inputfield" Width="120" ValidationGroup="callback"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredName" runat="server" Display="Dynamic" ValidationGroup="callback" EnableClientScript="false" ErrorMessage="*" ControlToValidate="txtName" CssClass="mandatory"></asp:RequiredFieldValidator>
                                                <asp:TextBox ID="txtEmail" runat="server" placeholder="Email" class="inputfield" Width="210" ValidationGroup="callback"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredEmail" runat="server" Display="Dynamic" ValidationGroup="callback" EnableClientScript="false" ErrorMessage="*" ControlToValidate="txtEmail" CssClass="mandatory"></asp:RequiredFieldValidator>
                                                <asp:LinkButton ID="CallBackSubmit" runat="server" class="MainButton" ValidationGroup="callback">Submit</asp:LinkButton>
                                            </div>
                                            <asp:Label ID="lblCallBackSubmit" Text="" runat="server"></asp:Label>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </div>
                            </div>
                        </div>
                        <div class="md-overlay"></div>
                        <!-- the overlay element -->
                    </div>
                    <div class="footer-fixed3"><a href="feedback.aspx">Feedback</a></div>
                    <%--<div class="footer-fixed4">Newsletter</div>--%>
                    <div class="footer-fixed5">
                        <asp:UpdatePanel ID="UpdatePanelSubscription" runat="server">
                            <ContentTemplate>
                                <asp:Label ID="subscribeSuccess" runat="server" CssClass="fixedfrmSubmit" Text="Subscription Done Successfully" Visible="false"></asp:Label>
                                <asp:TextBox ID="newsletter" CssClass="fixedfrmSubmit" placeholder=" Enter Email ID for Newsletter" runat="server" ValidationGroup="subscription" Style="border-radius: 3px; border: 0;"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RFNewsletter" ValidationGroup="subscription" runat="server" ErrorMessage="*" Display="Dynamic" ControlToValidate="newsletter" CssClass="mandatory"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2"
                                    runat="server" ErrorMessage="Please Enter Valid Email ID"
                                    ValidationGroup="subscription" ControlToValidate="newsletter" Display="Dynamic"
                                    CssClass="mandatoryfooter"
                                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
                                </asp:RegularExpressionValidator>
                                <asp:ImageButton ID="butNewsletter" runat="server" ImageUrl="~/images/go1.png" ValidationGroup="subscription" />

                            </ContentTemplate>
                        </asp:UpdatePanel>

                    </div>
                    <%--<div class="footer-fixed6"><a href="#">Message Us</a></div>--%>
                </div>
            </div>
            <!-- -----------------------------------footer fixed ends-->


            <script src="js/index.js"></script>
        </div>
    </form>
</body>
</html>
