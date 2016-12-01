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

public partial class KnowFund : System.Web.UI.Page
{

    SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ToString());
    string xStr = "";
    string xEmail = "";
    string xPswd = "";
    SqlCommand cmd;
    double xCurrExpen = 0;
    int xNoRetYear = 0;
    int xAfterRetAge = 0;
    string xRiskCode = "0";
    double xRiskPer = 11;
    double xRetAmt = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {

            ViewState["userid"] = Session["userSessionID"].ToString();            

            // Select Risk from table fp_prospects                                        
            SqlDataAdapter InvGDA = new SqlDataAdapter(" " +

                    " select Name, OPType1, RiskCode=isnull(riskCode,0), ROR=(select ROR from fp_riskper where srno=p.riskcode), " +
                    " RiskName=(select Risk from fp_riskper where srno=p.riskcode) " +
                    " from fp_prospects p where userid='" + ViewState["userid"] + "' " +
                    "  ", Con);

            DataSet InvGDS = new DataSet();
            Con.Open();
            InvGDA.Fill(InvGDS);
            Con.Close();

            if (InvGDS.Tables[0].Rows.Count > 0)
            {                
                xRiskPer = Convert.ToDouble(InvGDS.Tables[0].Rows[0]["ROR"]);                
                xRiskCode = InvGDS.Tables[0].Rows[0]["RiskCode"].ToString();
            }

            //Call for Click to know fund
            FillGridScheme_Matrix();

            //Call for ret schemes
            Retirement_Calculation();
            FillGridRetScheme_Matrix();

            //schemeDetailArea.Visible = false;

        }
    }

    // To get the schemes
    void FillGridScheme_Matrix()
    {
        if ((string)Session["userSessionID"] != null)
        {
            string xCode = Session["userSessionID"].ToString();

            SqlDataAdapter GDA = new SqlDataAdapter(" " +

                    " select Exlcode=max(s.Exlcode), ShName=s.sname, max((year(startdate)-year(EntryDate))*12), " +
                    " Period= max(case when ((year(startdate)-year(EntryDate))*12) between 0 and 6  then	'0-6 month'		else " +
                    "        case when ((year(startdate)-year(EntryDate))*12) between 7 and 12  then '6-12 month'	else " +
                    "        case when ((year(startdate)-year(EntryDate))*12) between 13 and 24  then '1-3 yr'	else " +
                    "        case when ((year(startdate)-year(EntryDate))*12) between 37 and 84  then '3-7 yr'	else " +
                    "        case when ((year(startdate)-year(EntryDate))*12) between 85 and 120  then '7-10yr'	else ' 10+ yr' " +
                    " end end end end end), " +
                    " SIPAmt=sum(floor(round(((((Amount*(power(1+(6*1.000000/100),(datediff(M,getdate(),startdate)/12.000))))*(" + xRiskPer + "*1.000000/100))/ " +
                    " (power((1+" + xRiskPer + "*1.000000/100),(datediff(M,getdate(),startdate)/12.000))-1))/12)/1000,0,0)    )*1000) " +
                    " from fp_GoalDetails g,fp_prospects p,fp_RiskObjMatrix r,fp_schemeMatrix s " +
                    " where g.GroupCode=p.code and p.riskcode=r.riskcode and r.Category=s.Category and  " +
                    " (year(startdate)-year(getdate()))*12 between frommonth and tomonth and userid='" + xCode + "' " +
                    " group by sname Order by  SIPAmt " +
                    "  ", Con);

            DataSet GDS = new DataSet();
            Con.Open();
            GDA.Fill(GDS);
            Con.Close();

            GridViewSchemes.DataSource = GDS;
            GridViewSchemes.DataBind();

        }
        else
        {
            Response.Redirect("SessionExpired.aspx");
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
        double xROR = xRiskPer;
        int xEntryYear = 0;

        string xCode = Session["userSessionID"].ToString();

        SqlDataAdapter DA = new SqlDataAdapter(" " +

                " select CurrentValue=CurrentExpenditure, LifeExpectancy,  RetYear=year(StartDate), EntryYear=year(EntryDate), " +
                " RetAge=(year(StartDate)-year(EntryDate)), " +
                " AmountReq=cast(round((CurrentExpenditure*(power(1+(6*1.000000/100),(year(startdate)-year(getdate()))))),0) as int), " +
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
            xAfterRetAge = Convert.ToInt32(DS.Tables[0].Rows[0]["Period"]);
            xCurrExpen = Convert.ToDouble(DS.Tables[0].Rows[0]["CurrentValue"]);
            xNoRetYear = Convert.ToInt32(DS.Tables[0].Rows[0]["RetAge"]);
            xEntryYear = Convert.ToInt32(DS.Tables[0].Rows[0]["EntryYear"]);
        }
        else
        {
            Response.Redirect("SessionExpired.aspx");
        }


        //Calculation for Real rate of return
        xRRR = xPostROI / 100;


        //Calculation for Monthly expense after retirement        
        MonExpRet = Math.Round(xCurrExpen * Math.Pow((1 + 7 * 1.0000 / 100), xNoRetYear), 0);

        //Calculation for Corpus
        for (int j = 1; j < xAfterRetAge; j++)
        {
            //Calculation for Expenses
            xExpense = MonExpRet * Math.Pow((1 + (xInflation * 1.00000 / 100)), j);


            //Calculation for PV
            xPV = xExpense / Math.Pow((1 + (xRRR * 1.0000)), j);
            CorpusReq += xPV;

        }
        

        //Calculation for SIP
        double prin = 0;
        double amt = CorpusReq;
        double tme = 15;
        double intr = 15;
        double intper = xROR / 1200;
        double tmemnth = xNoRetYear * 12;

        double powr = Math.Pow((1 + intper), tmemnth);
        prin = ((amt * ((intper * powr) / (powr - 1))) / powr);

        xRetAmt = Math.Round(prin, 0);

    }


    // To get the Retirement schemes
    void FillGridRetScheme_Matrix()
    {
        if ((string)Session["userSessionID"] != null)
        {
            string xCode = Session["userSessionID"].ToString();

            SqlDataAdapter GDA = new SqlDataAdapter(" " +

                    " select top 1 Exlcode=max(s.Exlcode), ShName=s.sname, max((year(startdate)-year(EntryDate))*12), " +
                    " Period= max(case when ((year(startdate)-year(EntryDate))*12) between 0 and 6  then	'0-6 month'		else " +
                    "        case when ((year(startdate)-year(EntryDate))*12) between 7 and 12  then '6-12 month'	else " +
                    "        case when ((year(startdate)-year(EntryDate))*12) between 13 and 24  then '1-3 yr'	else " +
                    "        case when ((year(startdate)-year(EntryDate))*12) between 37 and 84  then '3-7 yr'	else " +
                    "        case when ((year(startdate)-year(EntryDate))*12) between 85 and 120  then '7-10yr'	else ' 10+ yr' " +
                    " end end end end end), " +
                    " SIPAmt=" + xRetAmt + " " +
                    " from fp_GoalDetails g,fp_prospects p,fp_RiskObjMatrix r,fp_schemeMatrix s " +
                    " where g.GroupCode=p.code and p.riskcode=r.riskcode and r.Category=s.Category and GoalCode=7 and  " +
                    " (year(startdate)-year(getdate()))*12 between frommonth and tomonth and userid='" + xCode + "' " +
                    " group by sname order by max((year(startdate)-year(EntryDate))*12) " +
                    "  ", Con);

            DataSet GDS = new DataSet();
            Con.Open();
            GDA.Fill(GDS);
            Con.Close();

            GridViewRetirement.DataSource = GDS;
            GridViewRetirement.DataBind();

        }
        else
        {
            Response.Redirect("SessionExpired.aspx");
        }
    }
    protected void btnInvestNow_Click(object sender, EventArgs e)
    {
        // Select Risk from table fp_prospects                                        
        SqlDataAdapter InvGDA = new SqlDataAdapter(" " +

                " select UserId, Pwd from fp_prospects p where userid='" + ViewState["userid"] + "' " +
                "  ", Con);

        DataSet InvGDS = new DataSet();
        Con.Open();
        InvGDA.Fill(InvGDS);
        Con.Close();

        if (InvGDS.Tables[0].Rows.Count > 0)
        {
            xEmail = InvGDS.Tables[0].Rows[0]["UserId"].ToString();
            xPswd = InvGDS.Tables[0].Rows[0]["Pwd"].ToString();
        }
        
        Response.Redirect("https://invest.fincart.com/index.jsp?email=" + xEmail + "&pswd=" + xPswd + "&status=X");
    }
}