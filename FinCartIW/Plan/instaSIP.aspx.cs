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
using System.Collections.Generic;

public partial class Plan_instaSIP : System.Web.UI.Page
{
    string xPeriod = "";
    double xScore = 0;
    string xScore2 = "";
    string xAmount ="" ;
    string q4 = "", q5 = "", q6 = "", q7 = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["mid"])))
        {
            if (!IsPostBack)
            {
                string[] str = Convert.ToString(Request.QueryString["mid"]).Split('?');

                if (str[0] == "dfc7baeefbc6410f9837984fc32f4ee9")
                {
                    divquestions.Visible = true;
                    diverror.Visible = false;

                    if (Session["userSessionID"] == null || Session["Campaign"] == null)
                    {
                        LeadTracker lt = new LeadTracker();
                        lt.TrackLead("mid", "dfc7baeefbc6410f9837984fc32f4ee9", "Google_Mailer");

                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none", "<script>$(document).ready(function () {setTimeout(function () {$('#myModal').modal({backdrop: 'static',keyboard: true, show: true});}, 5000)});</script>", false);
                    }
                    else
                    {
                        lit_tracker.Text = "<iframe src='https://tracking.affiliatehub.co.in/SLaF' scrolling='no' frameborder='0' width='1' height='1'></iframe>";
                    }
                }
            }
        }
        
    }
    string usermanagement(string name, string email, string mobile, string pass, string type, string hfval)
    {
        string res = "ok";

        LeadTracker lt = new LeadTracker();

        try
        {
            if (type == "R")
            {
                if (lt.checkuserexsists(email.Trim()))
                {
                    res = "<div class='alert-danger' style='text-align: center; border-radius: 5px; margin-top: 2px;background-color:#fff;color:#4c9e32;' >Email ID already registered. <a href=javascript:openlogin('" + hfval.Trim() + "'); style='color:#1168d5'>Sign IN</a></div>";
                }
                else
                {
                    Session["userSessionID"] = lt.registeruser(name.Trim(), email.Trim(), pass.Trim(), mobile.Trim(), "C3");
                    lt.campaign_lead_capture(email.Trim(), "dfc7baeefbc6410f9837984fc32f4ee9");
                    Session["Campaign"] = "dfc7baeefbc6410f9837984fc32f4ee9";
                }
            }
            else if (type == "L")
            {
                string usr = lt.userlogin(email.Trim(), pass.Trim());
                if (!String.IsNullOrWhiteSpace(usr))
                {
                    Session["userSessionID"] = usr;
                    lt.campaign_lead_capture(usr, "dfc7baeefbc6410f9837984fc32f4ee9");
                    Session["Campaign"] = "dfc7baeefbc6410f9837984fc32f4ee9";
                }
                else
                {
                    res = "<div class='alert-danger' style='text-align: center; border-radius: 5px; margin-top: 2px;background-color:#fff;color:#ff0000;' >Invalid Credentials !! <a href=javascript:openlogin('" + hfval.Trim() + "'); style='color:#1168d5'>Sign IN</a></div>";
                }

            }
            else
            {
                if (lt.forgetpass(email.Trim()))
                {
                    res = "<div class='alert-danger' style='text-align: center; border-radius: 5px; margin-top: 2px;background-color:#fff;color:#4c9e32;' >We have sent information about your password to your recovery email address. <a href=javascript:openlogin('" + hfval.Trim() + "'); style='color:#1168d5'>Sign IN</a></div>";
                }
                else
                {
                    res = "<div class='alert-danger' style='text-align: center; border-radius: 5px; margin-top: 2px;background-color:#fff;color:#ff0000;' >Invalid Email !! <a href=javascript:openlogin('" + hfval.Trim() + "'); style='color:#1168d5'>Sign IN</a></div>";
                }
            }
        }
        catch
        {
            res = "error";
        }
        return res;
    }
    protected void instaSIPBtn_Click(object sender, EventArgs e)
    {
        // Answer for question #4
        if (knowledge1.Checked == true)
        {
            q4 = "2.5";
        }
        else if (knowledge2.Checked == true)
        {
            q4 = "5";
        }
        else if (knowledge3.Checked == true)
        {
            q4 = "10";
        }
        
        // Answer for question #5
        if (care1.Checked == true)
        {
            q5 = "10";
        }
        if (care2.Checked == true)
        {
            q5 = "2.5";
        }
        if (care3.Checked == true)
        {
            q5 = "5";
        }

        //Answer for question #6
        if (market1.Checked == true)
        {
            q6 = "2.5";
        }
        if (market2.Checked == true)
        {
            q6 = "5";
        }
        if (market3.Checked == true)
        {
            q6 = "7.5";
        }
        if (market4.Checked == true)
        {
            q6 = "10";
        }

        //Answer for question #7
        if (risk1.Checked == true)
        {
            q7 = "2.5";
        }
        if (risk2.Checked == true)
        {
            q7 = "5";
        }
        if (risk3.Checked == true)
        {
            q7 = "10";
        }

        xScore = Convert.ToDouble(q4) + Convert.ToDouble(q5) + Convert.ToDouble(q6) + Convert.ToDouble(q7);
        //xScore = 15;
        xScore2 = xScore.ToString();
        xAmount = txtAmount.Text;

        // Answer for Investment Period
        if (investmentPeriod1.Checked == true)
        {
            xPeriod = "1";
        }
        if (investmentPeriod2.Checked == true)
        {
            xPeriod = "3";
        }
        if (investmentPeriod3.Checked == true)
        {
            xPeriod = "5";
        }
        if (investmentPeriod4.Checked == true)
        {
            xPeriod = "10";
        }
        if (investmentPeriod5.Checked == true)
        {
            xPeriod = "11";
        }

        Response.Redirect("instaSIP-plan.aspx?amt=" + xAmount + "&score=" + xScore2 + "&invage=" + xPeriod + "&LoginType=XXX");
    }
    protected void RegisterButton_Click(object sender, EventArgs e)
    {
        string usr = usermanagement(name.Text, email.Text, mobile.Text, password.Text, "R", "lbl_error");
        if (usr == "ok")
        {
            name.Text = string.Empty;
            email.Text = string.Empty;
            mobile.Text = string.Empty;
            password.Text = string.Empty;

            Response.Redirect("instaSIP?mid=dfc7baeefbc6410f9837984fc32f4ee9");
        }
        else
        {
            divquestions.Visible = false;
            diverror.Visible = true;
            lbl_error.Text = usr;
        }

    }

    protected void LoginButton_Click(object sender, EventArgs e)
    {
        LeadTracker lt = new LeadTracker();
        string usr = usermanagement("", eusername.Text.Trim(), "", epassword.Text.Trim(), "L", hfval.Value.Trim());
        if (usr == "ok")
        {
            eusername.Text = string.Empty;
            epassword.Text = string.Empty;
            Response.Redirect("instaSIP?mid=dfc7baeefbc6410f9837984fc32f4ee9");
        }
        else
        {
            if (hfval.Value.Trim() == "lbl_error")
                lbl_error.Text = usr;
        }

    }
    protected void forgetButton_Click(object sender, EventArgs e)
    {
        LeadTracker lt = new LeadTracker();
        string usr = usermanagement("", txtEmailID.Text.Trim(), "", "", "F", hfval.Value.Trim());
        if (usr == "ok")
        {
            txtEmailID.Text = string.Empty;

            if (hfval.Value.Trim() == "lbl_error")
                lbl_error.Text = usr;
        }
        else
        {
            if (hfval.Value.Trim() == "lbl_error")
                lbl_error.Text = usr;
        }
    }
}
