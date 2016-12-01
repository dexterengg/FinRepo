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

public partial class MyDashBoard : System.Web.UI.Page
{
    SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ToString());
    string xStr = "";
    SqlCommand cmd;
    string xRiskCode = "0";
    string xRiskPer = "11";
    double xCurrExpen = 0;
    int xNoRetYear = 0;
    int xAfterRetAge = 0;
    double xGrossIncome = 0;
    double xSumAssured = 0;
    double xAddInsu = 0;
    double xInflation = 7;
    double xPostROI = 9;

    // Connection from My-portfolio
    SqlConnection mycon = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ToString());
    string xMyStr = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        try { 
        if (!Page.IsPostBack)
        {            

            ViewState["userid"] = Session["userSessionID"].ToString();
            
            // Select Risk from table fp_prospects                                        
            SqlDataAdapter InvGDA = new SqlDataAdapter(" " +

                    " select Name, OPType1, GrossIncome, RiskCode=isnull(riskCode,0), ROR=(select ROR from fp_riskper where srno=p.riskcode), " +
                    " RiskName=(select Risk from fp_riskper where srno=p.riskcode) "+
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
                //lblClientName.Text = InvGDS.Tables[0].Rows[0]["Name"].ToString();
                lblAccoutStatus.Text = InvGDS.Tables[0].Rows[0]["OPType1"].ToString();
                xRiskCode = InvGDS.Tables[0].Rows[0]["RiskCode"].ToString();
                xGrossIncome = Convert.ToDouble(InvGDS.Tables[0].Rows[0]["GrossIncome"]);
                            
            }

            IdealInsurance.Text = (xGrossIncome * 10).ToString("##,##,###");
            // Select LI Insurance from table fp_Insurance                                        
            SqlDataAdapter InsGDA = new SqlDataAdapter(" " +

                    " select SumAssured=isnull(Sum(SumAssured),0) from fp_Insurance where Product='LI' " +
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
                
            }
            else
            {
                AddInsurance.Text = ((xGrossIncome * 10) - xSumAssured).ToString("##,##,###");
                
            }

            if (xRiskCode != "0")
            {
                DivExistingInvestor.Visible = true;
                DivNewInvestor.Visible = false;    

                //Display Goal
                FillGridGoal_Planning();

                // Bind Suggested Investments Chart
                BindChart();

                // Bind Actual investments Chart
                BindActualInvestmentChart();

                // Code for retirement
                //RetirementPlanning();                
                Retirement_Calculation();

                //Investment Summary
                FillGridInvestment_Summary();
            }
            else
            {
                DivExistingInvestor.Visible = false;
                DivNewInvestor.Visible = true;
            }

            
        } 
            }
        catch(Exception ex){

        }
    }

    // To get the goals of the user and fill in the grid
    void FillGridGoal_Planning()
    {
        if ((string)Session["userSessionID"] != null)
        {
            string xCode = Session["userSessionID"].ToString();

            SqlDataAdapter GDA = new SqlDataAdapter(" " +
                    " select Code=g.code,ShName=case when isnull(g.exlcode,'')='' then s.sname else (select sname from schmst where exlcode=g.exlcode) end, CurrentValue=Amount,  SExlcode=s.Exlcode, ActualInvestment=isnull(ActualInvestment,0), (year(startdate)-year(EntryDate))*12,GoalName, " +
                    " GoalYear=(SELECT REPLACE(RIGHT(CONVERT(VARCHAR(11), StartDate, 106), 8), ' ', '-')),  "+
                    " Period=(year(startdate)-year(getdate())), "+
                    " AmountReq=cast(round((Amount*(power(1+(" + xInflation + "*1.000000/100),(datediff(M,getdate(),startdate)/12.000)))),0) as int), " +
                    " SIPAmt=floor(round(((((Amount*(power(1+(" + xInflation + "*1.000000/100),(datediff(M,getdate(),startdate)/12.000))))*(" + xRiskPer + "*1.000000/100))/ " +
                    " (power((1+" + xRiskPer + "*1.000000/100),(datediff(M,getdate(),startdate)/12.000))-1))/12)/1000,0,0)    )*1000 " +
                    " from fp_GoalDetails g,fp_prospects p,fp_RiskObjMatrix r,fp_schemeMatrix s "+
                    " where g.GroupCode=p.code and p.riskcode=r.riskcode and r.Category=s.Category and GoalCode<>7  and "+
                    " (year(startdate)-year(getdate()))*12 between frommonth and tomonth and userid='" + xCode + "'  order by startdate  " +
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
            Response.Redirect("SessionExpired.aspx?ss=A");
        }
    }
    protected void OnPaging(object sender, GridViewPageEventArgs e)
    {
        GridViewGoalPlanning.PageIndex = e.NewPageIndex;
        GridViewGoalPlanning.DataBind();
        FillGridGoal_Planning();
    }    
    
    protected void GridViewGoalPlanning_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridViewGoalPlanning.EditIndex = e.NewEditIndex;

        FillGridGoal_Planning();
    }
    protected void GridViewGoalPlanning_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int code = Convert.ToInt32(GridViewGoalPlanning.DataKeys[e.RowIndex].Value.ToString());
        GridViewRow row = (GridViewRow)GridViewGoalPlanning.Rows[e.RowIndex];        

        TextBox actInv = (TextBox)row.Cells[8].Controls[0];
        //String schExlcode = GridViewGoalPlanning.Rows[e.RowIndex].Cells[9].Text;
        Label schExlcode = (Label)GridViewGoalPlanning.Rows[e.RowIndex].Cells[9].FindControl("sexlcode");

        

        GridViewGoalPlanning.EditIndex = -1;
        Con.Open();

        SqlCommand cmd = new SqlCommand("update fp_GoalDetails set ActualInvestment='" + actInv.Text + "', Exlcode='" + schExlcode.Text + "' where code='" + code + "'", Con);
        cmd.ExecuteNonQuery();
        Con.Close();
        FillGridGoal_Planning();

    }
    protected void GridViewGoalPlanning_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridViewGoalPlanning.EditIndex = -1;
        FillGridGoal_Planning();
    }

    private void BindChart()
    {
        DataTable dsChartData = new DataTable();
        StringBuilder strScript = new StringBuilder();
        int ctr = 0;
        string[] color = { "#0D8ECF", "#0D52D1", "#FF0F00", "#FF6600", "#FF9E01", "#FCD202", "#F8FF01", "#04D215" };

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
            strScript.Append(" litres: " + row["AllAmt"] + ",");
            strScript.Append(" color: '" + color[ctr] + "'");
            strScript.Append("},");
            ctr++;

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
                                                    chart1.colorField = 'color';
													chart1.minRadius = 20;
													chart1.radius = 80;
                                                    
                                    
                                                    // LEGEND
                                                    
													legend1 = new AmCharts.AmLegend();                                                    
                                                    legend1.position = 'bottom';
                                                    legend1.markerType = 'circle';
                                                    legend1.markerSize = 7;
                                                    legend1.equalWidths = true;
                                                    legend1.marginLeft = 5;
                                                    legend1.marginRight = 5;
                                                    legend1.spacing = 4;
                                                    chart1.addLegend(legend1);
                                    
                                                    // WRITE
                                                    chart1.write('AssetChart');
                                                }); ");


        strScript.Append(" </script>");


        ltScriptsSuggested.Text = strScript.ToString();


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
     
    private DataTable GetChartData()
    {
        DataSet dsData = new DataSet();        

        SqlDataAdapter DA = new SqlDataAdapter(" " +
                " select AllAmt=sum(SIPAMT), Category from ( "+
                " select "+
                " SIPAmt=floor(round(((((Amount*(power(1+(" + xInflation + "*1.000000/100),(year(startdate)-year(getdate())))))*(" + xRiskPer + "*1.000000/100))/ " +
                " (power((1+" + xRiskPer + "*1.000000/100),datediff(M,getdate(),startdate)/12.000)-1))/12)/1000,0,0)    )*1000   , " +
                " Category=(select category from fp_RiskObjMatrix where riskcode=p.riskcode and "+
                " (year(startdate)-year(getdate()))*12 between frommonth and tomonth) "+
                " from fp_GoalDetails g, fp_prospects p where g.GroupCode=(select Code from fp_prospects where userid='" + ViewState["userid"] + "' ) " +
                " and g.GroupCode=p.Code "+
                " )z group by category " +
                "  ", Con);

        DataSet DS = new DataSet();
        Con.Open();
        DA.Fill(DS);
        Con.Close();

        return DS.Tables[0];

    }

    // Chart for Actual Investments
    private void BindActualInvestmentChart()
    {
        DataTable dsChartData = new DataTable();
        StringBuilder strScriptActual = new StringBuilder();
        int ctr = 0;
        string[] color = { "#0D8ECF", "#0D52D1", "#FF0F00", "#FF6600", "#FF9E01", "#FCD202", "#F8FF01", "#04D215" };

        //try
        //{            
        dsChartData = GetChartActualData();

        strScriptActual.Append(@"<script type='text/javascript'>
                                                var chart2;
                                                var legend2;
                                    
                                                var chartData2 = [");

        foreach (DataRow row in dsChartData.Rows)
        {

            strScriptActual.Append("{");
            strScriptActual.Append(" country: '" + row["Objective"] + "',");
            strScriptActual.Append(" litres: " + row["Amt"] + ",");
            strScriptActual.Append(" color: '" + color[ctr] + "'");
            strScriptActual.Append("},");
            ctr++;

        }
        strScriptActual.Remove(strScriptActual.Length - 1, 1);
        strScriptActual.Append("];");
        
        strScriptActual.Append(@"AmCharts.ready(function () {
                                                    // PIE CHART
                                                    chart2 = new AmCharts.AmPieChart();
                                                    chart2.dataProvider = chartData2;
                                                    chart2.titleField = 'country';
                                                    chart2.valueField = 'litres';
													chart2.labelsEnabled = true;
                                                    chart2.labelText = '[[percents]]%';
													chart2.labelRadius = 5;
                                                    chart2.fontSize = 10;
													chart2.depth3D = 10;
                                                    chart2.colorField = 'color';
													chart2.minRadius = 20;
													chart2.radius = 80;
                                                    
                                    
                                                    // LEGEND
                                                    
													legend2 = new AmCharts.AmLegend();                                                    
                                                    legend2.position = 'bottom';
                                                    legend2.markerType = 'circle';
                                                    legend2.markerSize = 7;
                                                    legend2.equalWidths = true;
                                                    legend2.marginLeft = 5;
                                                    legend2.marginRight = 5;
                                                    legend2.spacing = 4;
                                                    chart2.addLegend(legend2);
                                    
                                                    // WRITE
                                                    chart2.write('actualAllocationChart');
                                                }); ");


        strScriptActual.Append(" </script>");


        ltScriptsActual.Text = strScriptActual.ToString();


        //}
        //catch
        //{
        //}
        //finally
        //{
        dsChartData.Dispose();
        strScriptActual.Clear();
        //}
    }

    private DataTable GetChartActualData()
    {
        DataSet dsData = new DataSet();

        SqlDataAdapter DA = new SqlDataAdapter(" " +
                " Select Objective, Amt=round(Sum(AUM),0,0) from " +
                " (select s.Objective, AUM=sum(unt)*n.nav from "+
                " (select bid,cid,fcode,scode,foliono,unt= sum(units) from purchase group by bid,cid,fcode,scode,foliono "+
                " Union All  "+
                " select bid,cid,fcode,scode,foliono,unt= sum(units)*-1  from sell  group by bid,cid,fcode,scode,foliono ) a, "+
                " nav_last n,schmst s,login l where n.exlcode=s.exlcode and Left(a.Fcode,1)='F' and a.fcode=s.fcode "+
                " and a.scode=s.scode and a.bid=left(l.userid,5) "+
                " and a.cid=right(userid,8) and a.bid='10003' and cid in (select right(userid,8) from login "+
                " where grp_lead='1000301C00001' ) group by s.Objective,n.NAV having sum(unt)<>0)x  "+
                " group by  Objective   " +
                "  ", Con);

        DataSet DS = new DataSet();
        Con.Open();
        DA.Fill(DS);
        Con.Close();

        return DS.Tables[0];

    }

    void RetirementPlanning()
    {
        if ((string)Session["userSessionID"] != null)
        {
            string xCode = Session["userSessionID"].ToString();

            SqlDataAdapter DA = new SqlDataAdapter(" " +

                    " select CurrentValue=CurrentExpenditure, "+
                    " RetAge=(year(StartDate)-(select year(DOB) from fp_prospects where userid='" + xCode + "')), " +
                    " Period=(year(startdate)-year(getdate())), "+
                    " AmountReq=cast(round((CurrentExpenditure*(power(1+(" + xInflation + "*1.000000/100),(year(startdate)-year(getdate()))))),0) as int), " +
                    " AnnualAmt=cast((((CurrentExpenditure*(power(1+(" + xInflation + "*1.000000/100),(year(startdate)-year(getdate())))))*(" + xRiskPer + "*1.000000/100))/ " +
                    " (power((1+" + xRiskPer + "*1.000000/100),(year(startdate)-year(getdate())))-1)) as int), " +
                    " SIPAmt=cast(((((CurrentExpenditure*(power(1+(" + xInflation + "*1.000000/100),(year(startdate)-year(getdate())))))*(" + xRiskPer + "*1.000000/100))/ " +
                    " (power((1+" + xRiskPer + "*1.000000/100),(year(startdate)-year(getdate())))-1))/12) as int) " +
                    " from fp_GoalDetails where GroupCode=(select Code from fp_prospects where userid='" + xCode + "' ) " +
                    " and CurrentExpenditure is not NULL   " +
                    "  ", Con);

            DataSet DS = new DataSet();
            Con.Open();
            DA.Fill(DS);
            Con.Close();

            if (DS.Tables[0].Rows.Count > 0)
            {
                lblAnnualExpense.Text = Convert.ToDouble(DS.Tables[0].Rows[0]["CurrentValue"]).ToString("##,##,###");
                lblRetirementAge.Text = DS.Tables[0].Rows[0]["RetAge"].ToString();
                lblExpPostRet.Text = Convert.ToDouble(DS.Tables[0].Rows[0]["AmountReq"]).ToString("##,##,###");
                lblAnnualInvestments.Text = Convert.ToDouble(DS.Tables[0].Rows[0]["AnnualAmt"]).ToString("##,##,###");
                lblMonthlyInvestments.Text = Convert.ToDouble(DS.Tables[0].Rows[0]["SIPAmt"]).ToString("##,##,###");
            }
            else 
            {
                retirementSection.Visible = false;
            }
        }
        else
        {
            Response.Redirect("SessionExpired.aspx?ss=B");
        }
    }
    // For Retirement Chart

    //For Retirement Calculation
    private void Retirement_Calculation()
    {
        double MonExpRet = 0;
        double CorpusReq = 0;        
        double xRRR = 0;
        double xExpense = 0;        
        double xPV = 0;
        double xROR = Convert.ToDouble(xRiskPer);
        int xEntryYear = 0;

        if ((string)Session["userSessionID"] != null)
        {
            string xCode = Session["userSessionID"].ToString();



            SqlDataAdapter DA = new SqlDataAdapter(" " +

                    " select CurrentValue=CurrentExpenditure, LifeExpectancy,  RetYear=year(StartDate), EntryYear=year(EntryDate), " +
                    " RetAge=(year(StartDate)-year(EntryDate)), " +
                    " AmountReq=cast(round((CurrentExpenditure*(power(1+(" + xInflation + "*1.000000/100),(year(startdate)-year(getdate()))))),0) as int), " +
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
                lblExpPostRet.Text = Convert.ToDouble(DS.Tables[0].Rows[0]["AmountReq"]).ToString("##,##,###");
                lblLifeExpectency.Text = DS.Tables[0].Rows[0]["LifeExpectancy"].ToString();
                xAfterRetAge = Convert.ToInt32(DS.Tables[0].Rows[0]["Period"]);
                xCurrExpen = Convert.ToDouble(DS.Tables[0].Rows[0]["CurrentValue"]);
                xNoRetYear = Convert.ToInt32(DS.Tables[0].Rows[0]["RetAge"]);
                xEntryYear = Convert.ToInt32(DS.Tables[0].Rows[0]["EntryYear"]);
            }
        }
        else
        {
            Response.Redirect("SessionExpired.aspx?ss=C");
        }


        //Calculation for Real rate of return
        xRRR = ((xPostROI - xInflation) / (1 + 0.01 * xInflation)) / 100;


        //Calculation for Monthly expense after retirement        
        MonExpRet = Math.Round(xCurrExpen * Math.Pow((1 + xInflation * 1.0000 / 100), xNoRetYear), 0);

        //Calculation for Corpus
        for (int j = 1; j < xAfterRetAge; j++)
        {
            //Calculation for Expenses
            xExpense = MonExpRet * Math.Pow((1 + (xInflation * 1.00000 / 100)), j);


            //Calculation for PV
            xPV = xExpense / Math.Pow((1 + (xRRR * 1.0000)), j);
            CorpusReq += xPV;

        }        
        lblCorpusRequired.Text = Math.Round(CorpusReq, 0).ToString("##,##,###");

        //Calculation for SIP
        double prin = 0;
        double prin2 = 0;
        double amt = CorpusReq;
        double tme = 15;        
        double intper = xROR / 1200;
        double tmemnth = xNoRetYear * 12;

        double powr = Math.Pow((1 + intper), tmemnth);
        prin = ((amt * ((intper * powr) / (powr - 1))) / powr);
        prin2 = Math.Round(prin / 100, 0) * 100;

        lblMonthlyInvestments.Text = prin2.ToString("##,##,###");
        lblAnnualInvestments.Text = Math.Round((prin * 12), 0).ToString("##,##,###");
        
    }
    
    void FillGridInvestment_Summary()
    {
        if ((string)Session["userSessionID"] != null)
        {
            string xCode = Session["userSessionID"].ToString();

            SqlDataAdapter GDA = new SqlDataAdapter(" " +
                    " select a.CID,Name=l.name,Sname=s.sname,FolioNo=a.foliono, AUM=sum(unt)*n.nav from       " +
                    " (select bid,cid,fcode,scode,foliono,unt= sum(units) from purchase group by bid,cid,fcode,scode,foliono "+
                    " Union All "+
                    " select bid,cid,fcode,scode,foliono,unt= sum(units)*-1  from sell  group by bid,cid,fcode,scode,foliono ) a, "+
                    " nav_last n,schmst s,login l where n.exlcode=s.exlcode and Left(a.Fcode,1)='F' and a.fcode=s.fcode "+
                    " and a.scode=s.scode and a.bid=left(l.userid,5) "+
                    " and a.cid=right(userid,8) and a.bid='10003xxxx' and cid in (select right(userid,8) from login "+
                    " where grp_lead='1000301C00001xxxx' ) group by a.CID,l.name,s.sname,a.foliono,n.NAV having sum(unt)<>0 " +
                    "  ", Con);

            DataSet GDS = new DataSet();
            Con.Open();
            GDA.Fill(GDS);
            Con.Close();

            GridViewInvestmentSummary.DataSource = GDS;
            GridViewInvestmentSummary.DataBind();

        }
        else
        {
            Response.Redirect("SessionExpired.aspx?ss=D");
        }
    }
}