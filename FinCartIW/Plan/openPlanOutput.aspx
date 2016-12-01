<%@ Page Title="Plan Output" Language="C#" MasterPageFile="~/Plan/Website.master" AutoEventWireup="true" CodeFile="openPlanOutput.aspx.cs" Inherits="Plan_openPlanOutput" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajxct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script src="../ChartNew/amcharts/amchartsNew.js" type="text/javascript"></script> 
    <script src="../ChartNew/amcharts/serial.js" type="text/javascript"></script>  
    <script src="../ChartNew/amcharts/pie.js" type="text/javascript"></script> 

    <style type="text/css">   
    .ErrorControl
    {
        background-color: #ffffff !important;
        border: solid 1px #f00 !important;
    }
</style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <div class="MainContainer">
        <div class="planArea">
            <div class="row">
                <div class="col-sm-6">
                    <h2>Insta SIP</h2>
                </div>
                <div class="col-sm-6 textAlignRight">
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">Open Free Account</button>
                    <button type="button" class="btn btn-default" data-toggle="modal" data-target="#myModalSave">Save for Future</button>
                </div>                
            </div>
            <div class="row">
                <div class="col-sm-3 FPOLeft">
                    <div class="row">
                        <div class="col-sm-12">
                            <h3>My Risk Appetite</h3>
                            <p><asp:Image ID="imgRisk" ImageUrl="" runat="server" /></p>
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
                            <h3>Asset Allocation</h3>
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
                                    <h3>Scheme Matrix</h3>
                                </div>
                                <div class="col-sm-6 textAlignRight">
                                    <div class="form-inline" role="form">
                                      <div class="form-group">                            
                                        <label>Amount Rs.</label>
                                          <asp:TextBox ID="txtAmount_BoundControl" CssClass="form-input-borderless" runat="server" Width="90" ></asp:TextBox>
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
                            <div id="SchemeMatrix" style="width: 100%; height: 220px;"></div>                            
                        </div>
                       <%--</ContentTemplate>
                           <Triggers>
                                <asp:AsyncPostBackTrigger ControlID ="txtAmount" EventName ="TextChanged" />
                           </Triggers>
                       </asp:UpdatePanel>--%>
                    </div>

                    <div class="row">
                        <div class="col-sm-12">
                            <h3>Scheme Performance</h3>
                            <div class="goalGrid">
                                <asp:GridView ID="GVSchemePerformance" runat="server" AutoGenerateColumns="false" Width="100%" GridLines="None"  >
                                <Columns>                    
                                    <asp:BoundField DataField="Sname" HeaderText="Scheme " ReadOnly="true"   >
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle HorizontalAlign="Left" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Curr_NAV" HeaderText="Current NAV" HeaderStyle-CssClass="GV-HeaderStyleRight"   >                                    
                                    <HeaderStyle HorizontalAlign="right" />
                                    <ItemStyle HorizontalAlign="right" />
                                    </asp:BoundField>  
                                    <asp:BoundField DataField="Curr_Corpus" HeaderText="Corpus" ReadOnly="true" DataFormatString="{0:##,##,##,##,###}" HeaderStyle-CssClass="GV-HeaderStyleRight" >
                                    <HeaderStyle HorizontalAlign="right" />
                                    <ItemStyle HorizontalAlign="right" />
                                    </asp:BoundField>  
                                    <asp:BoundField DataField="Growth6" HeaderText="1 Year" ReadOnly="true" HeaderStyle-CssClass="GV-HeaderStyleRight" >
                                    <HeaderStyle HorizontalAlign="right" />
                                    <ItemStyle HorizontalAlign="right" />                            
                                    </asp:BoundField>                        
                                    <asp:BoundField DataField="Growth8" HeaderText="3 Year" ReadOnly="true" HeaderStyle-CssClass="GV-HeaderStyleRight" >
                                    <HeaderStyle HorizontalAlign="right" />
                                    <ItemStyle HorizontalAlign="right" />                            
                                    </asp:BoundField>                                                                  
                                    <asp:BoundField DataField="Growth10" HeaderText="5 Year" ReadOnly="true" HeaderStyle-CssClass="GV-HeaderStyleRight" >
                                    <HeaderStyle HorizontalAlign="right" />
                                    <ItemStyle HorizontalAlign="right" />                            
                                    </asp:BoundField> 
                                    <asp:BoundField DataField="Growth11" HeaderText="10 Year" ReadOnly="true" HeaderStyle-CssClass="GV-HeaderStyleRight" >
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
                </div>
            </div>
        </div>

        <!-- Modal for Invest Now -->        
            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="vertical-alignment-helper">
                    <div class="modal-dialog vertical-align-center">
                        <%--<asp:UpdatePanel ID="UpdatePanel2" runat="server">
                           <ContentTemplate>--%>
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span>

                                </button>
                                 <h4 class="modal-title" id="myModalLabel">Open Free Secure Online Account</h4>                                 
                            </div>
                            <div class="modal-body">
                                <p>Get your customized investment plan.</p>
                                <div class="row">
                                    <div class="col-sm-12">
                                        <asp:Label ID="emailValidate" runat="server" Text="" CssClass="validateEmail"></asp:Label>
                                    </div>
                                </div>
                                <div role="form">
                                    <div class="form-group">                    
                                        <asp:TextBox type="text" name="name" runat="server" placeholder="Enter Name" TabIndex="1" id="name" class="form-control" ValidationGroup="RegisterInfo"  />                    
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="RegisterInfo" Display="Dynamic" ErrorMessage="" ControlToValidate="name" CssClass="mandatory"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="form-group">                    
                                        <div class="input-group">
                                            <span class="input-group-addon">+91</span>
                                            <asp:TextBox type="text" name="countrycode" id="txtCountryCode" MaxLength="3" runat="server" value=" +91" Visible="false" ValidationGroup="RegisterInfo" />
                                            <asp:TextBox type="text" name="mobile" id="mobile" Placeholder="Enter Mobile No." runat="server" class="form-control" MaxLength="10" ValidationGroup="RegisterInfo" />
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="RegisterInfo" Display="Dynamic" ErrorMessage="" ControlToValidate="mobile" CssClass="mandatory"></asp:RequiredFieldValidator>
                                        </div>                    
                                    </div>
                                    <div class="form-group">                    
                                        <asp:TextBox type="text" name="email" id="email" runat="server" placeholder="Enter Email" class="form-control" ValidationGroup="RegisterInfo"  />                    
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" Display="Dynamic" runat="server" ValidationGroup="RegisterInfo" ErrorMessage="" ControlToValidate="email" CssClass="mandatory"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="form-group">                    
                                        <asp:TextBox type="password" name="password" id="txtPassword" runat="server" placeholder="password" class="form-control" ValidationGroup="RegisterInfo"  />                    
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" Display="Dynamic" runat="server" ValidationGroup="RegisterInfo" ErrorMessage="" ControlToValidate="txtPassword" CssClass="mandatory"></asp:RequiredFieldValidator>
                                    </div>                
                                    <div class="form-group">
                                        <asp:Button type="submit" name="RegisterButton" id="RegisterButton" runat="server" ValidationGroup="RegisterInfo" Text="Looks Great! Get Started Now" class="btn btn-info btn-block btn-md" OnClick="RegisterButton_Click" />                    
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>                                
                            </div>
                        </div>                               
                              <%-- </ContentTemplate>
                            </asp:UpdatePanel>--%>
                    </div>
                </div>
            </div>

            <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                           <ContentTemplate>
        <!-- Modal for Invest Now -->        
            <div class="modal fade" id="myModalSave" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="vertical-alignment-helper">
                    <div class="modal-dialog vertical-align-center">
                        
                        <div class="modal-content" >
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span>

                                </button>
                                 <h4 class="modal-title" id="H1">Save your selection for Future</h4>                                 
                            </div>
                            <div class="modal-body" >
                                <p>Access your investment plan at your convenience.</p>
                                
                                <div role="form">
                                    <div class="form-group">                    
                                        <asp:TextBox type="text" name="name2" runat="server" placeholder="Enter Name" TabIndex="1" id="txtName2" class="form-control" ValidationGroup="SaveForFuture"  />                    
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ValidationGroup="SaveForFuture" Display="Dynamic" ErrorMessage="" ControlToValidate="txtName2" CssClass="mandatory"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="form-group">                    
                                        <div class="input-group">
                                            <span class="input-group-addon">+91</span>
                                            <asp:TextBox type="text" name="countrycode2" id="txtCountryCode2" MaxLength="3" runat="server" value=" +91" Visible="false" ValidationGroup="SaveForFuture" />
                                            <asp:TextBox type="text" name="mobile2" id="txtMobile2" Placeholder="Enter Mobile No." runat="server" class="form-control" MaxLength="10" ValidationGroup="SaveForFuture" />
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ValidationGroup="SaveForFuture" Display="Dynamic" ErrorMessage="" ControlToValidate="txtMobile2" CssClass="mandatory"></asp:RequiredFieldValidator>
                                        </div>                    
                                    </div>
                                    <div class="form-group">                    
                                        <asp:TextBox type="text" name="email2" id="txtEmail2" runat="server" placeholder="Enter Email" class="form-control" ValidationGroup="SaveForFuture"  />                    
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" Display="Dynamic" runat="server" ValidationGroup="SaveForFuture" ErrorMessage="" ControlToValidate="txtEmail2" CssClass="mandatory"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="form-group">                    
                                        <asp:TextBox type="password" name="password2" id="txtPassword2" runat="server" placeholder="password" class="form-control" ValidationGroup="SaveForFuture"  />                    
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" Display="Dynamic" runat="server" ValidationGroup="SaveForFuture" ErrorMessage="" ControlToValidate="txtPassword2" CssClass="mandatory"></asp:RequiredFieldValidator>
                                    </div>                
                                    <div class="form-group">
                                        <asp:Button type="submit" id="btnSaveforFuture" runat="server" ValidationGroup="SaveForFuture" Text="Save Now" class="btn btn-info btn-block btn-md" OnClick="btnSaveforFuture_Click" />                    
                                    </div>
                                </div>
                            </div>
                           
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>                                
                            </div>
                        </div>                                                       
                    </div>
                </div>
            </div>
            </ContentTemplate>
                            </asp:UpdatePanel>
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

