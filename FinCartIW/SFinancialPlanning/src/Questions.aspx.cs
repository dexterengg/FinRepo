using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Excel.FinancialFunctions;
using System.Data;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.IO;

public partial class SFinancialPlanning_src_Questions : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["userSessionID"] == null || Session["Campaign"] == null)
            {
                Response.Redirect("../FPSelfie.aspx");
            }
            else if (Session["Payment"] != null)
            {
                Response.Redirect("../Payment.aspx");
            }
            else
            {
                LeadTracker lt = new LeadTracker();
                DataTable dt = lt.UserDetailsByEmailId(Session["userSessionID"].ToString());
                Session["Name"] = dt.Rows[0]["Name"].ToString();
                Session["Email"] = dt.Rows[0]["UserID"].ToString();
                Session["Mobile"] = dt.Rows[0]["Mobile1"].ToString();
                Session["UserPass"] = dt.Rows[0]["Pwd"].ToString();
            }
        }

    }


    [WebMethod]
    public static string setplan(int currage, double anualincome, double monthlyexp, double assetcost, int assettime, double vacationcost, int vacationtime, double othercost, int othertime,
        int retireage, int life, string stat, string goals, int noofchild, string hospital, bool illness, int inflation, double investing, double stock, double knowledge, double risk,
        string childrensage, string childrenseducation, string childrensmarriage)
    {
        string res = "ok";
        try
        {
            if (HttpContext.Current.Session["Name"] != null && HttpContext.Current.Session["Email"] != null && HttpContext.Current.Session["Mobile"] != null)
            {
                SqlHelper sqlHelper = new SqlHelper();
                DataTable dt_assets = SqlHelper.ExecuteDataset(sqlHelper.conn, CommandType.Text, "select * from [dbo].[fp_Assets]").Tables[0];
                DataTable dt_returns = SqlHelper.ExecuteDataset(sqlHelper.conn, CommandType.Text, "select * from [dbo].[fp_Returns]").Tables[0];

                HttpContext.Current.Session["AssetTitles"] = dt_assets;
                HttpContext.Current.Session["returns"] = dt_returns;

                userdata objusr = new userdata();
                objusr.currage = currage;
                objusr.anualincome = anualincome;
                objusr.monthlyexp = monthlyexp;
                objusr.assetcost = assetcost;
                objusr.assettime = assettime;
                objusr.vacationcost = vacationcost;
                objusr.vacationtime = vacationtime;
                objusr.othercost = othercost;
                objusr.othertime = othertime;
                objusr.retireage = retireage;
                objusr.life = life;
                objusr.stat = stat;
                objusr.goals = goals;
                objusr.noofchild = noofchild;
                objusr.hospital = hospital;
                objusr.illness = illness;
                objusr.inflation = inflation;
                objusr.investing = investing;
                objusr.stock = stock;
                objusr.knowledge = knowledge;
                objusr.risk = risk;
                objusr.childrensage = childrensage;
                objusr.childrenseducation = childrenseducation;
                objusr.childrensmarriage = childrensmarriage;

                HttpContext.Current.Session["userplandetails"] = objusr;

                Plan pl = new Plan();

                if (HttpContext.Current.Session["userplandetails"] != null)
                    pl = GetData(HttpContext.Current.Session["userplandetails"] as userdata);

                pl.name = Convert.ToString(HttpContext.Current.Session["Name"]);
                pl.email = Convert.ToString(HttpContext.Current.Session["Email"]);
                pl.mobile = Convert.ToString(HttpContext.Current.Session["Mobile"]);

                HttpContext.Current.Session["CalculatedPlan"] = pl;
            }
        }
        catch (Exception ex)
        {
            res = "error:" + ex;
        }

        return res;
    }
    public static string getSchemeName(int risk, int time)
    {
        string name = "L0";

        if (risk == 15)
        {
            if (time <= 1)
            {
                name = "L0";
            }
            else if (time <= 3)
            {
                name = "L1";
            }
            else if (time <= 5)
            {
                name = "L3";
            }
            else if (time <= 10)
            {
                name = "L5";
            }
            else
            {
                name = "L10";
            }
        }
        else if (risk == 25)
        {
            if (time <= 1)
            {
                name = "M0";
            }
            else if (time <= 3)
            {
                name = "M1";
            }
            else if (time <= 5)
            {
                name = "M3";
            }
            else if (time <= 10)
            {
                name = "M5";
            }
            else
            {
                name = "M10";
            }
        }
        else
        {
            if (time <= 1)
            {
                name = "H0";
            }
            else if (time <= 3)
            {
                name = "H1";
            }
            else if (time <= 5)
            {
                name = "H3";
            }
            else if (time <= 10)
            {
                name = "H5";
            }
            else
            {
                name = "H10";
            }
        }

        return name;
    }
    private static Plan GetData(userdata user)
    {
        //Write your logic here
        var pln = new Plan();
        pln.status = user.stat;
        pln.currrentage = user.currage.ToString();
        pln.retirementage = "N/A";
        pln.lifeexpentency = "N/A";

        var rsk = user.risk + user.knowledge + user.investing + user.stock;


        if (rsk <= 12.5)
        {
            pln.Risk_Ability = "15";//"Low";
        }
        else if (rsk >= 12.6 && rsk <= 27.4)
        {
            pln.Risk_Ability = "25";// "Moderate";
        }
        else
        {
            pln.Risk_Ability = "35";// "High";
        }

        Dictionary<string, double> schemefindigdata = new Dictionary<string, double>();


        pln.E_Fund_Amount = (user.monthlyexp * 6).ToString("#,##,##,###");
        pln.E_Fund_SIP = (0).ToString("#,##,##,###");//???
        pln.Risk_T_Insurance = (user.anualincome * 10).ToString("#,##,##,###");
        pln.Risk_FF_Insurance = get_health_insurance(user.stat, user.noofchild, user.anualincome).ToString("#,##,##,###");//???



        List<string> chrtdata = new List<string>();
        List<string> chrtdata_title = new List<string>();
        List<string> chrtdata_value = new List<string>();

        string[] goals = user.goals.Split('~');
        for (int i = 0; i < goals.Length; i++)
        {

            if (goals[i] == "CE")
            {
                pln.ChildE = true;
            }

            if (goals[i] == "CM")
            {
                pln.ChildM = true;
            }

            if (goals[i] == "AC")
            {
                pln.Asset = true;
            }

            if (goals[i] == "VC")
            {
                pln.Vacation = true;
            }

            if (goals[i] == "OC")
            {
                pln.other = true;
            }

            if (goals[i] == "RA")
            {
                pln.Retire = true;
            }
        }

        if (pln.ChildE)
        {
            string[] chlidage = user.childrensage.Split('~');
            string[] chlidedu = user.childrenseducation.Split('~');
            int tottime = 0;

            List<int> cage = new List<int>();
            List<double> cedu = new List<double>();


            for (int i = 0; i < chlidage.Length; i++)
            {
                cage.Add(Convert.ToInt32(chlidage[i]));
                tottime = tottime + (18 - Convert.ToInt32(chlidage[i]));
            }


            for (int i = 0; i < chlidedu.Length; i++)
            {
                cedu.Add(Convert.ToDouble(chlidedu[i]));
            }

            List<string> ce = Child_Goal_calculator(18, cedu, cage, user.inflation, user.investing, user.stock, user.knowledge, user.risk);
            pln.ChildE_SIP = ce[0];
            pln.ChildE_Amount = ce[1];

            string res = asset_allocation_chart_data(user.investing, user.stock, user.knowledge, user.risk, tottime, pln.ChildE_SIP);

            string[] t = res.Split(',');

            if (chrtdata_title.Contains(t[0]))
            {

                int i = chrtdata_title.IndexOf(t[0]);

                int amt = Convert.ToInt32(chrtdata_value[i]);
                int amt2 = Convert.ToInt32(t[1]);

                chrtdata_value[i] = Convert.ToString(amt + amt2);
            }
            else
            {
                chrtdata_title.Add(t[0]);
                chrtdata_value.Add(t[1]);
            }

            int mintime = 18 - cage.Max();
            string key = getSchemeName(Convert.ToInt32(pln.Risk_Ability), Convert.ToInt32(mintime));
            if (schemefindigdata.ContainsKey(key))
            {
                schemefindigdata[key] = schemefindigdata[key] + Convert.ToDouble(pln.ChildE_SIP.Replace(",", ""));
            }
            else
            {
                schemefindigdata.Add(key, Convert.ToDouble(pln.ChildE_SIP.Replace(",", "")));
            }

            //chrtdata.Add(asset_allocation_chart_data(user.investing, user.stock, user.knowledge, user.risk, tottime, pln.ChildE_SIP));
        }
        else
        {
            pln.ChildE_SIP = "0";
            pln.ChildE_Amount = "0";
        }

        if (pln.ChildM)
        {
            string[] chlidage = user.childrensage.Split('~');
            string[] chlidm = user.childrensmarriage.Split('~');
            int tottime = 0;

            List<int> cage = new List<int>();
            List<double> cmr = new List<double>();


            for (int i = 0; i < chlidage.Length; i++)
            {
                cage.Add(Convert.ToInt32(chlidage[i]));
                tottime = tottime + (24 - Convert.ToInt32(chlidage[i]));
            }

            for (int i = 0; i < chlidm.Length; i++)
            {
                cmr.Add(Convert.ToDouble(chlidm[i]));
            }

            List<string> cm = Child_Goal_calculator(24, cmr, cage, user.inflation, user.investing, user.stock, user.knowledge, user.risk);
            pln.ChildM_SIP = cm[0];
            pln.ChildM_Amount = cm[1];


            string res = asset_allocation_chart_data(user.investing, user.stock, user.knowledge, user.risk, tottime, pln.ChildM_SIP);

            string[] t = res.Split(',');

            if (chrtdata_title.Contains(t[0]))
            {

                int i = chrtdata_title.IndexOf(t[0]);

                int amt = Convert.ToInt32(chrtdata_value[i]);
                int amt2 = Convert.ToInt32(t[1]);

                chrtdata_value[i] = Convert.ToString(amt + amt2);
            }
            else
            {
                chrtdata_title.Add(t[0]);
                chrtdata_value.Add(t[1]);
            }
            int mintime = 24 - cage.Max();
            string key = getSchemeName(Convert.ToInt32(pln.Risk_Ability), Convert.ToInt32(mintime));
            if (schemefindigdata.ContainsKey(key))
            {
                schemefindigdata[key] = schemefindigdata[key] + Convert.ToDouble(pln.ChildM_SIP.Replace(",", ""));
            }
            else
            {
                schemefindigdata.Add(key, Convert.ToDouble(pln.ChildM_SIP.Replace(",", "")));
            }
            //schemefindigdata.Add(getSchemeName(Convert.ToInt32(pln.Risk_Ability), Convert.ToInt32(mintime)), Convert.ToDouble(pln.ChildM_SIP.Replace(",", "")));
            //chrtdata.Add(asset_allocation_chart_data(user.investing, user.stock, user.knowledge, user.risk, tottime, pln.ChildM_SIP));
        }
        else
        {
            pln.ChildM_SIP = "0";
            pln.ChildM_Amount = "0";
        }


        if (pln.Retire)
        {
            pln.retirementage = user.retireage.ToString();
            pln.lifeexpentency = user.life.ToString();

            List<string> rt = retirement_calculator(user.currage, user.retireage, user.life, user.monthlyexp, user.inflation, user.investing, user.stock, user.knowledge, user.risk);
            pln.Retire_SIP = rt[0];
            pln.Retire_Amount = rt[1];

            string res = asset_allocation_chart_data(user.investing, user.stock, user.knowledge, user.risk, user.retireage - user.currage, pln.Retire_SIP);

            string[] t = res.Split(',');

            if (chrtdata_title.Contains(t[0]))
            {

                int i = chrtdata_title.IndexOf(t[0]);

                int amt = Convert.ToInt32(chrtdata_value[i]);
                int amt2 = Convert.ToInt32(t[1]);

                chrtdata_value[i] = Convert.ToString(amt + amt2);
            }
            else
            {
                chrtdata_title.Add(t[0]);
                chrtdata_value.Add(t[1]);
            }

            string key = getSchemeName(Convert.ToInt32(pln.Risk_Ability), Convert.ToInt32(user.retireage - user.currage));
            if (schemefindigdata.ContainsKey(key))
            {
                schemefindigdata[key] = schemefindigdata[key] + Convert.ToDouble(pln.Retire_SIP.Replace(",", ""));
            }
            else
            {
                schemefindigdata.Add(key, Convert.ToDouble(pln.Retire_SIP.Replace(",", "")));
            }
            //chrtdata.Add(asset_allocation_chart_data(user.investing, user.stock, user.knowledge, user.risk, user.retireage - user.currage, pln.Retire_SIP));
        }
        else
        {
            pln.Retire_SIP = "0";
            pln.Retire_Amount = "0";
        }

        if (pln.Vacation)
        {
            List<string> v = Goal_calculator(user.vacationcost, user.vacationtime, user.inflation, user.investing, user.stock, user.knowledge, user.risk);
            pln.Vacation_SIP = v[0];
            pln.Vacation_Amount = v[1];

            string res = asset_allocation_chart_data(user.investing, user.stock, user.knowledge, user.risk, user.vacationtime, pln.Vacation_SIP);

            string[] t = res.Split(',');

            if (chrtdata_title.Contains(t[0]))
            {

                int i = chrtdata_title.IndexOf(t[0]);

                int amt = Convert.ToInt32(chrtdata_value[i]);
                int amt2 = Convert.ToInt32(t[1]);

                chrtdata_value[i] = Convert.ToString(amt + amt2);
            }
            else
            {
                chrtdata_title.Add(t[0]);
                chrtdata_value.Add(t[1]);
            }

            string key = getSchemeName(Convert.ToInt32(pln.Risk_Ability), Convert.ToInt32(user.vacationtime));
            if (schemefindigdata.ContainsKey(key))
            {
                schemefindigdata[key] = schemefindigdata[key] + Convert.ToDouble(pln.Vacation_SIP.Replace(",", ""));
            }
            else
            {
                schemefindigdata.Add(key, Convert.ToDouble(pln.Vacation_SIP.Replace(",", "")));
            }
            //schemefindigdata.Add(getSchemeName(Convert.ToInt32(pln.Risk_Ability), Convert.ToInt32(user.vacationtime)), Convert.ToDouble(pln.Vacation_SIP.Replace(",", "")));
            //chrtdata.Add(asset_allocation_chart_data(user.investing, user.stock, user.knowledge, user.risk, user.vacationtime, pln.Vacation_SIP));
        }
        else
        {
            pln.Vacation_SIP = "0";
            pln.Vacation_Amount = "0";
        }

        if (pln.Asset)
        {
            List<string> a = Goal_calculator(user.assetcost, user.assettime, user.inflation, user.investing, user.stock, user.knowledge, user.risk);
            pln.Asset_SIP = a[0];
            pln.Asset_Amount = a[1];

            string res = asset_allocation_chart_data(user.investing, user.stock, user.knowledge, user.risk, user.assettime, pln.Asset_SIP);

            string[] t = res.Split(',');

            if (chrtdata_title.Contains(t[0]))
            {

                int i = chrtdata_title.IndexOf(t[0]);

                int amt = Convert.ToInt32(chrtdata_value[i]);
                int amt2 = Convert.ToInt32(t[1]);

                chrtdata_value[i] = Convert.ToString(amt + amt2);
            }
            else
            {
                chrtdata_title.Add(t[0]);
                chrtdata_value.Add(t[1]);
            }
            string key = getSchemeName(Convert.ToInt32(pln.Risk_Ability), Convert.ToInt32(user.assettime));
            if (schemefindigdata.ContainsKey(key))
            {
                schemefindigdata[key] = schemefindigdata[key] + Convert.ToDouble(pln.Asset_SIP.Replace(",", ""));
            }
            else
            {
                schemefindigdata.Add(key, Convert.ToDouble(pln.Asset_SIP.Replace(",", "")));
            }
            //schemefindigdata.Add(getSchemeName(Convert.ToInt32(pln.Risk_Ability), Convert.ToInt32(user.assettime)), Convert.ToDouble(pln.Asset_SIP.Replace(",", "")));
            //chrtdata.Add(asset_allocation_chart_data(user.investing, user.stock, user.knowledge, user.risk, user.assettime, pln.Asset_SIP));
        }
        else
        {
            pln.Asset_SIP = "0";
            pln.Asset_Amount = "0";
        }

        if (pln.other)
        {
            List<string> o = Goal_calculator(user.othercost, user.othertime, user.inflation, user.investing, user.stock, user.knowledge, user.risk);
            pln.other_SIP = o[0];
            pln.other_Amount = o[1];

            string res = asset_allocation_chart_data(user.investing, user.stock, user.knowledge, user.risk, user.othertime, pln.other_SIP);

            string[] t = res.Split(',');

            if (chrtdata_title.Contains(t[0]))
            {

                int i = chrtdata_title.IndexOf(t[0]);

                int amt = Convert.ToInt32(chrtdata_value[i]);
                int amt2 = Convert.ToInt32(t[1]);

                chrtdata_value[i] = Convert.ToString(amt + amt2);
            }
            else
            {
                chrtdata_title.Add(t[0]);
                chrtdata_value.Add(t[1]);
            }

            string key = getSchemeName(Convert.ToInt32(pln.Risk_Ability), Convert.ToInt32(user.othertime));
            if (schemefindigdata.ContainsKey(key))
            {
                schemefindigdata[key] = schemefindigdata[key] + Convert.ToDouble(pln.other_SIP.Replace(",", ""));
            }
            else
            {
                schemefindigdata.Add(key, Convert.ToDouble(pln.other_SIP.Replace(",", "")));
            }
            //schemefindigdata.Add(getSchemeName(Convert.ToInt32(pln.Risk_Ability), Convert.ToInt32(user.othertime)), Convert.ToDouble(pln.other_SIP.Replace(",", "")));
            //chrtdata.Add(asset_allocation_chart_data(user.investing, user.stock, user.knowledge, user.risk, user.othertime, pln.other_SIP));
        }
        else
        {
            pln.other_SIP = "0";
            pln.other_Amount = "0";
        }


        for (int i = 0; i < chrtdata_title.Count; i++)
        {
            chrtdata.Add(chrtdata_title[i] + "," + chrtdata_value[i]);
        }


        pln.chartdata = String.Join("~", chrtdata.ToArray());

        pln.illness = "No";
        if (user.illness)
            pln.illness = "Yes";

        Dictionary<string, double> finalschemefindigdata = new Dictionary<string, double>();

        if (schemefindigdata.Keys.Count > 1)
        {
            foreach (var key in schemefindigdata.Keys)
            {
                finalschemefindigdata.Add(key, schemefindigdata[key]);
            }
            finalschemefindigdata.Add("E0", Convert.ToDouble(pln.E_Fund_Amount.Replace(",", "")));
        }
        else
        {
            foreach (var key in schemefindigdata.Keys)
            {
                finalschemefindigdata.Add(key + "3", schemefindigdata[key]);
            }
            finalschemefindigdata.Add("E0", Convert.ToDouble(pln.E_Fund_Amount.Replace(",", "")));
        }

        string schemes = "";

        foreach (var key in finalschemefindigdata.Keys)
        {
            schemes = schemes + ""+LeadTracker.getSchemeCodeByname(key)+"~"+finalschemefindigdata[key]+"|";
        }

        pln.Schemes = schemes;

        return pln;
    }

    public static double get_health_insurance(string status, int childs, double annualincome)
    {
        double ret = 0;
        if (status == "Single")
        {
            if (annualincome < 500000)
            {
                ret = 500000;
            }
            else if (annualincome >= 500000 || annualincome > 1000000)
            {
                ret = 500000;
            }
            else if (annualincome >= 1000000 || annualincome > 2000000)
            {
                ret = 1000000;
            }
            else if (annualincome >= 2000000 || annualincome > 5000000)
            {
                ret = 1500000;
            }
            else if (annualincome >= 5000000)
            {
                ret = 2000000;
            }
        }
        else if (status == "Married without Kids")
        {
            if (annualincome < 500000)
            {
                ret = 800000;
            }
            else if (annualincome >= 500000 || annualincome > 1000000)
            {
                ret = 800000;
            }
            else if (annualincome >= 1000000 || annualincome > 2000000)
            {
                ret = 1500000;
            }
            else if (annualincome >= 2000000 || annualincome > 5000000)
            {
                ret = 2300000;
            }
            else if (annualincome >= 5000000)
            {
                ret = 3000000;
            }
        }
        else if (status == "Married with Kids")
        {
            if (childs == 1)
            {
                if (annualincome < 500000)
                {
                    ret = 900000;
                }
                else if (annualincome >= 500000 || annualincome > 1000000)
                {
                    ret = 900000;
                }
                else if (annualincome >= 1000000 || annualincome > 2000000)
                {
                    ret = 1800000;
                }
                else if (annualincome >= 2000000 || annualincome > 5000000)
                {
                    ret = 2600000;
                }
                else if (annualincome >= 5000000)
                {
                    ret = 3500000;
                }
            }
            else if (childs == 2)
            {
                if (annualincome < 500000)
                {
                    ret = 1000000;
                }
                else if (annualincome >= 500000 || annualincome > 1000000)
                {
                    ret = 1000000;
                }
                else if (annualincome >= 1000000 || annualincome > 2000000)
                {
                    ret = 2000000;
                }
                else if (annualincome >= 2000000 || annualincome > 5000000)
                {
                    ret = 3000000;
                }
                else if (annualincome >= 5000000)
                {
                    ret = 4000000;
                }
            }
            else if (childs == 3)
            {
                if (annualincome < 500000)
                {
                    ret = 1000000;
                }
                else if (annualincome >= 500000 || annualincome > 1000000)
                {
                    ret = 1000000;
                }
                else if (annualincome >= 1000000 || annualincome > 2000000)
                {
                    ret = 2000000;
                }
                else if (annualincome >= 2000000 || annualincome > 5000000)
                {
                    ret = 3000000;
                }
                else if (annualincome >= 5000000)
                {
                    ret = 4000000;
                }
            }

        }
        return ret;
    }
    public static string asset_allocation_chart_data(double investing, double stock, double knwoledge, double risk, int time, string sip)
    {
        string dt = "";

        double xROR = Convert.ToDouble(investing + stock + knwoledge + risk);

        if (xROR <= 12.5)
        {
            dt = get_asset_title("Low", time) + "," + sip.Replace(",", "");
        }
        else if (xROR >= 12.6 && xROR <= 27.4)
        {
            dt = get_asset_title("Moderate", time) + "," + sip.Replace(",", "");
        }
        else if (xROR >= 27.5)
        {
            dt = get_asset_title("High", time) + "," + sip.Replace(",", "");
        }

        return dt;
    }
    private static string get_asset_title(string asset_risk, int time)
    {
        DataTable dt = HttpContext.Current.Session["AssetTitles"] as DataTable;

        string res = "";
        if (asset_risk == "Low")
        {
            if (time < 1)
            {
                res = (dt.Rows.Count > 0) ? Convert.ToString(dt.Rows[0]["Assettime1"]) : "Liquid Fund";
            }
            else if (time >= 1 && time < 3)
            {
                res = (dt.Rows.Count > 0) ? Convert.ToString(dt.Rows[0]["Assettime2"]) : "Short Term Fund";
            }
            else if (time >= 3 && time < 5)
            {
                res = (dt.Rows.Count > 0) ? Convert.ToString(dt.Rows[0]["Assettime3"]) : "MIP";
            }
            else if (time >= 5 && time < 10)
            {
                res = (dt.Rows.Count > 0) ? Convert.ToString(dt.Rows[0]["Assettime4"]) : "Hybrid";
            }
            else if (time >= 10)
            {
                res = (dt.Rows.Count > 0) ? Convert.ToString(dt.Rows[0]["Assettime5"]) : "Large Cap Fund";
            }
        }

        if (asset_risk == "Moderate")
        {
            if (time < 1)
            {
                res = (dt.Rows.Count > 0) ? Convert.ToString(dt.Rows[1]["Assettime1"]) : "Liquid Plus";
            }
            else if (time >= 1 && time < 3)
            {
                res = (dt.Rows.Count > 0) ? Convert.ToString(dt.Rows[1]["Assettime2"]) : "Short Term Fund";
            }
            else if (time >= 3 && time < 5)
            {
                res = (dt.Rows.Count > 0) ? Convert.ToString(dt.Rows[1]["Assettime3"]) : "Equity Savings Fund";
            }
            else if (time >= 5 && time < 10)
            {
                res = (dt.Rows.Count > 0) ? Convert.ToString(dt.Rows[1]["Assettime4"]) : "Aggressive Hybrid";
            }
            else if (time >= 10)
            {
                res = (dt.Rows.Count > 0) ? Convert.ToString(dt.Rows[1]["Assettime5"]) : "Midcap Fund";
            }
        }

        if (asset_risk == "High")
        {
            if (time < 1)
            {
                res = (dt.Rows.Count > 0) ? Convert.ToString(dt.Rows[2]["Assettime1"]) : "Arbitrage Fund";
            }
            else if (time >= 1 && time < 3)
            {
                res = (dt.Rows.Count > 0) ? Convert.ToString(dt.Rows[2]["Assettime2"]) : "Equity Savings";
            }
            else if (time >= 3 && time < 5)
            {
                res = (dt.Rows.Count > 0) ? Convert.ToString(dt.Rows[2]["Assettime3"]) : "Hybrid";
            }
            else if (time >= 5 && time < 10)
            {
                res = (dt.Rows.Count > 0) ? Convert.ToString(dt.Rows[2]["Assettime4"]) : "Large Cap";
            }
            else if (time >= 10)
            {
                res = (dt.Rows.Count > 0) ? Convert.ToString(dt.Rows[2]["Assettime5"]) : "Small Cap Fund";
            }
        }
        return res;
    }
    public static List<string> Goal_calculator(double cost, int years, int inflation, double investing, double stock, double knwoledge, double risk)
    {
        List<string> ret_vals = new List<string>();
        //double xROR = Convert.ToDouble(investing + stock + knwoledge + risk);

        double futurevalue = futureval(inflation * .01, years, 0, -cost);
        double annual = futurevalue;//((cost * (Math.Pow((1 + .01 * inflation), years))) * (xROR * .01)) / (Math.Pow((1 + .01 * xROR), years) - 1);


        double ret = return_assumtions(years);
        double rate = Financial.Nominal(ret * .01, 12) / 12;

        double nper = (years) * 12;

        double sip = pmt(rate, nper, 0, -futurevalue);//Math.Floor(Math.Round((annual / 12) / 1000, 0)) * 1000;

        ret_vals.Add(sip.ToString("#,##,##,###"));
        ret_vals.Add(annual.ToString("#,##,##,###"));

        return ret_vals;
    }
    public static double futureval(double rate, double nper, double pmt, double pv)
    {
        return Financial.Fv(rate, nper, pmt, pv, Excel.FinancialFunctions.PaymentDue.BeginningOfPeriod);
    }
    public static double pmt(double rate, double nper, double pv, double fv)
    {
        return Financial.Pmt(rate, nper, pv, fv, Excel.FinancialFunctions.PaymentDue.BeginningOfPeriod);
    }
    public static double pv(double rate, double nper, double pmt)
    {
        return Financial.Pv(rate, nper, pmt, 0, Excel.FinancialFunctions.PaymentDue.BeginningOfPeriod);
    }
    public static List<string> Child_Goal_calculator(int minage, List<double> cost, List<int> years, int inflation, double investing, double stock, double knwoledge, double risk)
    {
        List<string> ret_vals = new List<string>();
        double xROR = Convert.ToDouble(investing + stock + knwoledge + risk);

        double annual = 0, sip = 0;

        for (int i = 0; i < cost.Count; i++)
        {
            double nper = (minage - years[i]);

            //double futurevalue = Financial.Fv(inflation*.01, nper, 0, -cost[i], Excel.FinancialFunctions.PaymentDue.BeginningOfPeriod);

            //double rate = return_assumtions(18 - years[i]) * .01;

            annual = annual + futureval(inflation * .01, nper, 0, -cost[i]);//Financial.Pv(rate, nper, 0, -futurevalue, Excel.FinancialFunctions.PaymentDue.BeginningOfPeriod);

            //annual = annual + ((cost[i] * (Math.Pow((1 + .01 * inflation), (18 - years[i])))) * (xROR * .01)) / (Math.Pow((1 + .01 * xROR), (18 - years[i])) - 1);
        }

        for (int i = 0; i < cost.Count; i++)
        {
            //double futurevalue = Financial.Fv(inflation, Convert.ToDouble(18 - years[i]), 0.0, cost[i], Excel.FinancialFunctions.PaymentDue.EndOfPeriod);

            double futurevalue = Financial.Fv(inflation * .01, (minage - years[i]), 0, -cost[i], Excel.FinancialFunctions.PaymentDue.BeginningOfPeriod);

            double ret = return_assumtions(minage - years[i]);
            double rate = Financial.Nominal(ret * .01, 12) / 12;

            double nper = (minage - years[i]) * 12;

            sip = sip + pmt(rate, nper, 0, -futurevalue);//Financial.Pmt(rate,nper,0,-futurevalue, Excel.FinancialFunctions.PaymentDue.BeginningOfPeriod);
            //sip = sip + Math.Floor(Math.Round(((((cost[i] * (Math.Pow((1 + .01 * inflation), (18 - years[i])))) * (xROR * .01)) / (Math.Pow((1 + .01 * xROR), (18 - years[i])) - 1)) / 12) / 1000, 0)) * 1000;
        }

        ret_vals.Add(sip.ToString("#,##,##,###"));
        ret_vals.Add(annual.ToString("#,##,##,###"));

        return ret_vals;
    }
    //public List<string> Child_Goal_calculator(List<double> cost, List<int> years, int inflation, double investing, double stock, double knwoledge, double risk)
    //{
    //    List<string> ret_vals = new List<string>();
    //    double xROR = Convert.ToDouble(investing + stock + knwoledge + risk);


    //    double annual = 0, sip = 0;

    //    for (int i = 0; i < cost.Count; i++)
    //    {
    //        annual = annual + ((cost[i] * (Math.Pow((1 + .01 * inflation), (18 - years[i])))) * (xROR * .01)) / (Math.Pow((1 + .01 * xROR), (18 - years[i])) - 1);
    //    }

    //    for (int i = 0; i < cost.Count; i++)
    //    {
    //        sip = sip + Math.Floor(Math.Round(((((cost[i] * (Math.Pow((1 + .01 * inflation), (18 - years[i])))) * (xROR * .01)) / (Math.Pow((1 + .01 * xROR), (18 - years[i])) - 1)) / 12) / 1000, 0)) * 1000;
    //    }

    //    ret_vals.Add(sip.ToString("#,##,##,###"));
    //    ret_vals.Add(annual.ToString("#,##,##,###"));

    //    return ret_vals;
    //}
    public static List<string> retirement_calculator(int age, int ret_age, int life, double mnthly_exp, int inflation, double investing, double stock, double knwoledge, double risk)
    {
        List<string> ret_vals = new List<string>();

        //double xROR = Convert.ToDouble(investing + stock + knwoledge + risk);

        int ret_yrs = ret_age - age;

        double pre_ret_return = return_assumtions(ret_yrs) * .01;

        double posr_ret_return = 9 * .01;


        double Apmt = Math.Pow((1 + (inflation * .01)), ret_yrs) * mnthly_exp;

        double Aret = (posr_ret_return - (inflation * .01)) / (1 + (inflation * .01));

        double Arate = Financial.Nominal(Aret, 12) / 12;

        double Anper = (life - ret_age) * 12;

        double annual = pv(Arate, Anper, -Apmt);


        double Mrate = Financial.Nominal(pre_ret_return, 12) / 12;

        double Mnper = ret_yrs * 12;

        double sip = pmt(Mrate, Mnper, 0, -annual);

        ret_vals.Add(sip.ToString("#,##,##,###"));
        ret_vals.Add(annual.ToString("#,##,##,###"));

        return ret_vals;
    }
    public static int return_assumtions(int yrs)
    {
        DataTable dt = HttpContext.Current.Session["returns"] as DataTable;

        int ret = 8;

        if (yrs < 3)
            ret = (dt.Rows.Count > 0) ? Convert.ToInt32(dt.Rows[0]["returns"]) : 8;

        if (yrs >= 3 && yrs <= 5)
            ret = (dt.Rows.Count > 0) ? Convert.ToInt32(dt.Rows[1]["returns"]) : 9;

        if (yrs >= 6 && yrs <= 9)
            ret = (dt.Rows.Count > 0) ? Convert.ToInt32(dt.Rows[2]["returns"]) : 10;

        if (yrs >= 10)
            ret = (dt.Rows.Count > 0) ? Convert.ToInt32(dt.Rows[3]["returns"]) : 12;

        return ret;
    }
}