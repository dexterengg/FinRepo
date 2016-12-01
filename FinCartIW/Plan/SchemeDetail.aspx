<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SchemeDetail.aspx.cs" Inherits="SchemeDetail" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="../ChartNew/amcharts/amchartsNew.js" type="text/javascript"></script> 
    <script src="../ChartNew/amcharts/serial.js" type="text/javascript"></script>      
    <script src="../ChartNew/amcharts/amstockNew.js" type="text/javascript"></script>
    <link href="css/modal.css" rel="stylesheet" type="text/css" media="all" />
    <script type="text/javascript" src="https://www.google.com/jsapi"></script> 
</head>
<body>
    <form id="form1" runat="server">
    <div id="schemeDetailArea" class="schemeDetailArea" runat="server">            
            <div id="schemedetail" runat="server">
                <div class="schemename"><asp:Label ID="lblSchemeName" runat="server" Text="Scheme Name"></asp:Label></div>
                <div class="resultBodyDiff">
                    <div class="TableHeaderDiffHead">  
                        <div class="colDiff colLeftDiff">Past Performance</div>                                      
                    </div>                                    
                    <div class="TableHeaderDiff">                      
                        <div class="colDiff colLeftDiff">1 Year</div>              
                        <div class="colDiff">2 Year</div>
                        <div class="colDiff">3 Year</div>
                        <div class="colDiff">5 Year</div>
                        <div class="colDiff">10 Year</div>                    
                        <div class="colDiff">Since Inception</div>
                    </div>
                    <div class="TableRowDiff">    
                        <div class="colDiff colLeftDiff"><asp:Label ID="lblyear1" runat="server" Text='' ></asp:Label>%</div>            
                        <div class="colDiff"><asp:Label ID="lblyear2" runat="server" Text='' ></asp:Label>%</div>
                        <div class="colDiff"><asp:Label ID="lblyear3" runat="server" Text='' ></asp:Label>%</div>
                        <div class="colDiff"><asp:Label ID="lblyear5" runat="server"  Text=''></asp:Label>%</div>                    
                        <div class="colDiff"><asp:Label ID="lblyear10" runat="server"  Text=''></asp:Label>%</div>
                        <div class="colDiff"><asp:Label ID="lblinception" runat="server"  Text=''></asp:Label>%</div>
                    </div>                                                                                                                                      
                </div>
                <div class="sip-calendar">
                    <div class="SIPArea">
                        If someone did SIP of Rs 10,000 per month since inception than the accumulated amount would be

                        <h3>Amount : Rs. <asp:Label ID="lblSIPAmount" runat="server" Text="" ></asp:Label></h3>
                        <h3>As on Date : <asp:Label ID="lblAsOn" runat="server" Text=""></asp:Label></h3>
                    </div>
                    <div class="Calendar-chart">
                        <asp:Literal ID="ltCalendarScripts" runat="server"></asp:Literal>                      
                        <div id="calendarChart" style="width: 100%; height: 160px;"></div>
                    </div>
                </div>
                <div class="resultBodyDiff">
                    <div class="TableHeaderDiffHead">  
                        <div class="col colLeftDiff">Risk Ratios [in %]</div>                                      
                    </div>                                    
                    <div class="TableHeaderDiff">  
                        <div class="colDiff colLeftDiff">Std. Deviation</div>              
                        <div class="colDiff">Alpha</div>
                        <div class="colDiff">Beta</div>
                        <div class="colDiff">Sharpe Ratio</div>
                        <div class="colDiff">Sortino Ratio</div>                    
                        <div class="colDiff">Treynor Ratio</div>
                        <div class="colDiff">Tracking Error</div>
                        <div class="colDiff">Information Ratio</div>                    
                    </div>
                    <div class="TableRowDiff">    
                        <div class="colDiff colLeftDiff"><asp:Label ID="lblStandadrDev" runat="server" Text='' ></asp:Label></div>            
                        <div class="colDiff"><asp:Label ID="lblAlpha" runat="server" Text='' ></asp:Label></div>
                        <div class="colDiff"><asp:Label ID="lblBeta" runat="server" Text='' ></asp:Label></div>
                        <div class="colDiff"><asp:Label ID="lblSharpe" runat="server"  Text=''></asp:Label></div>                    
                        <div class="colDiff"><asp:Label ID="lblSortino" runat="server"  Text=''></asp:Label></div>
                        <div class="colDiff"><asp:Label ID="lblTreynor" runat="server"  Text=''></asp:Label></div>
                        <div class="colDiff"><asp:Label ID="lblTracking" runat="server"  Text=''></asp:Label></div>
                        <div class="colDiff"><asp:Label ID="lblInformation" runat="server"  Text=''></asp:Label></div>
                    </div>                                                                                                                                      
                </div>                
            </div>
            <div id="nodetail" runat="server" visible="false">
                <div class="schemename">There is no detail available for this scheme</div>
            </div>
        </div>
    </form>
</body>
</html>
