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

public partial class Website_FreePlanOutput : System.Web.UI.Page
{
    SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ToString());
    string xStr = "";
    SqlCommand cmd;
    string riskCode = "0";
    string xRiskPer = "11";
    double xCurrExpen = 0;
    int xNoRetYear = 0;
    int xAfterRetAge = 0;
    string xAcType = "";
    double xGrossIncome = 0;
    double xSumAssured = 0;
    double xAddInsu = 0;
    double xAddInsu2 = 0;
    double xInflation = 7;
    double xPostROI = 9;

    protected void Page_Load(object sender, EventArgs e)
    {

        if (!Page.IsPostBack)
        {
            //riskCode = Request.QueryString["risk"];

            ViewState["userid"] = Session["userSessionID"].ToString();


            /*if (riskCode == "A")
            { }
            else
            {
                Con.Open();
                // Code for Planner Role
                xStr = "update fp_Prospects set RiskCode='" + riskCode + "', OpType1='Free' where userid='" + ViewState["userid"] + "'";

                SqlCommand cmd = new SqlCommand(xStr, Con);
                cmd.ExecuteNonQuery();
                Con.Close();
            }*/


            // Select Risk from table fp_prospects                                        
            SqlDataAdapter InvGDA = new SqlDataAdapter(" " +

                    " select OpType1, GrossIncome, RiskCode=isnull(riskCode,0), ROR=(select ROR from fp_riskper where srno=p.riskcode), " +
                    " RiskName=(select Risk from fp_riskper where srno=p.riskcode) " +
                    " from fp_prospects p where userid='" + ViewState["userid"] + "' " +
                    "  ", Con);

            DataSet InvGDS = new DataSet();
            Con.Open();
            InvGDA.Fill(InvGDS);
            Con.Close();

            if (InvGDS.Tables[0].Rows.Count > 0)
            {
                lblRiskName.Text = InvGDS.Tables[0].Rows[0]["RiskName"].ToString();
                xRiskPer = InvGDS.Tables[0].Rows[0]["ROR"].ToString();
                xAcType = InvGDS.Tables[0].Rows[0]["OpType1"].ToString();
                xGrossIncome = Convert.ToDouble(InvGDS.Tables[0].Rows[0]["GrossIncome"]);
            }

            if (xAcType == "Paid")
            {
                //InsuranceSectionFree.Visible = true;
            }

            IdealInsurance.Text = (xGrossIncome * 10).ToString("##,##,###");

            // Select LI Insurance from table fp_Insurance                                        
            SqlDataAdapter InsGDA = new SqlDataAdapter(" " +

                    " select SumAssured=isnull(Sum(SumAssured),0) from fp_Insurance where Product='LI' "+
                    " and ClientCode=(select code from fp_prospects where userid='" + ViewState["userid"] + "') " +                    
                    "  ", Con);

            DataSet InsGDS = new DataSet();
            Con.Open();
            InsGDA.Fill(InsGDS);
            Con.Close();

            if (InvGDS.Tables[0].Rows.Count > 0)
            {
                xSumAssured = Convert.ToDouble(InsGDS.Tables[0].Rows[0]["SumAssured"]);                
            }

            ExistingInsurance.Text = xSumAssured.ToString("##,##,###");

            xAddInsu = ((xGrossIncome * 10) - xSumAssured);

            if (xAddInsu < 0)
            {
                AddInsurance.Text = "Sufficiently Covered";
                xAddInsu2 = 0;
            }
            else 
            {
                AddInsurance.Text = ((xGrossIncome * 10) - xSumAssured).ToString("##,##,###");
                xAddInsu2 = ((xGrossIncome * 10) - xSumAssured);
            }

            //Display Goal
            FillGridGoal_Planning();

            // Bind Charts  
            BindChart();

            // goal Timeline chart
            BindGoalChart();

            // Insurance chart
            BindInsuChart();

            // Retirement Chart
            //BindRetChart();

            // Code for retirement
            //RetirementPlanning(); 

            //All Retirement
            Retirement_Calculation();
           
            


        }
    }

    // To get the goals of the user and fill in the grid
    void FillGridGoal_Planning()
    {
        if ((string)Session["userSessionID"] != null)
        {
            string xCode = Session["userSessionID"].ToString();

            SqlDataAdapter GDA = new SqlDataAdapter(" " +

                    " select GoalName, CurrentValue=Amount, " +
                    " GoalYear=(SELECT REPLACE(RIGHT(CONVERT(VARCHAR(11), StartDate, 106), 8), ' ', '-')),  " +
                    " Period=(year(startdate)-year(getdate())), " +
                    " AmountReq=cast(round((Amount*(power(1+(" + xInflation + "*1.000000/100),(datediff(M,getdate(),startdate)/12.000)))),0) as int), " +
                    " AnnualAmt=cast((((Amount*(power(1+(" + xInflation + "*1.000000/100),(datediff(M,getdate(),startdate)/12.000))))*(" + xRiskPer + "*1.000000/100))/ " +
                    " (power((1+" + xRiskPer + "*1.000000/100),(datediff(M,getdate(),startdate)/12.000))-1)) as int), " +
                    " SIPAmt=floor(round(((((Amount*(power(1+(" + xInflation + "*1.000000/100),(datediff(M,getdate(),startdate)/12.000))))*(" + xRiskPer + "*1.000000/100))/ " +
                    " (power((1+" + xRiskPer + "*1.000000/100),(datediff(M,getdate(),startdate)/12.000))-1))/12)/1000,0,0)    )*1000 " +
                    " from fp_GoalDetails where GroupCode=(select Code from fp_prospects where userid='" + xCode + "' ) and GoalCode<>7 order by startdate  " +
                    "  ", Con);

            DataSet GDS = new DataSet();
            Con.Open();
            GDA.Fill(GDS);
            Con.Close();

            GridViewGoalPlanning.DataSource = GDS;
            GridViewGoalPlanning.DataBind();

        }
        else
        {
            Response.Redirect("SessionExpired.aspx");
        }
    }

    protected void OnPaging(object sender, GridViewPageEventArgs e)
    {
        GridViewGoalPlanning.PageIndex = e.NewPageIndex;
        GridViewGoalPlanning.DataBind();
        FillGridGoal_Planning();

    }

    private void BindChart()
    {
        DataTable dsChartData = new DataTable();
        StringBuilder strScript = new StringBuilder();

        //try
        //{            
        dsChartData = GetChartData();

        strScript.Append(@"<script type='text/javascript'>
                                                var chart1;
                                                var legend1;
                                    
                                                var chartData1 = [");

        foreach (DataRow row in dsChartData.Rows)
        {
            strScript.Append("{");
            strScript.Append(" country: '" + row["Category"] + "',");
            strScript.Append(" litres: " + row["AllAmt"] + "");
            strScript.Append("},");

        }
        strScript.Remove(strScript.Length - 1, 1);
        strScript.Append("];");
        /*strScript.Append(@"{
                                                country: 'Equity',
                                                litres: 210.74
                                            }, {
                                                country: 'Debt',
                                                litres: 88.82
                                            }, {
                                                country: 'Other',
                                                litres: 0.23
                                            }];");*/
        strScript.Append(@"AmCharts.ready(function () {
                                                    // PIE CHART
                                                    chart1 = new AmCharts.AmPieChart();
                                                    chart1.dataProvider = chartData1;
                                                    chart1.titleField = 'country';
                                                    chart1.valueField = 'litres';
													chart1.labelsEnabled = true;
                                                    chart1.labelText = '[[percents]]%';
													chart1.labelRadius = 5;
                                                    chart1.fontSize = 10;
													chart1.depth3D = 10;
													chart1.minRadius = 20;
													chart1.radius = 70;
                                                    chart1.fontFamily = 'Roboto';
                                                    
                                    
                                                    // LEGEND
                                                    
													legend1 = new AmCharts.AmLegend();
                                                    legend1.align = 'bottom';
                                                    legend1.markerType = 'circle';
                                                    legend1.markerSize = 7;
                                                    legend1.equalWidths = false;
                                                    legend1.marginLeft = 5;
                                                    legend1.marginRight = 5;
                                                    legend1.spacing = 4;
                                                    chart1.addLegend(legend1);
                                    
                                                    // WRITE
                                                    chart1.write('AssetChart');
                                                }); ");


        strScript.Append(" </script>");


        ltScripts.Text = strScript.ToString();

        //}
        //catch
        //{
        //}
        //finally
        //{
        dsChartData.Dispose();
        strScript.Clear();
        //}
    }

    /// <summary>  
    /// fetch data from mdf file saved in app_data  
    /// </summary>  
    /// <returns>DataTable</returns>  
    private DataTable GetChartData()
    {
        DataSet dsData = new DataSet();

        SqlDataAdapter DA = new SqlDataAdapter(" " +
                " select AllAmt=sum(SIPAMT), Category from ( " +
                " select " +
                " SIPAmt=floor(round(((((Amount*(power(1+(" + xInflation + "*1.000000/100),(year(startdate)-year(getdate())))))*(" + xRiskPer + "*1.000000/100))/ " +
                " (power((1+" + xRiskPer + "*1.000000/100),datediff(M,getdate(),startdate)/12.000)-1))/12)/1000,0,0)    )*1000   , " +
                " Category=(select category from fp_RiskObjMatrix where riskcode=p.riskcode and " +
                " (year(startdate)-year(getdate()))*12 between frommonth and tomonth) " +
                " from fp_GoalDetails g, fp_prospects p where g.GroupCode=(select Code from fp_prospects where userid='" + ViewState["userid"] + "' ) " +
                " and g.GroupCode=p.Code " +
                " )z group by category " +
                "  ", Con);

        DataSet DS = new DataSet();
        Con.Open();
        DA.Fill(DS);
        Con.Close();

        return DS.Tables[0];

    }    


    private void BindGoalChart()
    {
        DataTable dsGoalChartData = new DataTable();
        StringBuilder strGoalScript = new StringBuilder();
        int ctr = 0;

        //try
        //{            
        dsGoalChartData = GetGoalChartData();
        string[] color = { "#0D8ECF", "#0D52D1", "#FF0F00", "#FF6600", "#FF9E01", "#FCD202", "#F8FF01", "#B0DE09", "#04D215", "#0D8ECF", "#0D52D1", "#FF0F00", "#FF6600", "#FF9E01", "#FCD202", "#F8FF01", "#B0DE09", "#04D215", "#0D8ECF", "#0D52D1", "#FF0F00", "#FF6600", "#FF9E01", "#FCD202", };
        strGoalScript.Append(@"<script type='text/javascript'>
            var chart;

            var chartData = [ ");
        foreach (DataRow row in dsGoalChartData.Rows)
        {
            ctr++;
            strGoalScript.Append("{");
            strGoalScript.Append(" 'goalname': \"" + row["GoalName"] + "\",");
            strGoalScript.Append(" 'goalcatg': \"" + row["GoalCategory"] + "\",");
            strGoalScript.Append(" 'points': 3,");
            strGoalScript.Append(" 'GoalTime': " + row["GoalPeriod"] + ",");
            strGoalScript.Append(" 'color': '" + color[ctr] + "'");
            strGoalScript.Append("},");

        }
        strGoalScript.Remove(strGoalScript.Length - 1, 1);
        strGoalScript.Append("];");


        strGoalScript.Append(@"AmCharts.ready(function () {
                // SERIAL CHART
                chart = new AmCharts.AmSerialChart();
                chart.dataProvider = chartData;
                chart.categoryField = 'GoalTime';
                //chart.columnWidth = 0.1;
                // the following two lines makes chart 3D
                //chart.depth3D = 20;
                //chart.angle = 30;
                chart.fontFamily='Roboto';
                chart.fontSize = 12;
               

                // AXES
                // category
                var categoryAxis = chart.categoryAxis;
                //categoryAxis.labelRotation = 90;
                categoryAxis.dashLength = 5;
                categoryAxis.title = 'Goal Time Line (Years)';
                categoryAxis.gridAlpha = 0;
                //categoryAxis.axisAlpha = 0;
                categoryAxis.gridPosition = 'start';

                // value
                var valueAxis = new AmCharts.ValueAxis();
                valueAxis.minimum = 0;
                valueAxis.axisAlpha = 0;
                valueAxis.gridAlpha = 0;
                valueAxis.maximum = 20;
                valueAxis.dashLength = 4;
                valueAxis.color = '#f1f1f1';
                chart.addValueAxis(valueAxis);

                // GRAPH
                var graph = new AmCharts.AmGraph();
                graph.valueField = 'points';
                graph.colorField = 'color';
                graph.balloonText = '';
                graph.type = 'column';
                graph.columnWidth = 0.2;
                graph.labelText = '[[goalcatg]]';
                graph.balloonText = '[[goalname]]';
                graph.fontSize = 12;
                graph.columnSpacing = 10;
                graph.fixedColumnWidth = 10;
                graph.dashLength = 1;
                graph.labelOffset = 2;
                graph.lineAlpha = 0;
                graph.fillAlphas = 1;
                chart.addGraph(graph);

                // CURSOR
                var chartCursor = new AmCharts.ChartCursor();
                chartCursor.cursorAlpha = 0;
                chartCursor.zoomable = false;
                chartCursor.categoryBalloonEnabled = false;
                chart.addChartCursor(chartCursor);

                chart.creditsPosition = 'top-right';


                // WRITE
                chart.write('goalchart');
            });
        </script>");


        ltGoalScripts.Text = strGoalScript.ToString();

        //}
        //catch
        //{
        //}
        //finally
        //{
        dsGoalChartData.Dispose();
        strGoalScript.Clear();
        //}
    }

    /// <summary>  
    /// fetch data for Goal Timeline     
    private DataTable GetGoalChartData()
    {
        DataSet dsData = new DataSet();

        if ((string)Session["userSessionID"] != null)
        {
            string xCode = Session["userSessionID"].ToString();

            SqlDataAdapter DA = new SqlDataAdapter(" " +
                    " select GoalCategory=(select Goalname from fp_goalmaster where Code=g.GoalCode ), " +
                    " GoalName, GoalPeriod=(year(startdate)-year(getdate())) from fp_goaldetails g  " +
                    " where groupcode=(select code from fp_prospects where UserID='" + xCode + "') " +
                    " order by (year(startdate)-year(getdate())) " +
                    "  ", Con);

            DataSet DS = new DataSet();
            Con.Open();
            DA.Fill(DS);
            Con.Close();

            return DS.Tables[0];
        }
        else
        {
            Response.Redirect("SessionExpired.aspx");
            return null;
        }

    }

    // For Insurance Chart
    private void BindInsuChart()
    {
        DataTable dsGoalChartData = new DataTable();
        StringBuilder strInsuScript = new StringBuilder();
        dsGoalChartData = GetGoalChartData();

        //try
        //{            


        strInsuScript.Append(@"<script type='text/javascript'>
            var chartInsu;

            var chartDataInsu = [ ");
            strInsuScript.Append("{");
                strInsuScript.Append("InsuType: 'Ideal Insurance',");
                strInsuScript.Append(" InsuAmt: '" + xGrossIncome * 10 + "',");                
                strInsuScript.Append("color: '#0399c4'");
            strInsuScript.Append("}, {");
                strInsuScript.Append("InsuType: 'Existing Insurance',");
                strInsuScript.Append("InsuAmt: 5200000,");
                strInsuScript.Append(" InsuAmt: '" + xSumAssured + "',");
                strInsuScript.Append("color: '#FF6600'");
            strInsuScript.Append("}, {");
                strInsuScript.Append("InsuType: 'Additional Required',");
                strInsuScript.Append(" InsuAmt: '" + xAddInsu2 + "',");
                strInsuScript.Append("color: '#ff0000'");
                strInsuScript.Append("}");
        strInsuScript.Append("];");


        strInsuScript.Append(@"AmCharts.ready(function () {
                // SERIAL CHART
                chartInsu = new AmCharts.AmSerialChart();
                chartInsu.dataProvider = chartDataInsu;
                chartInsu.categoryField = 'InsuType';
                // the following two lines makes chart 3D
                //chartInsu.depth3D = 20;
                //chartInsu.angle = 30;
                chartInsu.fontFamily='Roboto';
                chartInsu.fontSize = 11;

                // AXES
                // category
                var categoryAxis = chartInsu.categoryAxis;
                categoryAxis.labelRotation = 0;
                categoryAxis.dashLength = 5;
                categoryAxis.labelsEnabled = true;                
                categoryAxis.fontSize = 0;
                categoryAxis.gridColor = '#ff0000';
                categoryAxis.gridAlpha = 0;

                // value
                var valueAxis = new AmCharts.ValueAxis();
                valueAxis.title = 'Amount (Rs.)';
                valueAxis.dashLength = 5;
                valueAxis.gridAlpha = 0;
                chartInsu.addValueAxis(valueAxis);
                

                // GRAPH            
                var graph = new AmCharts.AmGraph();
                graph.valueField = 'InsuAmt';
                graph.colorField = 'color';
                graph.balloonText = '[[category]]: [[value]]';
                graph.type = 'column';
                graph.labelText='[[InsuType]]';
                graph.fontSize = 11;
                graph.lineAlpha = 0;
                graph.fillAlphas = 1;
                chartInsu.addGraph(graph);                                
                
                // WRITE
                chartInsu.write('insuranceChartDiv');
            });
        </script>");


        ltInsuchartScripts.Text = strInsuScript.ToString();

        //}
        //catch
        //{
        //}
        //finally
        //{
        dsGoalChartData.Dispose();
        strInsuScript.Clear();
        //}
    }

    /// <summary>  
    /// fetch data for Goal Timeline     
    private DataTable GetInsuChartData()
    {
        DataSet dsData = new DataSet();

        if ((string)Session["userSessionID"] != null)
        {
            string xCode = Session["userSessionID"].ToString();

            SqlDataAdapter DA = new SqlDataAdapter(" " +
                    " select GoalCategory=(select Goalname from fp_goalmaster where Code=g.GoalCode ), " +
                    " GoalName, GoalPeriod=(year(startdate)-year(getdate())) from fp_goaldetails g  " +
                    " where groupcode=(select code from fp_prospects where UserID='" + xCode + "') " +
                    " order by (year(startdate)-year(getdate())) " +
                    "  ", Con);

            DataSet DS = new DataSet();
            Con.Open();
            DA.Fill(DS);
            Con.Close();

            return DS.Tables[0];
        }
        else
        {
            Response.Redirect("SessionExpired.aspx");
            return null;
        }

    }    

    //For Retirement Calculation
    private void Retirement_Calculation()
    {
        double MonExpRet = 0;
        double CorpusReq = 0;
        double xInflation = 7;
        double xPostROI = 9;
        double xRRR = 0;
        double xExpense = 0;
        double xTotalExpense = 0;
        double xPV = 0;
        double xROR = Convert.ToDouble(xRiskPer);
        int xEntryYear = 0;

        if ((string)Session["userSessionID"] != null)
        {
            string xCode = Session["userSessionID"].ToString();

            SqlDataAdapter DA = new SqlDataAdapter(" " +

                    " select CurrentValue=CurrentExpenditure, LifeExpectancy,  RetYear=year(StartDate), EntryYear=year(EntryDate), " +
                    " RetAge=(year(StartDate)-year(EntryDate)), " +
                    " AmountReq=cast(round((CurrentExpenditure*(power(1+(" + xInflation+ "*1.000000/100),(year(startdate)-year(getdate()))))),0) as int), " +
                    " Period=(LifeExpectancy-(year(StartDate)-(select year(DOB) from fp_prospects where userid='" + xCode + "'))) " +
                    " from fp_GoalDetails where GroupCode=(select Code from fp_prospects where userid='" + xCode + "' ) " +
                    " and CurrentExpenditure is not NULL " +
                    "  ", Con);

            DataSet DS = new DataSet();
            Con.Open();
            DA.Fill(DS);
            Con.Close();

            if (DS.Tables[0].Rows.Count > 0)
            {
                lblAnnualExpense.Text = Convert.ToDouble(DS.Tables[0].Rows[0]["CurrentValue"]).ToString("##,##,###");
                lblRetirementAge.Text = DS.Tables[0].Rows[0]["RetAge"].ToString();
                lblLifeExpectency.Text = DS.Tables[0].Rows[0]["LifeExpectancy"].ToString();
                xAfterRetAge = Convert.ToInt32(DS.Tables[0].Rows[0]["Period"]);
                xCurrExpen = Convert.ToDouble(DS.Tables[0].Rows[0]["CurrentValue"]);
                xNoRetYear = Convert.ToInt32(DS.Tables[0].Rows[0]["RetAge"]);
                xEntryYear = Convert.ToInt32(DS.Tables[0].Rows[0]["EntryYear"]);
            }
        }
        else
        {
            Response.Redirect("SessionExpired.aspx");
        }


        //Calculation for Real rate of return
        
        //xRRR = xPostROI/100;
        xRRR = ((xPostROI - xInflation) / (1 + 0.01 * xInflation))/100;


        //Calculation for Yearly expense after retirement        
        MonExpRet = Math.Round(xCurrExpen * Math.Pow((1 + 7 * 1.0000 / 100), xNoRetYear), 0);

        //Calculation for Corpus
        for (int j = 1; j < xAfterRetAge; j++)
        {
            //Calculation for Expenses
            //xExpense = MonExpRet * Math.Pow((1 + (xInflation*1.00000 / 100)), j);
            xExpense = MonExpRet * Math.Pow((1 + .01 * xInflation), j);

            //Calculation for PV
            xPV = xExpense / Math.Pow((1 + (xRRR) * 1.0000), j);
            CorpusReq =CorpusReq + xPV;
            
        }
        lblCorpus.Text = Math.Round(CorpusReq, 0).ToString("##,##,###");

        //Calculation for SIP
        double prin = 0;
        double prin2 = 0;
        double amt = CorpusReq;
        double tme = xAfterRetAge;
        //double intr = 15;
        double intper = xROR / 1200;
        double tmemnth = xNoRetYear * 12;

        double powr = Math.Pow((1 + intper), tmemnth);
        prin = ((amt * ((intper * powr) / (powr - 1))) / powr);
        prin2 = Math.Round(prin / 100, 0) * 100;

        lblMonthlyInvestments.Text = prin2.ToString("##,##,###");
        lblAnnualInvestments.Text = Math.Round((prin*12), 0).ToString("##,##,###");

        //Chart code start here
        DataTable dsGoalChartData = new DataTable();
        StringBuilder strRetcript = new StringBuilder();
        dsGoalChartData = GetGoalChartData();
        
        strRetcript.Append(@"<script type='text/javascript'>
            var retchart;
            var retgraph;
            
            var retchartData = [ ");

        int retYear = xEntryYear;
        double xAmountReq = 0;
        double xPrin = 0;
        double xCumAmount = 0;
        double xSNegCumAmount = 0;
        double xFNegCumAmount = 0;
        int NoofSIP = xNoRetYear * 12;



        for (int j = 0; j < NoofSIP; j++)
        {

            if (j == 1)
            {
                xPrin = prin;
                xCumAmount = prin;
            }
            else
            {
                xPrin = xCumAmount+prin;
                xCumAmount = Math.Round(xPrin * Math.Pow((1 + xROR * 1.0000 / 1200), 1), 0);
            }

            if (j % 12 == 0)
            {
                strRetcript.Append("{");
                strRetcript.Append("'year': '" + retYear + "',");
                strRetcript.Append("'value': " + xCumAmount + ",");
                strRetcript.Append("},");
                retYear++;
            }



        }
        int guideYear = retYear;
        xPrin = xCumAmount + prin;
        xCumAmount = Math.Round(xPrin * Math.Pow((1 + xROR * 1.0000 / 1200), 1), 0);

            strRetcript.Append("{");
            strRetcript.Append("'year': '" + retYear + "',");
            strRetcript.Append("'value': " + xCumAmount + ",");
            strRetcript.Append("},");
            retYear++;

            xSNegCumAmount = xCumAmount;

            for (int j = 1; j < xAfterRetAge; j++)
            {
                //Calculation for Expenses
                xExpense = MonExpRet * Math.Pow((1 + (xInflation * 1.00000 / 100)), j);

                xFNegCumAmount = xSNegCumAmount - xExpense;

                xFNegCumAmount = xFNegCumAmount * Math.Pow((1 + (xRRR * 1.00000)), 1);

                xSNegCumAmount = xFNegCumAmount;

                if (xFNegCumAmount < 0)
                { xFNegCumAmount = 0; }

                strRetcript.Append("{");
                strRetcript.Append("'year': '" + retYear + "',");
                strRetcript.Append("'value': " + Math.Round(xFNegCumAmount,0) + ",");
                strRetcript.Append("},");
                retYear++;
            }

        strRetcript.Remove(strRetcript.Length - 1, 1);
        strRetcript.Append("];");


        strRetcript.Append(@"AmCharts.ready(function () {
                // SERIAL CHART
                retchart = new AmCharts.AmSerialChart();
                retchart.pathToImages = 'ChartNew/amcharts/images/';
                retchart.dataProvider = retchartData;
                retchart.marginLeft = 10;
                retchart.categoryField = 'year';
                retchart.dataDateFormat = 'YYYY';                

                // AXES
                // category
                var categoryAxis = retchart.categoryAxis;
                //categoryAxis.parseDates = true; // as our data is date-based, we set parseDates to true
                //categoryAxis.minPeriod = 'YYYY'; // our data is yearly, so we set minPeriod to YYYY
                categoryAxis.dashLength = 3;
                categoryAxis.gridAlpha = 0;
                //categoryAxis.minorGridEnabled = true;
                //categoryAxis.minorGridAlpha = 0.1;

                // value
                var valueAxis = new AmCharts.ValueAxis();
                valueAxis.axisAlpha = 1;
                valueAxis.inside = true;
                valueAxis.dashLength = 3;
                valueAxis.gridAlpha = 0;
                retchart.addValueAxis(valueAxis);

                // GRAPH
                retgraph = new AmCharts.AmGraph();
                retgraph.type = 'smoothedLine'; // this line makes the graph smoothed line.
                retgraph.lineColor = '#d1655d';
                retgraph.negativeLineColor = '#637bb6'; // this line makes the graph to change color when it drops below 0
                retgraph.bullet = 'round';
                retgraph.bulletSize = 8;
                retgraph.bulletBorderColor = '#FFFFFF';
                retgraph.bulletBorderAlpha = 1;
                retgraph.bulletBorderThickness = 2;
                retgraph.lineThickness = 2;
                retgraph.valueField = 'value';
                //graph.balloonText = '[[category]]<br><b><span style='font-size:14px;'>[[value]]</span></b>';
                retchart.addGraph(retgraph);

                // first guide
                var guide1 = new AmCharts.Guide(); ");
                strRetcript.Append("guide1.category = '" + guideYear + "';");
                strRetcript.Append(@"guide1.lineColor = '#CC0000';
                guide1.lineAlpha = 1;
                guide1.dashLength = 2;
                guide1.position = 'vertical';
                guide1.inside = true;
                guide1.labelRotation = 90;
                guide1.label = 'Retirement Age';
                categoryAxis.addGuide(guide1);

                // CURSOR
                var chartCursor = new AmCharts.ChartCursor();
                chartCursor.cursorAlpha = 0;
                chartCursor.cursorPosition = 'mouse';
                chartCursor.categoryBalloonDateFormat = 'YYYY';
                retchart.addChartCursor(chartCursor);                

                // WRITE
                retchart.write('retirementChartDiv');
            });

            
        </script>");


        ltRetirementChart.Text = strRetcript.ToString();

        
        dsGoalChartData.Dispose();
        strRetcript.Clear();
        

    }

}