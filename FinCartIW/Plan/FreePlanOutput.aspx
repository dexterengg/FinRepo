<%@ Page Title="My Plan Output" Language="C#" MasterPageFile="DashBoard.master" AutoEventWireup="true" CodeFile="FreePlanOutput.aspx.cs" Inherits="Website_FreePlanOutput" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script src="../ChartNew/amcharts/amchartsNew.js" type="text/javascript"></script> 
    <script src="../ChartNew/amcharts/serial.js" type="text/javascript"></script>  
    <script src="../ChartNew/amcharts/pie.js" type="text/javascript"></script> 

    <link rel="stylesheet" type="text/css" href="../modal/css/component.css" />
	<script src="../modal/js/modernizr.custom.js"></script>
    <%--Loading code start here--%>
    <script type="text/javascript">
        $(window).load(function () {
            $(".loader").fadeOut("slow");
        })
    </script>    
    <div class="loader">Loading your Dashboard</div>
    <%--Loading code end here--%>

    <div class="my-db-area">        
        <div id="planOutputarea" runat="server">        
            <div class="toparea">
                <h1>My Plan Output</h1>
                <%--<div class="export">Print | Excel | PDF</div>--%>
                <p>
                    To ensure that your life goals are achieved, the plan output report has been generated for you based on your <u><asp:Label ID="lblRiskName" runat="server" Text=""></asp:Label></u> (<a href="RiskSelected.aspx" style="text-decoration:underline">Change Risk Profile Now?</a>) risk appetite and projected inflation rate 			
                </p>
            </div> 
            <!-- ************************************* -->
            <!--**** Area for Goal Timeline start *****-->
            <!-- ************************************* -->
            <div class="goalTimeLine">
                <%--<div class="goalt-heading">Goal Timeline</div>--%>
            
                <div class="goalGraph">
                    <asp:Literal ID="ltGoalScripts" runat="server"></asp:Literal>                      
                    <div id="goalchart" style="width: 100%; height: 150px;"></div>                
                </div>
            </div>
            <!-- ************************************* -->
            <!--**** Area for Goal Timeline end *****-->
            <!-- ************************************* -->

            <!-- ************************************* -->
            <!--**** Area for Goal Planning start *****-->
            <!-- ************************************* -->
            <div class="goalPlanning">
                <div class="myGoals">
                    <h2>Goal Planning</h2>
                    <div class="goalGrid">
                    <asp:GridView ID="GridViewGoalPlanning" runat="server" AutoGenerateColumns="false" Width="100%" GridLines="None"  
                        AllowPaging ="true" PageSize="10" OnPageIndexChanging="OnPaging" >
                    <Columns>                    
                        <asp:BoundField DataField="GoalName" HeaderText="Goal" HeaderStyle-HorizontalAlign="Left" ReadOnly="true" ItemStyle-HorizontalAlign="Left"  >
                        <HeaderStyle HorizontalAlign="Left" />
                        <ItemStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="CurrentValue" HeaderText="Current Value" HeaderStyle-HorizontalAlign="right" DataFormatString="{0:##,##,##,##,###}" ItemStyle-HorizontalAlign="right"  >
                        <HeaderStyle HorizontalAlign="right" />
                        <ItemStyle HorizontalAlign="right" />
                        </asp:BoundField>  
                        <asp:BoundField DataField="AmountReq" HeaderText="Amount Required" HeaderStyle-HorizontalAlign="right" ReadOnly="true" DataFormatString="{0:##,##,##,##,###}" ItemStyle-HorizontalAlign="right"  >
                        <HeaderStyle HorizontalAlign="right" />
                        <ItemStyle HorizontalAlign="right" />
                        </asp:BoundField>                          
                        <asp:BoundField DataField="GoalYear" HeaderText="Goal Year" HeaderStyle-HorizontalAlign="right" ReadOnly="true" ItemStyle-HorizontalAlign="right" >
                        <HeaderStyle HorizontalAlign="right" />
                        <ItemStyle HorizontalAlign="right" />                            
                        </asp:BoundField>                                                                  
                        <asp:BoundField DataField="SIPAmt" HeaderText="SIP Amount" HeaderStyle-HorizontalAlign="right" DataFormatString="{0:##,##,##,##,###}" ReadOnly="true" ItemStyle-HorizontalAlign="right" >
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
                    <div class="clear"></div>
                    <div class="knowFund">
                        <div class="knowFundLink"><i class="fa fa-list-ul"></i>&nbsp; <a href="KnowFund.aspx"  style="text-decoration:underline">Show funds</a></div>                    
                    </div>                
                
                </div>

                <div class="assetAllocation">
                        <asp:Literal ID="ltScripts" runat="server"></asp:Literal>                      
                        <div id="AssetChart" style="width: 100%; height: 350px;"></div>  
                </div>
            </div>
            <!-- ************************************* -->
            <!--**** Area for Goal Planning end *****-->
            <!-- ************************************* -->

            <!-- ************************************* -->
            <!--**** Area for Retirement Planning start *****-->
            <!-- ************************************* -->
            <div class="retirementPlanning" id="retirementSection" runat="server">
                <div id="retirmentDetail">
                <h2>My Retirement</h2>            
                <div class="resultBody">                                    
                    <div class="TableHeader">  
                        <div class="colRightLine">Annual Expense if you retire today</div>              
                        <div class="colRightLine">Age to Retirement</div>
                        <div class="colRightLine">Life Expectancy</div>
                        <div class="colRightLine">Corpus Required</div>
                        <div class="colRightLine">Annual Investments</div> 
                        <div class="colRightLine">Monthly Investments</div>                     
                    </div>
                    <div class="TableRow">    
                        <div class="col"><asp:Label ID="lblAnnualExpense" runat="server" Text='' ></asp:Label></div>            
                        <div class="col"><asp:Label ID="lblRetirementAge" runat="server" Text='' ></asp:Label></div>
                        <div class="col"><asp:Label ID="lblLifeExpectency" runat="server" Text='' ></asp:Label></div>
                        <div class="col"><asp:Label ID="lblCorpus" runat="server" Text=''></asp:Label></div>
                        <div class="col"><asp:Label ID="lblAnnualInvestments" runat="server" Text='' ></asp:Label></div>
                        <div class="col"><asp:Label ID="lblMonthlyInvestments" runat="server" Text=''></asp:Label></div>                    
                    </div>                                                                                                               
                </div>            
                <div class="knowFund">
                    <div class="knowFundLink"><i class="fa fa-list-ul"></i>&nbsp; <a href="KnowFund.aspx"  style="text-decoration:underline">Show funds</a></div>                                    
                </div>                                
                </div>
                <div id="retirementChart">
                    <asp:Literal ID="ltRetirementChart" runat="server"></asp:Literal>                      
                    <div id="retirementChartDiv" style="width: 100%; height: 320px;"></div>
                </div>
            </div>
            <!-- ************************************* -->
            <!--**** Area for Retirement Planning end *****-->
            <!-- ************************************* -->

            <!-- ************************************* -->
            <!--**** Area for insurance Planning start *****-->
            <!-- ************************************* -->
            <div class="insurancePlanning" id="InsuranceSection" runat="server" visible="true">
                <div id="insuranceDetail">
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
                <%--<div class="note"><i class="fa fa-info-circle"></i>&nbsp; HLV* - Human Life Value</div>--%> 
                    <div class="clear"></div>
                    <div class="knowFund">
                        <div class="knowFundLink"><i class="fa fa-list-ul"></i>&nbsp; <a href="KnowFund.aspx">Show Insurance</a></div>                    
                    </div>
                </div>
                <div id="insuranceChart">
                        <asp:Literal ID="ltInsuchartScripts" runat="server"></asp:Literal>                      
                        <div id="insuranceChartDiv" style="width: 100%; height: 300px;"></div>
                </div>
            </div>
            <%--<div class="insurancePlanningFree" id="InsuranceSectionFree" runat="server" visible="false">
                <div id="Div2">
                <h2>Insurance Planning</h2>
                <p>Ideal rule of thumb life insurance cover is approximately 10 X yearly gross income. A Paid fully-assisted financial plan will generate a comprehensive assessment of how much life insurance one actually needs, and that takes into account your Expenses, Liabilities & Assets.</p>        
                
                    <div class="clear"></div>
                    <div class="knowFund">
                        <div class="knowFundLink"><i class="fa fa-list-ul"></i>&nbsp; <a href="KnowFund.aspx">Show Insurance</a></div>                    
                    </div>
                </div>
                
            </div>--%>
            <div class="assumption">
                Note: For this Free Plan Output, please take note of the following assumptions used in the calculations-
                <ul>
                    <li>a. General inflation rate ~ 7%</li>
                    <li>b. Education inflation rate ~ 7% </li>
                    <li>c. Suggested SIP amounts in goal planning rounded off to nearest 1000</li>
                    <li>d. Suggested SIP amount in retirement rounded off to nearest 1000</li>
                    <li>e. Suggested ideal life insurance is ~ 10 times (Your Gross Yearly Income)</li>
                </ul>
            </div>
            <!-- ************************************* -->
            <!--**** Area for insurance Planning end *****-->
            <!-- ************************************* -->
        </div>
    </div>
    <script src="../modal/js/classie.js"></script>
		<script src="../modal/js/modalEffects.js"></script>		
		<script>
		    // this is important for IEs
		    var polyfilter_scriptpath = '../modal/js/';
		</script>
		<script src="../modal/js/cssParser.js"></script>
		<script src="../modal/js/css-filters-polyfill.js"></script>
</asp:Content>

