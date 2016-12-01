<%@ Page Title="My Profile" Language="C#" MasterPageFile="DashBoard.master" AutoEventWireup="true" CodeFile="MyDetails.aspx.cs" Inherits="MyDetails" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajxct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">    
    <script type="text/javascript" src="js/virtualpaginate.js">
</script>


    <asp:HiddenField ID="txtSessionUserID" runat="server" />
    <%--Loading code start here--%>
    <script type="text/javascript">
        $(window).load(function () {
            $(".loader").fadeOut("slow");
        })
    </script> 
    <link rel="stylesheet" href="../css/datepicker.css">    
    <script src="https://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
    <script type="text/javascript" >
        $(document).ready(function () {
            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
            Sys.WebForms.PageRequestManager.getInstance().beginAsyncPostBack();
            function EndRequestHandler(sender, args) {
                $("#ContentPlaceHolder1_txtDOB").datepicker({
                    changeMonth: true,
                    changeYear: true,
                    dateFormat: 'dd-mm-yy',
                    yearRange: '1910:2050'
                });

                $("#ContentPlaceHolder1_txtGoalMonth").datepicker({
                    changeMonth: true,
                    changeYear: true,
                    dateFormat: 'dd-mm-yy',
                    yearRange: '1910:2050'
                });

                $("#ContentPlaceHolder1_txtLIPolicyStartDate").datepicker({
                    changeMonth: true,
                    changeYear: true,
                    dateFormat: 'dd-mm-yy',
                    yearRange: '1910:2050'
                });

                $("#ContentPlaceHolder1_txtMaturityDate").datepicker({
                    changeMonth: true,
                    changeYear: true,
                    dateFormat: 'dd-mm-yy',
                    yearRange: '2015:2099'
                });

                $("#ContentPlaceHolder1_txtGIPolicyStartDate").datepicker({
                    changeMonth: true,
                    changeYear: true,
                    dateFormat: 'dd-mm-yy',
                    yearRange: '1910:2050'
                });
                
                $("#ContentPlaceHolder1_txtAccquisitionDate").datepicker({
                    changeMonth: true,
                    changeYear: true,
                    dateFormat: 'dd-mm-yy',
                    yearRange: '1910:2050'
                });
                
                $("#ContentPlaceHolder1_txtStartDate").datepicker({
                    changeMonth: true,
                    changeYear: true,
                    dateFormat: 'dd-mm-yy',
                    yearRange: '1910:2050'
                });
                
                $("#ContentPlaceHolder1_txtMFStartDate").datepicker({
                    changeMonth: true,
                    changeYear: true,
                    dateFormat: 'dd-mm-yy',
                    yearRange: '1910:2050'
                });
                
                $("#ContentPlaceHolder1_txtMFEndDate").datepicker({
                    changeMonth: true,
                    changeYear: true,
                    dateFormat: 'dd-mm-yy',
                    yearRange: '1910:2050'
                });
                
                $("#ContentPlaceHolder1_txtFIStartDate").datepicker({
                    changeMonth: true,
                    changeYear: true,
                    dateFormat: 'dd-mm-yy',
                    yearRange: '1910:2050'
                });
                
                $("#ContentPlaceHolder1_txtFIMaturityDate").datepicker({
                    changeMonth: true,
                    changeYear: true,
                    dateFormat: 'dd-mm-yy',
                    yearRange: '1910:2050'
                });
                
                $("#ContentPlaceHolder1_txtOIPurchaseDate").datepicker({
                    changeMonth: true,
                    changeYear: true,
                    dateFormat: 'dd-mm-yy',
                    yearRange: '1910:2050'
                });




            }
        });
</script>
         
         
     
       
    <div class="loader"></div>  
    <%--Loading code end here--%>
    <!-- section for main page content start -->
    <div class="my-db-area">
            <div id="gallerypaginate" class="paginationstyle">
                <a href="#" rel="previous">Prev</a> <span class="flatview"></span> <a href="#" rel="next">Next</a>
            </div>
            <div id="mydetails" class="virtualpage hidepiece" runat="server">
                <h1>My Details</h1>        
                <asp:UpdatePanel ID="MyDetailsPanel" runat="server">
                <ContentTemplate>
                    <a id="infoiconMyDetails" onclick="document.getElementById('div_name2Family').style.display='';document.getElementById('infoiconMyDetails').style.display='none';return false;" 
                            href="" style="text-decoration:none; display:none;">
                            <span style="float:right; font-size:18px; margin-top:-10px;"><i class="fa fa-info-circle"></i></span></a>
                            <br />
                            <div id="div_name2Family" style="display:block; margin-top:-10px" class="fragment">
                            <a onclick="document.getElementById('div_name2Family').style.display='none';document.getElementById('infoiconMyDetails').style.display='block';return false;" href="" 
                            class="close">X</a>
                            Enter your minimum personal details  
                        
                            </div>
			        <div class="hr-cbp-mc-form">
					    <div class="hr-cbp-mc-column">
                            <div class="hr-cbp-mc-column-inner">
						        <label for="name">Salutation</label>                            						
                                <asp:DropDownList ID="ddSalutation" CssClass="aspddl" runat="server" TabIndex="1" ValidationGroup="mydetail">
                                    <asp:ListItem Value="Mr.">Mr.</asp:ListItem>
                                    <asp:ListItem Value="Mrs.">Mrs.</asp:ListItem>
                                    <asp:ListItem Value="Miss">Miss</asp:ListItem>
                                    <asp:ListItem Value="Captain">Captain</asp:ListItem>
                                    <asp:ListItem Value="Dr.">Dr.</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="hr-cbp-mc-column-inner">
						        <label for="name">Name</label>                            						
                                <asp:TextBox type="text" name="name" required="required" TabIndex="2" runat="server" CssClass="inputfieldFixedWidth" id="txtName" ValidationGroup="mydetail" />
                            </div>
                            <div class="hr-cbp-mc-column-inner">
	  					        <label>Gender</label>	  					
                                <asp:DropDownList ID="txtGender" CssClass="aspddl" runat="server" TabIndex="3" ValidationGroup="mydetail">
                                        <asp:ListItem Value="M">Male</asp:ListItem>
                                        <asp:ListItem Value="F">Female</asp:ListItem>
                                    </asp:DropDownList>
                            </div>
                            <div class="hr-cbp-mc-column-inner">
	  					        <label for="email">Email</label>	  					
                                <asp:TextBox type="email" name="email" required="required" TabIndex="4" CssClass="inputfieldFixedWidth" ReadOnly="true"  runat="server" id="txtEmail" ValidationGroup="mydetail" />
                                <asp:RegularExpressionValidator ID="REVEmail" 
                                runat="server" ErrorMessage="Please Enter Valid Email ID"
                                    ValidationGroup="usergroup" ControlToValidate="txtEmail" Display="Dynamic"                     
                                    CssClass="mandatory" 
                                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
                                    </asp:RegularExpressionValidator>
                            </div>                                                                     
	  				    </div>
	  				    <div class="hr-cbp-mc-column">
                             <div class="hr-cbp-mc-column-inner">
	  					        <label for="dob">Date of Birth</label>                        
                                <asp:TextBox type="text" CssClass="inputfieldFixedWidth" runat="server" TabIndex="5" id="txtDOB" ValidationGroup="mydetail" />
                                <%--<ajxct:CalendarExtender ID="CalendarExtender3" runat="server" TargetControlID="txtDOB"  Format="yyyy-MM-dd" SkinID="2" Animated="true"  />--%>
                                <asp:RequiredFieldValidator ValidationGroup="mydetail" ID="RequiredFieldDOB" Display="Dynamic" runat="server" ErrorMessage="*" ControlToValidate="txtDOB" CssClass="mandatory"></asp:RequiredFieldValidator>	  					
                            </div>  
                            <div class="hr-cbp-mc-column-inner">
	  					        <label>Marital Status</label>	  					
                                <asp:DropDownList ID="ddMaritalStatus" CssClass="aspddl" runat="server" TabIndex="6" ValidationGroup="mydetail">
                                        <asp:ListItem Value="Married">Married</asp:ListItem>
                                        <asp:ListItem Value="Single">Single</asp:ListItem>
                                    </asp:DropDownList>
                            </div>
                            <div class="hr-cbp-mc-column-inner">
	  					        <label for="contact">Mobile</label>	  					
                                <asp:TextBox type="text" name="contact" CssClass="inputfieldFixedWidth" TabIndex="7" runat="server" id="txtContact" ValidationGroup="mydetail" />
                                <asp:RequiredFieldValidator ID="RequiredFieldContact" Display="Dynamic" runat="server" ValidationGroup="mydetail" ErrorMessage="Enter your Contact" ControlToValidate="txtContact" CssClass="mandatory"></asp:RequiredFieldValidator>
                            </div>
                            <div class="hr-cbp-mc-column-inner">
                                <label for="grossincome">Yearly Gross Income (<a href="#" alt="Value used to calculate ideal Life Insurance" title="Value used to calculate your ideal Life Insurance">Why?</a>)</label>	  					
                                <asp:TextBox type="text" name="grossincome" TabIndex="8" CssClass="inputfieldFixedWidth" runat="server" id="txtGrossIncome" ValidationGroup="mydetail" />                        
                                <asp:RequiredFieldValidator ID="RequiredFieldGrossIncome" Display="Dynamic" runat="server" ValidationGroup="mydetail" ErrorMessage="Enter Gross Income" ControlToValidate="txtGrossIncome" CssClass="mandatory"></asp:RequiredFieldValidator>
                                <%--<asp:RegularExpressionValidator ID="REVMobile1" 
                    runat="server" ErrorMessage="Enter valid amount" Display="Dynamic"
                        ValidationGroup="mydetail" ControlToValidate="txtGrossIncome"  CssClass="mandatory"
                        validationexpression="^[0-9]{10}$">
                        </asp:RegularExpressionValidator>--%>
                            </div>                                                                                                
	  				    </div>	                      				
	  				    <div class="hr-cbp-mc-column">
                            <%--<div class="hr-cbp-mc-column-inner">
	  					        <label for="annidate">Anniversary Date</label>	  					
                                  <asp:TextBox type="date" name="annidate" CssClass="inputfieldFixedWidth" runat="server" id="txtAnniDate" ValidationGroup="mydetail" />
                            </div>--%>
                        
                        </div>                        
                          
	  				
                        </div>
                    <div>
                        <asp:LinkButton ID="MyDetailSubmit" runat="server" CssClass="MainButton" TabIndex="9" OnClick="MyDetailSubmit_Click" ValidationGroup="mydetail">Save</asp:LinkButton>
                        <asp:Label ID="myDetailsSave" runat="server" CssClass="message" Text="Data Saved Successfully" Visible="false"></asp:Label>
                    </div>
                    </ContentTemplate>   
                    </asp:UpdatePanel>                          
		    </div>             
            <div id="familydetail" class="virtualpage hidepiece" runat="server">
                <h1>Family Details</h1>
                <asp:UpdatePanel ID="FamilyDetailPanel" runat="server">
                    <ContentTemplate>
                        
                        <a id="infoiconFamily" onclick="document.getElementById('div-Family').style.display='';document.getElementById('infoiconFamily').style.display='none';return false;" 
                        href="" style="text-decoration:none; display:none;">
                        <span style="float:right; font-size:18px; margin-top:-15px;"><i class="fa fa-info-circle"></i></span></a>
                        <br />
                        <div id="div-Family" style="display:block; margin-top:-10px" class="fragment">
                        <a onclick="document.getElementById('div-Family').style.display='none';document.getElementById('infoiconFamily').style.display='block';return false;" href="" 
                        class="close">X</a>
                        Enter your financially-dependent family members only
                        
                        </div>
                         
                        <div class="hr-cbp-mc-form">
                            <div class="hr-cbp-mc-column">
                                <div class="hr-cbp-mc-column-inner">
                                    <label for="fname">Name <asp:RequiredFieldValidator ID="RequiredFieldFname" Display="Dynamic" ValidationGroup="family" runat="server" ErrorMessage="*" ControlToValidate="txtFName" CssClass="mandatory"></asp:RequiredFieldValidator></label>
                                    <asp:TextBox type="text" name="fname" runat="server" TabIndex="1" id="txtFName" ValidationGroup="family" />
                                    
                                </div>
                                <div class="hr-cbp-mc-column-inner">
                                    <label>Gender</label>
                                    <asp:DropDownList ID="txtFGender" CssClass="aspddl" runat="server" TabIndex="2" ValidationGroup="family">
                                        <asp:ListItem Value="M">Male</asp:ListItem>
                                        <asp:ListItem Value="F">Female</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div class="hr-cbp-mc-column-inner">
                                    <label for="frelationship">Relationship</label>
                                    <asp:DropDownList ID="txtFRelationship" CssClass="aspddl" name="frelationship" TabIndex="3" runat="server" ValidationGroup="family" >
                                    <asp:ListItem Value="M">Male</asp:ListItem>                                
                                    </asp:DropDownList>
                                </div>
                                <div class="hr-cbp-mc-column-inner">
                                    <label for="age">Age <asp:RequiredFieldValidator ID="RequiredFieldMemberDOB" ValidationGroup="family" runat="server" ErrorMessage="*" ControlToValidate="txtAge" Display="Dynamic" CssClass="mandatory"></asp:RequiredFieldValidator></label>
                                    <asp:TextBox type="text" name="age" runat="server" id="txtAge" TabIndex="4" ValidationGroup="family"  />                                    
                                </div>
                            </div>                            
                            <div class="hr-cbp-mc-column">                                
                                <div class="hr-cbp-mc-column-inner">
                                    <label>Financial Dependent</label>
                                    <asp:DropDownList ID="txtFDependent" runat="server" CssClass="aspddl" TabIndex="5" ValidationGroup="family">
                                    <asp:ListItem Value="Y">Yes</asp:ListItem>
                                    <asp:ListItem Value="N">No</asp:ListItem>
                                    <asp:ListItem Value="P">Partly</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div class="hr-cbp-mc-column-inner">
                                    <label for="fhh">Health History</label>
                                    <asp:TextBox type="text" name="fhh" runat="server" id="txtFHealthHistory" TabIndex="6" ValidationGroup="family" />                                    
                                </div>
                                <div class="hr-cbp-mc-column-inner">
                                    <asp:LinkButton ID="FamilyDetailSubmit" runat="server" CssClass="MainButton" TabIndex="7" OnClick="FamilyDetailSubmit_Click" ValidationGroup="family">Add</asp:LinkButton>
                                </div>
                            </div>                            
                        </div>
                        <div class="GV-Area">
                            <asp:GridView ID="GridViewFamily" runat="server" RowStyle-Wrap="false" HeaderStyle-Wrap="false" RowStyle-Height="23px"  AutoGenerateColumns="False" OnRowDeleting="GridViewFamily_RowDeleting" 
                                    OnRowEditing="GridViewFamily_RowEditing" OnRowUpdating="GridViewFamily_RowUpdating" OnRowCancelingEdit="GridViewFamily_RowCancelingEdit" DataKeyNames="Code" Width="100%" GridLines="None">                                     
                                    <Columns>
                                        <asp:BoundField DataField="Code" Visible="false"  />
                                        <asp:BoundField DataField="Name" HeaderText="Name" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left"  >
                                        <HeaderStyle HorizontalAlign="Left" />
                                        <ItemStyle HorizontalAlign="Left" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Gender" HeaderText="Gender" HeaderStyle-HorizontalAlign="Left" ReadOnly="true" ItemStyle-HorizontalAlign="Left"  >
                                        <HeaderStyle HorizontalAlign="Left" />
                                        <ItemStyle HorizontalAlign="Left" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Relation" HeaderText="Relation" HeaderStyle-HorizontalAlign="Left" ReadOnly="true" ItemStyle-HorizontalAlign="Left" >
                                        <HeaderStyle HorizontalAlign="Left" />
                                        <ItemStyle HorizontalAlign="Left" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Age" HeaderText="Age" HeaderStyle-HorizontalAlign="center" ItemStyle-HorizontalAlign="center" >
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <ItemStyle HorizontalAlign="Center" />
                                        <ControlStyle Width="100px" />
                                        </asp:BoundField>                                        
                                        <asp:BoundField DataField="FinancialDependent" HeaderText="Financial Dependent" HeaderStyle-HorizontalAlign="center" ReadOnly="true" ItemStyle-HorizontalAlign="center" >
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <ItemStyle HorizontalAlign="Center" />
                                        <ControlStyle Width="120px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="HealthHistory" HeaderText="Health History" HeaderStyle-HorizontalAlign="center" ItemStyle-HorizontalAlign="center" >                                                                              
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <ItemStyle HorizontalAlign="Center" />
                                        <ControlStyle Width="120px" />
                                        </asp:BoundField>
                                        <asp:CommandField EditImageUrl="~/images/edit.png"  ButtonType="Image"  ShowEditButton="true" UpdateImageUrl="~/images/updates.png" CancelImageUrl="~/images/cancel.png" >
                                        
                                        </asp:CommandField>
                                        <asp:TemplateField >
	                                        <ItemTemplate>		                                    
                                                <asp:ImageButton ID="delButton" runat="server" CommandName="Delete" ImageUrl="~/images/delete.png"
                                                    OnClientClick="return confirm('Are you sure you want to delete this Family Member?');" />
	                                        </ItemTemplate>
                                        </asp:TemplateField>
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
            </div>

            <div class="virtualpage hidepiece" id="insuranceLife" runat="server">                               
                <asp:UpdatePanel ID="UpdatePanelInsurance" runat="server">
                <ContentTemplate>                    
                    <div class="itemdropdown">
                        <div class="pageheading">Insurance</div> 
                        <asp:DropDownList ID="DDInsurance" CssClass="inputfieldSmall" runat="server" OnSelectedIndexChanged="DDInsurance_SelectedIndexChanged" AutoPostBack="true" ValidationGroup="asset">
                            <asp:ListItem Value="Life">Life Insurance</asp:ListItem>
                            <asp:ListItem Value="NonLife">Non Life Insurance</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="clear"></div>
                    <a id="iniconInsurance" onclick="document.getElementById('infodetailInsurance').style.display='';document.getElementById('iniconInsurance').style.display='none';return false;" 
                    href="" style="text-decoration:none; display:none;">
                    <span style="float:right; font-size:18px; margin-top:-15px;"><i class="fa fa-info-circle"></i></span></a>
                    <br />
                    <div id="infodetailInsurance" style="display:block; margin-top:-10px; margin-bottom:30px;" class="fragment">
                    <a onclick="document.getElementById('infodetailInsurance').style.display='none';document.getElementById('iniconInsurance').style.display='block';return false;" href="" 
                    class="close">X</a>
                        Enter your protection against uncertainty
                    </div>
                    <asp:UpdatePanel ID="UpdatePanelLife" runat="server">
                    <ContentTemplate>
                        <div class="hr-cbp-mc-form">
                            <div class="hr-cbp-mc-column">
                                <div class="hr-cbp-mc-column-inner">
                                    <label for="LIPolicyName">Policy Name <asp:RequiredFieldValidator ID="RequiredFieldLIPolicyName" ValidationGroup="LIgroup" runat="server" ErrorMessage="*" Display="Dynamic" ControlToValidate="txtLIPolicyName" CssClass="mandatory"></asp:RequiredFieldValidator></label>
                                    <asp:TextBox type="text" id="txtLIPolicyName" name="LIPolicyName" CssClass="inputfieldSmall" TabIndex="1"  runat="server"  ValidationGroup="LIgroup" />                                    
                                </div> 
                                <div class="hr-cbp-mc-column-inner">
                                    <label for="LIInsuredName">Insured Name</label>
                                    <asp:DropDownList ID="txtLIInsuredName" name="LIInsuredName" TabIndex="2" CssClass="aspddl" runat="server" ValidationGroup="LIgroup" >                                                              
                                    </asp:DropDownList>
                                </div> 
                                <div class="hr-cbp-mc-column-inner">
                                    <label for="LIInsuranceType">Insurance Type</label>
                                    <asp:DropDownList ID="txtLIInsuranceType" name="LIInsuranceType" TabIndex="3" CssClass="aspddl" runat="server" ValidationGroup="LIgroup" >                                                              
                                    </asp:DropDownList>
                                </div>
                                <div class="hr-cbp-mc-column-inner">
                                    <label for="LIPremiumPayingTerm">Premium Paying Term</label>
                                    <asp:TextBox type="text" id="txtPremiumPayingTerm" name="LIPremiumPayingTerm" TabIndex="4" CssClass="inputfieldSmall"  runat="server"  ValidationGroup="LIgroup" />                                    
                                </div>                                                                                                                              
                            </div>
                            <div class="hr-cbp-mc-column">
                                <div class="hr-cbp-mc-column-inner">
                                    <label for="LIPremium">Premium <asp:RequiredFieldValidator ID="RequiredFieldLIPremium" ValidationGroup="LIgroup" runat="server" ErrorMessage="*" Display="Dynamic" ControlToValidate="txtLIPremium" CssClass="mandatory"></asp:RequiredFieldValidator></label>
                                    <asp:TextBox type="text" id="txtLIPremium" name="LIPremium" TabIndex="5" CssClass="inputfieldSmall"  runat="server"  ValidationGroup="LIgroup" />                                    
                                </div>
                                <div class="hr-cbp-mc-column-inner">
                                    <label for="LIPremiumMode">Premium Mode</label>
                                    <asp:DropDownList ID="txtPremiumMode" name="LIPremiumMode" TabIndex="6" CssClass="aspddl" runat="server" ValidationGroup="LIgroup" >                                                              
                                        <asp:ListItem Value="Monthly">Monthly</asp:ListItem>
                                        <asp:ListItem Value="Quarterly">Quarterly</asp:ListItem>
                                        <asp:ListItem Value="Half Yearly">Half Yearly</asp:ListItem>
                                        <asp:ListItem Value="Yearly" Selected="True">Yearly</asp:ListItem>
                                        <asp:ListItem Value="Single Payment">Single Payment</asp:ListItem>
                                    </asp:DropDownList>
                                </div>                           
                                <div class="hr-cbp-mc-column-inner">
                                    <label for="LISumAssured">Sum Assured <asp:RequiredFieldValidator ID="RequiredFieldLISumAssured" ValidationGroup="LIgroup" runat="server" ErrorMessage="*" Display="Dynamic" ControlToValidate="txtLISumAssured" CssClass="mandatory"></asp:RequiredFieldValidator> </label>
                                    <asp:TextBox type="text" id="txtLISumAssured" name="LISumAssured" TabIndex="7" CssClass="inputfieldSmall"  runat="server"  ValidationGroup="LIgroup" />                                    
                                </div> 
                                <div class="hr-cbp-mc-column-inner">
                                    <label for="LICurrentValue">Current Value</label>
                                    <asp:TextBox type="text" id="txtLICurrentValue" name="LICurrentValue" TabIndex="8" CssClass="inputfieldSmall"  runat="server"  ValidationGroup="LIgroup" />
                                </div>                                
                            </div>
                            <div class="hr-cbp-mc-column"> 
                                <div class="hr-cbp-mc-column-inner">
                                    <label for="LINomineeName">Nominee Name</label>
                                    <asp:DropDownList ID="txtLINomineeName" name="LINomineeName" TabIndex="9" CssClass="aspddl" runat="server" ValidationGroup="LIgroup" >                                                              
                                    </asp:DropDownList>
                                </div>                          
                                <div class="hr-cbp-mc-column-inner">
                                    <label for="LIPolicyStartDate">Policy Start Date <asp:RequiredFieldValidator ID="RequiredFieldLIPolicyStartDate" ValidationGroup="LIgroup" runat="server" ErrorMessage="*" Display="Dynamic" ControlToValidate="txtLIPolicyStartDate" CssClass="mandatory"></asp:RequiredFieldValidator> </label>
                                    <asp:TextBox type="text" id="txtLIPolicyStartDate" TabIndex="10" CssClass="inputfieldSmall"  runat="server"  ValidationGroup="LIgroup" />
                                    <%--<ajxct:CalendarExtender ID="CalendarExtender5" runat="server" TargetControlID="txtLIPolicyStartDate"  Format="yyyy-MM-dd" SkinID="2" Animated="true"  />  --%>                                  
                                </div>                                                            
                                <div class="hr-cbp-mc-column-inner">
                                    <label for="LIMaturityDate">Maturity Date</label>
                                    <asp:TextBox type="text" id="txtMaturityDate" TabIndex="11" CssClass="inputfieldSmall"  runat="server"  ValidationGroup="LIgroup" />
                                    <%--<ajxct:CalendarExtender ID="CalendarExtender6" runat="server" TargetControlID="txtMaturityDate"  Format="yyyy-MM-dd" SkinID="2" Animated="true"  />--%>
                                </div> 
                                <div class="hr-cbp-mc-column-inner">
                                    <asp:LinkButton ID="LISubmit" runat="server" CssClass="MainButton" TabIndex="12" OnClick="LISubmit_click" ValidationGroup="LIgroup">Add</asp:LinkButton>                                    
                                </div>                           
                            </div>                                             
                        </div>
                        <div class="GV-Area">
                        <asp:GridView ID="GridViewLI" runat="server" AutoGenerateColumns="False" OnRowDeleting="GridViewLI_RowDeleting" GridLines="None" 
                               OnRowEditing="GridViewLI_RowEditing" OnRowUpdating="GridViewLI_RowUpdating" OnRowCancelingEdit="GridViewLI_RowCancelingEdit" DataKeyNames="Code"  Width="100%">
                                <Columns>
                                    <asp:BoundField DataField="Code" Visible="false"  />
                                    <asp:BoundField DataField="PolicyName" HeaderText="Policy Name"  ReadOnly="true" HeaderStyle-HorizontalAlign="Left" />
                                    <asp:BoundField DataField="Applicant" HeaderText="Applicant Name"  ReadOnly="true" HeaderStyle-HorizontalAlign="Left" />
                                    <asp:BoundField DataField="InsuranceType" HeaderText="Insurance Type" ReadOnly="true" HeaderStyle-HorizontalAlign="Left"/>
                                    <asp:BoundField DataField="PremiumPaymentTerm" HeaderText="Payment Term" ControlStyle-Width="80" HeaderStyle-HorizontalAlign="Left" />                                        
                                    <asp:BoundField DataField="PremiumMode" HeaderText="Premium Mode" ReadOnly="true"  HeaderStyle-HorizontalAlign="left" />
                                    <asp:BoundField DataField="CurrentValue" HeaderText="Current Value" ControlStyle-Width="80" DataFormatString="{0:##,##,##,##,###}" HeaderStyle-HorizontalAlign="left" />
                                    <asp:BoundField DataField="Premium" HeaderText="Premium" ControlStyle-Width="80" DataFormatString="{0:##,##,##,##,###}" HeaderStyle-HorizontalAlign="left" />
                                    <asp:BoundField DataField="SumAssured" HeaderText="Sum Assured" ControlStyle-Width="80" DataFormatString="{0:##,##,##,##,###}" HeaderStyle-HorizontalAlign="left" />
                                    <asp:BoundField DataField="Nominee" HeaderText="Nominee" ReadOnly="true" HeaderStyle-HorizontalAlign="left" />
                                    <asp:BoundField DataField="StartDate" HeaderText="Start Date" ReadOnly="true" HeaderStyle-HorizontalAlign="left" />
                                    <asp:BoundField DataField="MaturityDate" HeaderText="Maturity Date" ReadOnly="true" HeaderStyle-HorizontalAlign="left" />
                                    <asp:CommandField EditImageUrl="~/images/edit.png"  ButtonType="Image"  ShowEditButton="true" UpdateImageUrl="~/images/updates.png" CancelImageUrl="~/images/cancel.png"  >                                        
                                    </asp:CommandField>
                                    <asp:TemplateField >
	                                    <ItemTemplate>		                                    
                                            <asp:ImageButton ID="delButton" runat="server" CommandName="Delete" ImageUrl="~/images/delete.png"
                                                OnClientClick="return confirm('Are you sure you want to delete this Insurance Details?');" />
	                                    </ItemTemplate>
                                    </asp:TemplateField>                                                                           
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
                    <asp:UpdatePanel ID="UpdatePanelNonLife" runat="server" Visible="false">
                    <ContentTemplate>
                        <div class="hr-cbp-mc-form">
                        <div class="hr-cbp-mc-column">
                            <div class="hr-cbp-mc-column-inner">
                                <label for="GIInsuredObject">Insurance For</label>
                                <asp:DropDownList ID="txtGIInsuredObject" name="GIInsuredObject" TabIndex="1" CssClass="aspddl" runat="server" ValidationGroup="GIgroup" >                                                              
                                </asp:DropDownList>
                            </div>
                            <div class="hr-cbp-mc-column-inner">
                                <label for="GIProposerName">Policy Holder Name</label>
                                <asp:DropDownList ID="txtGIProposerName" name="GIProposerName" TabIndex="2" CssClass="aspddl" runat="server" ValidationGroup="GIgroup" >                                                              
                                </asp:DropDownList>
                            </div>
                            <div class="hr-cbp-mc-column-inner">
                                <label for="GIPolicyName">Policy Name</label>
                                <asp:TextBox type="text" name="GIPolicyName" TabIndex="3" CssClass="inputfieldSmall"  runat="server" id="txtGIPolicyName"  ValidationGroup="GIgroup" />
                                 <asp:RequiredFieldValidator ID="RequiredFieldGIPolicyName" ValidationGroup="GIgroup" runat="server" ErrorMessage="*" Display="Dynamic" ControlToValidate="txtGIPolicyName" CssClass="mandatory"></asp:RequiredFieldValidator> 
                            </div>
                            <div class="hr-cbp-mc-column-inner">
                                <label for="GIAnnualPremium">Premium</label>
                                <asp:TextBox type="text" id="txtGIAnnualPremium" name="GIAnnualPremium" TabIndex="4" CssClass="inputfieldSmall"  runat="server"  ValidationGroup="GIgroup" />
                                <asp:RequiredFieldValidator ID="RequiredFieldGIAnnualPremium" ValidationGroup="GIgroup" runat="server" ErrorMessage="*" Display="Dynamic" ControlToValidate="txtGIAnnualPremium" CssClass="mandatory"></asp:RequiredFieldValidator> 
                             </div>                                                                                   
                        </div>
                        <div class="hr-cbp-mc-column">
                             <div class="hr-cbp-mc-column-inner">
                                    <label for="GIPaymentMode">Payment Mode</label>
                                    <asp:DropDownList ID="DDGIPaymentMode" name="GIPaymentMode" TabIndex="5" CssClass="aspddl" runat="server" ValidationGroup="LIgroup" >                                                                                                      
                                        <asp:ListItem Value="Yearly">Yearly</asp:ListItem>
                                        <asp:ListItem Value="Single">Single</asp:ListItem>
                                    </asp:DropDownList>
                                </div> 
                            <div class="hr-cbp-mc-column-inner">
                                <label for="GISumAssured">Sum Assured</label>
                                <asp:TextBox type="text" name="GISumAssured" TabIndex="6" CssClass="inputfieldSmall"  runat="server" id="txtGISumAssured"  ValidationGroup="GIgroup" />
                                 <asp:RequiredFieldValidator ID="RequiredFieldGISumAssured" ValidationGroup="GIgroup" runat="server" ErrorMessage="*" Display="Dynamic" ControlToValidate="txtGISumAssured" CssClass="mandatory"></asp:RequiredFieldValidator> 
                            </div>                            
                            <div class="hr-cbp-mc-column-inner">
                                <label for="GIPolicyStartDate">Policy Start Date</label>
                                <asp:TextBox type="text" id="txtGIPolicyStartDate" TabIndex="7" CssClass="inputfieldSmall"  runat="server"  ValidationGroup="GIgroup" />
                                <%--<ajxct:CalendarExtender ID="CalendarExtender7" runat="server" TargetControlID="txtGIPolicyStartDate"  Format="yyyy-MM-dd" SkinID="2" Animated="true"  />--%>
                                <asp:RequiredFieldValidator ID="RequiredFieldGIPolicyStartDate" ValidationGroup="GIgroup" runat="server" ErrorMessage="*" Display="Dynamic" ControlToValidate="txtGIPolicyStartDate" CssClass="mandatory"></asp:RequiredFieldValidator> 
                            </div>
                        </div>                        
                        <div class="hr-cbp-mc-column">
                            <div class="hr-cbp-mc-column-inner-remark">
                                <label for="GIRemarks">Remarks</label>
	  					        <textarea runat="server" id="txtGIRemarks" tabindex="8" name="GIRemarks" rows="3"></textarea> 
                            </div>
                            <div class="hr-cbp-mc-column-inner">
                                <asp:LinkButton ID="GISubmit" runat="server" CssClass="MainButton" TabIndex="9" OnClick="GISubmit_click" ValidationGroup="GIgroup">Add</asp:LinkButton>                                
                            </div>
                        </div>
                    </div>
                        <div class="GV-Area">
                        <asp:GridView ID="GridViewGI" runat="server" AutoGenerateColumns="False" OnRowDeleting="GridViewGI_RowDeleting" GridLines="None" 
                               OnRowEditing="GridViewGI_RowEditing" OnRowUpdating="GridViewGI_RowUpdating" OnRowCancelingEdit="GridViewGI_RowCancelingEdit" DataKeyNames="Code"  Width="100%">
                                <Columns>
                                    <asp:BoundField DataField="Code" Visible="false"  />
                                    <asp:BoundField DataField="InsuredObject" HeaderText="Insured Object"  ReadOnly="true" HeaderStyle-HorizontalAlign="Left" />
                                    <asp:BoundField DataField="PolicyHolderName" HeaderText="Policy Holder Name" ReadOnly="true" HeaderStyle-HorizontalAlign="Left"/>
                                    <asp:BoundField DataField="PolicyName" HeaderText="Policy Name" ControlStyle-Width="100" HeaderStyle-HorizontalAlign="Left" />                                        
                                    <asp:BoundField DataField="Premium" HeaderText="Premium" ControlStyle-Width="80" HeaderStyle-HorizontalAlign="left" />
                                    <asp:BoundField DataField="PremiumMode" HeaderText="Premium Mode" ReadOnly="true" HeaderStyle-HorizontalAlign="left" />                                    
                                    <asp:BoundField DataField="SumAssured" HeaderText="Sum Assured" ControlStyle-Width="80" DataFormatString="{0:##,##,##,##,###}" HeaderStyle-HorizontalAlign="left" />                                    
                                    <asp:BoundField DataField="StartDate" HeaderText="Start Date" ReadOnly="true" HeaderStyle-HorizontalAlign="left" />
                                    <asp:CommandField EditImageUrl="Plan/images/edit.png"  ButtonType="Image"  ShowEditButton="true" UpdateImageUrl="Plan/images/updates.png" CancelImageUrl="~/images/cancel.png"  >                                        
                                    </asp:CommandField>
                                    <asp:TemplateField >
	                                    <ItemTemplate>		                                    
                                            <asp:ImageButton ID="delButton" runat="server" CommandName="Delete" ImageUrl="~/images/delete.png"
                                                OnClientClick="return confirm('Are you sure you want to delete this Insurance Details?');" />
	                                    </ItemTemplate>
                                    </asp:TemplateField>                                                                          
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
                </ContentTemplate>   
                </asp:UpdatePanel>
            </div>

            <div id="myrequirement" class="virtualpage hidepiece" runat="server">
                <h1>My Requirement</h1>
                <asp:UpdatePanel ID="UpdatePanelMyRequirement" runat="server">
                    <ContentTemplate>
                    <a id="infoiconMyRequirement" onclick="document.getElementById('infodetailsMyRequirement').style.display='';document.getElementById('infoiconMyRequirement').style.display='none';return false;" 
                    href="" style="text-decoration:none; display:none;">
                    <span style="float:right; font-size:18px; margin-top:-15px;"><i class="fa fa-info-circle"></i></span></a>
                    <br />
                    <div id="infodetailsMyRequirement" style="display:block; margin-top:-10px" class="fragment">
                    <a onclick="document.getElementById('infodetailsMyRequirement').style.display='none';document.getElementById('infoiconMyRequirement').style.display='block';return false;" href="" 
                    class="close">X</a>
                    Enter what you want
                    </div>
                        <div class="hr-cbp-mc-form">
                            <div class="hr-cbp-mc-column">
                                <div class="hr-cbp-mc-column-inner">
                                    <label for="goalcategory">Goal Category</label>
                                    <asp:DropDownList ID="txtGoalCategory" name="goalcategory" TabIndex="1" OnSelectedIndexChanged="txtGoalCategory_change" AutoPostBack="true"   CssClass="aspddl" runat="server" ValidationGroup="myrequirement" >                                                              
                                    </asp:DropDownList>  
                                </div>                                  
                                <div class="hr-cbp-mc-column-inner">
                                    <label for="goalname">Goal Name <asp:RequiredFieldValidator ID="RequiredFieldGoalName" ValidationGroup="myrequirement" runat="server" ErrorMessage="*" Display="Dynamic" ControlToValidate="txtGoalName" CssClass="mandatory"></asp:RequiredFieldValidator></label>
                                    <asp:TextBox type="text" name="goalname" CssClass="inputfieldSmall" runat="server" TabIndex="2" id="txtGoalName" ValidationGroup="myrequirement" />                                    
                                    <asp:Label ID="GoalNameEg" runat="server" Text=""></asp:Label>
                                </div>
                                <div class="hr-cbp-mc-column-inner">
                                     <label for="ownamount" runat="server" id="lblOwnAmount">Amount <asp:RequiredFieldValidator ID="RequiredFieldOwnAmountRequired" ValidationGroup="myrequirement" runat="server" ErrorMessage="*" Display="Dynamic" ControlToValidate="txtOwnAmount" CssClass="mandatory"></asp:RequiredFieldValidator></label>
                                    <asp:TextBox type="text" name="amount" CssClass="inputfieldSmall" MaxLength="10" TabIndex="3" runat="server" id="txtOwnAmount" ValidationGroup="myrequirement"  />                                    
                                </div>
                                <div class="hr-cbp-mc-column-inner">
                                    <label for="goalmonth" id="lblRetYear" runat="server" visible="false"  >Year of Retirement <asp:RequiredFieldValidator ID="RequiredFieldRetYear" ValidationGroup="myrequirement" runat="server" ErrorMessage="*" Display="Dynamic" ControlToValidate="txtGoalMonth" CssClass="mandatory"></asp:RequiredFieldValidator></label>
                                    <label for="goalmonth" id="lblGoalYear" runat="server">Goal Month/Year <asp:RequiredFieldValidator ID="RequiredFieldStartDate" ValidationGroup="myrequirement" runat="server" ErrorMessage="*" Display="Dynamic" ControlToValidate="txtGoalMonth" CssClass="mandatory"></asp:RequiredFieldValidator></label>
                                    <asp:TextBox type="text" CssClass="inputfieldSmall" runat="server" id="txtGoalMonth" TabIndex="4" placeholder="DD-MM-YYYY" ValidationGroup="myrequirement"  />
                                    <%--<ajxct:CalendarExtender ID="CalendarExtender4" runat="server" TargetControlID="txtGoalMonth"  Format="yyyy-MM-dd" SkinID="2" Animated="true"  />--%>                                    
                                </div>                                                                                                                           
                            </div>                            
                            <div class="hr-cbp-mc-column">
                                <div class="hr-cbp-mc-column-inner">
                                    <label for="curexp" runat="server" visible="false" id="lblCurexp">Current Annual Expenses</label>
                                    <asp:TextBox type="text" Visible="false" name="curexp" CssClass="inputfieldSmall" TabIndex="5" runat="server" id="txtCurrentExp" ValidationGroup="myrequirement"  />
                                    <asp:RequiredFieldValidator Visible="false" ID="RequiredFieldCurrentExpenditure" ValidationGroup="myrequirement" runat="server" ErrorMessage="*" Display="Dynamic" ControlToValidate="txtCurrentExp" CssClass="mandatory"></asp:RequiredFieldValidator>
                                </div>
                                <div class="hr-cbp-mc-column-inner">
                                    <label for="lifeexpectancy" visible="false" runat="server" id="lblLifeExpectancy">Life Expectancy in Years</label>
                                    <asp:TextBox type="text" visible="false" name="lifeexpectancy" CssClass="inputfieldSmall" TabIndex="6" runat="server" id="txtLifeExpectancy" ValidationGroup="myrequirement"  />
                                    <asp:RequiredFieldValidator visible="false" ID="RequiredFieldLifeExpectancy" ValidationGroup="myrequirement" runat="server" ErrorMessage="*" Display="Dynamic" ControlToValidate="txtLifeExpectancy" CssClass="mandatory"></asp:RequiredFieldValidator>
                                </div>
                                <%--<div class="hr-cbp-mc-column-inner">
                                    <label for="remark" runat="server" id="lblRemark">Remark</label>
                                    <asp:TextBox type="text" name="remark" CssClass="inputfieldSmall" runat="server" id="txtRemark" ValidationGroup="myrequirement"  />                                    
                                </div>--%>
                                                               
                            </div>                                                         
                        </div>
                        <div >
                                <asp:LinkButton ID="GoalRequirementSubmit" runat="server" CssClass="MainButton" TabIndex="7" OnClick="GoalRequirementSubmit_click" ValidationGroup="myrequirement">Add</asp:LinkButton>
                                <asp:LinkButton ID="btnPlanOutPutRet" runat="server" CssClass="POButton" TabIndex="8" OnClick="btnPlanOutPut_Click" Visible="false" >Show Mini Free Plan Output</asp:LinkButton>
                                <asp:Label ID="Label1" runat="server" CssClass="message" Text="To generate a comprehensive plan, click Next."></asp:Label>
                            </div> 
                        <div class="GV-Area">
                            <h2>My Goals</h2>
                            <asp:GridView ID="GridViewGoal" runat="server" AutoGenerateColumns="False" OnRowDeleting="GridViewGoal_RowDeleting" GridLines="None" 
                                    OnRowEditing="GridViewGoal_RowEditing" OnRowUpdating="GridViewGoal_RowUpdating" OnRowCancelingEdit="GridViewGoal_RowCancelingEdit" DataKeyNames="Code"  Width="100%">
                                    <Columns>
                                        <asp:BoundField DataField="Code" Visible="false"  />
                                        <asp:BoundField DataField="GoalCategory" HeaderText="Goal Category"  ReadOnly="true" HeaderStyle-HorizontalAlign="Left" />                                        
                                        <asp:BoundField DataField="GoalName" HeaderText="Goal Name" ReadOnly="false"  HeaderStyle-HorizontalAlign="Left" />                                        
                                        <asp:BoundField DataField="GoalDate" HeaderText="GoalMonth" ReadOnly="true" HeaderStyle-HorizontalAlign="left" />                                        
                                        <asp:BoundField DataField="Amount" HeaderText="Amount" ControlStyle-Width="100px" ReadOnly="false" DataFormatString="{0:##,##,##,##,###}" HeaderStyle-HorizontalAlign="right" ItemStyle-HorizontalAlign="right" />                                        
                                        <asp:CommandField ItemStyle-HorizontalAlign="Right" EditImageUrl="~/images/edit.png"  ButtonType="Image"  ShowEditButton="true" UpdateImageUrl="~/images/updates.png" CancelImageUrl="~/images/cancel.png"  >
                                        
                                        </asp:CommandField>                                         
                                        <asp:TemplateField ItemStyle-HorizontalAlign="Right" >
	                                        <ItemTemplate>		                                    
                                                <asp:ImageButton ID="delButton" runat="server" CommandName="Delete" ImageUrl="~/images/delete.png"
                                                    OnClientClick="return confirm('Are you sure you want to delete this Goal?');" />
	                                        </ItemTemplate>
                                        </asp:TemplateField>                                                                           
                                    </Columns>
                                    <AlternatingRowStyle CssClass="GV-AlternatingRowStyle" />
                                    <EditRowStyle CssClass="GV-EditRow" />                                    
                                    <HeaderStyle CssClass="GV-HeaderStyle" />
                                    <PagerStyle CssClass="GV-PagerStyle" />
                                    <RowStyle CssClass="GV-RowStyle" />
                                    <SelectedRowStyle CssClass="GV-SelectedRowStyle" /> 
                                </asp:GridView>
                        </div>

                       <%-- For Retirement --%>

                        <div class="GV-Area">
                            <h2>Retirement</h2>
                            <asp:GridView ID="GridViewRetirementGoal" runat="server" AutoGenerateColumns="False" OnRowDeleting="GridViewRetirementGoal_RowDeleting" GridLines="None" 
                                    OnRowEditing="GridViewRetirementGoal_RowEditing" OnRowUpdating="GridViewRetirementGoal_RowUpdating" OnRowCancelingEdit="GridViewRetirementGoal_RowCancelingEdit" DataKeyNames="Code"  Width="100%">
                                    <Columns>
                                        <asp:BoundField DataField="Code" Visible="false"  />
                                        <asp:BoundField DataField="GoalCategory" HeaderText="Goal Category"  ReadOnly="true" HeaderStyle-HorizontalAlign="Left" />                                        
                                        <asp:BoundField DataField="GoalName" HeaderText="Goal Name" ReadOnly="false"  HeaderStyle-HorizontalAlign="Left" />                                        
                                        <asp:BoundField DataField="GoalDate" HeaderText="GoalMonth" ReadOnly="true" HeaderStyle-HorizontalAlign="left" />
                                        <asp:BoundField DataField="CurrentExpenditure" HeaderText="Current Exp" ReadOnly="true" HeaderStyle-HorizontalAlign="right" ItemStyle-HorizontalAlign="right"  DataFormatString="{0:##,##,##,##,###}" />
                                        <asp:BoundField DataField="LifeExpectancy" HeaderText="Life Expectancy" ReadOnly="true" HeaderStyle-HorizontalAlign="right" ItemStyle-HorizontalAlign="right" />                                        
                                        
                                        <asp:CommandField ItemStyle-HorizontalAlign="Right" EditImageUrl="~/images/edit.png"  ButtonType="Image"  ShowEditButton="true" UpdateImageUrl="~/images/updates.png" CancelImageUrl="~/images/cancel.png"  >                                        
                                        </asp:CommandField>                                         
                                        <asp:TemplateField ItemStyle-HorizontalAlign="Right" >
	                                        <ItemTemplate>		                                    
                                                <asp:ImageButton ID="delButton" runat="server" CommandName="Delete" ImageUrl="~/images/delete.png"
                                                    OnClientClick="return confirm('Are you sure you want to delete this Goal?');" />
	                                        </ItemTemplate>
                                        </asp:TemplateField>                                                                           
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
            </div>
            
            <div id="assetLiability" class="virtualpage hidepiece" runat="server">                 
                <asp:UpdatePanel ID="UpdatePanelAssetLiability" runat="server">
                <ContentTemplate>
                    <div class="itemdropdown">
                        <div class="pageheading">My Assets & My Liabilities</div> 
                        <asp:DropDownList ID="DDAssetLiability" CssClass="inputfieldSmall" runat="server" OnSelectedIndexChanged="DDAssetLiability_SelectedIndexChanged" AutoPostBack="true" ValidationGroup="asset">
                            <asp:ListItem Value="Asset">Assets</asp:ListItem>
                            <asp:ListItem Value="Liabilities">Liabilities</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="clear"></div>
                    <a id="infoiconAsset" onclick="document.getElementById('infodetailsAsset').style.display='';document.getElementById('infoiconAsset').style.display='none';return false;" 
                    href="" style="text-decoration:none; display:none;">
                    <span style="float:right; font-size:18px; margin-top:-15px;"><i class="fa fa-info-circle"></i></span></a>
                    <br />
                    <div id="infodetailsAsset" style="display:block; margin-top:-10px" class="fragment">
                    <a onclick="document.getElementById('infodetailsAsset').style.display='none';document.getElementById('infoiconAsset').style.display='block';return false;" href="" 
                    class="close">X</a>
                    Enter what you own & what you owe
                    </div>
                <asp:UpdatePanel ID="UpdatePanelAsset" runat="server">
                <ContentTemplate>
			        <div class="hr-cbp-mc-form">
                        <div class="hr-cbp-mc-column">
                            <div class="hr-cbp-mc-column-inner">
                                <label for="assetType">Asset Type</label>
                                <asp:DropDownList ID="txtAssetType" name="assetType" CssClass="aspddl" TabIndex="1"  runat="server" ValidationGroup="assetgroup" >                                                              
                                </asp:DropDownList> 
                            </div>
                            <div class="hr-cbp-mc-column-inner">
                                <label for="assetCurrentValue">Current Value <asp:RequiredFieldValidator ID="RequiredFieldAssetCurrentValue" ValidationGroup="assetgroup" runat="server" ErrorMessage="*" Display="Dynamic" ControlToValidate="txtAssetCurrentValue" CssClass="mandatory"></asp:RequiredFieldValidator></label>
                                <asp:TextBox type="text" name="assetCurrentValue" TabIndex="2" runat="server" id="txtAssetCurrentValue" ValidationGroup="assetgroup" />                                
                            </div>
                            <div class="hr-cbp-mc-column-inner">
                                <label for="accquisitionDate" id="lblAccDate" runat="server">Accquisition Date <asp:RequiredFieldValidator ID="RequiredFieldAccDate" ValidationGroup="assetgroup" runat="server" ErrorMessage="*" Display="Dynamic" ControlToValidate="txtAccquisitionDate" CssClass="mandatory"></asp:RequiredFieldValidator></label>
                                <asp:TextBox type="text" TabIndex="3" runat="server" id="txtAccquisitionDate" ValidationGroup="assetgroup"  />
                                <%--<ajxct:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtAccquisitionDate"  Format="yyyy-MM-dd" SkinID="2" Animated="true"  />                                --%>
                            </div>
                            <div class="hr-cbp-mc-column-inner">
                                <label for="goalcategory">Owner</label>
                                <asp:DropDownList ID="txtAssetOwner" CssClass="aspddl" runat="server" TabIndex="4" ValidationGroup="assetgroup">                                
                                </asp:DropDownList> 
                            </div>                            
                        </div>
                        <div class="hr-cbp-mc-column">
                            <div class="hr-cbp-mc-column-inner">
                                <label id="lblPurchasePrice" runat="server" for="assetPurchasePrice">Purchase Price <asp:RequiredFieldValidator ID="RequiredFieldAssetPurchasePrice" ValidationGroup="assetgroup" runat="server" ErrorMessage="*" Display="Dynamic" ControlToValidate="txtAssetPurchasePrice" CssClass="mandatory"></asp:RequiredFieldValidator></label>
                                <asp:TextBox type="text" name="assetPurchasePrice" CssClass="inputfieldSmall" TabIndex="5" runat="server" id="txtAssetPurchasePrice" ValidationGroup="assetgroup" />                                
                            </div>
                            <div class="hr-cbp-mc-column-inner">
                                <asp:LinkButton ID="AssetSubmit" runat="server" CssClass="MainButton" TabIndex="6" OnClick="AssetSubmit_click" ValidationGroup="assetgroup">Add</asp:LinkButton>
                            </div>                            
                        </div>                        
                    </div>

                    <div class="GV-Area">
                        <asp:GridView ID="GridViewAsset" runat="server" AutoGenerateColumns="False" OnRowDeleting="GridViewAsset_RowDeleting" GridLines="None" 
                                OnRowEditing="GridViewAsset_RowEditing" OnRowUpdating="GridViewAsset_RowUpdating" OnRowCancelingEdit="GridViewAsset_RowCancelingEdit" DataKeyNames="Code"  Width="100%">
                                <Columns>
                                    <asp:BoundField DataField="Code" Visible="false"  />
                                    <asp:BoundField DataField="AssetType" HeaderText="Asset Type"  ReadOnly="true" HeaderStyle-HorizontalAlign="Left" />
                                    <asp:BoundField DataField="AssetOwner" HeaderText="Asset Owner"  ReadOnly="true" HeaderStyle-HorizontalAlign="Left"/>                                    
                                    <asp:BoundField DataField="CurrentValue" HeaderText="Current Value" DataFormatString="{0:##,##,##,##,###}" HeaderStyle-HorizontalAlign="left" />
                                    <asp:BoundField DataField="PurchasePrice" HeaderText="Purchase Price" ControlStyle-Width="100px" DataFormatString="{0:##,##,##,##,###}" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" />                                        
                                    <asp:BoundField DataField="AccqDate" HeaderText="Accq. Date" HeaderStyle-HorizontalAlign="Left" />
                                    <asp:CommandField EditImageUrl="~/images/edit.png"  ButtonType="Image"  ShowEditButton="true" UpdateImageUrl="~/images/updates.png" CancelImageUrl="~/images/cancel.png"  >
                                        
                                    </asp:CommandField>
                                     <asp:TemplateField >
	                                    <ItemTemplate>		                                    
                                            <asp:ImageButton ID="delButton" runat="server" CommandName="Delete" ImageUrl="~/images/delete.png"
                                                OnClientClick="return confirm('Are you sure you want to delete this Asset?');" />
	                                    </ItemTemplate>
                                    </asp:TemplateField>                                                                             
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
                <asp:UpdatePanel ID="UpdatePanelLiability" runat="server" Visible="false">
                <ContentTemplate>
                    <div class="hr-cbp-mc-form">
                        <div class="hr-cbp-mc-column">
                            <div class="hr-cbp-mc-column-inner">
                                <label for="loanTaken">Loan Taken For</label>
                                <asp:DropDownList ID="DDLoanTaken" name="loanTaken" TabIndex="1" CssClass="aspddl" runat="server" ValidationGroup="loangroup" >                                                              
                                </asp:DropDownList>
                            </div>
                            <div class="hr-cbp-mc-column-inner">
                                <label for="originalamt" >Original Amount <asp:RequiredFieldValidator ID="RequiredFieldLender" ValidationGroup="loangroup" runat="server" ErrorMessage="*" Display="Dynamic" ControlToValidate="txtOriginalAmt" CssClass="mandatory"></asp:RequiredFieldValidator> </label>
                                <asp:TextBox type="text" name="originalamt" MaxLength="10" id="txtOriginalAmt" CssClass="inputfieldSmall" TabIndex="2"  runat="server"  ValidationGroup="loangroup" />                                
                            </div>
                            <div class="hr-cbp-mc-column-inner">
                                <label for="rateofInterest" >Rate of Interest <asp:RequiredFieldValidator ID="RequiredFieldRateofInterest" ValidationGroup="loangroup" runat="server" ErrorMessage="*" Display="Dynamic" ControlToValidate="txtRateofInterest" CssClass="mandatory"></asp:RequiredFieldValidator> </label>
                                <asp:TextBox type="text" name="rateofInterest" id="txtRateofInterest" CssClass="inputfieldSmall" TabIndex="3"  runat="server"  ValidationGroup="loangroup" />                                
                            </div>
                            <div class="hr-cbp-mc-column-inner">
                                <label for="loantype">Loan Type</label>
                                <asp:DropDownList ID="DDLoanType" name="loantype" TabIndex="4" CssClass="aspddl" runat="server" ValidationGroup="loangroup" >                                                              
                                    <asp:ListItem Value="Fixed">Fixed</asp:ListItem>
                                    <asp:ListItem Value="Floating">Floating</asp:ListItem>
                                    <asp:ListItem Value="Mixed">Mixed</asp:ListItem>
                                    <asp:ListItem Value="Others">Others</asp:ListItem>
                                </asp:DropDownList>
                            </div>                            
                        </div>
                        <div class="hr-cbp-mc-column">
                            <div class="hr-cbp-mc-column-inner">
                                <label for="emi" >EMI</label>
                                <asp:TextBox type="text" name="emi" id="txtEMI" CssClass="inputfieldSmall" TabIndex="5"  runat="server"  ValidationGroup="loangroup" />
                            </div>
                            <div class="hr-cbp-mc-column-inner">
                                <label for="outstanding" >Outstanding Balance</label>
                                <asp:TextBox type="text" name="outstanding" id="txtOutstandingBal" CssClass="inputfieldSmall" TabIndex="6"  runat="server"  ValidationGroup="loangroup" />
                            </div>
                            <div class="hr-cbp-mc-column-inner">
                                <label for="loanTenure" >Loan Tenure (Months) <asp:RequiredFieldValidator ID="RequiredFieldLoanTenure" ValidationGroup="loangroup" runat="server" ErrorMessage="*" Display="Dynamic" ControlToValidate="txtLoanTenure" CssClass="mandatory"></asp:RequiredFieldValidator> </label>
                                <asp:TextBox type="text" name="loanTenure" id="txtLoanTenure" CssClass="inputfieldSmall" TabIndex="7"  runat="server"  ValidationGroup="loangroup" />                                
                            </div>                              
                            <div class="hr-cbp-mc-column-inner">
                                <label for="startDate" >Start Date <asp:RequiredFieldValidator ID="RequiredFieldDisbursementDate" ValidationGroup="loangroup" runat="server" ErrorMessage="*" Display="Dynamic" ControlToValidate="txtStartDate" CssClass="mandatory"></asp:RequiredFieldValidator> </label>
                                <asp:TextBox type="text" id="txtStartDate" CssClass="inputfieldSmall" TabIndex="8"  runat="server"  ValidationGroup="loangroup" />
                                <%--<ajxct:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="txtStartDate"  Format="yyyy-MM-dd" SkinID="2" Animated="true"  />--%>
                            </div>                              
                        </div>
                        
                        <div class="hr-cbp-mc-column">                            
                            <div class="hr-cbp-mc-column-inner">
                                <asp:LinkButton ID="LoanSubmit" runat="server" CssClass="MainButton" TabIndex="9" OnClick="LoanSubmit_click" ValidationGroup="loangroup">Add</asp:LinkButton>
                            </div>
                        </div>
                    </div>

                    <div class="GV-Area">
                        <asp:GridView ID="GridViewLoan" runat="server" AutoGenerateColumns="False" OnRowDeleting="GridViewLoan_RowDeleting" GridLines="None" 
                                OnRowEditing="GridViewLoan_RowEditing" OnRowUpdating="GridViewLoan_RowUpdating" OnRowCancelingEdit="GridViewLoan_RowCancelingEdit" DataKeyNames="Code"  Width="100%">
                                <Columns>
                                    <asp:BoundField DataField="Code" Visible="false"  />
                                    <asp:BoundField DataField="LoanTakenFor" HeaderText="Loan Taken"  ReadOnly="true" HeaderStyle-HorizontalAlign="Left" />
                                    <asp:BoundField DataField="OriginalAmount" HeaderText="Original Amount" DataFormatString="{0:##,##,##,##,###}" ReadOnly="true" HeaderStyle-HorizontalAlign="Left"/>
                                    <asp:BoundField DataField="RateofInterest" HeaderText="Interest Rate" ReadOnly="true" HeaderStyle-HorizontalAlign="Left" />                                        
                                    <asp:BoundField DataField="LoanType" HeaderText="Loan Type"  HeaderStyle-HorizontalAlign="left" />
                                    <asp:BoundField DataField="EMI" HeaderText="EMI" ControlStyle-Width="100px" DataFormatString="{0:##,##,##,##,###}" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" />                                        
                                    <asp:BoundField DataField="LoanTenure" HeaderText="Tenure" HeaderStyle-HorizontalAlign="Left" />
                                    <asp:BoundField DataField="OutStandingBalance" HeaderText="Outstanding" HeaderStyle-HorizontalAlign="Left" />
                                    <asp:BoundField DataField="StartDate" HeaderText="Start Date" HeaderStyle-HorizontalAlign="Left" />                                    
                                    <asp:CommandField EditImageUrl="~/images/edit.png"  ButtonType="Image"  ShowEditButton="true" UpdateImageUrl="~/images/updates.png" CancelImageUrl="~/images/cancel.png"  >                                        
                                    </asp:CommandField>
                                     <asp:TemplateField >
	                                    <ItemTemplate>		                                    
                                            <asp:ImageButton ID="delButton" runat="server" CommandName="Delete" ImageUrl="~/images/delete.png"
                                                OnClientClick="return confirm('Are you sure you want to delete this Liability?');" />
	                                    </ItemTemplate>
                                    </asp:TemplateField>                                                                              
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
                    </ContentTemplate>   
                </asp:UpdatePanel>
            </div>
            <div class="virtualpage hidepiece" id="incomeExpense" runat="server">                                
                <asp:UpdatePanel ID="UpdatePanelIncomeExpense" runat="server">
                <ContentTemplate>
                    <div class="itemdropdown">
                        <div class="pageheading">My Income & My Expenses</div> 
                        <asp:DropDownList ID="DDIncomeExpense" CssClass="inputfieldSmall" runat="server" OnSelectedIndexChanged="DDIncomeExpense_SelectedIndexChanged" AutoPostBack="true" ValidationGroup="asset">
                            <asp:ListItem Value="Income">Income</asp:ListItem>
                            <asp:ListItem Value="Expense">Expense</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="clear"></div>
                    <a id="infoiconIncome" onclick="document.getElementById('infodetailsIncome').style.display='';document.getElementById('infoiconIncome').style.display='none';return false;" 
                    href="" style="text-decoration:none; display:none;">
                    <span style="float:right; font-size:18px; margin-top:-15px;"><i class="fa fa-info-circle"></i></span></a>
                    <br />
                    <div id="infodetailsIncome" style="display:block; margin-top:-10px" class="fragment">
                    <a onclick="document.getElementById('infodetailsIncome').style.display='none';document.getElementById('infoiconIncome').style.display='block';return false;" href="" 
                    class="close">X</a>
                        Enter what comes in & what goes out
                    </div>
                    <asp:UpdatePanel ID="UpdatePanelIncome" runat="server">
                    <ContentTemplate>
                    
			        <div class="hr-cbp-mc-form">
                        <div class="hr-cbp-mc-column">
                            <div class="hr-cbp-mc-column-inner">
                                <label for="incomeType">Income Type</label>
                                <asp:DropDownList ID="txtIncomeType" name="assetType" TabIndex="1" CssClass="aspddl" runat="server" ValidationGroup="incomegroup" >                                                              
                                </asp:DropDownList>
                            </div>
                            <div class="hr-cbp-mc-column-inner">
                                <label for="incomeAmount" >Income Amount <asp:RequiredFieldValidator ID="RequiredFieldIncomeMonthly" ValidationGroup="incomegroup" runat="server" ErrorMessage="*" Display="Dynamic" ControlToValidate="txtIncomeAmount" CssClass="mandatory"></asp:RequiredFieldValidator> </label>
                                <asp:TextBox type="text" name="incomeAmount" id="txtIncomeAmount" MaxLength="10"  CssClass="inputfieldSmall" TabIndex="2"  runat="server" ValidationGroup="incomegroup" />                                
                            </div>
                            <div class="hr-cbp-mc-column-inner">
                                <label for="incomeperiod">Income Period</label>
                                <asp:DropDownList ID="DDIncomePeriod" name="incomeperiod" TabIndex="3" CssClass="aspddl" runat="server" ValidationGroup="incomegroup" >                                                              
                                    <asp:ListItem Value="Monthly">Monthly</asp:ListItem>
                                    <asp:ListItem Value="Quarterly">Quarterly</asp:ListItem>
                                    <asp:ListItem Value="Half Yearly">Half Yearly</asp:ListItem>
                                    <asp:ListItem Value="Yearly">Yearly</asp:ListItem>
                                    <asp:ListItem Value="Others">Others</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="hr-cbp-mc-column-inner">
                                <asp:LinkButton ID="IncomeButton" runat="server" CssClass="MainButton" TabIndex="4" OnClick="IncomeSubmit_click" ValidationGroup="incomegroup">Add</asp:LinkButton>
                            </div>
                                                                                    
                        </div>                        
                     </div>
                    <div class="GV-Area">
                        <asp:GridView ID="GridViewIncome" runat="server" AutoGenerateColumns="False" OnRowDeleting="GridViewIncome_RowDeleting" GridLines="None" 
                                OnRowEditing="GridViewIncome_RowEditing" OnRowUpdating="GridViewIncome_RowUpdating" OnRowCancelingEdit="GridViewIncome_RowCancelingEdit" DataKeyNames="Code"  Width="100%">
                                <Columns>
                                    <asp:BoundField DataField="Code" Visible="false"  />
                                    <asp:BoundField DataField="IncomeType" HeaderText="Income Type"  ReadOnly="true" HeaderStyle-HorizontalAlign="Left" />
                                    <asp:BoundField DataField="IncomeAmount" HeaderText="Income Amount" HeaderStyle-HorizontalAlign="Left"/>
                                    <asp:BoundField DataField="IncomePeriod" HeaderText="Income Period" HeaderStyle-HorizontalAlign="Left" />                                    
                                    <asp:CommandField EditImageUrl="~/images/edit.png"  ButtonType="Image"  ShowEditButton="true" UpdateImageUrl="~/images/updates.png" CancelImageUrl="~/images/cancel.png"  >
                                        
                                    </asp:CommandField>
                                    <asp:TemplateField >
	                                    <ItemTemplate>		                                    
                                            <asp:ImageButton ID="delButton" runat="server" CommandName="Delete" ImageUrl="~/images/delete.png"
                                                OnClientClick="return confirm('Are you sure you want to delete this Income?');" />
	                                    </ItemTemplate>
                                    </asp:TemplateField>                                                                            
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
                    <asp:UpdatePanel ID="UpdatePanelExpenses" runat="server" Visible="false">
                        <ContentTemplate>
			            <div class="hr-cbp-mc-form">
                            <div class="hr-cbp-mc-column">
                                <div class="hr-cbp-mc-column-inner">
                                    <label for="expenseType">Expense Type</label>
                                    <asp:DropDownList ID="txtExpenseType" name="expenseType" TabIndex="1" CssClass="aspddl" runat="server" ValidationGroup="expensegroup" >                                                              
                                        </asp:DropDownList>
                                </div>
                                <div class="hr-cbp-mc-column-inner">
                                    <label for="expenseAmount" >Expense Amount <asp:RequiredFieldValidator ID="RequiredFieldExpenseMothly" ValidationGroup="expensegroup" runat="server" ErrorMessage="*" Display="Dynamic" ControlToValidate="txtExpenseAmount" CssClass="mandatory"></asp:RequiredFieldValidator> </label>
                                    <asp:TextBox type="text" name="expenseAmount" id="txtExpenseAmount" MaxLength="10" TabIndex="2" CssClass="inputfieldSmall"  runat="server" ValidationGroup="expensegroup" />                                    
                                </div>
                                <div class="hr-cbp-mc-column-inner">
                                    <label for="expenseperiod">Expense Period</label>
                                    <asp:DropDownList ID="DDExpensePeriod" name="expenseperiod" TabIndex="3" CssClass="aspddl" runat="server" ValidationGroup="incomegroup" >                                                              
                                        <asp:ListItem Value="Monthly">Monthly</asp:ListItem>
                                        <asp:ListItem Value="Quarterly">Quarterly</asp:ListItem>
                                        <asp:ListItem Value="Half Yearly">Half Yearly</asp:ListItem>
                                        <asp:ListItem Value="Yearly">Yearly</asp:ListItem>
                                        <asp:ListItem Value="Others">Others</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div class="hr-cbp-mc-column-inner">
                                    <asp:LinkButton ID="ExpenseSubmit" runat="server" TabIndex="4" CssClass="MainButton" OnClick="ExpenseSubmit_click" ValidationGroup="expensegroup">Add</asp:LinkButton>
                                </div>
                            </div>                                                        
                        </div>
                        <div class="GV-Area">
                                <asp:GridView ID="GridViewExpense" runat="server" AutoGenerateColumns="False" OnRowDeleting="GridViewExpense_RowDeleting" GridLines="None" 
                                       OnRowEditing="GridViewExpense_RowEditing" OnRowUpdating="GridViewExpense_RowUpdating" OnRowCancelingEdit="GridViewExpense_RowCancelingEdit" DataKeyNames="Code"  Width="100%">
                                        <Columns>
                                            <asp:BoundField DataField="Code" Visible="false"  />
                                            <asp:BoundField DataField="ExpenseType" HeaderText="Expense Type"  ReadOnly="true" HeaderStyle-HorizontalAlign="Left" />
                                            <asp:BoundField DataField="ExpenseAmount" HeaderText="Expense Amount" DataFormatString="{0:##,##,##,##,###}" HeaderStyle-HorizontalAlign="Left"/>
                                            <asp:BoundField DataField="ExpensePeriod" HeaderText="Expense Period"  HeaderStyle-HorizontalAlign="Left" />                                    
                                            <asp:CommandField EditImageUrl="~/images/edit.png"  ButtonType="Image"  ShowEditButton="true" UpdateImageUrl="~/images/updates.png" CancelImageUrl="~/images/cancel.png"  >
                                        
                                            </asp:CommandField>
                                            <asp:TemplateField >
	                                            <ItemTemplate>		                                    
                                                    <asp:ImageButton ID="delButton" runat="server" CommandName="Delete" ImageUrl="~/images/delete.png"
                                                        OnClientClick="return confirm('Are you sure you want to delete this Expense?');" />
	                                            </ItemTemplate>
                                            </asp:TemplateField>                                                                             
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
                    </ContentTemplate>   
                </asp:UpdatePanel>
            </div>
            <div class="virtualpage hidepiece" id="investments" runat="server">
                <asp:UpdatePanel ID="UpdatePanelInvestments" runat="server">
                    <ContentTemplate>
                        <div class="itemdropdown">
                        <div class="pageheading">Investments</div> 
                        <asp:DropDownList ID="DDInvestments" CssClass="inputfieldSmall" runat="server" OnSelectedIndexChanged="DDInvestments_SelectedIndexChanged" AutoPostBack="true" ValidationGroup="asset">
                            <asp:ListItem Value="Mutual Fund">Mutual Fund</asp:ListItem>
                            <asp:ListItem Value="Stock">Stock</asp:ListItem>
                            <asp:ListItem Value="Fixed Income">Fixed Income</asp:ListItem>
                            <asp:ListItem Value="Others">Others</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="clear"></div>
                         <a id="infoiconInvestments" onclick="document.getElementById('infoinvestmentsdetails').style.display='';document.getElementById('infoiconInvestments').style.display='none';return false;" 
                        href="" style="text-decoration:none; display:none;">
                        <span style="float:right; font-size:18px; margin-top:-15px;"><i class="fa fa-info-circle"></i></span></a>
                        <br />
                        <div id="infoinvestmentsdetails" style="display:block; margin-top:-10px" class="fragment">
                        <a onclick="document.getElementById('infoinvestmentsdetails').style.display='none';document.getElementById('infoiconInvestments').style.display='block';return false;" href="" 
                        class="close">X</a>
                            Enter financial products invested
                        </div>
                        <asp:UpdatePanel ID="UpdatePanelMutualFund" runat="server">
                            <ContentTemplate>
			                    <div class="hr-cbp-mc-form">
                                    <div class="hr-cbp-mc-column">
                                        <div class="hr-cbp-mc-column-inner">
                                            <label for="mfscheme">Mutual Fund Scheme Name <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="investments" runat="server" ErrorMessage="*" Display="Dynamic" ControlToValidate="txtMFSchemeName" CssClass="mandatory"></asp:RequiredFieldValidator></label>
                                            <asp:TextBox type="text" id="txtMFSchemeName" name="mfscheme" TabIndex="1" runat="server" ValidationGroup="investments" />                                            
                                        </div>
                                        <div class="hr-cbp-mc-column-inner">
                                            <label for="mfinvtype">Investment Type</label>
                                            <asp:DropDownList ID="DDMFInvType" name="mfinvtype" CssClass="aspddl" TabIndex="2" OnSelectedIndexChanged="DDMFInvType_SelectedIndexChanged" AutoPostBack="true" runat="server" ValidationGroup="investments" >
                                                <asp:ListItem Value="SIP">SIP</asp:ListItem>
                                                <asp:ListItem Value="Lumpsum">Lumpsum</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                        <div class="hr-cbp-mc-column-inner">
                                            <label for="mfinvamount">Invested Amount <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ValidationGroup="investments" runat="server" ErrorMessage="*" Display="Dynamic" ControlToValidate="txtMFInvAmount" CssClass="mandatory"></asp:RequiredFieldValidator></label>
                                            <asp:TextBox type="text" id="txtMFInvAmount" name="mfinvamount" MaxLength="10" CssClass="inputfieldSmall" TabIndex="3" runat="server" ValidationGroup="investments" />                                            
                                        </div>
                                        <div class="hr-cbp-mc-column-inner">
                                            <label for="mfcurrentvalue">Current Value <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ValidationGroup="investments" runat="server" ErrorMessage="*" Display="Dynamic" ControlToValidate="txtCurrentValue" CssClass="mandatory"></asp:RequiredFieldValidator></label>
                                            <asp:TextBox type="text" id="txtCurrentValue" name="mfcurrentvalue" CssClass="inputfieldSmall" TabIndex="4" runat="server" ValidationGroup="investments" />                                            
                                        </div>                                                                                    
                                    </div>
                                    <div class="hr-cbp-mc-column">
                                        <div class="hr-cbp-mc-column-inner">
                                            <label for="mfschemeoption">Scheme Option</label>
                                            <asp:DropDownList ID="DDMFSchemeOption" CssClass="aspddl" runat="server" TabIndex="5" ValidationGroup="investments">
                                                <asp:ListItem Value="Growth">Growth</asp:ListItem>
                                                <asp:ListItem Value="Dividend">Dividend</asp:ListItem>
                                                <asp:ListItem Value="Dividend Reinvest">Dividend Reinvest</asp:ListItem>                                                
                                            </asp:DropDownList> 
                                        </div>
                                        <div class="hr-cbp-mc-column-inner">
                                            <label for="mfstartdate">Start Date <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup="investments" runat="server" ErrorMessage="*" Display="Dynamic" ControlToValidate="txtMFStartDate" CssClass="mandatory"></asp:RequiredFieldValidator></label>
                                            <asp:TextBox type="text" id="txtMFStartDate" TabIndex="6" runat="server" ValidationGroup="investments"  />
                                            <%--<ajxct:CalendarExtender ID="CalendarExtender8" runat="server" TargetControlID="txtMFStartDate"  Format="yyyy-MM-dd" SkinID="2" Animated="true"  />--%>
                                        </div>
                                        <div class="hr-cbp-mc-column-inner">
                                            <label for="mfenddate"  runat="server" id="lblMFInvEndDate" >End Date <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ValidationGroup="investments" runat="server" ErrorMessage="*" Display="Dynamic" ControlToValidate="txtMFEndDate" CssClass="mandatory"></asp:RequiredFieldValidator></label>
                                            <asp:TextBox type="text" id="txtMFEndDate" TabIndex="7" runat="server" ValidationGroup="investments"  />
                                            <%--<ajxct:CalendarExtender ID="CalendarExtender9" runat="server" TargetControlID="txtMFEndDate"  Format="yyyy-MM-dd" SkinID="2" Animated="true"  />--%>
                                        </div>
                                        <div class="hr-cbp-mc-column-inner">
                                            <asp:LinkButton ID="MFSubmit" runat="server" TabIndex="8" CssClass="MainButton" OnClick="MFSubmit_click" ValidationGroup="investments">Add</asp:LinkButton>
                                            <asp:LinkButton ID="btnMFPaidPlanOutPut" runat="server" TabIndex="9" CssClass="POButton" OnClick="btnMFPaidPlanOutPut_Click" Visible="false" >Show Paid Plan Output</asp:LinkButton>
                                        </div>                            
                                    </div>                        
                                </div>

                                <div class="GV-Area">
                                    <asp:GridView ID="GridViewMFInvestments" runat="server" AutoGenerateColumns="False" OnRowDeleting="GridViewMFInvestments_RowDeleting" GridLines="None" 
                                            OnRowEditing="GridViewMFInvestments_RowEditing" OnRowUpdating="GridViewMFInvestments_RowUpdating" OnRowCancelingEdit="GridViewMFInvestments_RowCancelingEdit" DataKeyNames="Code"  Width="100%">
                                            <Columns>
                                                <asp:BoundField DataField="Code" Visible="false"  />
                                                <asp:BoundField DataField="SchemeName" HeaderText="Scheme Name"  ReadOnly="true" HeaderStyle-HorizontalAlign="Left" />
                                                <asp:BoundField DataField="InvestmentType" HeaderText="Investment Type"  ReadOnly="true" HeaderStyle-HorizontalAlign="Left"/>                                    
                                                <asp:BoundField DataField="InvestedAmount" HeaderText="Invested Amount" ControlStyle-Width="100px" DataFormatString="{0:##,##,##,##,###}"  HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" />
                                                <asp:BoundField DataField="CurrentValue" HeaderText="Current Value" ControlStyle-Width="100px" DataFormatString="{0:##,##,##,##,###}"  HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" />                                        
                                                <asp:BoundField DataField="SchemeOption" HeaderText="Scheme Option" ReadOnly="true"  HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" />
                                                <asp:BoundField DataField="StartDate" HeaderText="Start Date" ReadOnly="true"  HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" />
                                                <asp:BoundField DataField="EndDate" HeaderText="End Date" ReadOnly="true"  HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" />
                                                <asp:CommandField EditImageUrl="~/images/edit.png"  ButtonType="Image" ItemStyle-HorizontalAlign="Right"  ShowEditButton="true" UpdateImageUrl="~/images/updates.png" CancelImageUrl="~/images/cancel.png"  >                                        
                                                </asp:CommandField>
                                                 <asp:TemplateField ItemStyle-HorizontalAlign="Right" >
	                                                <ItemTemplate>		                                    
                                                        <asp:ImageButton ID="delButton" runat="server" CommandName="Delete" ImageUrl="~/images/delete.png"
                                                            OnClientClick="return confirm('Are you sure you want to delete this Mutual Fund?');" />
	                                                </ItemTemplate>
                                                </asp:TemplateField>                                                                             
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
                        <asp:UpdatePanel ID="UpdatePanelStock" runat="server"  Visible="false">
                            <ContentTemplate>
			                    <div class="hr-cbp-mc-form">
                                    <div class="hr-cbp-mc-column">
                                        <div class="hr-cbp-mc-column-inner">
                                            <label for="stockname">Stock Name <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ValidationGroup="stock" runat="server" ErrorMessage="*" Display="Dynamic" ControlToValidate="txtxStockName" CssClass="mandatory"></asp:RequiredFieldValidator></label>
                                            <asp:TextBox type="text" id="txtxStockName" name="stockname" TabIndex="1" runat="server" ValidationGroup="stock" />                                            
                                        </div>
                                        <div class="hr-cbp-mc-column-inner">
                                            <label for="noshares">No. of Shares <asp:RequiredFieldValidator ID="RequiredFieldValidator11" ValidationGroup="stock" runat="server" ErrorMessage="*" Display="Dynamic" ControlToValidate="txtNoShares" CssClass="mandatory"></asp:RequiredFieldValidator></label>
                                            <asp:TextBox type="text" id="txtNoShares" name="noshares" CssClass="inputfieldSmall" TabIndex="2" runat="server" ValidationGroup="stock" />                                            
                                        </div>
                                        <div class="hr-cbp-mc-column-inner">
                                            <label for="spurchaseprice">Purchase Price <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ValidationGroup="stock" runat="server" ErrorMessage="*" Display="Dynamic" ControlToValidate="txtSPurchasePrice" CssClass="mandatory"></asp:RequiredFieldValidator></label>
                                            <asp:TextBox type="text" id="txtSPurchasePrice" name="spurchaseprice" CssClass="inputfieldSmall" TabIndex="3" OnTextChanged="txtSPurchasePrice_change" AutoPostBack="true" runat="server" ValidationGroup="stock" />                                            
                                        </div>
                                        <div class="hr-cbp-mc-column-inner">
                                            <label for="scurrentprice">Current Price <asp:RequiredFieldValidator ID="RequiredFieldValidator8" ValidationGroup="stock" runat="server" ErrorMessage="*" Display="Dynamic" ControlToValidate="txtSCurrentPrice" CssClass="mandatory"></asp:RequiredFieldValidator></label>
                                            <asp:TextBox type="text" id="txtSCurrentPrice" name="scurrentprice" CssClass="inputfieldSmall" TabIndex="4" runat="server" OnTextChanged="txtSCurrentPrice_change" AutoPostBack="true" ValidationGroup="stock" />                                            
                                        </div>                                                                                    
                                    </div>
                                    <div class="hr-cbp-mc-column">
                                        <div class="hr-cbp-mc-column-inner">
                                            <label for="sinvamount">Invested Amount</label>
                                            <asp:TextBox type="text" id="txtSInvAmount" name="sinvamount" MaxLength="10" TabIndex="5" runat="server" ValidationGroup="stock"  />
                                        </div>
                                        <div class="hr-cbp-mc-column-inner">
                                            <label for="scurrentvalue">Current Value</label>
                                            <asp:TextBox type="text" id="txtSCurrentValue" name="scurrentvalue" TabIndex="6" runat="server" ValidationGroup="stock"  />                                            
                                        </div>
                                        <div class="hr-cbp-mc-column-inner">
                                            <label for="sgainloss">Gain/Loss %</label>
                                            <asp:TextBox type="text" id="txtSGainLoss" name="sgainloss" TabIndex="7" runat="server" ValidationGroup="stock"  />                                            
                                        </div>
                                        <div class="hr-cbp-mc-column-inner">
                                            <asp:LinkButton ID="StockButton" runat="server" TabIndex="8" CssClass="MainButton" OnClick="StockButton_click" ValidationGroup="stock">Add</asp:LinkButton>
                                            <asp:LinkButton ID="btnStockPaidPlanOutput" runat="server" TabIndex="9" CssClass="POButton" OnClick="btnMFPaidPlanOutPut_Click" Visible="false" >Show Paid Plan Output</asp:LinkButton>
                                        </div>                            
                                    </div>                        
                                </div>

                                <div class="GV-Area">
                                    <asp:GridView ID="GridViewStock" runat="server" AutoGenerateColumns="False" OnRowDeleting="GridViewStock_RowDeleting" GridLines="None" 
                                            OnRowEditing="GridViewStock_RowEditing" OnRowUpdating="GridViewStock_RowUpdating" OnRowCancelingEdit="GridViewStock_RowCancelingEdit" DataKeyNames="Code"  Width="100%">
                                            <Columns>
                                                <asp:BoundField DataField="Code" Visible="false"  />
                                                <asp:BoundField DataField="SchemeName" HeaderText="Stock Name"  ReadOnly="true" HeaderStyle-HorizontalAlign="Left" />
                                                <asp:BoundField DataField="NoShare" HeaderText="No. of Shares"  ReadOnly="true" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right"/>                                    
                                                <asp:BoundField DataField="PurchasePrice" HeaderText="Purchase Price" ControlStyle-Width="100px" DataFormatString="{0:##,##,##,##,###}" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" />
                                                <asp:BoundField DataField="CurrentPrice" HeaderText="Current Price" ControlStyle-Width="100px" DataFormatString="{0:##,##,##,##,###}" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" />                                        
                                                <asp:BoundField DataField="InvestedAmount" HeaderText="Invested Amount" ReadOnly="true" DataFormatString="{0:##,##,##,##,###}" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" />
                                                <asp:BoundField DataField="CurrentValue" HeaderText="Current Value" ReadOnly="true" DataFormatString="{0:##,##,##,##,###}" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" />
                                                <asp:BoundField DataField="GainLoss" HeaderText="Gain/Loss %" ReadOnly="true" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" />
                                                <asp:CommandField EditImageUrl="~/images/edit.png" ItemStyle-HorizontalAlign="Right"  ButtonType="Image"  ShowEditButton="true" UpdateImageUrl="~/images/updates.png" CancelImageUrl="~/images/cancel.png"  >
                                        
                                                </asp:CommandField>
                                                 <asp:TemplateField ItemStyle-HorizontalAlign="Right" >
	                                                <ItemTemplate>		                                    
                                                        <asp:ImageButton ID="delButton" runat="server" CommandName="Delete" ImageUrl="~/images/delete.png"
                                                            OnClientClick="return confirm('Are you sure you want to delete this Mutual Fund?');" />
	                                                </ItemTemplate>
                                                </asp:TemplateField>                                                                             
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
                        <asp:UpdatePanel ID="UpdatePanelFixedIncome" runat="server"  Visible="false">
                            <ContentTemplate>
			                    <div class="hr-cbp-mc-form">
                                    <div class="hr-cbp-mc-column">
                                        <div class="hr-cbp-mc-column-inner">
                                            <label for="fiinvtype">Investment Type</label>
                                            <asp:DropDownList ID="DDFIInvType" name="fiinvtype" CssClass="aspddl" TabIndex="1" runat="server" ValidationGroup="fixedincome" >
                                                <asp:ListItem Value="Lumpsum">Lumpsum</asp:ListItem>
                                                <asp:ListItem Value="Recurring-Monthly">Recurring (Monthly)</asp:ListItem>
                                                <asp:ListItem Value="Recurring-Quarterly">Recurring (Quarterly)</asp:ListItem>
                                                <asp:ListItem Value="Recurring-Yearly">Recurring (Yearly)</asp:ListItem>
                                                <asp:ListItem Value="Recurring-Others">Recurring (Others)</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                        <div class="hr-cbp-mc-column-inner">
                                            <label for="fiinvamount">Invested Amount <asp:RequiredFieldValidator ID="RequiredFieldValidator9" ValidationGroup="fixedincome" runat="server" ErrorMessage="*" Display="Dynamic" ControlToValidate="txtFIInvAmount" CssClass="mandatory"></asp:RequiredFieldValidator></label>
                                            <asp:TextBox type="text" id="txtFIInvAmount" name="fiinvamount" MaxLength="10" CssClass="inputfieldSmall" TabIndex="2" runat="server" ValidationGroup="fixedincome" />                                            
                                        </div>
                                        <div class="hr-cbp-mc-column-inner">
                                            <label for="ficurrentvalue">Current Value <asp:RequiredFieldValidator ID="RequiredFieldValidator10" ValidationGroup="fixedincome" runat="server" ErrorMessage="*" Display="Dynamic" ControlToValidate="txtFICurrentValue" CssClass="mandatory"></asp:RequiredFieldValidator></label>
                                            <asp:TextBox type="text" id="txtFICurrentValue" name="ficurrentvalue" CssClass="inputfieldSmall" TabIndex="3" runat="server" ValidationGroup="fixedincome" />                                            
                                        </div>
                                        <div class="hr-cbp-mc-column-inner">
                                            <label for="issuingentity">Issuing Entity</label>
                                            <asp:TextBox type="text" id="txtIssuingEntity" name="issuingentity" CssClass="inputfieldSmall" TabIndex="4" runat="server" ValidationGroup="fixedincome" />                                            
                                        </div>                                                                                    
                                    </div>
                                    <div class="hr-cbp-mc-column">
                                        <div class="hr-cbp-mc-column-inner">
                                            <label for="roi">Rate of Interest</label>
                                            <asp:TextBox type="text" id="txtROI" name="roi" TabIndex="5" runat="server" ValidationGroup="fixedincome"  />
                                        </div>
                                        <div class="hr-cbp-mc-column-inner">
                                            <label for="holdername">Holder Name</label>
                                            <asp:DropDownList ID="DDHolderNane" name="holdername" CssClass="aspddl" TabIndex="6" runat="server" ValidationGroup="fixedincome" >                                                
                                            </asp:DropDownList>                                            
                                        </div>
                                        <div class="hr-cbp-mc-column-inner">
                                            <label for="fistartdate">Start Date <asp:RequiredFieldValidator ID="RequiredFieldValidator12" ValidationGroup="fixedincome" runat="server" ErrorMessage="*" Display="Dynamic" ControlToValidate="txtMFStartDate" CssClass="mandatory"></asp:RequiredFieldValidator></label>
                                            <asp:TextBox type="text" id="txtFIStartDate" TabIndex="7" runat="server" ValidationGroup="fixedincome"  />
                                            <%--<ajxct:CalendarExtender ID="CalendarExtender10" runat="server" TargetControlID="txtFIStartDate"  Format="yyyy-MM-dd" SkinID="2" Animated="true"  />--%>
                                        </div>
                                        <div class="hr-cbp-mc-column-inner">
                                            <label for="fimaturitydate">Maturity Date <asp:RequiredFieldValidator ID="RequiredFieldValidator13" ValidationGroup="fixedincome" runat="server" ErrorMessage="*" Display="Dynamic" ControlToValidate="txtFIMaturityDate" CssClass="mandatory"></asp:RequiredFieldValidator></label>
                                            <asp:TextBox type="text" id="txtFIMaturityDate" TabIndex="8" runat="server" ValidationGroup="fixedincome"  />
                                            <%--<ajxct:CalendarExtender ID="CalendarExtender11" runat="server" TargetControlID="txtFIMaturityDate"  Format="yyyy-MM-dd" SkinID="2" Animated="true"  />--%>
                                        </div>                            
                                    </div> 
                                    <div class="hr-cbp-mc-column">
                                        <div class="hr-cbp-mc-column-inner-remark">
                                            <label for="FIRemarks">Remarks</label>
	  					                    <textarea runat="server" id="txtFIRemarks" tabindex="9" name="FIRemarks" rows="3"></textarea> 
                                        </div>
                                        <div class="hr-cbp-mc-column-inner">
                                            <asp:LinkButton ID="FISubmit" runat="server" CssClass="MainButton" TabIndex="10" OnClick="FISubmit_click" ValidationGroup="fixedincome">Add</asp:LinkButton>
                                            <asp:LinkButton ID="btnFIPaidPlanOutput" runat="server" TabIndex="11" CssClass="POButton" OnClick="btnMFPaidPlanOutPut_Click" Visible="false" >Show Paid Plan Output</asp:LinkButton>
                                        </div>
                                    </div>                       
                                </div>

                                <div class="GV-Area">
                                    <asp:GridView ID="GridViewFixedIncome" runat="server" AutoGenerateColumns="False" OnRowDeleting="GridViewFixedIncome_RowDeleting" GridLines="None" 
                                            OnRowEditing="GridViewFixedIncome_RowEditing" OnRowUpdating="GridViewFixedIncome_RowUpdating" OnRowCancelingEdit="GridViewFixedIncome_RowCancelingEdit" DataKeyNames="Code"  Width="100%">
                                            <Columns>
                                                <asp:BoundField DataField="Code" Visible="false"  />
                                                <asp:BoundField DataField="InvestmentType" HeaderText="Investment Type"  ReadOnly="true" HeaderStyle-HorizontalAlign="Left" />
                                                <asp:BoundField DataField="InvestedAmount" HeaderText="Invested Amount" DataFormatString="{0:##,##,##,##,###}"  HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right"/>                                    
                                                <asp:BoundField DataField="CurrentValue" HeaderText="Current Value" ControlStyle-Width="100px" DataFormatString="{0:##,##,##,##,###}" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" />
                                                <asp:BoundField DataField="IssuingEntity" HeaderText="Issuing Entity" ControlStyle-Width="100px" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" />                                        
                                                <asp:BoundField DataField="ROI" HeaderText="Rate of Interest" ControlStyle-Width="70px" DataFormatString="{0:##,##,##,##,###}" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" />
                                                <asp:BoundField DataField="HolderName" HeaderText="Holder Name" ReadOnly="true" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" />
                                                <asp:BoundField DataField="StartDate" HeaderText="Start Date" ReadOnly="true" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" />
                                                <asp:BoundField DataField="MaturityDate" HeaderText="Maturity Date" ReadOnly="true" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" />
                                                <asp:CommandField EditImageUrl="~/images/edit.png" ItemStyle-HorizontalAlign="Right"  ButtonType="Image"  ShowEditButton="true" UpdateImageUrl="~/images/updates.png" CancelImageUrl="~/images/cancel.png"  >
                                        
                                                </asp:CommandField>
                                                 <asp:TemplateField ItemStyle-HorizontalAlign="Right" >
	                                                <ItemTemplate>		                                    
                                                        <asp:ImageButton ID="delButton" runat="server" CommandName="Delete" ImageUrl="~/images/delete.png"
                                                            OnClientClick="return confirm('Are you sure you want to delete this Fixed Income?');" />
	                                                </ItemTemplate>
                                                </asp:TemplateField>                                                                             
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
                        <asp:UpdatePanel ID="UpdatePanelOtherInvestment" runat="server"  Visible="false">
                            <ContentTemplate>
			                    <div class="hr-cbp-mc-form">
                                    <div class="hr-cbp-mc-column">
                                        <div class="hr-cbp-mc-column-inner">
                                            <label for="oiinvtype">Investment Type <asp:RequiredFieldValidator ID="RequiredFieldValidator17" ValidationGroup="otherincome" runat="server" ErrorMessage="*" Display="Dynamic" ControlToValidate="txtOIInvType" CssClass="mandatory"></asp:RequiredFieldValidator></label>
                                            <asp:TextBox type="text" id="txtOIInvType" name="oiinvtype" CssClass="inputfieldSmall" TabIndex="1" runat="server" ValidationGroup="otherincome" />                                            
                                        </div>
                                        <div class="hr-cbp-mc-column-inner">
                                            <label for="opurchaseprice">Purchase Price <asp:RequiredFieldValidator ID="RequiredFieldValidator14" ValidationGroup="otherincome" runat="server" ErrorMessage="*" Display="Dynamic" ControlToValidate="txtOIPurchasePrice" CssClass="mandatory"></asp:RequiredFieldValidator></label>
                                            <asp:TextBox type="text" id="txtOIPurchasePrice" name="opurchaseprice" CssClass="inputfieldSmall" TabIndex="2" runat="server" ValidationGroup="otherincome" />                                            
                                        </div>
                                        <div class="hr-cbp-mc-column-inner">
                                            <label for="ocurrentvalue">Current Value <asp:RequiredFieldValidator ID="RequiredFieldValidator15" ValidationGroup="otherincome" runat="server" ErrorMessage="*" Display="Dynamic" ControlToValidate="txtOICurrentValue" CssClass="mandatory"></asp:RequiredFieldValidator></label>
                                            <asp:TextBox type="text" id="txtOICurrentValue" name="ocurrentvalue" CssClass="inputfieldSmall" TabIndex="3" runat="server" ValidationGroup="otherincome" />                                            
                                        </div>
                                        <div class="hr-cbp-mc-column-inner">
                                            <label for="oimaturitydate">Purchase Date <asp:RequiredFieldValidator ID="RequiredFieldValidator16" ValidationGroup="otherincome" runat="server" ErrorMessage="*" Display="Dynamic" ControlToValidate="txtOIPurchaseDate" CssClass="mandatory"></asp:RequiredFieldValidator></label>
                                            <asp:TextBox type="text" id="txtOIPurchaseDate" TabIndex="4" runat="server" ValidationGroup="otherincome"  />
                                            <%--<ajxct:CalendarExtender ID="CalendarExtender12" runat="server" TargetControlID="txtOIPurchaseDate"  Format="yyyy-MM-dd" SkinID="2" Animated="true"  />--%>
                                        </div>                                                                                       
                                    </div>                                    
                                    <div class="hr-cbp-mc-column">                                        
                                        <div class="hr-cbp-mc-column-inner">
                                            <asp:LinkButton ID="OtherInvSubmit" runat="server" CssClass="MainButton" TabIndex="5" OnClick="OtherInvSubmit_click" ValidationGroup="otherincome">Add</asp:LinkButton>
                                            <asp:LinkButton ID="btnOPaidPlanOutput" runat="server" TabIndex="6" CssClass="POButton" OnClick="btnMFPaidPlanOutPut_Click" Visible="false" >Show Paid Plan Output</asp:LinkButton>
                                        </div>
                                    </div>                       
                                </div>

                                <div class="GV-Area">
                                    <asp:GridView ID="GridViewOtherInv" runat="server" AutoGenerateColumns="False" OnRowDeleting="GridViewOtherInv_RowDeleting" GridLines="None" 
                                            OnRowEditing="GridViewOtherInv_RowEditing" OnRowUpdating="GridViewOtherInv_RowUpdating" OnRowCancelingEdit="GridViewOtherInv_RowCancelingEdit" DataKeyNames="Code"  Width="100%">
                                            <Columns>
                                                <asp:BoundField DataField="Code" Visible="false"  />
                                                <asp:BoundField DataField="InvestmentType" HeaderText="Investment Type"  HeaderStyle-HorizontalAlign="Left" />
                                                <asp:BoundField DataField="PurchasePrice" HeaderText="Purchase Price" ControlStyle-Width="100px" DataFormatString="{0:##,##,##,##,###}"  HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right"/>                                    
                                                <asp:BoundField DataField="CurrentValue" HeaderText="Current Value" ControlStyle-Width="100px" DataFormatString="{0:##,##,##,##,###}" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" />                                                
                                                <asp:BoundField DataField="StartDate" HeaderText="Purchase Date" ReadOnly="true" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" />
                                                <asp:CommandField EditImageUrl="~/images/edit.png" ItemStyle-HorizontalAlign="Right"  ButtonType="Image"  ShowEditButton="true" UpdateImageUrl="~/images/updates.png" CancelImageUrl="~/images/cancel.png"  >
                                        
                                                </asp:CommandField>
                                                 <asp:TemplateField ItemStyle-HorizontalAlign="Right" >
	                                                <ItemTemplate>		                                    
                                                        <asp:ImageButton ID="delButton" runat="server" CommandName="Delete" ImageUrl="~/images/delete.png"
                                                            OnClientClick="return confirm('Are you sure you want to delete this Other Income?');" />
	                                                </ItemTemplate>
                                                </asp:TemplateField>                                                                             
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
                    </ContentTemplate>   
                </asp:UpdatePanel>
            </div>
                       
    <!-- section for main page content end -->    
    </div>

    <script type="text/javascript">
        var javacriptVariable = "<%=CsVariable%>";
        var gallery = new virtualpaginate({
            piececlass: "virtualpage", //class of container for each piece of content
            piececontainer: 'div', //container element type (ie: "div", "p" etc)
            pieces_per_page: 1, //Pieces of content to show per page (1=1 piece, 2=2 pieces etc)
            defaultpage: javacriptVariable, //Default page selected (0=1st page, 1=2nd page etc). Persistence if enabled overrides this setting.
            wraparound: false,
            persist: false //Remember last viewed page and recall it when user returns within a browser session?
        })

        gallery.buildpagination(["gallerypaginate", "gallerypaginate2"])

</script>

</asp:Content>

