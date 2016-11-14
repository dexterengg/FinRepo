<%@ Page Title="Add Lead" Language="C#" MasterPageFile="~/Admin/AdminDashBoard.master" AutoEventWireup="true" CodeFile="AddLead.aspx.cs" Inherits="Admin_AddLead" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajxct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AdminContentPlaceHolder" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager> 
    <h1>Add a Lead</h1>
    
   <%-- <asp:UpdatePanel ID="UpdatePanelLead" runat="server" EnableViewState="False">
                <ContentTemplate>--%>
                    <div class="hr-normal-cbp-mc-form">
                        <div class="hr-normal-cbp-mc-column">
                            <div class="hr-normal-cbp-mc-column-inner">
                                <label for="investorname"><span class="mandatory">#</span>Investor Name <asp:RequiredFieldValidator ID="ReqInvestorName" ValidationGroup="addlead" runat="server" ErrorMessage="Required" Display="Dynamic" ControlToValidate="txtInvestorName" CssClass="mandatory"></asp:RequiredFieldValidator></label>
                                <asp:TextBox type="text" name="investorname" id="txtInvestorName" CssClass="inputfield" TabIndex="1"  runat="server"  ValidationGroup="addlead" />                                 
                            </div>
                            <div class="hr-normal-cbp-mc-column-inner">
                                <label for="gender" >Gender </label>                                
                                 <asp:DropDownList ID="DDGender" TabIndex="2" CssClass="inputfield" runat="server" ValidationGroup="addlead" >               
                                     <asp:ListItem Value="M">Male</asp:ListItem>
                                     <asp:ListItem Value="F">Female</asp:ListItem>                                                                                              
                                </asp:DropDownList>                             
                            </div>
                            <div class="hr-normal-cbp-mc-column-inner">
                                <label for="dob">DOB</label>
                                <asp:TextBox type="text" name="dob" id="txtDOB" CssClass="inputfield" TabIndex="3"  runat="server"  ValidationGroup="addlead" />                                
                                <ajxct:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtDOB"  Format="dd-MM-yyyy" SkinID="2" Animated="true"  />
                            </div>
                            <div class="hr-normal-cbp-mc-column-inner">
                                <label for="mobile1" ><span class="mandatory">#</span>Mobile 1 <asp:RequiredFieldValidator ID="RFMobile1" ValidationGroup="addlead" runat="server" ErrorMessage="Required" Display="Dynamic" ControlToValidate="txtMobile1" CssClass="mandatory"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="REVMobile1" 
                runat="server" ErrorMessage="Phone Number is not valid" Display="Dynamic"
                    ValidationGroup="addlead" ControlToValidate="txtMobile1"  CssClass="mandatory"
                    validationexpression="^[0-9]{10}$">
                    </asp:RegularExpressionValidator>
                                </label>
                                <asp:TextBox type="text" name="email1" id="txtMobile1" MaxLength="10" CssClass="inputfield" TabIndex="4"  runat="server"  ValidationGroup="addlead" />  
                            </div>
                        </div>
                        <div class="hr-normal-cbp-mc-column">
                            <div class="hr-normal-cbp-mc-column-inner">
                                <label for="email1" ><span class="mandatory">#</span>Email ID <asp:RequiredFieldValidator ID="RFEmail1" ValidationGroup="addlead" runat="server" ErrorMessage="Required" Display="Dynamic" ControlToValidate="txtEmail1" CssClass="mandatory"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" 
                runat="server" ErrorMessage="Please Enter Valid Email ID"
                    ValidationGroup="addlead" ControlToValidate="txtEmail1" Display="Dynamic"                     
                    CssClass="mandatory" 
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
                    </asp:RegularExpressionValidator>
                                </label>
                                <asp:TextBox type="text" name="email1" id="txtEmail1" CssClass="inputfield" TabIndex="5"  runat="server"  ValidationGroup="addlead" />
                                
                            </div>  
                            <div class="hr-normal-cbp-mc-column-inner">
                                <label for="rateofInterest" >City</label>
                                <asp:TextBox type="text" name="rateofInterest" id="txtCity" CssClass="inputfield" TabIndex="6"  runat="server"  ValidationGroup="addlead" />  
                                                              
                            </div>
                            <div class="hr-normal-cbp-mc-column-inner">
                                <label for="state">State</label>
                                <asp:TextBox type="text" name="state" id="txtState" CssClass="inputfield" TabIndex="7"  runat="server"  ValidationGroup="addlead" />
                            </div>
                            <div class="hr-normal-cbp-mc-column-inner">
                                <label for="pin" >Pin</label>
                                <asp:TextBox type="text" name="pin" id="txtPin" CssClass="inputfield" TabIndex="8"  runat="server"  ValidationGroup="addlead" />                                
                            </div>                              
                        </div>                    
                    <div class="hr-normal-cbp-mc-column">
                            <div class="hr-normal-cbp-mc-column-inner">
                                <label for="source1" >Source 1</label>
                                <asp:DropDownList ID="DDSource1" TabIndex="9" CssClass="inputfield" runat="server" ValidationGroup="addlead" OnSelectedIndexChanged="DDSource1_SelectedIndexChanged"  AutoPostBack="true" >                                                              
                                </asp:DropDownList>                             
                            </div>                            
                            <div class="hr-normal-cbp-mc-column-inner">
                                <label for="source2" >Source 2</label>
                                <asp:DropDownList ID="DDSource2" TabIndex="10" CssClass="inputfield" runat="server" ValidationGroup="addlead" >                                                              
                                </asp:DropDownList>
                            </div>
                            <div class="hr-normal-cbp-mc-column-inner">
                                <label for="siteac" >Site A/C </label>
                                <asp:DropDownList ID="DDSiteAC" TabIndex="11" CssClass="inputfield" runat="server" ValidationGroup="addlead" >                                             
                                    <asp:ListItem Value="N">No</asp:ListItem>
                                    <asp:ListItem Value="Y">Yes</asp:ListItem>                                                    
                                </asp:DropDownList>
                                
                            </div>
                            <div class="hr-normal-cbp-mc-column-inner">
                                <label for="txnac">TXN A/C</label>
                                <asp:DropDownList ID="DDTxnAC" TabIndex="12" CssClass="inputfield" runat="server" ValidationGroup="addlead" >                                              
                                    <asp:ListItem Value="N">No</asp:ListItem>
                                    <asp:ListItem Value="Y">Yes</asp:ListItem>               
                                </asp:DropDownList>
                            </div>
                    </div>
                    <div class="hr-normal-cbp-mc-column">
                            <div class="hr-normal-cbp-mc-column-inner">
                                <label for="optype1" >Op Type 1</label>
                                <asp:DropDownList ID="DDOPtype1" TabIndex="13" CssClass="inputfield" OnSelectedIndexChanged="DDOpType1_change"  AutoPostBack="true"  runat="server" ValidationGroup="addlead" >                                              <asp:ListItem Value="Free">Free</asp:ListItem>
                                      <asp:ListItem Value="Paid">Paid</asp:ListItem>                
                                </asp:DropDownList>                              
                            </div>
                            <div class="hr-normal-cbp-mc-column-inner">
                                <label for="optype2" >Op Type 2</label>
                                <asp:DropDownList ID="DDOpType2" TabIndex="14" CssClass="inputfield" runat="server" ValidationGroup="addlead" >                                            <asp:ListItem Value="T">Transact</asp:ListItem>
                                                    
                                </asp:DropDownList> 
                            </div>                             
                            <div class="hr-normal-cbp-mc-column-inner">
                                <label for="mobile2" >Mobile 2
                                    <asp:RegularExpressionValidator ID="REVMobile2" 
                runat="server" ErrorMessage="Phone Number is not valid" Display="Dynamic"
                    ValidationGroup="addlead" ControlToValidate="txtMobile2"  CssClass="mandatory"
                    validationexpression="^[0-9]{10}$">
                    </asp:RegularExpressionValidator>
                                </label>
                                <asp:TextBox type="text" name="disbursementDate" id="txtMobile2" MaxLength="10" CssClass="inputfield" TabIndex="15"  runat="server"  ValidationGroup="addlead" />  
                            </div>
                            <div class="hr-normal-cbp-mc-column-inner">
                                <label for="email2" >Email 2
                                    <asp:RegularExpressionValidator ID="REVEmail2" 
                runat="server" ErrorMessage="Please Enter Valid Email ID"
                    ValidationGroup="addlead" ControlToValidate="txtEmail2" Display="Dynamic"                     
                    CssClass="mandatory" 
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
                    </asp:RegularExpressionValidator>
                                </label>
                                <asp:TextBox type="text" name="disbursementDate" id="txtEmail2" CssClass="inputfield" TabIndex="16"  runat="server"  ValidationGroup="addlead" />  
                            </div>                                                                             
                        </div>                         
                        <div class="hr-normal-cbp-mc-column">                            
                            <div class="hr-normal-cbp-mc-column-inner">
                                <label for="remarks" >Remarks</label>
                                <textarea runat="server" id="txtRemarks" tabindex="17" name="remarks"></textarea>   
                            </div>
                            <div class="hr-normal-cbp-mc-column-inner">
                                <label for="anndob">Anniversary Date</label>
                                <asp:TextBox type="text" name="anndob" id="txtAnnvDate" CssClass="inputfield" TabIndex="18"  runat="server"  ValidationGroup="addlead" />                                
                                <ajxct:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="txtAnnvDate"  Format="dd-MM-yyyy" SkinID="2" Animated="true"  />
                            </div>
                            <div class="hr-normal-cbp-mc-column-inner">
                                <asp:LinkButton ID="AddLeadSubmit" runat="server" CssClass="DBbuttonSmall" TabIndex="19" OnClick="AddLeadSubmit_click" ValidationGroup="addlead">Add</asp:LinkButton><span class="mandatory" style="float:right; margin-top:22px;"># Fields are mandatory</span>
                            </div>                                                                                 
                        </div>                      
                    </div>
                    
                    <div class="GV-Area">
                        <asp:GridView ID="GridViewUser" runat="server" AutoGenerateColumns="False" GridLines="None" 
                                 DataKeyNames="Code"  Width="100%"  >
                                <Columns>
                                    <asp:BoundField DataField="Code" Visible="false"  />
                                    <asp:BoundField DataField="PlannerName" HeaderText="Planner Name"  ReadOnly="true" HeaderStyle-HorizontalAlign="Left" />
                                    <asp:BoundField DataField="UserID" HeaderText="User ID"  ReadOnly="true" HeaderStyle-HorizontalAlign="Left"/>
                                    <asp:BoundField DataField="Pwd" HeaderText="Password" ReadOnly="true" HeaderStyle-HorizontalAlign="Left" />                                        
                                    <asp:BoundField DataField="City" HeaderText="City" HeaderStyle-HorizontalAlign="left" ControlStyle-Width="80" />
                                    <asp:BoundField DataField="Mobile" HeaderText="Mobile" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ControlStyle-Width="80" />                                        
                                    <asp:BoundField DataField="Website" HeaderText="Website" HeaderStyle-HorizontalAlign="Left" ControlStyle-Width="80" />
                                    <asp:BoundField DataField="PlannerRole" HeaderText="Role" HeaderStyle-HorizontalAlign="Left" ReadOnly="true"  />
                                    <asp:BoundField DataField="ReportTo" HeaderText="Report To" HeaderStyle-HorizontalAlign="Left" ReadOnly="true" />
                                    <asp:CommandField EditImageUrl="~/images/edit.png"  ButtonType="Image"  ShowEditButton="true" UpdateImageUrl="~/images/updates.png" CancelImageUrl="~/images/cancel.png"  >
                                        
                                    </asp:CommandField>
                                    <%--<asp:CommandField ShowDeleteButton="true" ButtonType="Image" DeleteImageUrl="~/images/delete.png" >
                                        
                                    </asp:CommandField>--%>                                                                            
                                </Columns>
                                <AlternatingRowStyle CssClass="GV-AlternatingRowStyle" />
                                <EditRowStyle CssClass="GV-EditRow" />                                    
                                <HeaderStyle CssClass="GV-HeaderStyle" />
                                <PagerStyle CssClass="GV-PagerStyle" />
                                <RowStyle CssClass="GV-RowStyle" />
                                <SelectedRowStyle CssClass="GV-SelectedRowStyle" /> 
                            </asp:GridView>
                    </div>
            <%--**********************************************--%>
            <%--Message popup area start--%>
            <%--**********************************************--%>
            <asp:Button runat="server" ID="btnMessagePopupTargetButton" Style="display: none;" />
            <ajxct:ModalPopupExtender ID="mpeMessagePopup" runat="server" PopupControlID="pnlMessageBox"
                TargetControlID="btnMessagePopupTargetButton" OkControlID="btnOk" CancelControlID="btnCancel"
                BackgroundCssClass="MessageBoxPopupBackground">
            </ajxct:ModalPopupExtender>
            <asp:Panel runat="server" ID="pnlMessageBox" 
                   BackColor="White" Width="420" 
                   Style="display: none; border: 1px solid #859ab1;">
                <div class="popupHeader" style="width: 420px;">
                    <asp:Label ID="lblMessagePopupHeading" Text="Information" 
                        runat="server"></asp:Label><asp:LinkButton
                        ID="btnCancel" runat="server" 
                         Style="float: right; margin-right: 5px;">X</asp:LinkButton>
                </div>
                <div style="max-height: 500px; width: 420px; overflow: hidden;">
                    <div style="float:left; width:380px; margin:20px;">
                        <table style="padding: 0; border-spacing: 0; border-collapse: collapse; width: 100%;">
                            <tr>
                                <td style="text-align: left; vertical-align: top; width: 11%;">
                                    <i class="fa fa-thumbs-up fa-2x"></i>                                    
                                </td>
                                <td style="width: 2%;">
                                </td>
                                <td style="text-align: left; vertical-align: top; width: 87%;">
                                    <p style="margin: 0px; padding: 0px; color: #5F0202;">
                                        
                                            <asp:Label runat="server" ID="lblMessagePopupText"></asp:Label>
                                    </p>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: right; vertical-align: top;" colspan="3">
                                    <div style="margin-right: 0px; float: right; width: auto;">
                                        <asp:LinkButton ID="btnOk" runat="server" 
                                            CssClass="popup_button">Ok</asp:LinkButton>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </asp:Panel>
            <%--**********************************************--%>
            <%--Message popup area end--%>
            <%--**********************************************--%>

                <%--</ContentTemplate>   
        </asp:UpdatePanel>--%>
</asp:Content>

