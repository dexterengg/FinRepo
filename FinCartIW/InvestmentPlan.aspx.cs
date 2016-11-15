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
public partial class InvestmentPlan : System.Web.UI.Page
{
    SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ToString());

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["userSessionID"] == null || Session["Campaign"] == null)
            {
                LeadTracker lt = new LeadTracker();
                lt.TrackLead("investplanid", "e28a04ba1220455eaf1050c900478f22", "InvetmentPlan_Landing_page");
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
                    Session["userSessionID"] = lt.registeruser(name.Trim(), email.Trim(), pass.Trim(), mobile.Trim(), "C2");
                    lt.campaign_lead_capture(email.Trim(), "e28a04ba1220455eaf1050c900478f22");
                    Session["Campaign"] = "e28a04ba1220455eaf1050c900478f22";
                }
            }
            else if (type == "L")
            {
                string usr = lt.userlogin(email.Trim(), pass.Trim());
                if (!String.IsNullOrWhiteSpace(usr))
                {
                    Session["userSessionID"] = usr;
                    lt.campaign_lead_capture(usr, "e28a04ba1220455eaf1050c900478f22");
                    Session["Campaign"] = "e28a04ba1220455eaf1050c900478f22";
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
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        string usr = usermanagement(Name.Value, Email.Value, Mobile.Value, password.Value, "R", "lit_sucess");
        if (usr == "ok")
        {
            Name.Value = string.Empty;
            Email.Value = string.Empty;
            Mobile.Value = string.Empty;
            password.Value = string.Empty;
            lit_sucess.Visible = false; ;
            Response.Redirect("Plan/instaSIP");
        }
        else
        {
            lit_sucess.Visible = true;
            lit_sucess.Text = usr;
        }
    }
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        string usr = usermanagement(Name1.Value, Email1.Value, Mobile1.Value, password1.Value, "R", "lit_sucess1");
        if (usr == "ok")
        {
            Name1.Value = string.Empty;
            Email1.Value = string.Empty;
            Mobile1.Value = string.Empty;
            password1.Value = string.Empty;
            lit_sucess1.Visible = false; ;
            Response.Redirect("Plan/instaSIP");
        }
        else
        {
            lit_sucess1.Visible = true;
            lit_sucess1.Text = usr;
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
    protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
    {
        string usr = usermanagement(Namexs.Value, Emailxs.Value, Mobilexs.Value, passwordxs.Value, "R", "lit_sucessxs");
        if (usr == "ok")
        {
            Namexs.Value = string.Empty;
            Emailxs.Value = string.Empty;
            Mobilexs.Value = string.Empty;
            passwordxs.Value = string.Empty;
            lit_sucessxs.Visible = false; ;
            Response.Redirect("Plan/instaSIP");
        }
        else
        {
            lit_sucessxs.Visible = true;
            lit_sucessxs.Text = usr;
        }
    }
    protected void ImageButton4_Click(object sender, ImageClickEventArgs e)
    {
        string usr = usermanagement(Name1xs.Value, Email1xs.Value, Mobile1xs.Value, password1xs.Value, "R", "lit_sucess1xs");
        if (usr == "ok")
        {
            Name1xs.Value = string.Empty;
            Email1xs.Value = string.Empty;
            Mobile1xs.Value = string.Empty;
            password1xs.Value = string.Empty;
            lit_sucess1xs.Visible = false; ;
            Response.Redirect("Plan/instaSIP");
        }
        else
        {
            lit_sucess1xs.Visible = true;
            lit_sucess1xs.Text = usr;
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
            Response.Redirect("Plan/instaSIP");
        }
        else
        {
            if (hfval.Value.Trim() == "lit_sucess")
                lit_sucess.Text = usr;
            if (hfval.Value.Trim() == "lit_sucess1")
                lit_sucess1.Text = usr;
            if (hfval.Value.Trim() == "lit_sucessxs")
                lit_sucessxs.Text = usr;
            if (hfval.Value.Trim() == "lit_sucess1xs")
                lit_sucess1xs.Text = usr;
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
            if (hfval.Value.Trim() == "lit_sucess1")
                lit_sucess1.Text = usr;
            if (hfval.Value.Trim() == "lit_sucessxs")
                lit_sucessxs.Text = usr;
            if (hfval.Value.Trim() == "lit_sucess1xs")
                lit_sucess1xs.Text = usr;
        }
        else
        {
            if (hfval.Value.Trim() == "lit_sucess")
                lit_sucess.Text = usr;
            if (hfval.Value.Trim() == "lit_sucess1")
                lit_sucess1.Text = usr;
            if (hfval.Value.Trim() == "lit_sucessxs")
                lit_sucessxs.Text = usr;
            if (hfval.Value.Trim() == "lit_sucess1xs")
                lit_sucess1xs.Text = usr;
        }
    }
}