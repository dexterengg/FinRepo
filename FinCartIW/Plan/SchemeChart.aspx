<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SchemeChart.aspx.cs" Inherits="SchemeChart" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="../ChartNew/amcharts/amchartsNew.js" type="text/javascript"></script> 
    <script src="../ChartNew/amcharts/serial.js" type="text/javascript"></script>      
    <script src="../ChartNew/amcharts/amstockNew.js" type="text/javascript"></script>
    <link href="css/modal.css" rel="stylesheet" type="text/css" media="all" />
    <link href='https://fonts.googleapis.com/css?family=Roboto' rel='stylesheet' type='text/css' />

</head>
<body>
    <form id="form1" runat="server">
        <div class="goalname"><asp:Label ID="lblGoalName" runat="server" Text="Visible when Invested Amount is filled"></asp:Label></div>
        <div class="schemename"><asp:Label ID="lblSchemeName" runat="server" Text="Visible when Invested Amount is filled"></asp:Label></div>
    <div class="schemeChart" runat="server" id="schemechartArea">        
        <asp:Literal ID="ltGoalSchChart" runat="server" ></asp:Literal>                      
        <div id='retirementChartDiv' style="width: 100%; height: 380px; float:left "></div>                    
    </div>
    </form>
</body>
</html>
