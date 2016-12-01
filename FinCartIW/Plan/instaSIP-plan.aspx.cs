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

public partial class Plan_instaSIP_plan : System.Web.UI.Page
{
    SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ToString());
    string xStr = "";
    SqlCommand cmd;
    string xPeriod = "";
    string xPeriod2 = "";
    string xAmount = "";
    string xRisk = "";
    string xAmt = "";
    string xExl = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        ViewState["Amount"] = Request.QueryString["amt"].ToString();
        ViewState["Score"] = Request.QueryString["score"].ToString();
        ViewState["Period"] = Request.QueryString["invage"].ToString();

        buttons_visibility();

        if (!Page.IsPostBack)
        {
            xPeriod2 = ViewState["Period"].ToString();
            xAmount = ViewState["Amount"].ToString();
            txtAmount.Text = xAmount;



            if (Convert.ToDouble(ViewState["Score"]) <= 12.5)
            {
                imgRisk.ImageUrl = "images/risk-c.png";
                xRisk = "2";
            }

            if (Convert.ToDouble(ViewState["Score"]) > 12.5 && Convert.ToDouble(ViewState["Score"]) < 27.4)
            {
                imgRisk.ImageUrl = "images/risk-m.png";
                xRisk = "3";
            }
            if (Convert.ToDouble(ViewState["Score"]) >= 27.5)
            {
                imgRisk.ImageUrl = "images/risk-a.png";
                xRisk = "4";
            }

            //Risk Selection 
            /*if (ViewState["Risk"].ToString() == "2.5")
            {
                xRisk = "2";
            }
            if (ViewState["Risk"].ToString() == "5")
            {
                xRisk = "3";
            }
            if (ViewState["Risk"].ToString() == "10")
            {
                xRisk = "4";
            }*/

            //Code for Scheme Matrix
            if (ViewState["Period"].ToString() == "1")
            {
                xPeriod = "frommonth=0 and tomonth=12 ";
            }
            if (ViewState["Period"].ToString() == "3")
            {
                xPeriod = "frommonth=13 and tomonth=36 ";
            }
            if (ViewState["Period"].ToString() == "5")
            {
                xPeriod = "frommonth=37 and tomonth=60 ";
            }
            if (ViewState["Period"].ToString() == "10")
            {
                xPeriod = "frommonth=61 and tomonth=120 ";
            }
            if (ViewState["Period"].ToString() == "11")
            {
                xPeriod = "frommonth>120";
            }

            AssetBindChart();
            FillGrid_SchemePerformance();
            SschemeMatrixBindChart();            

        }
    }

    void buttons_visibility()
    {
        // for checking whether user is loging after save for future
        string lgType = Request.QueryString["LoginType"].ToString();
        //ViewState["Risk"] = Request.QueryString["risk"].ToString();

        if (Session["Campaign"] != null)
        {
            OpenFreeAc.Visible = false;
            proceedandtransactNow.Visible = true;
        }
        else if (lgType.ToString() == "FFF")
        {
            OpenFreeAc.Visible = false;
            transactNow.Visible = true;
        }
        else if (Session["userSessionID"] != null)
        {
            OpenFreeAc.Visible = false;
            transactNow.Visible = true;
        }
        else
        {
            transactNow.Visible = false;
            OpenFreeAc.Visible = true;
        }
    }

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
                " select sm.sname, Allocation, AllAmount=((Allocation/100)*" + ViewState["Amount"] + ") from fp_FreeSchemeMatrix fsm, schmst sm " +
                " where " + xPeriod + " and riskcode=" + xRisk + "  and fsm.exlcode=sm.exlcode " +
                "  ", Con);

        DataSet DS = new DataSet();
        Con.Open();
        DA.Fill(DS);
        Con.Close();

        return DS.Tables[0];
    }

    protected void RegisterButton_Click(object sender, EventArgs e)
    {
        if (WT_online.Checked == true)
        {

            if (Convert.ToDouble(ViewState["Score"]) <= 12.5)
            {
                imgRisk.ImageUrl = "images/risk-c.png";
                xRisk = "2";
            }

            if (Convert.ToDouble(ViewState["Score"]) > 12.5 && Convert.ToDouble(ViewState["Score"]) < 27.4)
            {
                imgRisk.ImageUrl = "images/risk-m.png";
                xRisk = "3";
            }
            if (Convert.ToDouble(ViewState["Score"]) >= 27.5)
            {
                imgRisk.ImageUrl = "images/risk-a.png";
                xRisk = "4";
            }

            //Code for Scheme Matrix
            if (ViewState["Period"].ToString() == "1")
            {
                xPeriod = "frommonth=0 and tomonth=12 ";
            }
            if (ViewState["Period"].ToString() == "3")
            {
                xPeriod = "frommonth=13 and tomonth=36 ";
            }
            if (ViewState["Period"].ToString() == "5")
            {
                xPeriod = "frommonth=37 and tomonth=60 ";
            }
            if (ViewState["Period"].ToString() == "10")
            {
                xPeriod = "frommonth=61 and tomonth=120 ";
            }
            if (ViewState["Period"].ToString() == "11")
            {
                xPeriod = "frommonth>120";
            }

            //bool isValid = ucCaptcha.Validate(txtCaptcha.Text.Trim());
            //if (isValid)
            //{
            SqlDataAdapter DAduplicate = new SqlDataAdapter(" " +

                    " select userKey from fp_Prospects where userid='" + email.Text + "' " +
                    "  ", Con);

            DataSet DSduplicate = new DataSet();

            Con.Open();
            DAduplicate.Fill(DSduplicate);
            Con.Close();

            if (DSduplicate.Tables[0].Rows.Count == 0)
            {

                SqlDataAdapter DA = new SqlDataAdapter(" " +

                        " insert into fp_Prospects(Name,userid,Pwd,mobile1,email1,clientStatus,FTimePeriod,FAmount,RiskCode,SystemDate) " +
                        " values('" + name.Text + "','" + email.Text + "','" + txtPassword.Text + "','" + mobile.Text + "','" + email.Text + "','F','" + ViewState["Period"] + "','" + ViewState["Amount"] + "','" + xRisk + "','" + Convert.ToDateTime(System.DateTime.Now).ToString("yyyy-MM-dd") + "') " +
                        "  ", Con);

                DataSet DS = new DataSet();

                Con.Open();
                DA.Fill(DS);
                Con.Close();

                // Select for Amount and Exlcode                
                DataSet dsData = new DataSet();

                SqlDataAdapter AEDA = new SqlDataAdapter(" " +
                        " select fsm.Exlcode, AllAmount=floor(((Allocation/100)*" + ViewState["Amount"] + ")) from fp_FreeSchemeMatrix fsm, schmst sm  " +
                        " where " + xPeriod + " and riskcode=" + xRisk + "  and fsm.exlcode=sm.exlcode " +
                        "  ", Con);

                DataSet AEDS = new DataSet();
                Con.Open();
                AEDA.Fill(AEDS);
                Con.Close();

                foreach (DataRow row in AEDS.Tables[0].Rows)
                {
                    xExl = xExl + row["Exlcode"].ToString() + "~";
                    xAmt = xAmt + row["AllAmount"].ToString() + "~";
                }
                xExl = xExl.Substring(0, xExl.Length - 1);
                xAmt = xAmt.Substring(0, xAmt.Length - 1);

                //Check for email id already exist or not.
                SqlDataAdapter DAuserkey = new SqlDataAdapter(" " +

                        " select UserID, OpType1, Risk=isnull(RiskCode,99) from fp_Prospects where userid='" + email.Text + "' " +
                        "  ", Con);

                DataSet DSuserkey = new DataSet();

                Con.Open();
                DAuserkey.Fill(DSuserkey);
                Con.Close();

                if (DSuserkey.Tables[0].Rows.Count > 0)
                {
                    //Redirection to parent page         
                    //Response.Redirect("https://invest.fincart.com/index.jsp?email=" + email.Text + "&pswd=" + txtPassword.Text + "&name=" + name.Text + "&mobile=" + mobile.Text + "&exlcode=" + xExl + "&amount=" + xAmt + "&period=" + ViewState["Period"] + "&status=N");
                    Session["userSessionID"] = email.Text.Trim();
                    (this.Master as Website_Website).refreshuser();
                    buttons_visibility();
                    //Response.Redirect(Request.RawUrl);
                }


                //RegistrationInit.Visible = false;
                //RegistrationStart.Visible = true;



            }
            else
            {
                emailValidate.Text = "Email ID already registered. Try again";
            }
            //}
            //else
            //{
            //    lblMessage.Text = "Invalid!";
            //    lblMessage.ForeColor = Color.Red;
            //}
        }
        else
        {
            if (Convert.ToDouble(ViewState["Score"]) <= 12.5)
            {
                imgRisk.ImageUrl = "images/risk-c.png";
                xRisk = "2";
            }

            if (Convert.ToDouble(ViewState["Score"]) > 12.5 && Convert.ToDouble(ViewState["Score"]) < 27.4)
            {
                imgRisk.ImageUrl = "images/risk-m.png";
                xRisk = "3";
            }
            if (Convert.ToDouble(ViewState["Score"]) >= 27.5)
            {
                imgRisk.ImageUrl = "images/risk-a.png";
                xRisk = "4";
            }

            //Code for Scheme Matrix
            if (ViewState["Period"].ToString() == "1")
            {
                xPeriod = "frommonth=0 and tomonth=12 ";
            }
            if (ViewState["Period"].ToString() == "3")
            {
                xPeriod = "frommonth=13 and tomonth=36 ";
            }
            if (ViewState["Period"].ToString() == "5")
            {
                xPeriod = "frommonth=37 and tomonth=60 ";
            }
            if (ViewState["Period"].ToString() == "10")
            {
                xPeriod = "frommonth=61 and tomonth=120 ";
            }
            if (ViewState["Period"].ToString() == "11")
            {
                xPeriod = "frommonth>120";
            }

            SqlDataAdapter DAduplicate = new SqlDataAdapter(" " +

                    " select userKey from fp_Prospects where userid='" + email.Text + "' " +
                    "  ", Con);

            DataSet DSduplicate = new DataSet();

            Con.Open();
            DAduplicate.Fill(DSduplicate);
            Con.Close();

            if (DSduplicate.Tables[0].Rows.Count == 0)
            {

                SqlDataAdapter DA = new SqlDataAdapter(" " +

                        " insert into fp_Prospects(Name,userid,Pwd,mobile1,email1,clientStatus,FTimePeriod,FAmount,RiskCode,SystemDate) " +
                        " values('" + name.Text + "','" + email.Text + "','" + txtPassword.Text + "','" + mobile.Text + "','" + email.Text + "','S','" + ViewState["Period"] + "','" + ViewState["Amount"] + "','" + xRisk + "','" + Convert.ToDateTime(System.DateTime.Now).ToString("yyyy-MM-dd") + "') " +
                        "  ", Con);

                DataSet DS = new DataSet();

                Con.Open();
                DA.Fill(DS);
                Con.Close();

                Response.Redirect("SuccessSOF.aspx");

            }  
        }
    }

    protected void txtAmount_TextChanged(object sender, EventArgs e)
    {

        DataTable dsChartData = new DataTable();
        StringBuilder strSMScript2 = new StringBuilder();

        txtAmount.Text = txtAmount.Text;
        if (Convert.ToDouble(ViewState["Score"]) <= 12.5)
        {
            imgRisk.ImageUrl = "images/risk-c.png";
            xRisk = "2";
        }

        if (Convert.ToDouble(ViewState["Score"]) > 12.5 && Convert.ToDouble(ViewState["Score"]) < 27.4)
        {
            imgRisk.ImageUrl = "images/risk-m.png";
            xRisk = "3";
        }
        if (Convert.ToDouble(ViewState["Score"]) >= 27.5)
        {
            imgRisk.ImageUrl = "images/risk-a.png";
            xRisk = "4";
        }

        //Code for Scheme Matrix
        if (ViewState["Period"].ToString() == "1")
        {
            xPeriod = "frommonth=0 and tomonth=12 ";
        }
        if (ViewState["Period"].ToString() == "3")
        {
            xPeriod = "frommonth=13 and tomonth=36 ";
        }
        if (ViewState["Period"].ToString() == "5")
        {
            xPeriod = "frommonth=37 and tomonth=60 ";
        }
        if (ViewState["Period"].ToString() == "10")
        {
            xPeriod = "frommonth=61 and tomonth=120 ";
        }
        if (ViewState["Period"].ToString() == "11")
        {
            xPeriod = "frommonth>120";
        }

        DataSet dsData = new DataSet();

        SqlDataAdapter DA = new SqlDataAdapter(" " +
                " select sm.sname, Allocation, AllAmount=((Allocation/100)*" + txtAmount.Text + ") from fp_FreeSchemeMatrix fsm, schmst sm " +
                " where " + xPeriod + " and riskcode=" + xRisk + "  and fsm.exlcode=sm.exlcode " +
                "  ", Con);

        DataSet DS = new DataSet();
        Con.Open();
        DA.Fill(DS);
        Con.Close();

        dsChartData = DS.Tables[0];

        strSMScript2.Append(@"<Script>
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
            strSMScript2.Append("{");
            strSMScript2.Append(" category: '" + row["sname"] + "',");
            strSMScript2.Append(" visits: " + row["AllAmount"] + ",");
            strSMScript2.Append(" short: " + row["Allocation"] + "");
            strSMScript2.Append("},");

        }
        strSMScript2.Remove(strSMScript2.Length - 1, 1);
        strSMScript2.Append("],");

        strSMScript2.Append(@"'valueAxes': [{
            'gridColor': '#999999',
            'gridAlpha': 0.2,
            'rotate': true,
            'dashLength': 0
          }],                        
          'startDuration': 1,
          'graphs': [{
            'balloonText': '[[category]]: <b>[[value]]</b>',
            'fillAlphas': 1,
            'lineAlpha': 0.2,
            'fillColors': ['#d5edff', '#b0dcff'],
            'type': 'column',
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
        strSMScript2.Append("</Script>");


        ltSMScripts.Text = strSMScript2.ToString();
        //ScriptManager.RegisterStartupScript(this, this.GetType(), "newWindow", ltSMScripts.Text, true);
        //ScriptManager.RegisterArrayDeclaration(this, "amttext", ltSMScripts.Text);

        dsChartData.Dispose();
        strSMScript2.Clear();
    }

    protected void btnTransact_Click(object sender, EventArgs e)
    {
        string xCode = Session["userSessionID"].ToString();

        SqlDataAdapter DASFF = new SqlDataAdapter(" " +
            " select [Name], Pwd, Email1, Mobile1 from fp_Prospects where userid='" + xCode + "' " +
            "  ", Con);

        DataSet DSSFF = new DataSet();

            Con.Open();
            DASFF.Fill(DSSFF);
            Con.Close();

            if (DSSFF.Tables[0].Rows.Count > 0)
            {
                string str = "https://invest.fincart.com/index.jsp?email=" + DSSFF.Tables[0].Rows[0]["Email1"] + "&pswd=" + DSSFF.Tables[0].Rows[0]["Pwd"] + "&name=" + DSSFF.Tables[0].Rows[0]["Name"] + "&mobile=" + DSSFF.Tables[0].Rows[0]["Mobile1"] + "&exlcode=" + xExl + "&amount=" + xAmt + "&period=" + ViewState["Period"] + "&status=N";

                Response.Redirect("https://invest.fincart.com/index.jsp?email=" + DSSFF.Tables[0].Rows[0]["Email1"] + "&pswd=" + DSSFF.Tables[0].Rows[0]["Pwd"] + "&name=" + DSSFF.Tables[0].Rows[0]["Name"] + "&mobile=" + DSSFF.Tables[0].Rows[0]["Mobile1"] + "&exlcode=" + xExl + "&amount=" + xAmt + "&period=" + ViewState["Period"] + "&status=N");
            }
        
    }
    protected void btnProoceedandTransact_Click(object sender, EventArgs e)
    {
        Session["Campaign"] = null;

        if (Convert.ToDouble(ViewState["Score"]) <= 12.5)
        {
            imgRisk.ImageUrl = "images/risk-c.png";
            xRisk = "2";
        }

        if (Convert.ToDouble(ViewState["Score"]) > 12.5 && Convert.ToDouble(ViewState["Score"]) < 27.4)
        {
            imgRisk.ImageUrl = "images/risk-m.png";
            xRisk = "3";
        }
        if (Convert.ToDouble(ViewState["Score"]) >= 27.5)
        {
            imgRisk.ImageUrl = "images/risk-a.png";
            xRisk = "4";
        }

        //Code for Scheme Matrix
        if (ViewState["Period"].ToString() == "1")
        {
            xPeriod = "frommonth=0 and tomonth=12 ";
        }
        if (ViewState["Period"].ToString() == "3")
        {
            xPeriod = "frommonth=13 and tomonth=36 ";
        }
        if (ViewState["Period"].ToString() == "5")
        {
            xPeriod = "frommonth=37 and tomonth=60 ";
        }
        if (ViewState["Period"].ToString() == "10")
        {
            xPeriod = "frommonth=61 and tomonth=120 ";
        }
        if (ViewState["Period"].ToString() == "11")
        {
            xPeriod = "frommonth>120";
        }

        

            SqlDataAdapter DA = new SqlDataAdapter(" " +

                    " update fp_Prospects set FTimePeriod='" + ViewState["Period"] + "',FAmount='" + ViewState["Amount"] + "',RiskCode='" + xRisk + "' where userid ='" + Session["userSessionID"].ToString() + "' " +
                    "  ", Con);

            DataSet DS = new DataSet();

            Con.Open();
            DA.Fill(DS);
            Con.Close();

            // Select for Amount and Exlcode                
            DataSet dsData = new DataSet();

            SqlDataAdapter AEDA = new SqlDataAdapter(" " +
                    " select fsm.Exlcode, AllAmount=floor(((Allocation/100)*" + ViewState["Amount"] + ")) from fp_FreeSchemeMatrix fsm, schmst sm  " +
                    " where " + xPeriod + " and riskcode=" + xRisk + "  and fsm.exlcode=sm.exlcode " +
                    "  ", Con);

            DataSet AEDS = new DataSet();
            Con.Open();
            AEDA.Fill(AEDS);
            Con.Close();

            foreach (DataRow row in AEDS.Tables[0].Rows)
            {
                xExl = xExl + row["Exlcode"].ToString() + "~";
                xAmt = xAmt + row["AllAmount"].ToString() + "~";
            }
            xExl = xExl.Substring(0, xExl.Length - 1);
            xAmt = xAmt.Substring(0, xAmt.Length - 1);

            //Check for email id already exist or not.
            SqlDataAdapter DAuserkey = new SqlDataAdapter(" " +

                    " select UserID, OpType1,Email1,Pwd,Name,Mobile1, Risk=isnull(RiskCode,99) from fp_Prospects where userid='" + Session["userSessionID"].ToString() + "' " +
                    "  ", Con);

            DataSet DSuserkey = new DataSet();

            Con.Open();
            DAuserkey.Fill(DSuserkey);
            Con.Close();

            if (DSuserkey.Tables[0].Rows.Count > 0)
            {
                //Redirection to parent page           
                //Response.Redirect("https://invest.fincart.com/index.jsp?email=" + email.Text + "&pswd=" + txtPassword.Text + "&name=" + name.Text + "&mobile=" + mobile.Text + "&exlcode=" + xExl + "&amount=" + xAmt + "&period=" + ViewState["Period"] + "&status=N");
                Response.Redirect("https://invest.fincart.com/index.jsp?email=" + DSuserkey.Tables[0].Rows[0]["Email1"] + "&pswd=" + DSuserkey.Tables[0].Rows[0]["Pwd"] + "&name=" + DSuserkey.Tables[0].Rows[0]["Name"] + "&mobile=" + DSuserkey.Tables[0].Rows[0]["Mobile1"] + "&exlcode=" + xExl + "&amount=" + xAmt + "&period=" + ViewState["Period"] + "&status=N");
            }

    }
    protected void LoginButton_Click(object sender, EventArgs e)
    {
        LeadTracker lt = new LeadTracker();

        string usr = lt.userlogin(eusername.Text.Trim(), epassword.Text.Trim());
        if (!String.IsNullOrWhiteSpace(usr))
        {
            Session["userSessionID"] = usr;

            Session["Campaign"] = null;

            if (Convert.ToDouble(ViewState["Score"]) <= 12.5)
            {
                imgRisk.ImageUrl = "images/risk-c.png";
                xRisk = "2";
            }

            if (Convert.ToDouble(ViewState["Score"]) > 12.5 && Convert.ToDouble(ViewState["Score"]) < 27.4)
            {
                imgRisk.ImageUrl = "images/risk-m.png";
                xRisk = "3";
            }
            if (Convert.ToDouble(ViewState["Score"]) >= 27.5)
            {
                imgRisk.ImageUrl = "images/risk-a.png";
                xRisk = "4";
            }

            //Code for Scheme Matrix
            if (ViewState["Period"].ToString() == "1")
            {
                xPeriod = "frommonth=0 and tomonth=12 ";
            }
            if (ViewState["Period"].ToString() == "3")
            {
                xPeriod = "frommonth=13 and tomonth=36 ";
            }
            if (ViewState["Period"].ToString() == "5")
            {
                xPeriod = "frommonth=37 and tomonth=60 ";
            }
            if (ViewState["Period"].ToString() == "10")
            {
                xPeriod = "frommonth=61 and tomonth=120 ";
            }
            if (ViewState["Period"].ToString() == "11")
            {
                xPeriod = "frommonth>120";
            }



            SqlDataAdapter DA = new SqlDataAdapter(" " +

                    " update fp_Prospects set FTimePeriod='" + ViewState["Period"] + "',FAmount='" + ViewState["Amount"] + "',RiskCode='" + xRisk + "' where userid ='" + Session["userSessionID"].ToString() + "' " +
                    "  ", Con);

            DataSet DS = new DataSet();

            Con.Open();
            DA.Fill(DS);
            Con.Close();

            // Select for Amount and Exlcode                
            DataSet dsData = new DataSet();

            SqlDataAdapter AEDA = new SqlDataAdapter(" " +
                    " select fsm.Exlcode, AllAmount=floor(((Allocation/100)*" + ViewState["Amount"] + ")) from fp_FreeSchemeMatrix fsm, schmst sm  " +
                    " where " + xPeriod + " and riskcode=" + xRisk + "  and fsm.exlcode=sm.exlcode " +
                    "  ", Con);

            DataSet AEDS = new DataSet();
            Con.Open();
            AEDA.Fill(AEDS);
            Con.Close();

            foreach (DataRow row in AEDS.Tables[0].Rows)
            {
                xExl = xExl + row["Exlcode"].ToString() + "~";
                xAmt = xAmt + row["AllAmount"].ToString() + "~";
            }
            xExl = xExl.Substring(0, xExl.Length - 1);
            xAmt = xAmt.Substring(0, xAmt.Length - 1);

            //Check for email id already exist or not.
            SqlDataAdapter DAuserkey = new SqlDataAdapter(" " +

                    " select UserID, OpType1, Risk=isnull(RiskCode,99) from fp_Prospects where userid='" + Session["userSessionID"].ToString() + "' " +
                    "  ", Con);

            DataSet DSuserkey = new DataSet();

            Con.Open();
            DAuserkey.Fill(DSuserkey);
            Con.Close();

            if (DSuserkey.Tables[0].Rows.Count > 0)
            {
                //Redirection to parent page           
                //Response.Redirect("https://invest.fincart.com/index.jsp?email=" + email.Text + "&pswd=" + txtPassword.Text + "&name=" + name.Text + "&mobile=" + mobile.Text + "&exlcode=" + xExl + "&amount=" + xAmt + "&period=" + ViewState["Period"] + "&status=N");
                (this.Master as Website_Website).refreshuser();
                buttons_visibility();
                //Response.Redirect(Request.RawUrl);
            }
        }
        else
        {
            emailValidate.Text = "<div class='alert-danger' style='text-align: center; border-radius: 5px; margin-top: 2px;background-color:#fff;color:#ff0000;' >Invalid Credentials !! <a href=javascript:openlogin(); style='color:#1168d5'>Sign IN</a></div>";
        }

    }
    protected void forgetButton_Click(object sender, EventArgs e)
    {
        LeadTracker lt = new LeadTracker();

        if (lt.forgetpass(txtEmailID.Text.Trim()))
        {
            emailValidate.Text = "<div class='alert-danger' style='text-align: center; border-radius: 5px; margin-top: 2px;background-color:#fff;color:#4c9e32;' >We have sent information about your password to your recovery email address. <a href=javascript:openlogin(); style='color:#1168d5'>Sign IN</a></div>";
        }
        else
        {
            emailValidate.Text = "<div class='alert-danger' style='text-align: center; border-radius: 5px; margin-top: 2px;background-color:#fff;color:#ff0000;' >Invalid Email !! <a href=javascript:openlogin(); style='color:#1168d5'>Sign IN</a></div>";
        }
    }
}