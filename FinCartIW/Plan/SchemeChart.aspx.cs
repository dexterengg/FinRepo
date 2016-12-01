using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using System.IO;
using System.Text;
using System.Globalization;

public partial class SchemeChart : System.Web.UI.Page
{
    SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ToString());
    string xStr = "";
    SqlCommand cmd;
    string xRiskCode = "0";
    string xRiskPer = "11";
    string xGoalName = "";
    string xSchemeName = "";


    protected void Page_Load(object sender, EventArgs e)
    {

        ViewState["xGoalCode"] = Request.QueryString["goalcode"];
        ViewState["xSIPAmt"] = Request.QueryString["sipamt"];
        ViewState["xExlCode"] = Request.QueryString["exlcode"];
        ViewState["xActInv"] = Request.QueryString["actinv"];


        if (!Page.IsPostBack)
        {
            ViewState["userid"] = Session["userSessionID"].ToString();

            // Query for selecting Goalname and Scheme Name
            SqlDataAdapter DA = new SqlDataAdapter(" " +
                    " select GoalName, SName from Schmst s, fp_GoalDetails g where s.exlcode=g.exlcode and g.Code=" + ViewState["xGoalCode"] + " " +                    
                    "  ", Con);

            DataSet DS = new DataSet();
            Con.Open();
            DA.Fill(DS);
            Con.Close();

            if (DS.Tables[0].Rows.Count > 0)
            {
                xGoalName = DS.Tables[0].Rows[0]["GoalName"].ToString();
                xSchemeName = DS.Tables[0].Rows[0]["SName"].ToString();

                lblGoalName.Text = "Goal Name : " + xGoalName;
                lblSchemeName.Text = "Scheme Name : " + xSchemeName;
            }
            else
            {
                lblGoalName.Text = "Goal Name : Visible when Actual Investment is filled";
                lblSchemeName.Text = "Scheme Name : Visible when Actual Investment is filled ";
            }
            
            BindSchemeChart();
        }
    }

    protected void BindSchemeChart()
    {        
            
            DataTable dsGoalChartData = new DataTable();
            StringBuilder strGoalSchChart = new StringBuilder();

            string xCode = Session["userSessionID"].ToString();
            //try
            //{                        

            strGoalSchChart.Append(@"<script type='text/javascript'>
			AmCharts.ready(function () {
				generateChartData();
				createStockChart();
			});

			var chartData1 = [];
			var chartData2 = [];
			var chartData3 = [];
			

			function generateChartData() {
            ");
            //Select No. of Months

            int xMonth = 0;
            string xSIPDt = "";
            string xProjDate = "";
            double xPrin = 0;
            //double xCumAmount = 0;
            double sipamt = Convert.ToDouble(ViewState["xSIPAmt"]);
            double actamt = Convert.ToDouble(ViewState["xActInv"]);

            double sUnit = 0;
            double aUnit = 0;
            double sCumUnit = 0;
            double aCumUnit = 0;
            double sProjectedAmt = 0;
            double aProjectedAmt = 0;
            double SuggestedAmt = 0;

            string xSIPDate = "";
            string dd = "";
            string mm = "";
            string yy = "";

            // Query for selecting SIP start Month and No. of month for SIP
            SqlDataAdapter NoMonDA = new SqlDataAdapter(" " +
                    " select SIPStartDate=Convert(varchar(10),EntryDate,120), NoMonth=datediff(M,EntryDate,Startdate) from fp_GoalDetails " +
                    " where GroupCode=(Select Code from fp_prospects where userid='" + ViewState["userid"] + "') and Code=" + ViewState["xGoalCode"] + " " +
                    "  ", Con);

            DataSet NoMonDS = new DataSet();
            Con.Open();
            NoMonDA.Fill(NoMonDS);
            Con.Close();

            if (NoMonDS.Tables[0].Rows.Count > 0)
            {
                xMonth = Convert.ToInt32(NoMonDS.Tables[0].Rows[0]["NoMonth"]);
                xSIPDt = NoMonDS.Tables[0].Rows[0]["SIPStartDate"].ToString();
            }

            CultureInfo culture = new CultureInfo("en-GB");
            DateTime SIPDate;

            SIPDate = Convert.ToDateTime(xSIPDt, culture);

            for (int j = 1; j <= xMonth; j++)
            {
                double sNAV = 0;
                string xSIPStartDt = SIPDate.ToString();
                

                dd = SIPDate.Day.ToString().PadLeft(2, '0');
                mm = SIPDate.Month.ToString().PadLeft(2, '0');
                yy = SIPDate.Year.ToString();
                xSIPDate = yy + "-" + mm + "-" + dd;

                // Query for selecting NAV of SIP start Month
                SqlDataAdapter NavDA = new SqlDataAdapter(" " +
                        " select NAV, SIPDate=Convert(varchar(10),NAVDate,120) from navexlc where exlcode=" + ViewState["xExlCode"] + " " +
                        " and NavDate=(select Min(NAVDate) from navexlc where exlcode=" + ViewState["xExlCode"] + " and NavDate >= '" + xSIPDate + "') " +
                        "  ", Con);

                DataSet NavDS = new DataSet();
                Con.Open();
                NavDA.Fill(NavDS);
                Con.Close();

                if (NavDS.Tables[0].Rows.Count > 0)
                {
                    sNAV = Convert.ToDouble(NavDS.Tables[0].Rows[0]["NAV"]);
                    xProjDate = NavDS.Tables[0].Rows[0]["SIPDate"].ToString();

                    // getting unit for Suggested SIP Amount based on every months SIP
                    sUnit = (sipamt / sNAV);

                    // getting unit for Actual Investment Amount based on every months SIP
                    aUnit = (actamt / sNAV);

                    if (j == 1)
                    {
                        sCumUnit = sUnit;
                        aCumUnit = aUnit;
                        sProjectedAmt = sCumUnit * sNAV;
                        aProjectedAmt = aCumUnit * sNAV;
                    }
                    else
                    {
                        sCumUnit = sCumUnit + sUnit;
                        aCumUnit = aCumUnit + aUnit;
                        sProjectedAmt = sCumUnit * sNAV;
                        aProjectedAmt = aCumUnit * sNAV;
                    }

                    strGoalSchChart.Append("chartData2.push({ date: new Date(" + yy + "," + mm + "," + dd + "), value: " + sProjectedAmt + " });");
                    strGoalSchChart.Append("chartData3.push({ date: new Date(" + yy + "," + mm + "," + dd + "), value: " + aProjectedAmt + " });");
                }

                // Calculation for Suggested Amount with Risk
                if (j == 1)
                {
                    xPrin = sipamt;
                    SuggestedAmt = sipamt;
                }
                else
                {
                    xPrin = SuggestedAmt + sipamt;
                    SuggestedAmt = Math.Round(xPrin * Math.Pow((1 + Convert.ToDouble(xRiskPer) * 1.0000 / 100), 1), 0);
                }


                strGoalSchChart.Append("chartData1.push({ date: new Date(" + yy + "," + mm + "," + dd + "), value: " + SuggestedAmt + " });");

                SIPDate = SIPDate.AddMonths(j);
            }



            strGoalSchChart.Append(@"}

			function createStockChart() {
				var chartScheme = new AmCharts.AmStockChart();
				chartScheme.pathToImages = '../ChartNew/amcharts/images/';

				// DATASETS //////////////////////////////////////////
				// create data sets first
				var dataSet1 = new AmCharts.DataSet();
				dataSet1.title = 'Inv. on suggested amt';
				dataSet1.fieldMappings = [{
					fromField: 'value',
					toField: 'value'
				}, {
					fromField: 'volume',
					toField: 'volume'
				}];
				dataSet1.dataProvider = chartData1;
				dataSet1.categoryField = 'date';
                dataSet1.lineThickness = 1;
                                

				var dataSet2 = new AmCharts.DataSet();
				dataSet2.title = 'Suggested Amt. Performance';
				dataSet2.fieldMappings = [{
					fromField: 'value',
					toField: 'value'
				}, {
					fromField: 'volume',
					toField: 'volume'
				}];
				dataSet2.dataProvider = chartData2;
				dataSet2.categoryField = 'date';
                dataSet2.lineThickness = 1;

				var dataSet3 = new AmCharts.DataSet();
				dataSet3.title = 'Actual Amt. Performance';
				dataSet3.fieldMappings = [{
					fromField: 'value',
					toField: 'value'
				}, {
					fromField: 'volume',
					toField: 'volume'
				}];
				dataSet3.dataProvider = chartData3;
				dataSet3.categoryField = 'date';
                dataSet3.lineThickness = 1;

				

				// set data sets to the chart
				chartScheme.dataSets = [dataSet1, dataSet2, dataSet3];

				// PANELS ///////////////////////////////////////////                                                  
				// first stock panel
				var stockPanel1 = new AmCharts.StockPanel();
				stockPanel1.showCategoryAxis = false;
				stockPanel1.title = 'Value';
				stockPanel1.percentHeight = 70;

				// graph of first stock panel
				var graph1 = new AmCharts.StockGraph();
				graph1.valueField = 'value';
				graph1.comparable = true;
				graph1.compareField = 'value';
                graph1.lineThickness = 1;
				stockPanel1.addStockGraph(graph1);

				// create stock legend                
				stockPanel1.stockLegend = new AmCharts.StockLegend();


				// second stock panel
				var stockPanel2 = new AmCharts.StockPanel();				
				stockPanel2.percentHeight = 10;
                stockPanel2.backgroundColor = '#ff0000';
				var graph2 = new AmCharts.StockGraph();
				//graph2.valueField = 'volume';
				//graph2.type = 'column';
				//graph2.showBalloon = false;
				graph2.fillAlphas = 1;
				//stockPanel2.addStockGraph(graph2);
				stockPanel2.stockLegend = new AmCharts.StockLegend();
				
				// set panels to the chart
				chartScheme.panels = [stockPanel1, stockPanel2];


				// OTHER SETTINGS ////////////////////////////////////
				 sbsettings = new AmCharts.ChartScrollbarSettings();
				sbsettings.graph = graph1;
				chartScheme.chartScrollbarSettings = sbsettings;
				

				// PERIOD SELECTOR ///////////////////////////////////
				var periodSelector = new AmCharts.PeriodSelector();
				periodSelector.position = 'left';
                periodSelector.inputFieldsEnabled = false;
				periodSelector.periods = [{
					period: 'DD',
					count: 10,
					label: '10 days'
				}, {
					period: 'MM',					
					count: 1,
					label: '1 month'
				}, {
					period: 'YYYY',
					count: 1,
					label: '1 year'
				}, {
					period: 'YTD',
					label: 'YTD'
				}, {
					period: 'MAX',
                    selected: true,
					label: 'MAX'
				}];
				chartScheme.periodSelector = periodSelector;

				// DATA SET SELECTOR
				var dataSetSelector = new AmCharts.DataSetSelector();
				dataSetSelector.position = 'left';
                dataSetSelector.width = 200;
				chartScheme.dataSetSelector = dataSetSelector;                                                                
                                
				chartScheme.write('retirementChartDiv');
			}
		</script> ");



            ltGoalSchChart.Text = strGoalSchChart.ToString();



            //}
            //catch
            //{
            //}
            //finally
            //{
            dsGoalChartData.Dispose();
            strGoalSchChart.Clear();
            //}
        
    }
}