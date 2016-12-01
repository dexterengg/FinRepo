<%-- 
    Document   : nseline
    Created on : Jul 30, 2011, 2:35:17 PM
    Author     : Arup
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="beans.dbconnect"  %>
<%@page import="java.io.*, java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">                
<link href="../chart.css" rel="stylesheet" type="text/css">
<title>NSE Live Graph</title>
</head>
<%

String speriod=request.getParameter("speriod");

if(speriod==null){speriod="1D";}

//out.print(speriod);


%>
	<body >
            <%
            java.sql.Connection con=null;
            java.sql.Statement st=null;
            java.sql.ResultSet rs=null;
            java.sql.ResultSet rs2=null;

            dbconnect db=new dbconnect();        

            String driver=db.getdriver();
            String url=db.getconurliwell();
            String uid=db.getusernameiwell();
            String pwd=db.getuserpasswordiwell();

            Class.forName(driver);
            con=java.sql.DriverManager.getConnection(url, uid, pwd);
            st=con.createStatement();

            String query=null, query2=null; 
            
            java.text.DecimalFormat dfa=(java.text.DecimalFormat)java.text.DecimalFormat.getInstance();
            dfa.applyPattern("###0.00");
            %>
            <table width="580" border="0" align="left" cellpadding="0" cellspacing="0" >
              <tr>
              	<td colspan="8">&nbsp;</td>
              </tr>
              <tr>
              	<td width="50px"></td>
                <%                               
                if(speriod.equals("1D")) {%>  
                <td>
                    <a href="ytm.jsp?speriod=1D" target="_self">
                    <img src="../../images/tabs/1d-on.png" border="0" style="margin-right: 10px; padding-bottom:-5px;"/>
                    </a>
                </td>
                <td>
                    <a href="ytm.jsp?speriod=1w" target="_self">
                    <img src="../../images/tabs/1w-off.png" border="0" style="margin-right: 10px; padding-bottom:-5px;"/>
                    </a>
                </td>
                <td>
                    <a href="ytm.jsp?speriod=1m" target="_self">
                    <img src="../../images/tabs/1m-off.png" border="0" style="margin-right: 10px;" />
                    </a>
                </td>
                <td>
                    <a href="ytm.jsp?speriod=3m" target="_self">
                    <img src="../../images/tabs/3m-off.png" border="0" style="margin-right: 10px;" />
                    </a>
                </td>
                <td>
                    <a href="ytm.jsp?speriod=6m" target="_self">
                    <img src="../../images/tabs/6m-off.png" border="0" style="margin-right: 10px;" />
                    </a>
                </td>
                <td>
                    <a href="ytm.jsp?speriod=1y" target="_self">
                    <img src="../../images/tabs/1y-off.png" border="0" style="margin-right: 10px;" />
                    </a>
                </td>
                <td>
                    <a href="ytm.jsp?speriod=2y" target="_self">
                    <img src="../../images/tabs/2y-off.png" border="0" style="margin-right: 10px;" />
                    </a>
                </td>
                <td>
                    <a href="ytm.jsp?speriod=3y" target="_self">
                    <img src="../../images/tabs/3y-off.png" border="0" style="margin-right: 10px;" />
                    </a>
                </td>
                <%}%>
                <%                               
                if(speriod.equals("1w")) {%>  
                <td>
                    <a href="ytm.jsp?speriod=1D" target="_self">
                    <img src="../../images/tabs/1d-off.png" border="0" style="margin-right: 10px; padding-bottom:-5px;"/>
                    </a>
                </td>
                <td>
                    <a href="ytm.jsp?speriod=1w" target="_self">
                    <img src="../../images/tabs/1w-on.png" border="0" style="margin-right: 10px; padding-bottom:-5px;"/>
                    </a>
                </td>
                <td>
                    <a href="ytm.jsp?speriod=1m" target="_self">
                    <img src="../../images/tabs/1m-off.png" border="0" style="margin-right: 10px;" />
                    </a>
                </td>
                <td>
                    <a href="ytm.jsp?speriod=3m" target="_self">
                    <img src="../../images/tabs/3m-off.png" border="0" style="margin-right: 10px;" />
                    </a>
                </td>
                <td>
                    <a href="ytm.jsp?speriod=6m" target="_self">
                    <img src="../../images/tabs/6m-off.png" border="0" style="margin-right: 10px;" />
                    </a>
                </td>
                <td>
                    <a href="ytm.jsp?speriod=1y" target="_self">
                    <img src="../../images/tabs/1y-off.png" border="0" style="margin-right: 10px;" />
                    </a>
                </td>
                <td>
                    <a href="ytm.jsp?speriod=2y" target="_self">
                    <img src="../../images/tabs/2y-off.png" border="0" style="margin-right: 10px;" />
                    </a>
                </td>
                <td>
                    <a href="ytm.jsp?speriod=3y" target="_self">
                    <img src="../../images/tabs/3y-off.png" border="0" style="margin-right: 10px;" />
                    </a>
                </td>
                <%}%>
                <%                
                if(speriod.equals("1m")) {%>  
                <td>
                    <a href="ytm.jsp?speriod=1D" target="_self">
                    <img src="../../images/tabs/1d-off.png" border="0" style="margin-right: 10px; padding-bottom:-5px;"/>
                    </a>
                </td>
                <td>
                    <a href="ytm.jsp?speriod=1w" target="_self">
                    <img src="../../images/tabs/1w-off.png" border="0" style="margin-right: 10px; padding-bottom:-5px;"/>
                    </a>
                </td>
                <td>
                    <a href="ytm.jsp?speriod=1m" target="_self">
                    <img src="../../images/tabs/1m-on.png" border="0" style="margin-right: 10px;" />
                    </a>
                </td>
                <td>
                    <a href="ytm.jsp?speriod=3m" target="_self">
                    <img src="../../images/tabs/3m-off.png" border="0" style="margin-right: 10px;" />
                    </a>
                </td>
                <td>
                    <a href="ytm.jsp?speriod=6m" target="_self">
                    <img src="../../images/tabs/6m-off.png" border="0" style="margin-right: 10px;" />
                    </a>
                </td>
                <td>
                    <a href="ytm.jsp?speriod=1y" target="_self">
                    <img src="../../images/tabs/1y-off.png" border="0" style="margin-right: 10px;" />
                    </a>
                </td>
                <td>
                    <a href="ytm.jsp?speriod=2y" target="_self">
                    <img src="../../images/tabs/2y-off.png" border="0" style="margin-right: 10px;" />
                    </a>
                </td>
                <td>
                    <a href="ytm.jsp?speriod=3y" target="_self">
                    <img src="../../images/tabs/3y-off.png" border="0" style="margin-right: 10px;" />
                    </a>
                </td>
                <%}%>
                <%                
                if(speriod.equals("3m")) {%>  
                <td>
                    <a href="ytm.jsp?speriod=1D" target="_self">
                    <img src="../../images/tabs/1d-off.png" border="0" style="margin-right: 10px; padding-bottom:-5px;"/>
                    </a>
                </td>
                <td>
                    <a href="ytm.jsp?speriod=1w" target="_self">
                    <img src="../../images/tabs/1w-off.png" border="0" style="margin-right: 10px; padding-bottom:-5px;"/>
                    </a>
                </td>
                <td>
                    <a href="ytm.jsp?speriod=1m" target="_self">
                    <img src="../../images/tabs/1m-off.png" border="0" style="margin-right: 10px;" />
                    </a>
                </td>
                <td>
                    <a href="ytm.jsp?speriod=3m" target="_self">
                    <img src="../../images/tabs/3m-on.png" border="0" style="margin-right: 10px;" />
                    </a>
                </td>
                <td>
                    <a href="ytm.jsp?speriod=6m" target="_self">
                    <img src="../../images/tabs/6m-off.png" border="0" style="margin-right: 10px;" />
                    </a>
                </td>
                <td>
                    <a href="ytm.jsp?speriod=1y" target="_self">
                    <img src="../../images/tabs/1y-off.png" border="0" style="margin-right: 10px;" />
                    </a>
                </td>
                <td>
                    <a href="ytm.jsp?speriod=2y" target="_self">
                    <img src="../../images/tabs/2y-off.png" border="0" style="margin-right: 10px;" />
                    </a>
                </td>
                <td>
                    <a href="ytm.jsp?speriod=3y" target="_self">
                    <img src="../../images/tabs/3y-off.png" border="0" style="margin-right: 10px;" />
                    </a>
                </td>
                <%}%>
                <%                
                if(speriod.equals("6m")) {%>  
                <td>
                    <a href="ytm.jsp?speriod=1D" target="_self">
                    <img src="../../images/tabs/1d-off.png" border="0" style="margin-right: 10px; padding-bottom:-5px;"/>
                    </a>
                </td>
                <td>
                    <a href="ytm.jsp?speriod=1w" target="_self">
                    <img src="../../images/tabs/1w-off.png" border="0" style="margin-right: 10px; padding-bottom:-5px;"/>
                    </a>
                </td>
                <td>
                    <a href="ytm.jsp?speriod=1m" target="_self">
                    <img src="../../images/tabs/1m-off.png" border="0" style="margin-right: 10px;" />
                    </a>
                </td>
                <td>
                    <a href="ytm.jsp?speriod=3m" target="_self">
                    <img src="../../images/tabs/3m-off.png" border="0" style="margin-right: 10px;" />
                    </a>
                </td>
                <td>
                    <a href="ytm.jsp?speriod=6m" target="_self">
                    <img src="../../images/tabs/6m-on.png" border="0" style="margin-right: 10px;" />
                    </a>
                </td>
                <td>
                    <a href="ytm.jsp?speriod=1y" target="_self">
                    <img src="../../images/tabs/1y-off.png" border="0" style="margin-right: 10px;" />
                    </a>
                </td>
                <td>
                    <a href="ytm.jsp?speriod=2y" target="_self">
                    <img src="../../images/tabs/2y-off.png" border="0" style="margin-right: 10px;" />
                    </a>
                </td>
                <td>
                    <a href="ytm.jsp?speriod=3y" target="_self">
                    <img src="../../images/tabs/3y-off.png" border="0" style="margin-right: 10px;" />
                    </a>
                </td>
                <%}%>
                <%                
                if(speriod.equals("1y")) {%>  
                <td>
                    <a href="ytm.jsp?speriod=1D" target="_self">
                    <img src="../../images/tabs/1d-off.png" border="0" style="margin-right: 10px; padding-bottom:-5px;"/>
                    </a>
                </td>
                <td>
                    <a href="ytm.jsp?speriod=1w" target="_self">
                    <img src="../../images/tabs/1w-off.png" border="0" style="margin-right: 10px; padding-bottom:-5px;"/>
                    </a>
                </td>
                <td>
                    <a href="ytm.jsp?speriod=1m" target="_self">
                    <img src="../../images/tabs/1m-off.png" border="0" style="margin-right: 10px;" />
                    </a>
                </td>
                <td>
                    <a href="ytm.jsp?speriod=3m" target="_self">
                    <img src="../../images/tabs/3m-off.png" border="0" style="margin-right: 10px;" />
                    </a>
                </td>
                <td>
                    <a href="ytm.jsp?speriod=6m" target="_self">
                    <img src="../../images/tabs/6m-off.png" border="0" style="margin-right: 10px;" />
                    </a>
                </td>
                <td>
                    <a href="ytm.jsp?speriod=1y" target="_self">
                    <img src="../../images/tabs/1y-on.png" border="0" style="margin-right: 10px;" />
                    </a>
                </td>
                <td>
                    <a href="ytm.jsp?speriod=2y" target="_self">
                    <img src="../../images/tabs/2y-off.png" border="0" style="margin-right: 10px;" />
                    </a>
                </td>
                <td>
                    <a href="ytm.jsp?speriod=3y" target="_self">
                    <img src="../../images/tabs/3y-off.png" border="0" style="margin-right: 10px;" />
                    </a>
                </td>
                <%}%>
                <%                
                if(speriod.equals("2y")) {%>  
                <td>
                    <a href="ytm.jsp?speriod=1D" target="_self">
                    <img src="../../images/tabs/1d-off.png" border="0" style="margin-right: 10px; padding-bottom:-5px;"/>
                    </a>
                </td>
                <td>
                    <a href="ytm.jsp?speriod=1w" target="_self">
                    <img src="../../images/tabs/1w-off.png" border="0" style="margin-right: 10px; padding-bottom:-5px;"/>
                    </a>
                </td>
                <td>
                    <a href="ytm.jsp?speriod=1m" target="_self">
                    <img src="../../images/tabs/1m-off.png" border="0" style="margin-right: 10px;" />
                    </a>
                </td>
                <td>
                    <a href="ytm.jsp?speriod=3m" target="_self">
                    <img src="../../images/tabs/3m-off.png" border="0" style="margin-right: 10px;" />
                    </a>
                </td>
                <td>
                    <a href="ytm.jsp?speriod=6m" target="_self">
                    <img src="../../images/tabs/6m-off.png" border="0" style="margin-right: 10px;" />
                    </a>
                </td>
                <td>
                    <a href="ytm.jsp?speriod=1y" target="_self">
                    <img src="../../images/tabs/1y-off.png" border="0" style="margin-right: 10px;" />
                    </a>
                </td>
                <td>
                    <a href="ytm.jsp?speriod=2y" target="_self">
                    <img src="../../images/tabs/2y-on.png" border="0" style="margin-right: 10px;" />
                    </a>
                </td>
                <td>
                    <a href="ytm.jsp?speriod=3y" target="_self">
                    <img src="../../images/tabs/3y-off.png" border="0" style="margin-right: 10px;" />
                    </a>
                </td>
                <%}%>
                <%                
                if(speriod.equals("3y")) {%>  
                <td>
                    <a href="ytm.jsp?speriod=1D" target="_self">
                    <img src="../../images/tabs/1d-off.png" border="0" style="margin-right: 10px; padding-bottom:-5px;"/>
                    </a>
                </td>
                <td>
                    <a href="ytm.jsp?speriod=1w" target="_self">
                    <img src="../../images/tabs/1w-off.png" border="0" style="margin-right: 10px; padding-bottom:-5px;"/>
                    </a>
                </td>
                <td>
                    <a href="ytm.jsp?speriod=1m" target="_self">
                    <img src="../../images/tabs/1m-off.png" border="0" style="margin-right: 10px;" />
                    </a>
                </td>
                <td>
                    <a href="ytm.jsp?speriod=3m" target="_self">
                    <img src="../../images/tabs/3m-off.png" border="0" style="margin-right: 10px;" />
                    </a>
                </td>
                <td>
                    <a href="ytm.jsp?speriod=6m" target="_self">
                    <img src="../../images/tabs/6m-off.png" border="0" style="margin-right: 10px;" />
                    </a>
                </td>
                <td>
                    <a href="ytm.jsp?speriod=1y" target="_self">
                    <img src="../../images/tabs/1y-off.png" border="0" style="margin-right: 10px;" />
                    </a>
                </td>
                <td>
                    <a href="ytm.jsp?speriod=2y" target="_self">
                    <img src="../../images/tabs/2y-off.png" border="0" style="margin-right: 10px;" />
                    </a>
                </td>
                <td>
                    <a href="ytm.jsp?speriod=3y" target="_self">
                    <img src="../../images/tabs/3y-on.png" border="0" style="margin-right: 10px;" />
                    </a>
                </td>
                <%}%>
                <%                
                if(speriod.equals("5y")) {%>  
                <td>
                    <a href="ytm.jsp?speriod=1D" target="_self">
                    <img src="../../images/tabs/1d-off.png" border="0" style="margin-right: 10px; padding-bottom:-5px;"/>
                    </a>
                </td>
                <td>
                    <a href="ytm.jsp?speriod=1w" target="_self">
                    <img src="../../images/tabs/1w-off.png" border="0" style="margin-right: 10px; padding-bottom:-5px;"/>
                    </a>
                </td>
                <td>
                    <a href="ytm.jsp?speriod=1m" target="_self">
                    <img src="../../images/tabs/1m-off.png" border="0" style="margin-right: 10px;" />
                    </a>
                </td>
                <td>
                    <a href="ytm.jsp?speriod=3m" target="_self">
                    <img src="../../images/tabs/3m-off.png" border="0" style="margin-right: 10px;" />
                    </a>
                </td>
                <td>
                    <a href="ytm.jsp?speriod=6m" target="_self">
                    <img src="../../images/tabs/6m-off.png" border="0" style="margin-right: 10px;" />
                    </a>
                </td>
                <td>
                    <a href="ytm.jsp?speriod=1y" target="_self">
                    <img src="../../images/tabs/1y-off.png" border="0" style="margin-right: 10px;" />
                    </a>
                </td>
                <td>
                    <a href="ytm.jsp?speriod=2y" target="_self">
                    <img src="../../images/tabs/2y-off.png" border="0" style="margin-right: 10px;" />
                    </a>
                </td>
                <td>
                    <a href="ytm.jsp?speriod=3y" target="_self">
                    <img src="../../images/tabs/3y-off.png" border="0" style="margin-right: 10px;" />
                    </a>
                </td>
                <%}%>
                </tr>                
            </table><br>
            <table cellspacing="0" cellpadding="0" width="100%"  class="chartarea">
                <tr>
                    <td colspan="2">                        
		
        <script src="../amcharts/amcharts.js" type="text/javascript"></script>        
        <script type="text/javascript">
            var chart;
            var chartData = [];

            AmCharts.ready(function () {
                // first we generate some random data
                generateChartData();

                // SERIAL CHART
                chart = new AmCharts.AmSerialChart();
                chart.pathToImages = "../amcharts/images/";
                chart.zoomOutButton = {
                backgroundColor: '#000000',
                backgroundAlpha: 0.15
                };
                chart.dataProvider = chartData;
                chart.categoryField = "cdate";

                // data updated event will be fired when chart is first displayed,
                // also when data will be updated. We'll use it to set some
                // initial zoom
                chart.addListener("dataUpdated", zoomChart);

                // AXES
                // Category
                var categoryAxis = chart.categoryAxis;
                categoryAxis.parseDates = false; // in order char to understand dates, we should set parseDates to true
                categoryAxis.minPeriod = "mm"; // as we have data with minute interval, we have to set "mm" here.			 
                categoryAxis.gridAlpha = 0.07;
                categoryAxis.axisColor = "#111111"; 
                categoryAxis.labelsEnabled = true;
                categoryAxis.labelRotation = 45;
                
                // Value
                var valueAxis = new AmCharts.ValueAxis();
                valueAxis.gridAlpha = 0.07;
                //valueAxis.title = "Nifty Value";
                chart.addValueAxis(valueAxis);                
                                 
                // GRAPH
                var graph = new AmCharts.AmGraph();
                graph.type = "line"; // try to change it to "column"
                graph.title = "red line";				
                graph.valueField = "cvisits";				
                graph.lineAlpha = 1;
                graph.lineColor = "#0000ff";
                //graph.negativeLineColor = "#ff0000";
                //graph.fillAlphas = 0.5; // setting fillAlphas to > 0 value makes it area graph												
                chart.addGraph(graph);

                // CURSOR
                var chartCursor = new AmCharts.ChartCursor();
                chartCursor.cursorPosition = "mouse";
                chartCursor.categoryBalloonDateFormat = "JJ:NN, DD MMMM";
                chart.addChartCursor(chartCursor);
                
                // WRITE
                chart.write("chartdiv");
            });			

            // generate some random data, quite different range 
            function generateChartData() 
            {                            					            											
                chartData.push(
                
                <%
                
                String p1="", p2="";
                
                if(speriod.trim().equals("1D")) 
                {
                    p1="dd";
                    p2="1";
                }
                
                if(speriod.trim().equals("1w")) 
                {
                    p1="ww";
                    p2="1";
                }
                
                if(speriod.trim().equals("1m")) 
                {
                    p1="mm";
                    p2="1";                                        
                }
                if(speriod.trim().equals("3m")) 
                {
                    p1="mm";
                    p2="3";                                        
                }
                if(speriod.trim().equals("6m")) 
                {
                    p1="mm";
                    p2="6";                                        
                }
                if(speriod.trim().equals("1y")) 
                {
                    p1="yy";
                    p2="1";                                        
                }
                if(speriod.trim().equals("2y")) 
                {
                    p1="yy";
                    p2="2";                                        
                }
                if(speriod.trim().equals("3y")) 
                {
                    p1="yy";
                    p2="3";                                        
                }
                if(speriod.trim().equals("5y")) 
                {
                    p1="yy";
                    p2="5";                                        
                }
                                                                                     
                query=" select convert(varchar(11), date, 105), * from ytm_curve where ";
                query+=" date = (select max(date) from ytm_curve where date < dateadd("+p1+", -"+p2+", getdate())) ";                
                rs=st.executeQuery(query);
                
                double pr=0;
                String dt="";
                if(rs.next())
                {                                        
                    for(int i=1; i<=60; i++)
                    {
                        pr=pr+(0.5);
                        out.println("{");
                        out.println("cdate: '"+pr+"',");                    
                        out.println("cvisits: "+dfa.format(rs.getFloat(i+2))+"");                    
                        if(i==60)
                        {
                            out.println("}");
                        }
                        else
                        {
                            out.println("},");
                        }
                    }
                    
                    dt=rs.getString(1);
                }                
                %>                                
                );
            }

                    // this method is called when chart is first inited as we listen for "dataUpdated" event
                    function zoomChart() {
                        // different zoom methods can be used - zoomToIndexes, zoomToDates, zoomToCategoryValues
                        //chart.zoomToIndexes(chartData.length - 40, chartData.length - 1);
                    }
                </script>		
		<div id="chartdiv" style="width:550px; height:300px;"></div>
                
                    </td>                    
                </tr> 
                <tr>
                    <td style="padding-left: 30px;" class="bodytextbold">Date as per : <%=dt%></td>
                    <td style="padding-left: 30px;" class="bodytext">Data Source: CCIL India</td>
                </tr>
            </table>
	</body>
</html>

