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
using System.Web.Services;
using System.Web.Script.Serialization;
using System.Collections.Generic;

public partial class Admin_LeadDetails : System.Web.UI.Page
{
    SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ToString());
    string xStr = "";
    string xClientStatus = "";
    string xRisk = "";
    string xTimePeriod = "";
    string xAmount = "";
    string xPeriod = "";
    string xName = "";
    string userid = "";
    SqlCommand cmd;
    protected void Page_Load(object sender, EventArgs e)
    {
        List<string> clientstatuscodes = new List<string>();
        clientstatuscodes.Add("C4");
        clientstatuscodes.Add("C5");
        clientstatuscodes.Add("C12");
        clientstatuscodes.Add("C13");
        clientstatuscodes.Add("C15");
        clientstatuscodes.Add("C16");
        clientstatuscodes.Add("C17");
        clientstatuscodes.Add("C18");
        clientstatuscodes.Add("C19");
        clientstatuscodes.Add("C20");
        clientstatuscodes.Add("C21");
        clientstatuscodes.Add("C22");
        clientstatuscodes.Add("C23");
        clientstatuscodes.Add("C25");

        ViewState["xClientCode"] = Request.QueryString["clientcode"];

        if (!IsPostBack)
        {
            SqlDataAdapter DA = new SqlDataAdapter(" " +

                    " select UserID,pwd, clientStatus, RiskCode, FTimePeriod, FAmount, Name from fp_prospects where Code=" + ViewState["xClientCode"] + " " +
                    "  ", Con);

            DataSet DS = new DataSet();
            Con.Open();
            DA.Fill(DS);
            Con.Close();

            if (DS.Tables[0].Rows.Count > 0)
            {
                xClientStatus = DS.Tables[0].Rows[0]["clientStatus"].ToString();
                xRisk = DS.Tables[0].Rows[0]["RiskCode"].ToString();
                xTimePeriod = DS.Tables[0].Rows[0]["FTimePeriod"].ToString();
                xAmount = DS.Tables[0].Rows[0]["FAmount"].ToString();
                lblLeadName.Text = DS.Tables[0].Rows[0]["Name"].ToString();
                userid = DS.Tables[0].Rows[0]["UserID"].ToString();
                Session["Email"]=userid;
                Session["UserPass"] = DS.Tables[0].Rows[0]["pwd"].ToString(); 
            }

            setFPSelfieLeadDetails(userid);

            if (xClientStatus == "F")
            {
                accordion.Visible = false;
                FreeLeadDetail.Visible = true;
                FPSelfieLeadDetails.Visible = false;

                //******************************************
                //*************For Free user****************
                //******************************************
                if (xRisk == "2")
                {
                    imgRisk.ImageUrl = "images/risk-c.png";
                }

                if (xRisk == "3")
                {
                    imgRisk.ImageUrl = "images/risk-m.png";
                }
                if (xRisk == "4")
                {
                    imgRisk.ImageUrl = "images/risk-a.png";
                }

                //Code for Scheme Matrix
                if (xTimePeriod == "1")
                {
                    xPeriod = "frommonth=0 and tomonth=12 ";
                }
                if (xTimePeriod == "3")
                {
                    xPeriod = "frommonth=13 and tomonth=36 ";
                }
                if (xTimePeriod == "5")
                {
                    xPeriod = "frommonth=37 and tomonth=60 ";
                }
                if (xTimePeriod == "10")
                {
                    xPeriod = "frommonth=61 and tomonth=120 ";
                }
                if (xTimePeriod == "11")
                {
                    xPeriod = "frommonth>120";
                }

                AssetBindChart();
                FillGrid_SchemePerformance();
                SschemeMatrixBindChart();
            }
            else if (clientstatuscodes.Contains(xClientStatus) && HttpContext.Current.Session["FPSelfieLeadDetails"] != null)
            {
                accordion.Visible = false;
                FreeLeadDetail.Visible = false;
                FPSelfieLeadDetails.Visible = true;
            }
            else
            {
                accordion.Visible = true;
                FreeLeadDetail.Visible = false;
                FPSelfieLeadDetails.Visible = false;
                //******************************************
                //*************For Other user****************
                //******************************************
                FillPersonalDetail();
                FillGridFamily();
                FillGridLI();
                FillGridGI();
                FillGridGoal();
                FillGridRetirementGoal();
                FillGridAsset();
                FillGridLoan();
                FillGridIncome();
                FillGridExpense();
                FillGridMFInvestments();
                FillGridStock();
                FillGridFixedIncome();
                FillGridOtherIncome();
            }

        }
    }


    //************************************************************
    //*************Function details For Other user****************
    //************************************************************

    // Code for Personal Details
    void FillPersonalDetail()
    {
        string xGender = "";
        if ((string)Session["AdminSessionID"] != null)
        {
            SqlDataAdapter DA = new SqlDataAdapter(" " +

                    " select * from fp_Prospects where Code=" + ViewState["xClientCode"] + " " +
                    "  ", Con);

            DataSet DS = new DataSet();
            Con.Open();
            DA.Fill(DS);
            Con.Close();

            if (DS.Tables[0].Rows.Count > 0)
            {
                lblName.Text = DS.Tables[0].Rows[0]["Name"].ToString();
                xGender = DS.Tables[0].Rows[0]["Gender"].ToString();
                if (xGender == "M")
                { lblGender.Text = "Male"; }
                else
                { lblGender.Text = "Female"; }

                if (Convert.ToInt16(DS.Tables[0].Rows[0]["DOB"].ToString().Length) > 0)
                    lblDOB.Text = Convert.ToDateTime(DS.Tables[0].Rows[0]["DOB"].ToString()).ToString("dd-MM-yyyy");
                lblEmail.Text = DS.Tables[0].Rows[0]["Email1"].ToString();
                lblMarritalStatus.Text = DS.Tables[0].Rows[0]["MaritalStatus"].ToString();
                lblMobile.Text = DS.Tables[0].Rows[0]["Mobile1"].ToString();
                lblGrossIncome.Text = DS.Tables[0].Rows[0]["GrossIncome"].ToString();
            }
        }
        else
        {
            Response.Redirect("SessionExpired.aspx");
        }
    }

    // Code for Family Details view
    void FillGridFamily()
    {
        if ((string)Session["AdminSessionID"] != null)
        {
            SqlDataAdapter GDA = new SqlDataAdapter(" " +

                    " select Code,Name, Gender=case when Gender='F' then 'Female' else 'Male' end, " +
                    " Age, Mobile1, " +
                    " Relation=(select Name from fp_ComboDetail where ComboCode=3 and Code=Relation)," +
                    " FinancialDependent=case when FinancialDependent='Y' then 'Yes' else 'No' end, " +
                    " HealthHistory from fp_ProspectsFamily where GroupCode=" + ViewState["xClientCode"] + " " +
                    "  ", Con);

            DataSet GDS = new DataSet();
            Con.Open();
            GDA.Fill(GDS);
            Con.Close();

            GVFamilyDetails.DataSource = GDS;
            GVFamilyDetails.DataBind();
        }
        else
        {
            Response.Redirect("SessionExpired.aspx");
        }
    }

    // Code for Life Insurance view
    void FillGridLI()
    {
        if ((string)Session["AdminSessionID"] != null)
        {

            SqlDataAdapter GDA = new SqlDataAdapter(" " +

                    " select Code, PolicyName, Applicant=isnull((Select [Name] from fp_prospectsfamily where Code=FamilyMemberCode ),'Self'), " +
                    " InsuranceType=(select [Name] from fp_Combodetail where Code=r.InsType ), PremiumPaymentTerm, PremiumMode, CurrentValue, " +
                    " Premium, SumAssured, Nominee=isnull((Select [Name] from fp_prospectsfamily where Code=NomineeName ),'Self'), " +
                    " StartDate=convert(varchar(11),PolicystartDate,113), MaturityDate=convert(varchar(11),MaturityDate,113) " +
                    " from fp_Insurance r where Product='LI' and ClientCode=" + ViewState["xClientCode"] + " " +
                    "  ", Con);

            DataSet GDS = new DataSet();
            Con.Open();
            GDA.Fill(GDS);
            Con.Close();

            GridViewLI.DataSource = GDS;
            GridViewLI.DataBind();
        }
        else
        {
            Response.Redirect("SessionExpired.aspx");
        }
    }

    // Code for Non Life Insurance view
    void FillGridGI()
    {
        if ((string)Session["AdminSessionID"] != null)
        {

            SqlDataAdapter GDA = new SqlDataAdapter(" " +

                    " select Code, InsuredObject=(Select [Name] from fp_ComboDetail where Code=r.InsType ), " +
                    " PolicyHolderName=isnull((Select [Name] from fp_prospectsfamily where Code=r.ProposerName ),'Self'), " +
                    " PolicyName, Premium, PremiumMode, SumAssured, StartDate=convert(varchar(11),PolicystartDate,113) " +
                    " from fp_Insurance r where Product='GI' and ClientCode=" + ViewState["xClientCode"] + " " +
                    "  ", Con);

            DataSet GDS = new DataSet();
            Con.Open();
            GDA.Fill(GDS);
            Con.Close();

            GridViewGI.DataSource = GDS;
            GridViewGI.DataBind();
        }
        else
        {
            Response.Redirect("SessionExpired.aspx");
        }
    }

    // Code for Non Goal view
    void FillGridGoal()
    {
        if ((string)Session["AdminSessionID"] != null)
        {
            SqlDataAdapter GDA = new SqlDataAdapter(" " +

                    " select Code, GoalCategory=(select GoalName from fp_goalMaster gm where Code=GoalCode), " +
                    " GoalFor=isnull((Select [Name] from fp_prospectsfamily where Code=FamilyMemberCode ),'Self'), " +
                    " GoalName, Priority, GoalDate=Convert(varchar(11),StartDate,113), EndDate, Amount,LifeExpectancy," +
                    " RetirementAge, CurrentExpenditure, RequiredInflow, Remarks   " +
                    " from fp_GoalDetails where GoalCode<>7 and GroupCode=" + ViewState["xClientCode"] + " " +
                    "  ", Con);

            DataSet GDS = new DataSet();
            Con.Open();
            GDA.Fill(GDS);
            Con.Close();

            GridViewGoal.DataSource = GDS;
            GridViewGoal.DataBind();
        }
        else
        {
            Response.Redirect("SessionExpired.aspx");
        }
    }

    // Code for Non Retirement view
    void FillGridRetirementGoal()
    {
        if ((string)Session["AdminSessionID"] != null)
        {
            string xCode = Session["AdminSessionID"].ToString();

            SqlDataAdapter GDA = new SqlDataAdapter(" " +

                    " select Code, GoalCategory=(select GoalName from fp_goalMaster gm where Code=GoalCode), " +
                    " GoalFor=isnull((Select [Name] from fp_prospectsfamily where Code=FamilyMemberCode ),'Self'), " +
                    " GoalName, Priority, GoalDate=Convert(varchar(11),StartDate,113), EndDate, Amount,LifeExpectancy," +
                    " RetirementAge, CurrentExpenditure, RequiredInflow, Remarks   " +
                    " from fp_GoalDetails where GoalCode=7 and GroupCode=" + ViewState["xClientCode"] + " " +
                    "  ", Con);

            DataSet GDS = new DataSet();
            Con.Open();
            GDA.Fill(GDS);
            Con.Close();

            GridViewRetirementGoal.DataSource = GDS;
            GridViewRetirementGoal.DataBind();
        }
        else
        {
            Response.Redirect("SessionExpired.aspx");
        }
    }

    // Code for Assets view
    void FillGridAsset()
    {
        if ((string)Session["AdminSessionID"] != null)
        {
            SqlDataAdapter GDA = new SqlDataAdapter(" " +

                    " select code, AssetType=(select [Name] from fp_ComboDetail where Code=AssetCode), " +
                    " AssetOwner=isnull((Select [Name] from fp_prospectsfamily where Code=FamilyMemberCode ),'Self'), " +
                    " AssetName, CurrentValue, PurchasePrice, AccqDate=Convert(varchar(11),AccquisitionDate,113) " +
                    " from fp_AssetDetail where ClientCode=" + ViewState["xClientCode"] + "  " +
                    "  ", Con);

            DataSet GDS = new DataSet();
            Con.Open();
            GDA.Fill(GDS);
            Con.Close();

            GridViewAsset.DataSource = GDS;
            GridViewAsset.DataBind();
        }
        else
        {
            Response.Redirect("SessionExpired.aspx");
        }
    }

    // Code for Liability view
    void FillGridLoan()
    {
        if ((string)Session["AdminSessionID"] != null)
        {
            SqlDataAdapter GDA = new SqlDataAdapter(" " +

                    " select Code, LoanTakenFor=(Select [Name] from fp_ComboDetail where Code=r.LoanTaken ), " +
                    " OriginalAmount,RateofInterest,LoanType,EMI,LoanTenure,OutStandingBalance,StartDate=convert(varchar(11),StartDate,113) " +
                    " from fp_Loan r where ClientCode=" + ViewState["xClientCode"] + " " +
                    "  ", Con);

            DataSet GDS = new DataSet();
            Con.Open();
            GDA.Fill(GDS);
            Con.Close();

            GridViewLoan.DataSource = GDS;
            GridViewLoan.DataBind();
        }
        else
        {
            Response.Redirect("SessionExpired.aspx");
        }
    }

    // Code for Income view
    void FillGridIncome()
    {
        if ((string)Session["AdminSessionID"] != null)
        {

            SqlDataAdapter GDA = new SqlDataAdapter(" " +

                    " select Code, IncomeType=(select [Name] from fp_ComboDetail where Code=Source), " +
                    " IncomeAmount=IncomeMonthly, IncomePeriod  " +
                    " from fp_Income where ClientCode=" + ViewState["xClientCode"] + " " +
                    "  ", Con);

            DataSet GDS = new DataSet();
            Con.Open();
            GDA.Fill(GDS);
            Con.Close();

            GridViewIncome.DataSource = GDS;
            GridViewIncome.DataBind();
        }
        else
        {
            Response.Redirect("SessionExpired.aspx");
        }
    }

    // Code for Expense view
    void FillGridExpense()
    {
        if ((string)Session["AdminSessionID"] != null)
        {
            SqlDataAdapter GDA = new SqlDataAdapter(" " +

                    " select Code, ExpenseType=(select [Name] from fp_ComboDetail where Code=Source), " +
                    " ExpenseAmount=ExpenseMonthly, ExpensePeriod " +
                    " from fp_Expense where ClientCode=" + ViewState["xClientCode"] + " " +
                    "  ", Con);

            DataSet GDS = new DataSet();
            Con.Open();
            GDA.Fill(GDS);
            Con.Close();

            GridViewExpense.DataSource = GDS;
            GridViewExpense.DataBind();
        }
        else
        {
            Response.Redirect("SessionExpired.aspx");
        }
    }

    // Code for MF Investments view
    void FillGridMFInvestments()
    {
        if ((string)Session["AdminSessionID"] != null)
        {
            SqlDataAdapter GDA = new SqlDataAdapter(" " +

                    " select code, SchemeName, InvestmentType, InvestedAmount, CurrentValue, SchemeOption, " +
                    " StartDate=convert(varchar(11),StartDate,113), EndDate=convert(varchar(11),EndDate,113) " +
                    " from fp_Investments where ProductName='Mutual Fund' and ClientCode=" + ViewState["xClientCode"] + "  " +
                    "  ", Con);

            DataSet GDS = new DataSet();
            Con.Open();
            GDA.Fill(GDS);
            Con.Close();

            GridViewMFInvestments.DataSource = GDS;
            GridViewMFInvestments.DataBind();
        }
        else
        {
            Response.Redirect("SessionExpired.aspx");
        }
    }

    // Code for Stock Investments view
    void FillGridStock()
    {
        if ((string)Session["AdminSessionID"] != null)
        {
            SqlDataAdapter GDA = new SqlDataAdapter(" " +

                    " select Code,SchemeName,NoShare,PurchasePrice,CurrentPrice,InvestedAmount,CurrentValue,GainLoss " +
                    " from fp_Investments where ProductName='Stock' and ClientCode=" + ViewState["xClientCode"] + "  " +
                    "  ", Con);

            DataSet GDS = new DataSet();
            Con.Open();
            GDA.Fill(GDS);
            Con.Close();

            GridViewStock.DataSource = GDS;
            GridViewStock.DataBind();
        }
        else
        {
            Response.Redirect("SessionExpired.aspx");
        }
    }

    // Code for Fixed Income Investments view
    void FillGridFixedIncome()
    {
        if ((string)Session["AdminSessionID"] != null)
        {
            SqlDataAdapter GDA = new SqlDataAdapter(" " +

                    " select code, InvestmentType, InvestedAmount, CurrentValue, IssuingEntity,ROI, " +
                    " HolderName=(select [Name] from fp_prospectsfamily where Code=r.HolderName), " +
                    " StartDate=convert(varchar(11),StartDate,113), MaturityDate=convert(varchar(11),MaturityDate,113) " +
                    " from fp_Investments r where ProductName='Fixed Income' and ClientCode=" + ViewState["xClientCode"] + " " +
                    "  ", Con);

            DataSet GDS = new DataSet();
            Con.Open();
            GDA.Fill(GDS);
            Con.Close();

            GridViewFixedIncome.DataSource = GDS;
            GridViewFixedIncome.DataBind();
        }
        else
        {
            Response.Redirect("SessionExpired.aspx");
        }
    }

    // Code for Other Investments view
    void FillGridOtherIncome()
    {
        if ((string)Session["AdminSessionID"] != null)
        {

            SqlDataAdapter GDA = new SqlDataAdapter(" " +

                    " select code, InvestmentType, PurchasePrice, CurrentValue, " +
                    " StartDate=convert(varchar(11),StartDate,113), MaturityDate=convert(varchar(11),MaturityDate,113) " +
                    " from fp_Investments r where ProductName='Other' and ClientCode=" + ViewState["xClientCode"] + "  " +
                    "  ", Con);

            DataSet GDS = new DataSet();
            Con.Open();
            GDA.Fill(GDS);
            Con.Close();

            GridViewOtherInv.DataSource = GDS;
            GridViewOtherInv.DataBind();
        }
        else
        {
            Response.Redirect("SessionExpired.aspx");
        }
    }

    //************************************************************
    //*************Function details For Free user****************
    //************************************************************

    private void AssetBindChart()
    {
        DataTable dsChartData = new DataTable();
        StringBuilder strScript = new StringBuilder();

        string[] color = new string[4] { "#67bbfe", "#67fef9", "#67fea3", "#eafe67" };
        int i = 0;
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
            strScript.Append(" country: '" + row["objective"] + "',");
            strScript.Append(" litres: " + row["Allocate"] + ",");
            strScript.Append(" color: '" + color[i] + "'");
            strScript.Append("},");
            i++;
        }
        strScript.Remove(strScript.Length - 1, 1);
        strScript.Append("];");
        strScript.Append(@"AmCharts.ready(function () {
                        // PIE CHART
                        chart1 = new AmCharts.AmPieChart();
                        chart1.dataProvider = chartData1;
                        chart1.titleField = 'country';
                        chart1.valueField = 'litres';
						chart1.labelsEnabled = true;
                        chart1.labelText = '[[percents]]%';
						chart1.labelRadius = 5;
                        chart1.fontSize = 12;
						chart1.depth3D = 10;
						chart1.minRadius = 20;
						chart1.radius = 70;
                        chart1.colorField = 'color';
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
    private DataTable GetChartData()
    {
        DataSet dsData = new DataSet();

        SqlDataAdapter DA = new SqlDataAdapter(" " +
                " select objective, Allocate=sum(Allocation) from fp_FreeSchemeMatrix fsm, schmst sm where " + xPeriod + " " +
                " and riskcode=" + xRisk + " and fsm.exlcode=sm.exlcode group by objective " +
                "  ", Con);

        DataSet DS = new DataSet();
        Con.Open();
        DA.Fill(DS);
        Con.Close();

        return DS.Tables[0];
    }

    //Scheme Performance   
    void FillGrid_SchemePerformance()
    {

        SqlDataAdapter GDA = new SqlDataAdapter(" " +

                " select Sname, Curr_NAV, Curr_Corpus, Growth6, Growth8, Growth10, Growth11 from fund_compare fc, schmst fsm " +
                " where fc.exlcode in (select exlcode from fp_FreeSchemeMatrix where " + xPeriod + " and riskcode=" + xRisk + ") " +
                " and fc.exlcode=fsm.exlcode  " +
                "  ", Con);

        DataSet GDS = new DataSet();
        Con.Open();
        GDA.Fill(GDS);
        Con.Close();

        GVSchemePerformance.DataSource = GDS;
        GVSchemePerformance.DataBind();
    }

    //Scheme Matrix Chart
    private void SschemeMatrixBindChart()
    {
        DataTable dsChartData = new DataTable();
        StringBuilder strSMScript = new StringBuilder();

        dsChartData = GetSMChartData();

        strSMScript.Append(@"<Script>
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
            Sys.WebForms.PageRequestManager.getInstance().beginAsyncPostBack();
            function EndRequestHandler(sender, args) {
        var chart = AmCharts.makeChart('SchemeMatrix', {
          'type': 'serial',
          'theme': 'none',
          'rotate': true,
          'dataProvider': [ ");

        foreach (DataRow row in dsChartData.Rows)
        {
            strSMScript.Append("{");
            strSMScript.Append(" category: '" + row["sname"] + "',");
            strSMScript.Append(" visits: " + row["AllAmount"] + ",");
            strSMScript.Append(" short: " + row["Allocation"] + "");
            strSMScript.Append("},");

        }
        strSMScript.Remove(strSMScript.Length - 1, 1);
        strSMScript.Append("],");

        strSMScript.Append(@"'valueAxes': [{
            'gridColor': '#999999',
            'gridAlpha': 0.2,
            'dashLength': 0
          }],                        
          'startDuration': 1,
          'graphs': [{
            'balloonText': '[[category]]: <b>[[value]]</b>',
            'fillAlphas': 1,
            'lineAlpha': 0.2,
            'fillColors': ['#d5edff', '#b0dcff'],
            'type': 'column',
            //'labelText': '[[category]]',
            'valueField': 'visits'
          }],
          'chartCursor': {
            'categoryBalloonEnabled': false,
            'cursorAlpha': 0,
            'zoomable': false
          },
          'categoryField': 'category',
          'categoryAxis': {
            'gridPosition': 'middle',
            'gridAlpha': 0.2,
            'labelFunction': function(valueText, serialDataItem, categoryAxis) {
              if (valueText.length > 15)
                return valueText.substring(0, 15) + '...';
              else
                return valueText;
            }
          }
        });
}
");
        strSMScript.Append("</Script>");


        ltSMScripts.Text = strSMScript.ToString();


        dsChartData.Dispose();
        strSMScript.Clear();

    }
    private DataTable GetSMChartData()
    {
        DataSet dsData = new DataSet();

        SqlDataAdapter DA = new SqlDataAdapter(" " +
                " select sm.sname, Allocation, AllAmount=((Allocation/100)*" + xAmount + ") from fp_FreeSchemeMatrix fsm, schmst sm " +
                " where " + xPeriod + " and riskcode=" + xRisk + "  and fsm.exlcode=sm.exlcode " +
                "  ", Con);

        DataSet DS = new DataSet();
        Con.Open();
        DA.Fill(DS);
        Con.Close();

        return DS.Tables[0];
    }

    #region
    [WebMethod]
    public static string getFPSelfieLeadDetails(int id)
    {
        string res = "";
        try
        {
            if (HttpContext.Current.Session["FPSelfieLeadDetails"] != null)
            {
                Plan pl = HttpContext.Current.Session["FPSelfieLeadDetails"] as Plan;
                JavaScriptSerializer javaScriptSerializer = new JavaScriptSerializer();
                res = javaScriptSerializer.Serialize(pl);
            }
            else
            {
                HttpContext.Current.Response.Redirect("LMS.aspx");

            }
            return res;
        }
        catch (Exception ex)
        {
            res = "error:" + ex;

            return res;
        }
    }
    private void setFPSelfieLeadDetails(string email)
    {
        Session["FPSelfieLeadDetails"] = null;

        string qry = "select top 1 * from [dbo].[fp_Subsidary_Plan] where email='" + email + "' order by 1 desc";
        DataSet dsData = new DataSet();
        SqlDataAdapter DA = new SqlDataAdapter(qry, Con);
        DataSet DS = new DataSet();
        Con.Open();
        DA.Fill(DS);
        Con.Close();
        DataTable dt = DS.Tables[0];
        if (dt.Rows.Count > 0)
        {

            var pln = new Plan();
            pln.name = Convert.ToString(dt.Rows[0]["name"]);
            pln.email = Convert.ToString(dt.Rows[0]["email"]);
            pln.mobile = Convert.ToString(dt.Rows[0]["mobile"]);
            pln.status = Convert.ToString(dt.Rows[0]["status"]);
            pln.currrentage = Convert.ToString(dt.Rows[0]["currrentage"]);
            pln.retirementage = Convert.ToString(dt.Rows[0]["retirementage"]);
            pln.lifeexpentency = Convert.ToString(dt.Rows[0]["lifeexpentency"]);
            pln.Risk_Ability = Convert.ToString(dt.Rows[0]["Risk_Ability"]);
            pln.E_Fund_Amount = Convert.ToString(dt.Rows[0]["E_Fund_Amount"]);
            pln.E_Fund_SIP = Convert.ToString(dt.Rows[0]["E_Fund_SIP"]);
            pln.Risk_T_Insurance = Convert.ToString(dt.Rows[0]["Risk_T_Insurance"]);
            pln.Risk_FF_Insurance = Convert.ToString(dt.Rows[0]["Risk_FF_Insurance"]);

            pln.ChildE = Convert.ToString(dt.Rows[0]["ChildE"]).ToLower() == "false" ? false : true;
            pln.ChildE_SIP = Convert.ToString(dt.Rows[0]["ChildE_SIP"]);
            pln.ChildE_Amount = Convert.ToString(dt.Rows[0]["ChildE_Amount"]);

            pln.ChildM = Convert.ToString(dt.Rows[0]["ChildM"]).ToLower() == "false" ? false : true;
            pln.ChildM_SIP = Convert.ToString(dt.Rows[0]["ChildM_SIP"]);
            pln.ChildM_Amount = Convert.ToString(dt.Rows[0]["ChildM_Amount"]);

            pln.Asset = Convert.ToString(dt.Rows[0]["Asset"]).ToLower() == "false" ? false : true;
            pln.Asset_SIP = Convert.ToString(dt.Rows[0]["Asset_SIP"]);
            pln.Asset_Amount = Convert.ToString(dt.Rows[0]["Asset_Amount"]);

            pln.Vacation = Convert.ToString(dt.Rows[0]["Vacation"]).ToLower() == "false" ? false : true;
            pln.Vacation_SIP = Convert.ToString(dt.Rows[0]["Vacation_SIP"]);
            pln.Vacation_Amount = Convert.ToString(dt.Rows[0]["Vacation_Amount"]);

            pln.other = Convert.ToString(dt.Rows[0]["other"]).ToLower() == "false" ? false : true;
            pln.other_SIP = Convert.ToString(dt.Rows[0]["other_SIP"]);
            pln.other_Amount = Convert.ToString(dt.Rows[0]["other_Amount"]);

            pln.Retire = Convert.ToString(dt.Rows[0]["Retire"]).ToLower() == "false" ? false : true;
            pln.Retire_SIP = Convert.ToString(dt.Rows[0]["Retire_SIP"]);
            pln.Retire_Amount = Convert.ToString(dt.Rows[0]["Retire_Amount"]);

            pln.chartdata = Convert.ToString(dt.Rows[0]["chartdata"]);

            pln.illness = Convert.ToString(dt.Rows[0]["illness"]);

            pln.Schemes = Convert.ToString(dt.Rows[0]["Schemes"]);

            Session["FPSelfieLeadDetails"] = pln;
        }
    }

    #endregion
}