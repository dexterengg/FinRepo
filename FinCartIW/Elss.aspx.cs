using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Elss : System.Web.UI.Page
{
    SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["userSessionID"] == null || Session["Campaign"] == null)
            {
                LeadTracker lt = new LeadTracker();
                lt.TrackLead("Elssid", "fc5065dfaa5d48a7816a48ba26e83f27", "ELSS_Landing_page");
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
                    Session["userSessionID"] = lt.registeruser(name.Trim(), email.Trim(), pass.Trim(), mobile.Trim(), "C1");
                    lt.campaign_lead_capture(email.Trim(), "fc5065dfaa5d48a7816a48ba26e83f27");
                    Session["Campaign"] = "fc5065dfaa5d48a7816a48ba26e83f27";
                }
            }
            else if (type == "L")
            {
                string usr = lt.userlogin(email.Trim(), pass.Trim());
                if (!String.IsNullOrWhiteSpace(usr))
                {
                    Session["userSessionID"] = usr;
                    lt.campaign_lead_capture(usr, "fc5065dfaa5d48a7816a48ba26e83f27");
                    Session["Campaign"] = "fc5065dfaa5d48a7816a48ba26e83f27";
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
    protected void btn_submit_Click(object sender, EventArgs e)
    {

        string usr = usermanagement(Name.Value, Email.Value, Mobile.Value, password.Value, "R", "lit_sucess");
        if (usr == "ok")
        {
            Name.Value = string.Empty;
            Email.Value = string.Empty;
            Mobile.Value = string.Empty;
            password.Value = string.Empty;
            lit_sucess.Visible = false;
            Response.Redirect("Plan/instaSIP");
        }
        else
        {
            lit_sucess.Visible = true;
            lit_sucess.Text = usr;
        }
    }

    protected void butNewsletter_Click(object sender, EventArgs e)
    {
        SqlDataAdapter DA = new SqlDataAdapter(" " +

                " insert into fp_Subscription(code,Email,SubscribeDate) " +
                " values((select max(code) + 1 from fp_Subscription),'" + newsletter.Text + "', '" + Convert.ToDateTime(System.DateTime.Now).ToString("yyyy-MM-dd") + "') " +
                "  ", Con);

        DataSet DS = new DataSet();

        Con.Open();
        DA.Fill(DS);
        Con.Close();

        subscribeSuccess.Visible = true;
        newsletter.Visible = false;
    }

    protected void LoginButton_Click(object sender, EventArgs e)
    {
        LeadTracker lt = new LeadTracker();
        string usr = usermanagement("", eusername.Text.Trim(), "", epassword.Text.Trim(), "L", hfval.Value.Trim());
        if (usr == "ok")
        {
            eusername.Text = string.Empty;
            epassword.Text = string.Empty;
            lit_sucess.Text = "<div class='alert-danger' style='text-align: center; border-radius: 5px; margin-top: 2px;background-color:#fff;color:#4c9e32;' >Details Send Successfully !!</div>";
            //Response.Redirect("Plan/instaSIP");
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
}