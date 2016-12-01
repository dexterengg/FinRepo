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

public partial class SchemeDetail : System.Web.UI.Page
{
    SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ToString());
    string xStr = "";
    string xAsOn = "";
    double incRet = 0;
    int noMonth = 0;
    SqlCommand cmd;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {

            ViewState["userid"] = Session["userSessionID"].ToString();
            ViewState["xExlCode"] = Request.QueryString["exlcode"];
            
            lblSchemeName.Text = "";
            lblyear1.Text = "";
            lblyear2.Text = "";
            lblyear3.Text = "";
            lblyear5.Text = "";
            lblyear10.Text = "";
            lblinception.Text = "";
            lblStandadrDev.Text = "";
            lblBeta.Text = "";
            lblAlpha.Text = "";
            lblSharpe.Text = "";
            lblTreynor.Text = "";
            lblTracking.Text = "";
            lblInformation.Text = "";
            lblSortino.Text = "";            

            // Select Performance of the scheme
            SqlDataAdapter InvGDA = new SqlDataAdapter(" " +

                    " select AsOn=Convert(varchar(11),Curr_Date, 113), Sname, Year1=isnull(cast(Growth6 as varchar) ,'NA'), Year2=isnull(cast(Growth7 as varchar),'NA'), " +
                    " Year3=isnull(cast(Growth8 as varchar),'NA'),year5=isnull(cast(Growth10 as varchar),'NA'), " +
                    " year10=isnull(cast(Growth11 as varchar),'NA'), Inception=isnull(cast(Growth12 as varchar),'NA') " +
                    " from fund_compare fc, schmst s where fc.exlcode=" + ViewState["xExlCode"] + " and s.exlcode=fc.exlcode " +
                    "  ", Con);
                    

            DataSet InvGDS = new DataSet();
            Con.Open();
            InvGDA.Fill(InvGDS);
            Con.Close();

            if (InvGDS.Tables[0].Rows.Count > 0)
            {
                lblSchemeName.Text = InvGDS.Tables[0].Rows[0]["Sname"].ToString();
                lblyear1.Text = InvGDS.Tables[0].Rows[0]["Year1"].ToString();
                lblyear2.Text = InvGDS.Tables[0].Rows[0]["Year2"].ToString();
                lblyear3.Text = InvGDS.Tables[0].Rows[0]["Year3"].ToString();
                lblyear5.Text = InvGDS.Tables[0].Rows[0]["year5"].ToString();
                lblyear10.Text = InvGDS.Tables[0].Rows[0]["year10"].ToString();
                lblinception.Text = InvGDS.Tables[0].Rows[0]["Inception"].ToString();
                incRet = Convert.ToDouble(InvGDS.Tables[0].Rows[0]["Inception"]);
                xAsOn = InvGDS.Tables[0].Rows[0]["AsOn"].ToString();
            }
            else
            {
                schemedetail.Visible = false;
                nodetail.Visible = true;
            }

            // Select Performance of the scheme
            SqlDataAdapter ratioGDA = new SqlDataAdapter(" " +

                    " select AnnualSD, BetaSlope, Alpha, SharpeRatio, TreynorRatio, TrackingError, InformationRatio,SortinoRatio " +
                    " from ratios where schemecode=" + ViewState["xExlCode"] + " " +
                    "  ", Con);

            DataSet ratioGDS = new DataSet();
            Con.Open();
            ratioGDA.Fill(ratioGDS);
            Con.Close();

            if (ratioGDS.Tables[0].Rows.Count > 0)
            {
                lblStandadrDev.Text = ratioGDS.Tables[0].Rows[0]["AnnualSD"].ToString();
                lblBeta.Text = ratioGDS.Tables[0].Rows[0]["BetaSlope"].ToString();
                lblAlpha.Text = ratioGDS.Tables[0].Rows[0]["Alpha"].ToString();
                lblSharpe.Text = ratioGDS.Tables[0].Rows[0]["SharpeRatio"].ToString();
                lblTreynor.Text = ratioGDS.Tables[0].Rows[0]["TreynorRatio"].ToString();
                lblTracking.Text = ratioGDS.Tables[0].Rows[0]["TrackingError"].ToString();
                lblInformation.Text = ratioGDS.Tables[0].Rows[0]["InformationRatio"].ToString();
                lblSortino.Text = ratioGDS.Tables[0].Rows[0]["SortinoRatio"].ToString();
            }

            //Calculation for SIP Accumulation Amount
            double xPrin = 0;
            double accAmount = 0;
            double sipamt = 10000;
            double ror = incRet / 12;

            SqlDataAdapter MonthGDA = new SqlDataAdapter(" " +

                    " select Open_Date, Curr_Date, MonthC=datediff(M,Open_Date,Curr_Date)  from schmst s, fund_compare n "+
                    " where s.exlcode=" + ViewState["xExlCode"] + " and s.exlcode=n.exlcode " +                    
                    "  ", Con);

            DataSet MonthGDS = new DataSet();
            Con.Open();
            MonthGDA.Fill(MonthGDS);
            Con.Close();

            if (MonthGDS.Tables[0].Rows.Count > 0)
            {
                noMonth = Convert.ToInt32(MonthGDS.Tables[0].Rows[0]["MonthC"]);
            }

            for (int j = 1; j <= noMonth; j++)
            {
                xPrin = accAmount + sipamt;
                accAmount = Math.Round(xPrin * Math.Pow((1 + Convert.ToDouble(ror) * 1.0000 / 100), 1), 0);
            }

            lblSIPAmount.Text = accAmount.ToString("##,##,###");
            lblAsOn.Text = xAsOn;

            // Calendar chart start
            BindCalendarChart();


        }
    }

    private void BindCalendarChart()
    {
        DataTable dsGoalChartData = new DataTable();
        StringBuilder strGoalScript = new StringBuilder();
        int ctr = 0;

        //try
        //{            
        dsGoalChartData = GetGoalChartData();
        string[] color = { "#0D8ECF", "#0D52D1", "#FF0F00", "#FF6600", "#FF9E01", "#FCD202", "#F8FF01", "#B0DE09", "#04D215", "#0D8ECF", "#0D52D1", "#FF0F00", "#FF6600", "#FF9E01", "#FCD202", "#F8FF01", "#B0DE09", "#04D215", "#0D8ECF", "#0D52D1", "#FF0F00", "#FF6600", "#FF9E01", "#FCD202", };
           
                strGoalScript.Append(@"<script type='text/javascript'>
                google.load('visualization', '1', {packages:['corechart']});
                google.setOnLoadCallback(drawChart);
                function drawChart() {
                var data = google.visualization.arrayToDataTable([
                    ['Year', 'Return'],");
                        
                    foreach (DataRow row in dsGoalChartData.Rows)
                    {                        
                        strGoalScript.Append("['" + row["Period"] + "', " + row["SchemeReturn"] + "],");                                                

                    }
                    strGoalScript.Remove(strGoalScript.Length - 1, 1);
                    strGoalScript.Append("]);");

                    


                    strGoalScript.Append(@"var options = {
                    title: 'Calendar Year Returns',
                    legend: {position: 'none'},
                    hAxis: {title: 'Year', titleTextStyle: {color: 'red'}},
                    vAxis: {title: 'Return', titleTextStyle: {color: 'red'}}
                    };

                    var chart = new google.visualization.ColumnChart(document.getElementById('calendarChart'));
                    chart.draw(data, options);
                    }
                </script>");

        ltCalendarScripts.Text = strGoalScript.ToString();

        
        dsGoalChartData.Dispose();
        strGoalScript.Clear();
        
    }

    /// fetch data for Calendar Chart     
    private DataTable GetGoalChartData()
    {
        DataSet dsData = new DataSet();

        if ((string)Session["userSessionID"] != null)
        {
            string xCode = Session["userSessionID"].ToString();

            SqlDataAdapter DA = new SqlDataAdapter(" " +
                    " Select top 10  Period=S.Period, SchemeReturn=S.YReturn from "+
                    " (Select Period=convert(varchar(4),a.YrStartDate,111),   YReturn=round(((Select NAV from NAVEXLc n where n.exlcode = a.exlcode  "+
                    " and n.navdate = a.YrLastDate)-(Select NAV from NAVEXLc n where n.exlcode = a.exlcode and n.navdate = a.YrStartDate))*100/ "+
                    " (Select NAV from NAVEXLc n where n.exlcode = a.exlcode and n.navdate = a.YrStartDate),2)    "+
                    " from (   Select ExlCode, min(navdate) as YrStartDate, Max(navdate) as YrLastDate from NAVEXLc  "+
                    " Where exlcode =" + ViewState["xExlCode"] + " Group By  ExlCode, year(navdate)   ) a )S   " +
                    " order by S.Period   " +
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
}