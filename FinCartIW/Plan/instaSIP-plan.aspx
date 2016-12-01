<%@ Page Title="Insta SIP Plan" Language="C#" MasterPageFile="~/Plan/Website.master" AutoEventWireup="true" CodeFile="instaSIP-plan.aspx.cs" Inherits="Plan_instaSIP_plan" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajxct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="../ChartNew/amcharts/amchartsNew.js" type="text/javascript"></script>
    <script src="../ChartNew/amcharts/serial.js" type="text/javascript"></script>
    <script src="../ChartNew/amcharts/pie.js" type="text/javascript"></script>

    <style type="text/css">
        .ErrorControl {
            background-color: #ffffff !important;
            border: solid 1px #f00 !important;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="MainContainer">
        <div class="planAreaBg">
            <div class="planArea">
                <div class="row">
                    <div class="col-sm-6">
                        &nbsp;
                    </div>
                </div>
                <div class="row" style="text-align: left;">
                    <div class="col-sm-3 FPOLeft">
                        <div class="row">
                            <div class="col-sm-12">
                                <h3 style="font-size: 24px; margin-bottom: 10px; margin-top: 20px; font-weight: 500; line-height: 1.1; vertical-align: baseline;">My Risk Appetite</h3>
                                <p>
                                    <asp:Image ID="imgRisk" ImageUrl="" runat="server" /></p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12">
                                <p><a href="instaSIP.aspx">Change My Risk Profile</a></p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12 line-separator">
                                &nbsp;
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12">
                                <h3 style="font-size: 24px; margin-bottom: 10px; margin-top: 20px; font-weight: 500; line-height: 1.1; vertical-align: baseline;">Asset Allocation</h3>
                                <asp:Literal ID="ltScripts" runat="server"></asp:Literal>
                                <div id="AssetChart" style="width: 100%; height: 280px;"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-9 FPORight">

                        <div class="row">
                            <%--<asp:UpdatePanel ID="UpdatePanel1" runat="server">
                           <ContentTemplate>--%>
                            <div class="col-sm-12 line-separator">
                                <div class="row">
                                    <div class="col-sm-6">
                                        <h3 style="font-size: 24px; margin-bottom: 10px; margin-top: 20px; font-weight: 500; line-height: 1.1; vertical-align: baseline;">Scheme Matrix</h3>
                                    </div>
                                    <div class="col-sm-6 textAlignRight">
                                        <div class="form-inline" role="form">
                                            <div class="form-group">
                                                <label>Amount Rs.</label>
                                                <asp:TextBox ID="txtAmount_BoundControl" CssClass="form-input-borderless" runat="server" Width="90"></asp:TextBox>
                                                <asp:TextBox ID="txtAmount" CssClass="form-control" runat="server" Width="80" OnTextChanged="txtAmount_TextChanged" AutoPostBack="true"></asp:TextBox>
                                                <ajxct:SliderExtender ID="SliderExtender1" runat="server"
                                                    BehaviorID="txtAmount"
                                                    TargetControlID="txtAmount"
                                                    Minimum="5000"
                                                    Maximum="1000000"
                                                    EnableHandleAnimation="true"
                                                    BoundControlID="txtAmount_BoundControl"
                                                    RaiseChangeOnlyOnMouseUp="True"
                                                    TooltipText="Current Amount : {0}"
                                                    Steps="996" />
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <asp:Literal ID="ltSMScripts" runat="server"></asp:Literal>
                                <div id="SchemeMatrix" style="width: 100%; height: 160px;"></div>
                            </div>
                            <%--</ContentTemplate>
                           <Triggers>
                                <asp:AsyncPostBackTrigger ControlID ="txtAmount" EventName ="TextChanged" />
                           </Triggers>
                       </asp:UpdatePanel>--%>
                        </div>

                        <div class="row">
                            <div class="col-sm-12">
                                <h3 style="font-size: 24px; margin-bottom: 10px; margin-top: 20px; font-weight: 500; line-height: 1.1; vertical-align: baseline;">Scheme Performance(% CAGR)</h3>
                                <div class="goalGrid">
                                    <asp:GridView ID="GVSchemePerformance" runat="server" AutoGenerateColumns="false" Width="100%" GridLines="None">
                                        <Columns>
                                            <asp:BoundField DataField="Sname" HeaderText="Scheme " ReadOnly="true">
                                                <HeaderStyle HorizontalAlign="Left" />
                                                <ItemStyle HorizontalAlign="Left" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="Curr_NAV" HeaderText="Current NAV" HeaderStyle-CssClass="GV-HeaderStyleRight">
                                                <HeaderStyle HorizontalAlign="right" />
                                                <ItemStyle HorizontalAlign="right" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="Curr_Corpus" HeaderText="Corpus(Cr.)" ReadOnly="true" DataFormatString="{0:##,##,##,##,###}" HeaderStyle-CssClass="GV-HeaderStyleRight">
                                                <HeaderStyle HorizontalAlign="right" />
                                                <ItemStyle HorizontalAlign="right" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="Growth6" HeaderText="1 Year" ReadOnly="true" HeaderStyle-CssClass="GV-HeaderStyleRight">
                                                <HeaderStyle HorizontalAlign="right" />
                                                <ItemStyle HorizontalAlign="right" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="Growth8" HeaderText="3 Year" ReadOnly="true" HeaderStyle-CssClass="GV-HeaderStyleRight">
                                                <HeaderStyle HorizontalAlign="right" />
                                                <ItemStyle HorizontalAlign="right" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="Growth10" HeaderText="5 Year" ReadOnly="true" HeaderStyle-CssClass="GV-HeaderStyleRight">
                                                <HeaderStyle HorizontalAlign="right" />
                                                <ItemStyle HorizontalAlign="right" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="Growth11" HeaderText="10 Year" ReadOnly="true" HeaderStyle-CssClass="GV-HeaderStyleRight">
                                                <HeaderStyle HorizontalAlign="right" />
                                                <ItemStyle HorizontalAlign="right" />
                                            </asp:BoundField>
                                        </Columns>
                                        <AlternatingRowStyle CssClass="GV-AlternatingRowStyle" />
                                        <EditRowStyle CssClass="GV-EditRow" />
                                        <HeaderStyle CssClass="GV-HeaderStyle" />
                                        <PagerStyle CssClass="GV-PagerStyle" />
                                        <RowStyle CssClass="GV-RowStyle" />
                                        <SelectedRowStyle CssClass="GV-SelectedRowStyle" />
                                    </asp:GridView>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12 textAlignRight" runat="server" id="OpenFreeAc" visible="false">
                               <div class="col-sm-9">
                                    <asp:Label ID="emailValidate" runat="server" Text="" CssClass="validateEmail"></asp:Label>
                                   </div>
                                <div class="col-sm-2">
                                <a class="btn btn-danger" href="javascript:openreg();">Looks Great! Open Free Account</a>
                                    </div>
                            </div>
                            <div class="col-sm-12 textAlignRight" runat="server" id="transactNow" visible="false">
                                <asp:Button ID="btnTransact" runat="server" CssClass="btn btn-danger" Text="Transact Now" OnClick="btnTransact_Click" />
                            </div>
                            <div class="col-sm-12 textAlignRight" runat="server" id="proceedandtransactNow" visible="false">
                                <asp:Button ID="btnProoceedandTransact" runat="server" CssClass="btn btn-danger" Text="Proceed And Transact Now" OnClick="btnProoceedandTransact_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <!-- Modal for Invest Now -->
    <div class="modal fade" id="myModal" role="dialog">
        <div class="modal-dialog" style="margin-top: 15%;">
            <%--<asp:UpdatePanel ID="UpdatePanel2" runat="server">
                           <ContentTemplate>--%>
            <div class="modal-content" style="text-align: left;">
                <div class="modal-header">
                    <%--<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span>

                                </button>--%>
                    <h4 class="modal-title" id="myModalLabel" style="font-size: 18px; font-weight: 500; line-height: 1.42857; vertical-align: baseline;">Open Free Secure Online Account</h4>
                </div>
                <div class="modal-body">
                    <p style="margin: 0 0 10px; vertical-align: baseline;">Get your customized investment plan.</p>
                    <div role="form">
                        <div class="form-group">
                            <asp:TextBox type="text" name="name" runat="server" placeholder="Enter Name" TabIndex="1" ID="name" class="form-control" ValidationGroup="RegisterInfo" Style="background-color: #ccc;" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="RegisterInfo" Display="Dynamic" ErrorMessage="" ControlToValidate="name" CssClass="mandatory"></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group">
                            <div class="input-group">
                                <span class="input-group-addon">+91</span>
                                <asp:TextBox type="text" name="countrycode" ID="txtCountryCode" MaxLength="3" runat="server" value=" +91" Visible="false" ValidationGroup="RegisterInfo" />
                                <asp:TextBox type="text" name="mobile" ID="mobile" Placeholder="Enter Mobile No." runat="server" class="form-control" MaxLength="10" ValidationGroup="RegisterInfo" Style="background-color: #ccc;" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="RegisterInfo" Display="Dynamic" ErrorMessage="" ControlToValidate="mobile" CssClass="mandatory"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:TextBox type="text" name="email" ID="email" runat="server" placeholder="Enter Email" class="form-control" ValidationGroup="RegisterInfo" Style="background-color: #ccc;" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" Display="Dynamic" runat="server" ValidationGroup="RegisterInfo" ErrorMessage="" ControlToValidate="email" CssClass="mandatory"></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group">
                            <asp:TextBox type="password" name="password" ID="txtPassword" runat="server" placeholder="password" class="form-control" ValidationGroup="RegisterInfo" Style="background-color: #ccc;" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" Display="Dynamic" runat="server" ValidationGroup="RegisterInfo" ErrorMessage="" ControlToValidate="txtPassword" CssClass="mandatory"></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group">
                            <label class="radio-inline">
                                <asp:RadioButton ID="WT_online" runat="server" GroupName="worktype" Checked="true" />Online Transact</label>
                            <label class="radio-inline">
                                <asp:RadioButton ID="WT_save" runat="server" GroupName="worktype" />Save for Future</label>
                        </div>
                        <div class="form-group">
                            <asp:Button type="submit" name="RegisterButton" ID="RegisterButton" runat="server" ValidationGroup="RegisterInfo" Text="Get Started Now" class="btn btn-info btn-block btn-md" OnClick="RegisterButton_Click" />
                        </div>
                        <div class="form-group">
                            <div style="text-align: center; border-radius: 5px; margin-top: 2px; background-color: transparent; color: #000; text-decoration: underline;" class="alert-danger">
                                Already member? 
                                <a style="color: #0db9f0" href="javascript:openlogin('lit_sucess');">Log IN</a>
                            </div>
                        </div>
                    </div>
                </div>
                <%--<div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>                                
                            </div>--%>
            </div>
            <%-- </ContentTemplate>
                            </asp:UpdatePanel>--%>
        </div>
    </div>

    <!-- Modal login-->
    <div id="loginModal" class="modal fade" role="dialog">
        <div class="modal-dialog" style="margin-top: 15%;">

            <!-- Modal content-->
            <div class="modal-content" style="text-align: left;">
                <div class="modal-header">
                    <h4 class="modal-title">Sign In</h4>
                </div>
                <div class="modal-body">
                    <div role="form">
                        <div class="form-group">
                            <label for="email">Email ID</label>
                            <asp:TextBox type="text" name="eusername" runat="server" TabIndex="1" ID="eusername" class="form-control" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="*Email Required" ControlToValidate="eusername" Display="Dynamic" ValidationGroup="SubmitInfo" ForeColor="Red"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ErrorMessage="*Invalid Email" ControlToValidate="eusername" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$" Display="Dynamic" ValidationGroup="SubmitInfo" ForeColor="Red"></asp:RegularExpressionValidator>
                        </div>
                        <div class="form-group">
                            <label for="pwd">Password&nbsp;&nbsp;(<a href="javascript:openforgetpass();" class="underlineLink">Forgot Password?</a>)</label>
                            <asp:TextBox type="password" name="epassword" runat="server" TabIndex="2" ID="epassword" class="form-control" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ErrorMessage="*Password Required" ControlToValidate="epassword" Display="Dynamic" ValidationGroup="SubmitInfo" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group">
                            <asp:Button ID="LoginButton" TabIndex="4" runat="server" class="btn btn-info btn-block" Text="Login" ValidationGroup="SubmitInfo" OnClick="LoginButton_Click" />
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>

    <!-- Modal forgetpass-->
    <div id="forgetpassModal" class="modal fade" role="dialog">
        <div class="modal-dialog" style="margin-top: 15%;">

            <!-- Modal content-->
            <div class="modal-content" style="text-align: left;">
                <div class="modal-header">
                    <h4 class="modal-title">Forget Password</h4>
                </div>
                <div class="modal-body">
                    <div role="form">
                        <div class="form-group">
                            <label for="txtEmailID">Email ID</label>
                            <asp:TextBox type="text" name="txtEmailID" runat="server" TabIndex="1" ID="txtEmailID" class="form-control" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ErrorMessage="*Email Required" ControlToValidate="txtEmailID" Display="Dynamic" ValidationGroup="forgotp" ForeColor="Red"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ErrorMessage="*Invalid Email" ControlToValidate="txtEmailID" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$" Display="Dynamic" ValidationGroup="forgotp" ForeColor="Red"></asp:RegularExpressionValidator>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <asp:Button ID="forgetButton" runat="server" Text="Submit" CssClass="btn btn-info btn-block" ValidationGroup="forgotp" OnClick="forgetButton_Click" />
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>

    <script>
        function openreg() {
            $('#loginModal').modal('hide');
            $('#forgetpassModal').modal('hide');
            $('#myModal').modal({ backdrop: 'static', keyboard: true, show: true });
        }
        function openlogin() {
            $('#myModal').modal('hide');
            $('#forgetpassModal').modal('hide');
            $('#loginModal').modal({ backdrop: 'static', keyboard: true, show: true });
        }
        function openforgetpass() {
            $('#loginModal').modal('hide');
            $('#myModal').modal('hide');
            $('#forgetpassModal').modal({ backdrop: 'static', keyboard: true, show: true });
        }
    </script>

    <div runat="server" id="modalpopup">
        <script type="text/javascript">
            //$(document).ready(function () {
            //    setTimeout(function () {
            //        $("#myModal").modal('show');
            //    }, 10000);
            //});
        </script>
    </div>

    <script type="text/javascript">
        function WebForm_OnSubmit() {
            if (typeof (ValidatorOnSubmit) == "function" && ValidatorOnSubmit() == false) {
                for (var i in Page_Validators) {
                    try {
                        var control = document.getElementById(Page_Validators[i].controltovalidate);
                        if (!Page_Validators[i].isvalid) {
                            control.className = "form-control ErrorControl";
                        } else {
                            control.className = "form-control";
                        }
                    } catch (e) { }
                }
                return false;
            }
            return true;
        }
    </script>
</asp:Content>

