using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Net;
using System.Net.Mail;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class SFinancialPlanning_FPSelfie : System.Web.UI.Page
{
    SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ToString());

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LeadTracker lt = new LeadTracker();
            
            if (Session["userSessionID"] == null)
            {
                lt.TrackLead("subsidaryplanid", "a7d4d44b273b41b5a314033f1a48c4ac", "Subsidary_Plan");
            }
            else
            {
                lt.campaign_lead_capture(Session["userSessionID"].ToString(), "a7d4d44b273b41b5a314033f1a48c4ac");
                Session["Campaign"] = "a7d4d44b273b41b5a314033f1a48c4ac";
                Response.Redirect("src/Questions.aspx");
            }
        }
    }
    protected void btn_submit_Click(object sender, EventArgs e)
    {
        string usr = usermanagement(Name.Value, Email.Value, Mobile.Value, Password.Value, "R", "lit_sucess");
        if (usr == "ok")
        {
            Name.Value = string.Empty;
            Email.Value = string.Empty;
            Mobile.Value = string.Empty;
            Password.Value = string.Empty;
            lit_sucess.Visible = false; ;
            Session["Payment"] = "unpaid";
            Response.Redirect("Payment.aspx");
        }
        else
        {
            lit_sucess.Visible = true;
            lit_sucess.Text = usr;
        }
        
    }
    protected void LoginButton_Click(object sender, EventArgs e)
    {
        LeadTracker lt = new LeadTracker();
        PaymentGateway pg = new PaymentGateway();

        string usr = usermanagement("", eusername.Text.Trim(), "", epassword.Text.Trim(), "L", hfval.Value.Trim());
        if (usr == "ok")
        {
            DataSet ds = lt.leaddetails(eusername.Text.Trim(), epassword.Text.Trim());
            //eusername.Text = string.Empty;
            //epassword.Text = string.Empty;

            if (ds.Tables.Count > 0) 
            {
                if (ds.Tables[0].Rows[0]["ClientStatus"].ToString().ToUpper() == "C5")
                {
                    if (pg.customerPaymentStatus(eusername.Text.Trim()) == "PENDING")
                    {
                        Session["Payment"] = "unpaid";
                        Response.Redirect("Payment.aspx");
                    }
                    else
                    {
                        Response.Redirect("src/Questions.aspx");
                    }
                }
                else
                {
                    Response.Redirect("src/Questions.aspx");
                }
            }
            else
            {
                Response.Redirect("src/Questions.aspx");
            }
        }
        else
        {
            if (hfval.Value.Trim() == "lit_sucess")
                lit_sucess.Text = usr;
        }

    }
    protected void forgetButton_Click(object sender, EventArgs e)
    {
        LeadTracker lt = new LeadTracker();
        string usr = usermanagement("", txtEmailID.Text.Trim(), "", "", "F", hfval.Value.Trim());
        if (usr == "ok")
        {
            txtEmailID.Text = string.Empty;

            if (hfval.Value.Trim() == "lit_sucess")
                lit_sucess.Text = usr;
        }
        else
        {
            if (hfval.Value.Trim() == "lit_sucess")
                lit_sucess.Text = usr;
        }
    }
    string usermanagement(string name, string email, string mobile, string pass, string type, string hfval)
    {
        string res = "ok", ccode = "C5", ckey = "a7d4d44b273b41b5a314033f1a48c4ac";

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
                    Session["userSessionID"] = lt.registeruser(name.Trim(), email.Trim(), pass.Trim(), mobile.Trim(), ccode);
                    lt.campaign_lead_capture(email.Trim(), ckey);
                    Session["Campaign"] = ckey;
                }
            }
            else if (type == "L")
            {
                string usr = lt.userlogin(email.Trim(), pass.Trim());
                if (!String.IsNullOrWhiteSpace(usr))
                {
                    Session["userSessionID"] = usr;
                    lt.campaign_lead_capture(usr, ckey);
                    Session["Campaign"] = ckey;
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
}