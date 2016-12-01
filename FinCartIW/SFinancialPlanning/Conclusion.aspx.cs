using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Script.Serialization;
using System.Web.Services;

public partial class SFinancialPlanning_Conclusion : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (HttpContext.Current.Session["CalculatedPlan"] != null)
        {
            Plan pl = HttpContext.Current.Session["CalculatedPlan"] as Plan;
            LeadTracker lt = new LeadTracker();
            lt.insertplan(pl);
        }
        else
        {
            Response.Redirect("FPSelfie.aspx");

        }
    }

    [WebMethod]
    public static string getplan(int id)
    {
        string res = "";
        try
        {
            if (HttpContext.Current.Session["CalculatedPlan"] != null)
            {
                Plan pl = HttpContext.Current.Session["CalculatedPlan"] as Plan;
                JavaScriptSerializer javaScriptSerializer = new JavaScriptSerializer();
                res = javaScriptSerializer.Serialize(pl);
            }
            else
            {
                HttpContext.Current.Response.Redirect("FPSelfie.aspx");

            }
            return res;
        }
        catch (Exception ex)
        {
            res = "error:" + ex;

            return res;
        }
    }
    protected void lnkbtn_logout_Click(object sender, EventArgs e)
    {
        Session["CalculatedPlan"] = null;
        Session["Payment"] = null;
        Session["userSessionID"] = null;
        Session["Campaign"] = null;
        Response.Redirect("../Default.aspx");
    }
}