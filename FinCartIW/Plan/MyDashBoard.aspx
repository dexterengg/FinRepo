<%@ Page Title="My DashBoard" Language="C#" MasterPageFile="DashBoard.master" AutoEventWireup="true" 
    CodeFile="MyDashBoard.aspx.cs" EnableEventValidation="false" Inherits="MyDashBoard" Culture="hi-IN" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script src="../ChartNew/amcharts/amchartsNew.js" type="text/javascript"></script> 
    <script src="../ChartNew/amcharts/serial.js" type="text/javascript"></script>  
    <script src="../ChartNew/amcharts/pie.js" type="text/javascript"></script> 
    <script src="../ChartNew/amcharts/amstockNew.js" type="text/javascript"></script>       
      
    
    <%--Loading code start here--%>
    <script type="text/javascript">
        $(window).load(function () {
            $(".loader2").fadeOut("slow");
        })
    </script>    
    <div class="loader2">Loading your Dashboard</div>  
    <%--Loading code end here--%> 
     
    <div class="my-db-area">
        <div class="toparea">
            <h1>My Dashboard</h1>
            <%--<div class="export">Welcome <b>
                <asp:Label ID="lblClientName" runat="server" Text=""></asp:Label></b>
            </div>--%>
            <p>After every investment, fill the actual investment field amount so that you can track your goal progress daily. This amount may or may not be same as our suggested SIP amount.
                
            </p>
        </div>  
        <div id="DivExistingInvestor" runat="server" >        
            <div class="DBPartLeft">
            <!-- ************************************* -->
            <!--**** Area for Goal Planning start *****-->
            <!-- ************************************* -->
            <div class="goalPlanningDB">
                <%--<asp:UpdatePanel ID="UpdatePanelGoal" runat="server" EnableViewState="true">
                        <ContentTemplate>--%>
                            
                <div class="myGoalsDB">
                    <h2>Goal Planning</h2>
                    <div class="goalGrid">
                        <asp:GridView ID="GridViewGoalPlanning" runat="server" RowStyle-Wrap="false" HeaderStyle-Wrap="false"  AutoGenerateColumns="False" 
                             DataKeyNames="Code" Width="100%" GridLines="none"
                            OnRowEditing="GridViewGoalPlanning_RowEditing" OnRowUpdating="GridViewGoalPlanning_RowUpdating" OnRowCancelingEdit="GridViewGoalPlanning_RowCancelingEdit"
                            AllowPaging ="true" PageSize="10"  OnPageIndexChanging="OnPaging" >                                     
                            <Columns>                                                                
                                <asp:TemplateField Visible="false">
                                    <ItemTemplate>
                                        <asp:Label id="goalcode" runat ="server" text='<%# Eval("Code")%>' />
                                    </ItemTemplate>
                                </asp:TemplateField> 
                                <asp:BoundField DataField="GoalName" HeaderText="Goal" HeaderStyle-HorizontalAlign="Left" ReadOnly="true" ItemStyle-HorizontalAlign="Left"  >
                                <HeaderStyle HorizontalAlign="Left" />
                                <ItemStyle HorizontalAlign="Left" />
                                </asp:BoundField>
                                <asp:BoundField DataField="CurrentValue" HeaderText="Current Value" ReadOnly="true" HeaderStyle-HorizontalAlign="right" DataFormatString="{0:##,##,##,##,###}" ItemStyle-HorizontalAlign="right"  >
                                <HeaderStyle HorizontalAlign="right" />
                                <ItemStyle HorizontalAlign="right" />
                                </asp:BoundField> 
                                <asp:BoundField DataField="AmountReq" HeaderText="Amount Required" HeaderStyle-HorizontalAlign="right" ReadOnly="true" DataFormatString="{0:##,##,##,##,###}" ItemStyle-HorizontalAlign="right"  >
                                <HeaderStyle HorizontalAlign="right" />
                                <ItemStyle HorizontalAlign="right" />
                                </asp:BoundField>                          
                                                                                 
                                <asp:BoundField DataField="ShName" HeaderText="Scheme Name" HeaderStyle-HorizontalAlign="right" ReadOnly="true" DataFormatString="{0:##,##,##,##,###}" ItemStyle-HorizontalAlign="right"  >
                                <HeaderStyle HorizontalAlign="right" />
                                <ItemStyle HorizontalAlign="right" />
                                </asp:BoundField>                                 
                                <asp:TemplateField HeaderText="" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>                                            
                                        <a href="#" id="link2"  class="md-trigger" data-modal="Modal-LMSEdit<%# Eval("Code") %>"><asp:Image ID="Image1" ImageUrl="images/chart.png" runat="server" /></a>
                                        <div class="md-modalBig md-effect-1" id='Modal-LMSEdit<%# Eval("Code") %>'>
			                                <div class="md-content">
				                                <h3>Scheme Performance Chart<span><a href="#" class="md-close" style="text-decoration:none;">X</a></span></h3>
                                                <div>
                                                    <iframe src="SchemeChart.aspx?goalcode=<%# Eval("Code") %>&sipamt=<%# Eval("SIPAmt") %>&exlcode=<%# Eval("SExlcode")%>&actinv=<%# Eval("ActualInvestment")%>" width="100%" height="420px" scrolling="no" frameborder="0"></iframe>
                                                </div>				                        
			                                </div>
		                                </div>
                                        <div class="md-overlay"></div><!-- the overlay element --> 

                                    </ItemTemplate>
                                </asp:TemplateField>    
                                <asp:BoundField DataField="GoalYear" HeaderText="Goal Year" HeaderStyle-HorizontalAlign="right" ReadOnly="true" ItemStyle-HorizontalAlign="right" >
                                <HeaderStyle HorizontalAlign="right" />
                                <ItemStyle HorizontalAlign="right" />                            
                                </asp:BoundField>                                                      
                                <asp:BoundField DataField="SIPAmt" HeaderText="SIP Amount" HeaderStyle-HorizontalAlign="right" DataFormatString="{0:##,##,##,##,###}" ReadOnly="true" ItemStyle-HorizontalAlign="right" >
                                <HeaderStyle HorizontalAlign="right" />
                                <ItemStyle HorizontalAlign="right" />                            
                                </asp:BoundField>                                 
                                <asp:BoundField DataField="ActualInvestment" HeaderText="Actual Investment" ControlStyle-Width="60px" HeaderStyle-HorizontalAlign="right" DataFormatString="{0:##,##,##,##,###}"  ItemStyle-HorizontalAlign="right" >
                                <HeaderStyle HorizontalAlign="right" />
                                <ItemStyle HorizontalAlign="right" />                            
                                </asp:BoundField> 
                                <asp:TemplateField Visible="false">
                                    <ItemTemplate>
                                        <asp:Label id="sexlcode" runat ="server" text='<%# Eval("SExlcode")%>' />
                                    </ItemTemplate>
                                </asp:TemplateField>                                                            
                                <asp:CommandField EditImageUrl="images/edit.png" ItemStyle-HorizontalAlign="Right"  ButtonType="Image"  ShowEditButton="true" UpdateImageUrl="images/updates.png" CancelImageUrl="images/cancel.png" >                                        
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
                    <div class="clear"></div>                                
                
                </div>
                
                    <%--</ContentTemplate>   
                </asp:UpdatePanel>--%>
                
                <div class="retirementPlanningDB" id="retirementSection" runat="server">            
                <h2>Retirement</h2>            
                <div class="resultBody">                                    
                    <div class="TableHeader">  
                        <div class="colRightLine">Annual Expense if you retire today</div>              
                        <div class="colRightLine">Retirement Age</div>
                        <div class="colRightLine">Life Expectancy</div>
                        <div class="colRightLine">Expenses Post Retirement</div>
                        <div class="colRightLine">Corpus Required</div>
                        <div class="colRightLine">Annual Investments</div> 
                        <div class="colRightLine">Monthly Investments</div>                     
                    </div>
                    <div class="TableRow">    
                        <div class="col"><asp:Label ID="lblAnnualExpense" runat="server" Text='' ></asp:Label></div>            
                        <div class="col"><asp:Label ID="lblRetirementAge" runat="server" Text='' ></asp:Label></div>
                        <div class="col"><asp:Label ID="lblLifeExpectency" runat="server" Text='' ></asp:Label></div>
                        <div class="col"><asp:Label ID="lblExpPostRet" runat="server" Text=''></asp:Label></div>
                        <div class="col"><asp:Label ID="lblCorpusRequired" runat="server" Text=''></asp:Label></div>
                        <div class="col"><asp:Label ID="lblAnnualInvestments" runat="server" Text='' ></asp:Label></div>
                        <div class="col"><asp:Label ID="lblMonthlyInvestments" runat="server" Text=''></asp:Label></div>                    
                    </div>                                                                                                               
                </div>                                                                               
            </div>
                <div class="assetAllocationDB">
                    <div class="suggestedAllocation">
                        <h2>Suggested Allocation</h2>
                        <asp:Literal ID="ltScriptsSuggested" runat="server"></asp:Literal>                      
                        <div id="AssetChart" style="width: 100%; height: 360px;"></div>
                    </div>
                    <div class="ActualAllocation">
                        <h2>Actual Allocation</h2>
                        <asp:Literal ID="ltScriptsActual" runat="server"></asp:Literal>                      
                        <div id="actualAllocationChart" style="width: 100%; height: 360px;"></div>
                    </div>
                      
                </div>
            </div>
            <!-- ************************************* -->
            <!--**** Area for Goal Planning end *****-->
            <!-- ************************************* -->
             
            <!-- ************************************* -->
            <!--**** Area for Investment Summary start *****-->
            <!-- ************************************* -->
                <div class="InvestmentSummary">
                <h2>Investment Summary through Fincart</h2>
                    <div class="goalGrid">
                <asp:GridView ID="GridViewInvestmentSummary" runat="server" RowStyle-Wrap="false" HeaderStyle-Wrap="false"  AutoGenerateColumns="False" 
                DataKeyNames="CID" Width="100%" GridLines="None"                 
                AllowPaging ="true" PageSize="10" >                                     
                <Columns>                                                                                    
                    <asp:BoundField DataField="Name" HeaderText="Applicant Name" HeaderStyle-HorizontalAlign="Left" ReadOnly="true" ItemStyle-HorizontalAlign="Left"  >
                    <HeaderStyle HorizontalAlign="Left" />
                    <ItemStyle HorizontalAlign="Left" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Sname" HeaderText="Scheme Name" ReadOnly="true" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left"  >
                    <HeaderStyle HorizontalAlign="Left" />
                    <ItemStyle HorizontalAlign="Left" />
                    </asp:BoundField>                           
                    <asp:BoundField DataField="FolioNo" HeaderText="Folio No." HeaderStyle-HorizontalAlign="right" ReadOnly="true" ItemStyle-HorizontalAlign="right" >
                    <HeaderStyle HorizontalAlign="right" />
                    <ItemStyle HorizontalAlign="right" />                            
                    </asp:BoundField>                
                    <asp:BoundField DataField="AUM" HeaderText="Amount" HeaderStyle-HorizontalAlign="right" ReadOnly="true" DataFormatString="{0:##,##,##,##,###}" ItemStyle-HorizontalAlign="right"  >
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
            <!-- ************************************* -->
            <!--**** Area for Investment Summary end *****-->
            <!-- ************************************* -->                
             
            <!-- ************************************* -->
            <!--**** Area for insurance Planning start *****-->
            <!-- ************************************* -->
            <div class="insurancePlanning" id="InsuranceSection" runat="server"  visible="true">            
                <h2>Insurance Planning</h2>
                <div class="resultBody">                                    
                    <div class="TableHeader">  
                        <div class="col colLeft">Insurance</div>              
                        <div class="col">Ideal Insurance</div>
                        <div class="col">Existing Insurance</div>
                        <div class="col">Additional Insurance Required</div>                    
                    </div>
                    <div class="TableRow">    
                        <div class="col colLeft"><asp:Label ID="Label1" runat="server" Text='Life Insurance (HLV*)' ></asp:Label></div>            
                        <div class="col"><asp:Label ID="IdealInsurance" runat="server" Text='' ></asp:Label></div>
                        <div class="col"><asp:Label ID="ExistingInsurance" runat="server" Text='' ></asp:Label></div>
                        <div class="col"><asp:Label ID="AddInsurance" runat="server"  Text=''></asp:Label></div>                   
                    </div>                                                                                                                                
                </div>                                              
            </div>
            <!-- ************************************* -->
            <!--**** Area for insurance Planning end *****-->
            <!-- ************************************* -->       
            </div>
            <div class="DBPartRight">
                <div class="DBPartRightClientStatus">
                    Risk Type : <asp:Label ID="lblRiskName" runat="server" Text=""></asp:Label> <br />
                    Account status : <asp:Label ID="lblAccoutStatus" runat="server" Text=""></asp:Label>
                </div>
                <div class="DBPartRightContentUpgrade">
                    <h3>Upgrade</h3>
                </div>                
                <div class="DBPartRightContentIRD">
                    <h2>Important Dates</h2>
                    <h3>Insurance Renewal Dates</h3>

                </div>
                <div class="DBPartRightContentSIPD">
                    <h3>SIP Dates</h3>
                </div>
                <div class="DBPartRightContentNotification">
                    <h3>Notification</h3>
                    
                </div>
            </div>
        </div>
        <div id="DivNewInvestor" class="DBNewInvestor" runat="server">
            <p>As you continue to register your life goals and aspirations in the site and invest properly as per our informed suggestions, 
                or, you decide to invest as per your discretionary judgement, this my dashboard page will start to display all relevant numbers 
                and charts and act as your daily, friendly portfolio tracker page for all your investments made through our online secure platform...
            <br />
            We will help you to systematically achieve your life goals...

</p>
            <div class="startFP"><a href="accounttype.aspx"><i class="fa fa-calendar"></i> <br />Start the process and see what we can do for you</a></div>
        </div>
    </div>    
</asp:Content>

