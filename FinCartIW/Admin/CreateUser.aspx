<%@ Page Title="Create User" Language="C#" MasterPageFile="~/Admin/AdminDashBoard.master" AutoEventWireup="true" CodeFile="CreateUser.aspx.cs" Inherits="Admin_CreateUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
       
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AdminContentPlaceHolder" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>  
    <h1>Add an user</h1>
    
    <asp:UpdatePanel ID="UpdatePanelUser" runat="server">
                <ContentTemplate>
                    <div class="hr-normal-cbp-mc-form">
                        <div class="hr-normal-cbp-mc-column">
                            <div class="hr-normal-cbp-mc-column-inner">
                                <label for="loanType"><span class="mandatory">#</span>Planner/BDM Name <asp:RequiredFieldValidator ID="ReqPlannerName" ValidationGroup="usergroup" runat="server" ErrorMessage="Required" Display="Dynamic" ControlToValidate="txtPlannerName" CssClass="mandatory"></asp:RequiredFieldValidator></label>
                                <asp:TextBox type="text" name="lender" id="txtPlannerName" CssClass="inputfield" TabIndex="1"  runat="server"  ValidationGroup="usergroup" />                                 
                            </div>
                            <div class="hr-normal-cbp-mc-column-inner">
                                <label for="email1" ><span class="mandatory">#</span>Email / User ID &nbsp; <i class="fa fa-info-circle"></i> <asp:RequiredFieldValidator ID="ReqEmail1" ValidationGroup="usergroup" runat="server" ErrorMessage="Required" Display="Dynamic" ControlToValidate="txtEmail1" CssClass="mandatory"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" 
                runat="server" ErrorMessage="Please Enter Valid Email ID"
                    ValidationGroup="usergroup" ControlToValidate="txtEmail1" Display="Dynamic"                     
                    CssClass="mandatory" 
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
                    </asp:RegularExpressionValidator>
                                </label>
                                <asp:TextBox type="text" name="email1" id="txtEmail1" CssClass="inputfield" TabIndex="2"  runat="server"  ValidationGroup="usergroup" />  
                                                            
                            </div>
                            <div class="hr-normal-cbp-mc-column-inner">
                                <label for="applicantName"><span class="mandatory">#</span>Password <asp:RequiredFieldValidator ID="ReqPassword" ValidationGroup="usergroup" runat="server" ErrorMessage="Required" Display="Dynamic" ControlToValidate="txtPassword" CssClass="mandatory"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="REVPassword" runat="server" 
                                        ControlToValidate="txtPassword" Display="Dynamic" CssClass="mandatory"                                 
                                        ErrorMessage="Password must be between 6 and 15 characters" 
                                        ValidationExpression="^[a-zA-Z0-9\s]{6,15}">                                        
                                    </asp:RegularExpressionValidator>
                                </label>
                                <asp:TextBox type="text" name="lender" id="txtPassword" CssClass="inputfield" TabIndex="3"  runat="server"  ValidationGroup="usergroup" />
                                
                            </div>
                            <div class="hr-normal-cbp-mc-column-inner">
                                <label for="liabilityAmount" >Role                                    
                                </label>
                                <asp:DropDownList ID="DDPlannerRole" CausesValidation="false" name="plannerrole" TabIndex="4" CssClass="inputfield" OnSelectedIndexChanged="DDPlannerRole_change"  AutoPostBack="true" runat="server" ValidationGroup="usergroup" >                                                              
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="hr-normal-cbp-mc-column">
                            <div class="hr-normal-cbp-mc-column-inner">
                                <label for="loanTenure" >Address</label>
                                <asp:TextBox type="text" name="loanTenure" id="txtAddress" CssClass="inputfield" TabIndex="5"  runat="server"  ValidationGroup="usergroup" />
                                
                            </div>  
                            <div class="hr-normal-cbp-mc-column-inner">
                                <label for="rateofInterest" ><span class="mandatory">#</span>City <asp:RequiredFieldValidator ID="ReqCity" ValidationGroup="usergroup" runat="server" ErrorMessage="Required" Display="Dynamic" ControlToValidate="txtCity" CssClass="mandatory"></asp:RequiredFieldValidator></label>
                                <asp:TextBox type="text" name="rateofInterest" id="txtCity" CssClass="inputfield" TabIndex="6"  runat="server"  ValidationGroup="usergroup" />  
                                                              
                            </div>
                            <div class="hr-normal-cbp-mc-column-inner">
                                <label for="typeofInterest">State</label>
                                <asp:TextBox type="text" name="rateofInterest" id="txtState" CssClass="inputfield" TabIndex="7"  runat="server"  ValidationGroup="usergroup" />
                            </div>
                            <div class="hr-normal-cbp-mc-column-inner">
                                <label for="disbursementDate" >Pin</label>
                                <asp:TextBox type="text" name="disbursementDate" id="txtPin" CssClass="inputfield" TabIndex="8"  runat="server"  ValidationGroup="usergroup" />                                
                            </div>                              
                        </div>                    
                    <div class="hr-normal-cbp-mc-column">
                            <div class="hr-normal-cbp-mc-column-inner">
                                <label for="lender" >Contact Name</label>
                                <asp:TextBox type="text" name="lender" id="txtContactName" CssClass="inputfield" TabIndex="9"  runat="server"  ValidationGroup="usergroup" />                                
                            </div>                            
                            <div class="hr-normal-cbp-mc-column-inner">
                                <label for="email2" >Email2 
                                    <asp:RegularExpressionValidator ID="REVEmail2" 
                runat="server" ErrorMessage="Please Enter Valid Email ID"
                    ValidationGroup="usergroup" ControlToValidate="txtEmail2" Display="Dynamic"                     
                    CssClass="mandatory" 
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
                    </asp:RegularExpressionValidator>
                                </label>
                                <asp:TextBox type="text" name="email2" id="txtEmail2" CssClass="inputfield" TabIndex="10"  runat="server"  ValidationGroup="usergroup" />                                
                            </div>
                            <div class="hr-normal-cbp-mc-column-inner">
                                <label for="mobile1" ><span class="mandatory">#</span>Mobile1 <asp:RequiredFieldValidator ID="ReqMobile1" ValidationGroup="usergroup" runat="server" ErrorMessage="Required" Display="Dynamic" ControlToValidate="txtMobile1" CssClass="mandatory"></asp:RequiredFieldValidator> 
                                    <asp:RegularExpressionValidator ID="REVMobile1" 
                runat="server" ErrorMessage="Phone Number is not valid" Display="Dynamic"
                    ValidationGroup="usergroup" ControlToValidate="txtMobile1"  CssClass="mandatory"
                    validationexpression="^[0-9]{10}$">
                    </asp:RegularExpressionValidator>
                                </label>
                                <asp:TextBox type="text" name="mobile1" id="txtMobile1" MaxLength="10" CssClass="inputfield" TabIndex="11"  runat="server"  ValidationGroup="usergroup" />
                                
                            </div>
                            <div class="hr-normal-cbp-mc-column-inner">
                                <label for="mobile2">Landline No.
                                    <asp:RegularExpressionValidator ID="REVMobile2" 
                runat="server" ErrorMessage="Phone Number is not valid" Display="Dynamic"
                    ValidationGroup="usergroup" ControlToValidate="txtMobile2"  CssClass="mandatory"
                    validationexpression="^[0-9]{10}$">
                    </asp:RegularExpressionValidator>
                                </label>
                                <asp:TextBox type="text" name="mobile2" id="txtMobile2" MaxLength="10" CssClass="inputfield" TabIndex="12"  runat="server"  ValidationGroup="usergroup" />
                            </div>
                    </div>
                    <div class="hr-normal-cbp-mc-column">                            
                            <div class="hr-normal-cbp-mc-column-inner" runat="server" id="divReportTo" visible="false">
                                <label for="reportto" >Report To</label>
                                <asp:DropDownList ID="DropDownReportTo" name="reportto" TabIndex="14" CssClass="inputfield" runat="server" ValidationGroup="usergroup" >                                                              
                                </asp:DropDownList>
                            </div> 
                            <div class="hr-normal-cbp-mc-column-inner">
                                <asp:LinkButton ID="UserSubmit" runat="server" CssClass="DBbuttonSmall" TabIndex="15" OnClick="UserSubmit_click" ValidationGroup="usergroup">Add</asp:LinkButton> <span class="mandatory" style="float:right; margin-top:22px;"># Fields are mandatory</span>
                            </div>                           
                        </div>                        
                    </div>
                    
                    <div class="GV-Area">
                        <asp:GridView ID="GridViewUser" runat="server" AutoGenerateColumns="False" GridLines="None" 
                                 DataKeyNames="Code"  Width="100%" OnRowEditing="GridViewUser_RowEditing" OnRowUpdating="GridViewUser_RowUpdating" OnRowDeleting="GridViewUser_RowDeleting" OnRowCancelingEdit="GridViewUser_RowCancelingEdit" OnRowCreated="GridViewUser_RowCreated" >
                                <Columns>
                                    <asp:BoundField DataField="Code" Visible="false"  />
                                    <asp:BoundField DataField="PlannerName" HeaderText="Planner Name"  ReadOnly="true" HeaderStyle-HorizontalAlign="Left" />
                                    <asp:BoundField DataField="UserID" HeaderText="User ID"  ReadOnly="true" HeaderStyle-HorizontalAlign="Left"/>
                                    <asp:BoundField DataField="Pwd"  HeaderText="Password" ReadOnly="true" HeaderStyle-HorizontalAlign="Left" />                                        
                                    <asp:BoundField DataField="City" HeaderText="City" HeaderStyle-HorizontalAlign="left" ControlStyle-Width="80" />
                                    <asp:BoundField DataField="Mobile" HeaderText="Mobile" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ControlStyle-Width="80" />                                        
                                    <%--<asp:BoundField DataField="Website" HeaderText="Website" HeaderStyle-HorizontalAlign="Left" ControlStyle-Width="80" />--%>
                                    <asp:BoundField DataField="PlannerRole" HeaderText="Role" HeaderStyle-HorizontalAlign="Left" ReadOnly="true"  />
                                    <asp:BoundField DataField="ReportTo" HeaderText="Report To" HeaderStyle-HorizontalAlign="Left" ReadOnly="true" />
                                    <asp:CommandField EditImageUrl="~/images/edit.png"  ButtonType="Image"  ShowEditButton="true" UpdateImageUrl="~/images/updates.png" CancelImageUrl="~/images/cancel.png"  >
                                        
                                    </asp:CommandField>
                                    <asp:CommandField ShowDeleteButton="true" ButtonType="Image" DeleteImageUrl="~/images/delete.png" >
                                        
                                    </asp:CommandField>                                                                            
                                </Columns>
                                <AlternatingRowStyle CssClass="GV-AlternatingRowStyle" />
                                <EditRowStyle CssClass="GV-EditRow" />                                    
                                <HeaderStyle CssClass="GV-HeaderStyle" />
                                <PagerStyle CssClass="GV-PagerStyle" />
                                <RowStyle CssClass="GV-RowStyle" />
                                <SelectedRowStyle CssClass="GV-SelectedRowStyle" /> 
                            </asp:GridView>
                    </div>

                </ContentTemplate>   
        </asp:UpdatePanel>
</asp:Content>

