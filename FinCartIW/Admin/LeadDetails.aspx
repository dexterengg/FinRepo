<%@ Page Title="Lead Details" Language="C#" MasterPageFile="~/Admin/AdminDashBoard.master" AutoEventWireup="true" CodeFile="LeadDetails.aspx.cs" Inherits="Admin_LeadDetails" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajxct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AdminContentPlaceHolder" Runat="Server">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">  
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

    <script src="../ChartNew/amcharts/amchartsNew.js" type="text/javascript"></script> 
    <script src="../ChartNew/amcharts/serial.js" type="text/javascript"></script>  
    <script src="../ChartNew/amcharts/pie.js" type="text/javascript"></script>

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>  
    <h2>Lead Details [<asp:Label ID="lblLeadName" runat="server" Text=""></asp:Label>]</h2>
    <p>Details regarding the complete profile of Lead.</p>

    <%--Code for normal lead details--%>
    <div class="panel-group" id="accordion" runat="server">
    <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">
          <a data-toggle="collapse" data-parent="#accordion" href="#collapse1">Personal Details</a>
        </h4>
      </div>
      <div id="collapse1" class="panel-collapse collapse in">
        <div class="panel-body">
            <div class="row">
                  <div class="col-md-3">
                    <label>Name</label>
                  </div>
                  <div class="col-md-3"> 
                    <p><asp:Label ID="lblName" runat="server" Text="Label"></asp:Label></p>
                  </div>
                  <div class="col-md-3"> 
                    <label>Gender</label>
                  </div>
                  <div class="col-md-3"> 
                    <p><asp:Label ID="lblGender" runat="server" Text="Label"></asp:Label></p>
                  </div>
            </div>
            <div class="row">
                  <div class="col-md-3">
                    <label>Email</label>
                  </div>
                  <div class="col-md-3"> 
                    <p><asp:Label ID="lblEmail" runat="server" Text="Label"></asp:Label></p>
                  </div>
                  <div class="col-md-3"> 
                    <label>Date of Birth</label>
                  </div>
                  <div class="col-md-3"> 
                    <p><asp:Label ID="lblDOB" runat="server" Text="Label"></asp:Label></p>
                  </div>
            </div>
            <div class="row">
                  <div class="col-md-3">
                    <label>Marital Status</label>
                  </div>
                  <div class="col-md-3"> 
                    <p><asp:Label ID="lblMarritalStatus" runat="server" Text="Label"></asp:Label></p>
                  </div>
                  <div class="col-md-3"> 
                    <label>Mobile</label>
                  </div>
                  <div class="col-md-3"> 
                    <p><asp:Label ID="lblMobile" runat="server" Text="Label"></asp:Label></p>
                  </div>
            </div>
            <div class="row">
                  <div class="col-md-3">
                    <label>Yearly Gross Income</label>
                  </div>
                  <div class="col-md-3"> 
                    <p><asp:Label ID="lblGrossIncome" runat="server" Text="Label"></asp:Label></p>
                  </div>                  
            </div>            
        </div>
      </div>
    </div>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">
          <a data-toggle="collapse" data-parent="#accordion" href="#collapse2">Family Details</a>
        </h4>
      </div>
      <div id="collapse2" class="panel-collapse collapse">
        <div class="panel-body">
            <div class="GV-Area">
                <asp:GridView ID="GVFamilyDetails" runat="server" RowStyle-Wrap="false" HeaderStyle-Wrap="false" RowStyle-Height="23px"  
                    AutoGenerateColumns="False" Width="100%" GridLines="None">
                    <Columns>                        
                        <asp:BoundField DataField="Name" HeaderText="Name" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left"  ></asp:BoundField>
                        <asp:BoundField DataField="Gender" HeaderText="Gender" HeaderStyle-HorizontalAlign="Left" ReadOnly="true" ItemStyle-HorizontalAlign="Left"  ></asp:BoundField>
                        <asp:BoundField DataField="Relation" HeaderText="Relation" HeaderStyle-HorizontalAlign="Left" ReadOnly="true" ItemStyle-HorizontalAlign="Left" ></asp:BoundField>
                        <asp:BoundField DataField="Age" HeaderText="Age" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" ></asp:BoundField>                                        
                        <asp:BoundField DataField="FinancialDependent" HeaderText="Financial Dependent" HeaderStyle-HorizontalAlign="Left" ReadOnly="true" ItemStyle-HorizontalAlign="Left" >                        
                        </asp:BoundField>
                        <asp:BoundField DataField="HealthHistory" HeaderText="Health History" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" >                                                                                                     
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
    <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">
          <a data-toggle="collapse" data-parent="#accordion" href="#collapse3">Life Insurance</a>
        </h4>
      </div>
      <div id="collapse3" class="panel-collapse collapse">
        <div class="panel-body">
            <div class="GV-Area">
                <asp:GridView ID="GridViewLI" runat="server" AutoGenerateColumns="False" GridLines="None" Width="100%">
                        <Columns>                                                        
                            <asp:BoundField DataField="Applicant" HeaderText="Applicant Name"  ReadOnly="true" HeaderStyle-HorizontalAlign="Left" />
                            <asp:BoundField DataField="PolicyName" HeaderText="Policy Name"  ReadOnly="true" HeaderStyle-HorizontalAlign="Left" />
                            <asp:BoundField DataField="InsuranceType" HeaderText="Insurance Type" ReadOnly="true" HeaderStyle-HorizontalAlign="Left"/>
                            <asp:BoundField DataField="PremiumPaymentTerm" HeaderText="Payment Term" ControlStyle-Width="80" HeaderStyle-HorizontalAlign="Left" />                                        
                            <asp:BoundField DataField="PremiumMode" HeaderText="Premium Mode" ReadOnly="true"  HeaderStyle-HorizontalAlign="left" />
                            <asp:BoundField DataField="CurrentValue" HeaderText="Current Value" ControlStyle-Width="80" DataFormatString="{0:##,##,##,##,###}" HeaderStyle-HorizontalAlign="left" />
                            <asp:BoundField DataField="Premium" HeaderText="Premium" ControlStyle-Width="80" DataFormatString="{0:##,##,##,##,###}" HeaderStyle-HorizontalAlign="left" />
                            <asp:BoundField DataField="SumAssured" HeaderText="Sum Assured" ControlStyle-Width="80" DataFormatString="{0:##,##,##,##,###}" HeaderStyle-HorizontalAlign="left" />
                            <asp:BoundField DataField="Nominee" HeaderText="Nominee" ReadOnly="true" HeaderStyle-HorizontalAlign="left" />
                            <asp:BoundField DataField="StartDate" HeaderText="Start Date" ReadOnly="true" HeaderStyle-HorizontalAlign="left" />
                            <asp:BoundField DataField="MaturityDate" HeaderText="Maturity Date" ReadOnly="true" HeaderStyle-HorizontalAlign="left" />                                                                                                      
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
    <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">
          <a data-toggle="collapse" data-parent="#accordion" href="#collapse4">Non-Life Insurance</a>
        </h4>
      </div>
      <div id="collapse4" class="panel-collapse collapse">
        <div class="panel-body">
            <div class="GV-Area">
                <asp:GridView ID="GridViewGI" runat="server" AutoGenerateColumns="False" GridLines="None" Width="100%">
                        <Columns>                                                        
                            <asp:BoundField DataField="PolicyHolderName" HeaderText="Policy Holder Name" ReadOnly="true" HeaderStyle-HorizontalAlign="Left"/>
                            <asp:BoundField DataField="InsuredObject" HeaderText="Insured Object"  ReadOnly="true" HeaderStyle-HorizontalAlign="Left" />
                            <asp:BoundField DataField="PolicyName" HeaderText="Policy Name" ControlStyle-Width="100" HeaderStyle-HorizontalAlign="Left" />                                        
                            <asp:BoundField DataField="Premium" HeaderText="Premium" ControlStyle-Width="80" HeaderStyle-HorizontalAlign="left" />
                            <asp:BoundField DataField="PremiumMode" HeaderText="Premium Mode" ReadOnly="true" HeaderStyle-HorizontalAlign="left" />                                    
                            <asp:BoundField DataField="SumAssured" HeaderText="Sum Assured" ControlStyle-Width="80" DataFormatString="{0:##,##,##,##,###}" HeaderStyle-HorizontalAlign="left" />                                    
                            <asp:BoundField DataField="StartDate" HeaderText="Start Date" ReadOnly="true" HeaderStyle-HorizontalAlign="left" />                                                                                                     
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
    <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">
          <a data-toggle="collapse" data-parent="#accordion" href="#collapse5">Goal Requirement</a>
        </h4>
      </div>
      <div id="collapse5" class="panel-collapse collapse">
        <div class="panel-body">
            <div class="GV-Area">
                <h4>My Goals</h4>
                <asp:GridView ID="GridViewGoal" runat="server" AutoGenerateColumns="False" GridLines="None" Width="100%">
                        <Columns>                            
                            <asp:BoundField DataField="GoalCategory" HeaderText="Goal Category"  ReadOnly="true" HeaderStyle-HorizontalAlign="Left" />                                        
                            <asp:BoundField DataField="GoalName" HeaderText="Goal Name" ReadOnly="false"  HeaderStyle-HorizontalAlign="Left" />                                        
                            <asp:BoundField DataField="GoalDate" HeaderText="GoalMonth" ReadOnly="true" HeaderStyle-HorizontalAlign="left" />                                        
                            <asp:BoundField DataField="Amount" HeaderText="Amount" ReadOnly="false" DataFormatString="{0:##,##,##,##,###}" HeaderStyle-HorizontalAlign="left" >                                
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

            <%-- For Retirement --%>

            <div class="GV-Area">
                <h4>Retirement</h4>
                <asp:GridView ID="GridViewRetirementGoal" runat="server" AutoGenerateColumns="False" GridLines="None" Width="100%">
                        <Columns>                            
                            <asp:BoundField DataField="GoalCategory" HeaderText="Goal Category"  ReadOnly="true" HeaderStyle-HorizontalAlign="Left" />                                        
                            <asp:BoundField DataField="GoalName" HeaderText="Goal Name" ReadOnly="false"  HeaderStyle-HorizontalAlign="Left" />                                        
                            <asp:BoundField DataField="GoalDate" HeaderText="GoalMonth" ReadOnly="true" HeaderStyle-HorizontalAlign="left" />
                            <asp:BoundField DataField="CurrentExpenditure" HeaderText="Current Exp" ReadOnly="true" HeaderStyle-HorizontalAlign="left" ItemStyle-HorizontalAlign="left"  DataFormatString="{0:##,##,##,##,###}" />
                            <asp:BoundField DataField="LifeExpectancy" HeaderText="Life Expectancy" ReadOnly="true" HeaderStyle-HorizontalAlign="left" ItemStyle-HorizontalAlign="left" />                                                                                                                                               
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
    <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">
          <a data-toggle="collapse" data-parent="#accordion" href="#collapse6">Assets & Liabilities</a>
        </h4>
      </div>
      <div id="collapse6" class="panel-collapse collapse">
        <div class="panel-body">
            <div class="GV-Area">
                <h4>Assets</h4>
                <asp:GridView ID="GridViewAsset" runat="server" AutoGenerateColumns="False" GridLines="None" Width="100%">
                        <Columns>                            
                            <asp:BoundField DataField="AssetType" HeaderText="Asset Type"  ReadOnly="true" HeaderStyle-HorizontalAlign="Left" />
                            <asp:BoundField DataField="AssetOwner" HeaderText="Asset Owner"  ReadOnly="true" HeaderStyle-HorizontalAlign="Left"/>                                    
                            <asp:BoundField DataField="CurrentValue" HeaderText="Current Value" DataFormatString="{0:##,##,##,##,###}" HeaderStyle-HorizontalAlign="left" />
                            <asp:BoundField DataField="PurchasePrice" HeaderText="Purchase Price" ControlStyle-Width="100px" DataFormatString="{0:##,##,##,##,###}" HeaderStyle-HorizontalAlign="left" ItemStyle-HorizontalAlign="left" />                                        
                            <asp:BoundField DataField="AccqDate" HeaderText="Accq. Date" HeaderStyle-HorizontalAlign="Left" />                                                                                                               
                        </Columns>   
                        <AlternatingRowStyle CssClass="GV-AlternatingRowStyle" />
                        <EditRowStyle CssClass="GV-EditRow" />                                                                       
                        <HeaderStyle CssClass="GV-HeaderStyle" />
                        <PagerStyle CssClass="GV-PagerStyle" />
                        <RowStyle CssClass="GV-RowStyle" />
                        <SelectedRowStyle CssClass="GV-SelectedRowStyle" />                             
                    </asp:GridView>
            </div>
            <div class="GV-Area">
                <h4>Liabilities</h4>
                <asp:GridView ID="GridViewLoan" runat="server" AutoGenerateColumns="False" GridLines="None" Width="100%">
                        <Columns>                            
                            <asp:BoundField DataField="LoanTakenFor" HeaderText="Loan Taken"  ReadOnly="true" HeaderStyle-HorizontalAlign="Left" />
                            <asp:BoundField DataField="OriginalAmount" HeaderText="Original Amount" DataFormatString="{0:##,##,##,##,###}" ReadOnly="true" HeaderStyle-HorizontalAlign="Left"/>
                            <asp:BoundField DataField="RateofInterest" HeaderText="Interest Rate" ReadOnly="true" HeaderStyle-HorizontalAlign="Left" />                                        
                            <asp:BoundField DataField="LoanType" HeaderText="Loan Type"  HeaderStyle-HorizontalAlign="left" />
                            <asp:BoundField DataField="EMI" HeaderText="EMI" ControlStyle-Width="100px" DataFormatString="{0:##,##,##,##,###}" HeaderStyle-HorizontalAlign="left" ItemStyle-HorizontalAlign="left" />                                        
                            <asp:BoundField DataField="LoanTenure" HeaderText="Tenure" HeaderStyle-HorizontalAlign="Left" />
                            <asp:BoundField DataField="OutStandingBalance" HeaderText="Outstanding" HeaderStyle-HorizontalAlign="Left" />
                            <asp:BoundField DataField="StartDate" HeaderText="Start Date" HeaderStyle-HorizontalAlign="Left" />                                                                                                                                          
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
    <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">
          <a data-toggle="collapse" data-parent="#accordion" href="#collapse7">Income & Expenses</a>
        </h4>
      </div>
      <div id="collapse7" class="panel-collapse collapse">
        <div class="panel-body">
            <div class="GV-Area">
            <h4>Income</h4>
                <asp:GridView ID="GridViewIncome" runat="server" AutoGenerateColumns="False"  GridLines="None" Width="100%">
                    <Columns>                        
                        <asp:BoundField DataField="IncomeType" HeaderText="Income Type"  ReadOnly="true" HeaderStyle-HorizontalAlign="Left" />
                        <asp:BoundField DataField="IncomeAmount" HeaderText="Income Amount" HeaderStyle-HorizontalAlign="Left"/>
                        <asp:BoundField DataField="IncomePeriod" HeaderText="Income Period" HeaderStyle-HorizontalAlign="Left" />                                                                                                                                           
                    </Columns>     
                    <AlternatingRowStyle CssClass="GV-AlternatingRowStyle" />
                        <EditRowStyle CssClass="GV-EditRow" />                                                                       
                        <HeaderStyle CssClass="GV-HeaderStyle" />
                        <PagerStyle CssClass="GV-PagerStyle" />
                        <RowStyle CssClass="GV-RowStyle" />
                        <SelectedRowStyle CssClass="GV-SelectedRowStyle" />                   
                </asp:GridView>
            </div>
            <div class="GV-Area">
                <h4>Expenses</h4>
                    <asp:GridView ID="GridViewExpense" runat="server" AutoGenerateColumns="False" GridLines="None" Width="100%">
                        <Columns>                            
                            <asp:BoundField DataField="ExpenseType" HeaderText="Expense Type"  ReadOnly="true" HeaderStyle-HorizontalAlign="Left" />
                            <asp:BoundField DataField="ExpenseAmount" HeaderText="Expense Amount" DataFormatString="{0:##,##,##,##,###}" HeaderStyle-HorizontalAlign="Left"/>
                            <asp:BoundField DataField="ExpensePeriod" HeaderText="Expense Period"  HeaderStyle-HorizontalAlign="Left" />                                                                                                                                           
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
    <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">
          <a data-toggle="collapse" data-parent="#accordion" href="#collapse8">Investments</a>
        </h4>
      </div>
      <div id="collapse8" class="panel-collapse collapse">
        <div class="panel-body">
            <div class="GV-Area">
                <h4>Mutual Fund</h4>
                <asp:GridView ID="GridViewMFInvestments" runat="server" AutoGenerateColumns="False" GridLines="None" Width="100%">
                        <Columns>                            
                            <asp:BoundField DataField="SchemeName" HeaderText="Scheme Name"  ReadOnly="true" HeaderStyle-HorizontalAlign="Left" />
                            <asp:BoundField DataField="InvestmentType" HeaderText="Investment Type"  ReadOnly="true" HeaderStyle-HorizontalAlign="Left"/>                                    
                            <asp:BoundField DataField="InvestedAmount" HeaderText="Invested Amount" ControlStyle-Width="100px" DataFormatString="{0:##,##,##,##,###}"  HeaderStyle-HorizontalAlign="left" ItemStyle-HorizontalAlign="left" />
                            <asp:BoundField DataField="CurrentValue" HeaderText="Current Value" ControlStyle-Width="100px" DataFormatString="{0:##,##,##,##,###}"  HeaderStyle-HorizontalAlign="left" ItemStyle-HorizontalAlign="left" />                                        
                            <asp:BoundField DataField="SchemeOption" HeaderText="Scheme Option" ReadOnly="true"  HeaderStyle-HorizontalAlign="left" ItemStyle-HorizontalAlign="left" />
                            <asp:BoundField DataField="StartDate" HeaderText="Start Date" ReadOnly="true"  HeaderStyle-HorizontalAlign="left" ItemStyle-HorizontalAlign="left" />
                            <asp:BoundField DataField="EndDate" HeaderText="End Date" ReadOnly="true"  HeaderStyle-HorizontalAlign="left" ItemStyle-HorizontalAlign="left" />                                                                                                      
                        </Columns>     
                        <AlternatingRowStyle CssClass="GV-AlternatingRowStyle" />
                        <EditRowStyle CssClass="GV-EditRow" />                                                                       
                        <HeaderStyle CssClass="GV-HeaderStyle" />
                        <PagerStyle CssClass="GV-PagerStyle" />
                        <RowStyle CssClass="GV-RowStyle" />
                        <SelectedRowStyle CssClass="GV-SelectedRowStyle" />                   
                    </asp:GridView>
                </div>
            <div class="GV-Area">
                <h4>Stock</h4>
                <asp:GridView ID="GridViewStock" runat="server" AutoGenerateColumns="False" GridLines="None" Width="100%">
                        <Columns>                            
                            <asp:BoundField DataField="SchemeName" HeaderText="Stock Name"  ReadOnly="true" HeaderStyle-HorizontalAlign="Left" />
                            <asp:BoundField DataField="NoShare" HeaderText="No. of Shares"  ReadOnly="true" HeaderStyle-HorizontalAlign="left" ItemStyle-HorizontalAlign="left"/>                                    
                            <asp:BoundField DataField="PurchasePrice" HeaderText="Purchase Price" ControlStyle-Width="100px" DataFormatString="{0:##,##,##,##,###}" HeaderStyle-HorizontalAlign="left" ItemStyle-HorizontalAlign="left" />
                            <asp:BoundField DataField="CurrentPrice" HeaderText="Current Price" ControlStyle-Width="100px" DataFormatString="{0:##,##,##,##,###}" HeaderStyle-HorizontalAlign="left" ItemStyle-HorizontalAlign="left" />                                        
                            <asp:BoundField DataField="InvestedAmount" HeaderText="Invested Amount" ReadOnly="true" DataFormatString="{0:##,##,##,##,###}" HeaderStyle-HorizontalAlign="left" ItemStyle-HorizontalAlign="left" />
                            <asp:BoundField DataField="CurrentValue" HeaderText="Current Value" ReadOnly="true" DataFormatString="{0:##,##,##,##,###}" HeaderStyle-HorizontalAlign="left" ItemStyle-HorizontalAlign="left" />
                            <asp:BoundField DataField="GainLoss" HeaderText="Gain/Loss %" ReadOnly="true" HeaderStyle-HorizontalAlign="left" ItemStyle-HorizontalAlign="left" />                                                                                                        
                        </Columns>     
                        <AlternatingRowStyle CssClass="GV-AlternatingRowStyle" />
                        <EditRowStyle CssClass="GV-EditRow" />                                                                       
                        <HeaderStyle CssClass="GV-HeaderStyle" />
                        <PagerStyle CssClass="GV-PagerStyle" />
                        <RowStyle CssClass="GV-RowStyle" />
                        <SelectedRowStyle CssClass="GV-SelectedRowStyle" />                   
                    </asp:GridView>
                </div>
            <div class="GV-Area">
                <h4>Fixed Income</h4>
                <asp:GridView ID="GridViewFixedIncome" runat="server" AutoGenerateColumns="False" GridLines="None"  Width="100%">
                    <Columns>                            
                        <asp:BoundField DataField="InvestmentType" HeaderText="Investment Type"  ReadOnly="true" HeaderStyle-HorizontalAlign="Left" />
                        <asp:BoundField DataField="InvestedAmount" HeaderText="Invested Amount" DataFormatString="{0:##,##,##,##,###}"  HeaderStyle-HorizontalAlign="left" ItemStyle-HorizontalAlign="left"/>                                    
                        <asp:BoundField DataField="CurrentValue" HeaderText="Current Value" ControlStyle-Width="100px" DataFormatString="{0:##,##,##,##,###}" HeaderStyle-HorizontalAlign="left" ItemStyle-HorizontalAlign="left" />
                        <asp:BoundField DataField="IssuingEntity" HeaderText="Issuing Entity" ControlStyle-Width="100px" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" />                                        
                        <asp:BoundField DataField="ROI" HeaderText="Rate of Interest" ControlStyle-Width="70px" DataFormatString="{0:##,##,##,##,###}" HeaderStyle-HorizontalAlign="left" ItemStyle-HorizontalAlign="left" />
                        <asp:BoundField DataField="HolderName" HeaderText="Holder Name" ReadOnly="true" HeaderStyle-HorizontalAlign="left" ItemStyle-HorizontalAlign="left" />
                        <asp:BoundField DataField="StartDate" HeaderText="Start Date" ReadOnly="true" HeaderStyle-HorizontalAlign="left" ItemStyle-HorizontalAlign="left" />
                        <asp:BoundField DataField="MaturityDate" HeaderText="Maturity Date" ReadOnly="true" HeaderStyle-HorizontalAlign="left" ItemStyle-HorizontalAlign="left" />                                                                                                                                   
                    </Columns>   
                    <AlternatingRowStyle CssClass="GV-AlternatingRowStyle" />
                        <EditRowStyle CssClass="GV-EditRow" />                                                                       
                        <HeaderStyle CssClass="GV-HeaderStyle" />
                        <PagerStyle CssClass="GV-PagerStyle" />
                        <RowStyle CssClass="GV-RowStyle" />
                        <SelectedRowStyle CssClass="GV-SelectedRowStyle" />                     
                </asp:GridView>
                </div>
            <div class="GV-Area">
                <h4>Other Investments</h4>
                <asp:GridView ID="GridViewOtherInv" runat="server" AutoGenerateColumns="False" GridLines="None" Width="100%">
                    <Columns>                        
                        <asp:BoundField DataField="InvestmentType" HeaderText="Investment Type"  HeaderStyle-HorizontalAlign="Left" />
                        <asp:BoundField DataField="PurchasePrice" HeaderText="Purchase Price" ControlStyle-Width="100px" DataFormatString="{0:##,##,##,##,###}"  HeaderStyle-HorizontalAlign="left" ItemStyle-HorizontalAlign="left"/>                                    
                        <asp:BoundField DataField="CurrentValue" HeaderText="Current Value" ControlStyle-Width="100px" DataFormatString="{0:##,##,##,##,###}" HeaderStyle-HorizontalAlign="left" ItemStyle-HorizontalAlign="left" />                                                
                        <asp:BoundField DataField="StartDate" HeaderText="Purchase Date" ReadOnly="true" HeaderStyle-HorizontalAlign="left" ItemStyle-HorizontalAlign="left" />                                                                                                     
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
  
  <%--Code for free lead details--%>
   <div class="container-fluid" runat="server" id="FreeLeadDetail">
        <div class="planArea">
            <div class="row">
                <div class="col-sm-6">
                    &nbsp;
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
                            <h3>Scheme Performance(% CAGR)</h3>
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
                                    <asp:BoundField DataField="Curr_Corpus" HeaderText="Corpus(Cr.)" ReadOnly="true" DataFormatString="{0:##,##,##,##,###}" HeaderStyle-CssClass="GV-HeaderStyleRight" >
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
    </div>
                  

    <%--Code for FPSelfie lead details--%>
    <div id="FPSelfieLeadDetails" runat="server">
    <link rel="stylesheet" href="../SFinancialPlanning/assets/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="../SFinancialPlanning/assets/css/form-elements.css">
    <link rel="stylesheet" href="../SFinancialPlanning/assets/css/style.css">

    <script src="../SFinancialPlanning/Scripts/fusioncharts.js"></script>
    <script src="../SFinancialPlanning/Scripts/fusioncharts.theme.fint.js"></script>
    <script src="../SFinancialPlanning/Scripts/fusioncharts.widgets.js"></script>
    <script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script type="text/javascript">
        // Load the Visualization API
        google.load('visualization', '1.0', { 'packages': ['corechart'] });
        // Set a callback to run when the Google Visualization API is loaded.
        // This callback function actually draws the chart
        // google.setOnLoadCallback(drawChart);
        // Draw the chart
        // This is where chart logic is located
        function drawChart(assetdata) {
            // Add the data to the chart
            var data = new google.visualization.DataTable();
            // Add columns
            data.addColumn('string', 'Asset');
            data.addColumn('number', 'Count');
            // Add rows
            data.addRows(assetdata);
            // Set chart options
            var options = {
                'width': '100%',
                'height': 350,
                is3D: true
            };
            // Draw the chart

            var formatter = new google.visualization.NumberFormat({ pattern: '###', fractionDigits: 0 });
            formatter.format(data, 1);

            var chart = new google.visualization.PieChart(document.getElementById('chart_wrap'));
            chart.draw(data, options);
        }

    </script>

    <style>
        #chartdiv {
            width: 100%;
            height: 380px;
            font-size: 16rem;
        }

        .full {
            background: url(images/background_1680x1050.jpg) no-repeat center center fixed;
            -webkit-background-size: cover;
            -moz-background-size: cover;
            -o-background-size: cover;
            background-size: cover;
        }

        .price_table_container {
            text-align: center;
            color: #666;
            margin-top: 35px;
            font-family: 'Open Sans', sans-serif;
        }

        .price_table_heading {
            font-size: 36px;
            padding: 10px;
            background: #EEE;
        }


        .price_table_row {
            padding: 15px;
            background: #FFF;
        }

        .cost {
            padding: 30px;
            font-size: 30px;
        }

            .cost span {
                font-size: 15px;
            }

        .price_table_row:nth-of-type(even) {
            background: #F8F8F8;
        }

        .btn {
            border-radius: 0px;
        }

        .recommended {
            /*USER DEFINED COLOUR*/
            background: #FF3A3A;
            color: #FFF;
            /*USER DEFINED COLOUR*/
            padding: 3px 0 3px 0;
            margin-top: 10px;
            text-align: center;
            margin-bottom: -35px;
            font-family: 'Open Sans', sans-serif;
        }


        .spacer {
            width: 100%;
            height: 50px;
        }


        /*Already Defined Colours*/
        /*Background*/
        .primary-bg {
            background: #337AB7;
            color: #FFF;
        }

        .success-bg {
            background: #5CB85C;
            color: #FFF;
        }

        .info-bg {
            background: #5BC0DE;
            color: #FFF;
        }

        .warning-bg {
            background: #F0AD4E;
            color: #FFF;
        }

        .danger-bg {
            background: #D9534F;
            color: #FFF;
        }

        .dark-bg {
            background: #444;
            color: #FFF;
        }

        .royal-bg {
            background: #8E74E2;
            color: #FFF;
        }

        .static-bg {
            background: #2BB0A6;
            color: #FFF;
        }

        /*Only Text Colours*/
        .primary-text {
            background: #FFF;
            color: #337AB7;
        }

        .success-text {
            background: #FFF;
            color: #5CB85C;
        }

        .info-text {
            background: #FFF;
            color: #5BC0DE;
        }

        .warning-text {
            background: #FFF;
            color: #F0AD4E;
        }

        .danger-text {
            background: #FFF;
            color: #D9534F;
        }

        .dark-text {
            background: #FFF;
            color: #444;
        }

        .royal-text {
            background: #FFF;
            color: #8E74E2;
        }

        .static-text {
            background: #FFF;
            color: #2BB0A6;
        }

        .cost {
            font-size: 29px;
        }
        /*Additional Button styles*/

        /*BTN-DARK*/
        .btn-dark {
            color: #fff;
            background-color: #444;
            border-color: #444;
        }

            .btn-dark:hover,
            .btn-dark:focus,
            .btn-dark.focus,
            .btn-dark:active,
            .btn-dark.active,
            .open > .dropdown-toggle.btn-dark {
                color: #fff;
                background-color: #222;
                border-color: #222;
            }

            .btn-dark:active,
            .btn-dark.active,
            .open > .dropdown-toggle.btn-dark {
                background-image: none;
            }


        /*BTN-ROYAL---------*/
        .btn-royal {
            color: #fff;
            background-color: #8E74E2;
            border-color: #8E74E2;
        }

            .btn-royal:hover,
            .btn-royal:focus,
            .btn-royal.focus,
            .btn-royal:active,
            .btn-royal.active,
            .open > .dropdown-toggle.btn-royal {
                color: #fff;
                background-color: #7451E8;
                border-color: #7451E8;
            }

            .btn-royal:active,
            .btn-royal.active,
            .open > .dropdown-toggle.btn-royal {
                background-image: none;
            }


        /*BTN-STATIC---------*/
        .btn-static {
            color: #fff;
            background-color: #2BB0A6;
            border-color: #2BB0A6;
        }

            .btn-static:hover,
            .btn-static:focus,
            .btn-static.focus,
            .btn-static:active,
            .btn-static.active,
            .open > .dropdown-toggle.btn-static {
                color: #fff;
                background-color: #07A094;
                border-color: #07A094;
            }

            .btn-static:active,
            .btn-static.active,
            .open > .dropdown-toggle.btn-static {
                background-image: none;
            }
            .flexy-menu.vertical li a {
    display: inline-flex !important;

}
            header .hRight {
     margin-top: 42px;

}
    </style>

        <div class="container">
                <div class="row form-bottom">
                    <h1 align="center" style="color: #ffffff;"><span id="username"></span></h1>

                    <div class="col-md-4 col-sm-6 col-xs-12 float-shadow">
                        <div class="price_table_container">
                            <div class="price_table_body">
                                <div class="price_table_row cost info-bg"><strong>Personal Profile</strong></div>
                                <div class="price_table_row">Status: <span id="userstatus"></span></div>
                                <div class="price_table_row">Mobile: <span id="usermobile"></span></div>
                                <div class="price_table_row">Email: <span id="useremail"></span></div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4 col-sm-6 col-xs-12 float-shadow">
                        <div class="price_table_container">
                            <div class="price_table_body">
                                <div class="price_table_row cost success-bg"><strong>Retirement Milestone</strong></div>
                                <div class="price_table_row">Current Age: <span id="userage"></span></div>
                                <div class="price_table_row">Retirement Age: <span id="userretirementage"></span></div>
                                <div class="price_table_row">Life Expentency: <span id="userlifeexpentency"></span></div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4 col-sm-6 col-xs-12 float-shadow">
                        <div class="price_table_container">
                            <div class="price_table_body">
                                <div class="price_table_row cost danger-bg"><strong>Risk-O-Meter</strong></div>
                                <div id="chart-container"></div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row form-bottom">

                    <h1 align="center" style="color: #ffffff;">The Way Forward</h1>

                    <div class="col-md-4 col-sm-6 col-xs-12 float-shadow">
                        <div class="price_table_container">
                            <div class="price_table_body">
                                <div class="price_table_row cost warning-bg"><strong>Emergency Fund</strong></div>
                                <div class="price_table_row">Investment needed: <span id="efundA"></span></div>
                            </div>
                            <a id="Ehref" href="#" class="btn btn-warning btn-lg btn-block" target="_blank">Click to know funds</a>
                        </div>
                    </div>

                    <div class="col-md-4 col-sm-6 col-xs-12 float-shadow">
                        <div class="price_table_container">
                            <div class="price_table_body">
                                <div class="price_table_row cost warning-bg"><strong>Term Insurance</strong></div>
                                <div class="price_table_row" id="riskLife_div">Life Insurance Needed:<span id="riskLife"></span> </div>
                            </div>
                            <a href="../OnlineTermInsurance.aspx" class="btn btn-warning btn-lg btn-block" target="_blank">Click for Best Insurance Options</a>
                        </div>
                    </div>

                    <div class="col-md-4 col-sm-6 col-xs-12 float-shadow">
                        <div class="price_table_container">
                            <div class="price_table_body">
                                <div class="price_table_row cost warning-bg"><strong>Medical Insurance</strong></div>
                                <div class="price_table_row" id="riskHealth_div">Health Insurance Needed: <span id="riskHealth"></span></div>
                            </div>
                            <a href="../OnlineHealthInsurance.aspx" class="btn btn-warning btn-lg btn-block" target="_blank">Click for Best Insurance Options</a>
                        </div>
                    </div>

                    <div class="col-md-4 col-sm-6 col-xs-12 float-shadow" id="Education" style="display: none;">
                        <div class="price_table_container">
                            <div class="price_table_body">
                                <div class="price_table_row cost info-bg"><strong>Children’s Education</strong></div>
                                <div class="price_table_row">Amount needed: <span id="EducationA"></span></div>
                                <div class="price_table_row">Monthly Investments (SIP): <span id="EducationM"></span></div>
                            </div>
                            <a id="CEhref" href="#" class="btn btn-info btn-lg btn-block" target="_blank">Click to know funds</a>
                        </div>
                    </div>

                    <div class="col-md-4 col-sm-6 col-xs-12 float-shadow" id="Marriage" style="display: none;">
                        <div class="price_table_container">
                            <div class="price_table_body">
                                <div class="price_table_row cost success-bg"><strong>Children’s Marriage</strong></div>
                                <div class="price_table_row">Amount needed: <span id="MarriageA"></span></div>
                                <div class="price_table_row">Monthly Investments (SIP): <span id="MarriageM"></span></div>
                            </div>
                            <a id="CMhref" href="#" class="btn btn-success btn-lg btn-block" target="_blank">Click to know funds</a>
                        </div>
                    </div>

                    <div class="col-md-4 col-sm-6 col-xs-12 float-shadow" id="asset" style="display: none;">
                        <div class="price_table_container">
                            <div class="price_table_body">
                                <div class="price_table_row cost dark-bg"><strong>Buying Asset</strong></div>
                                <div class="price_table_row">Amount needed: <span id="assetA"></span></div>
                                <div class="price_table_row">Monthly Investments (SIP): <span id="assetM"></span></div>
                            </div>
                            <a id="Ahref" href="#" class="btn btn-dark btn-lg btn-block" target="_blank">Click to know funds</a>
                        </div>
                    </div>

                    <div class="col-md-4 col-sm-6 col-xs-12 float-shadow" id="Vacation" style="display: none;">
                        <div class="price_table_container">
                            <div class="price_table_body">
                                <div class="price_table_row cost royal-bg"><strong>Vacation</strong></div>
                                <div class="price_table_row">Amount needed: <span id="VacationA"></span></div>
                                <div class="price_table_row">Monthly Investments (SIP): <span id="VacationM"></span></div>
                            </div>
                            <a id="Vhref" href="#" class="btn btn-royal btn-lg btn-block" target="_blank">Click to know funds</a>
                        </div>
                    </div>

                    <div class="col-md-4 col-sm-6 col-xs-12 float-shadow" id="Others" style="display: none;">
                        <div class="price_table_container">
                            <div class="price_table_body">
                                <div class="price_table_row cost success-bg"><strong>Others</strong></div>
                                <div class="price_table_row">Amount needed: <span id="OthersA"></span></div>
                                <div class="price_table_row">Monthly Investments (SIP): <span id="OthersM"></span></div>
                            </div>
                            <a id="Ohref" href="#" class="btn btn-success btn-lg btn-block" target="_blank">Click to know funds</a>
                        </div>
                    </div>

                    <div class="col-md-4 col-sm-6 col-xs-12 float-shadow" id="Retirement" style="display: none;">
                        <div class="price_table_container">
                            <div class="price_table_body">
                                <div class="price_table_row cost primary-bg"><strong>Retirement</strong></div>
                                <div class="price_table_row">Amount needed: <span id="RetirementA"></span></div>
                                <div class="price_table_row">Monthly Investments (SIP): <span id="RetirementM"></span></div>
                            </div>
                            <a id="Rhref" href="#" class="btn btn-primary btn-lg btn-block" target="_blank">Click to know funds</a>
                        </div>
                    </div>

                    <div class="col-md-12 col-sm-12 col-xs-12 float-shadow">
                        <div class="price_table_container">
                            <div class="price_table_body">
                                <div class="price_table_row cost success-bg" style="cursor: pointer;">Estate Planning: Get your personalised online will.</div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-12 col-sm-12 col-xs-12 float-shadow" style="display:none;">
                        <div class="price_table_container">
                            <div class="price_table_body">
                                <div class="price_table_row cost static-bg"><strong>Asset Allocation</strong></div>
                                <!--<div id="chartdiv"></div>-->
                                <div id="chart_wrap"></div>

                            </div>
                            <a id="AAhref" href="#" class="btn btn-static btn-lg btn-block" target="_blank">Click to know funds</a>
                        </div>
                    </div>

                </div>

            </div>

        <script>


            $(document).ready(function () {

                $.ajax({
                    type: "POST",
                    url: "LeadDetails.aspx/getFPSelfieLeadDetails",
                    data: "{'id':1}",
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        var d = JSON.parse(data.d);
                        $('#username').text(d.name + "'s – Financial Plan");

                        $('#Ehref').attr("href", "https://invest.fincart.com/index.jsp?email=<%=Session["Email"].ToString()%>&pswd=<%=Session["UserPass"].ToString()%>&pstatus=F&pid=" + d.Schemes);
                        $('#CEhref').attr("href", "https://invest.fincart.com/index.jsp?email=<%=Session["Email"].ToString()%>&pswd=<%=Session["UserPass"].ToString()%>&pstatus=F&pid=" + d.Schemes);
                        $('#CMhref').attr("href", "https://invest.fincart.com/index.jsp?email=<%=Session["Email"].ToString()%>&pswd=<%=Session["UserPass"].ToString()%>&pstatus=F&pid=" + d.Schemes);
                        $('#Ahref').attr("href", "https://invest.fincart.com/index.jsp?email=<%=Session["Email"].ToString()%>&pswd=<%=Session["UserPass"].ToString()%>&pstatus=F&pid=" + d.Schemes);
                        $('#Vhref').attr("href", "https://invest.fincart.com/index.jsp?email=<%=Session["Email"].ToString()%>&pswd=<%=Session["UserPass"].ToString()%>&pstatus=F&pid=" + d.Schemes);
                        $('#Ohref').attr("href", "https://invest.fincart.com/index.jsp?email=<%=Session["Email"].ToString()%>&pswd=<%=Session["UserPass"].ToString()%>&pstatus=F&pid=" + d.Schemes);
                        $('#Rhref').attr("href", "https://invest.fincart.com/index.jsp?email=<%=Session["Email"].ToString()%>&pswd=<%=Session["UserPass"].ToString()%>&pstatus=F&pid=" + d.Schemes);
                        $('#AAhref').attr("href", "https://invest.fincart.com/index.jsp?email=<%=Session["Email"].ToString()%>&pswd=<%=Session["UserPass"].ToString()%>&pstatus=F&pid=" + d.Schemes);

                        $('#userstatus').text(d.status);
                        $('#usermobile').text("+91" + d.mobile);
                        $('#useremail').text(d.email);

                        $('#userage').text(d.currrentage);
                        $('#userretirementage').text(d.retirementage);
                        $('#userlifeexpentency').text(d.lifeexpentency);

                        $('#efundA').text(d.E_Fund_Amount);

                        $('#riskLife').text(d.Risk_T_Insurance);

                        $('#riskHealth').text(d.Risk_FF_Insurance);


                        if (d.Asset) {
                            $('#asset').css("display", "Block");
                            $('#assetA').text(d.Asset_Amount);
                            $('#assetM').text(d.Asset_SIP);
                        }

                        if (d.Vacation) {
                            $('#Vacation').css("display", "Block");
                            $('#VacationA').text(d.Vacation_Amount);
                            $('#VacationM').text(d.Vacation_SIP);
                        }

                        if (d.Retire) {
                            $('#Retirement').css("display", "Block");
                            $('#RetirementA').text(d.Retire_Amount);
                            $('#RetirementM').text(d.Retire_SIP);
                        }

                        if (d.other) {
                            $('#Others').css("display", "Block");
                            $('#OthersA').text(d.other_Amount);
                            $('#OthersM').text(d.other_SIP);
                        }

                        if (d.ChildE) {
                            $('#Education').css("display", "Block");
                            $('#EducationA').text(d.ChildE_Amount);
                            $('#EducationM').text(d.ChildE_SIP);
                        }

                        if (d.ChildM) {
                            $('#Marriage').css("display", "Block");
                            $('#MarriageA').text(d.ChildM_Amount);
                            $('#MarriageM').text(d.ChildM_SIP);
                        }

                        var res = d.chartdata.split("~");

                        var assetdata = [];

                        for (var i = 0; i < res.length; i++) {

                            var r = res[i].split(",");

                            var crdat = ['' + r[0] + '', parseInt(r[1])];//'{ "text": "' + r[0] + '", "values": [' + r[1] + '] },';

                            assetdata.push(crdat);
                        }

                        drawChart(assetdata);

                        FusionCharts.ready(function () {
                            var cSatScoreChart = new FusionCharts({
                                type: 'angulargauge',
                                renderAt: 'chart-container',
                                width: '100%',
                                height: '180',
                                dataFormat: 'json',
                                dataSource: {
                                    "chart": {
                                        "caption": "",
                                        "subcaption": "",
                                        "lowerLimit": "10",
                                        "upperLimit": "40",
                                        "lowerLimitDisplay": "Low",
                                        "upperLimitDisplay": "High",
                                        "showValue": "0",
                                        "valueBelowPivot": "1",
                                        "pivotRadius": "0",
                                        "theme": "fint",
                                        "showTickMarks": "0",
                                        "tickValueStep": "5",
                                        "gaugeFillMix": "{dark-40},{light-40},{dark-20}",
                                    },
                                    "colorRange": {
                                        "color": [
                                            {
                                                "minValue": "10",
                                                "maxValue": "20",
                                                "code": "#6baa01"
                                            },
                                            {
                                                "minValue": "20",
                                                "maxValue": "30",
                                                "code": "#f8bd19"
                                            },
                                            {
                                                "minValue": "30",
                                                "maxValue": "40",
                                                "code": "#e44a00"
                                            }
                                        ]
                                    },
                                    "dials": {
                                        "dial": [{
                                            "radius": "80",
                                            "baseWidth": "40",
                                            "baseRadius": "25",
                                            "topWidth": "1",
                                            "rearExtension": "0",
                                            "value": d.Risk_Ability
                                        },
                                         {
                                             "radius": "48",
                                             "bgColor": "ffffff",
                                             "borderAlpha": "0",
                                             "baseWidth": "45",
                                             "baseRadius": "25",
                                             "topWidth": "40",
                                             "rearExtension": "2",
                                             "value": d.Risk_Ability,
                                             "showValue": "0"
                                         }]
                                    }
                                }
                            }).render();
                        });

                    }
                });

            });
        </script>
    </div>
</asp:Content>

