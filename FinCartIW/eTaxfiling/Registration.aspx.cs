using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
public partial class eTaxfilling_Registration : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            if (Session["TAXCampaign"] == null)
            {
                LeadTracker lt = new LeadTracker();

                if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["taxmailerid"])))
                {
                    string[] str = Convert.ToString(Request.QueryString["taxmailerid"]).Split('?');
                    if (str[0] == "06bf3bd81fd64924ba4c4d8a687cc47b")
                    {
                        if (Session["userSessionID"] == null)
                        {
                            lt.TrackLead("taxmailerid", "06bf3bd81fd64924ba4c4d8a687cc47b", "Tax_Filling_Google_Mailer");
                            Session["ccode"] = "C24";
                            Session["ckey"] = "06bf3bd81fd64924ba4c4d8a687cc47b";
                            Session["TAXCampaign"] = "06bf3bd81fd64924ba4c4d8a687cc47b";
                        }
                        else
                        {
                            lt.campaign_lead_capture(Session["userSessionID"].ToString(), "06bf3bd81fd64924ba4c4d8a687cc47b");
                            Session["Campaign"] = "06bf3bd81fd64924ba4c4d8a687cc47b";
                            Session["TAXCampaign"] = "06bf3bd81fd64924ba4c4d8a687cc47b";
                            Response.Redirect("Filetax");
                        }
                    }
                    else
                    {
                        if (Session["userSessionID"] == null)
                        {
                            lt.TrackLead("taxid", "d19cfcdc7a524dcfb204184941966737", "Tax_Filling");
                            Session["ccode"] = "C14";
                            Session["ckey"] = "d19cfcdc7a524dcfb204184941966737";
                            Session["TAXCampaign"] = "06bf3bd81fd64924ba4c4d8a687cc47b";
                        }
                        else
                        {
                            lt.campaign_lead_capture(Session["userSessionID"].ToString(), "d19cfcdc7a524dcfb204184941966737");
                            Session["Campaign"] = "d19cfcdc7a524dcfb204184941966737";
                            Session["TAXCampaign"] = "06bf3bd81fd64924ba4c4d8a687cc47b";
                            Response.Redirect("Filetax");
                        }
                    }
                }
                else
                {
                    if (Session["userSessionID"] == null)
                    {
                        lt.TrackLead("taxid", "d19cfcdc7a524dcfb204184941966737", "Tax_Filling");
                        Session["ccode"] = "C14";
                        Session["ckey"] = "d19cfcdc7a524dcfb204184941966737";
                        Session["TAXCampaign"] = "06bf3bd81fd64924ba4c4d8a687cc47b";
                    }
                    else
                    {
                        lt.campaign_lead_capture(Session["userSessionID"].ToString(), "d19cfcdc7a524dcfb204184941966737");
                        Session["Campaign"] = "d19cfcdc7a524dcfb204184941966737";
                        Session["TAXCampaign"] = "06bf3bd81fd64924ba4c4d8a687cc47b";
                        Response.Redirect("Filetax");
                    }
                }
            }
        }
    }
    string usermanagement(string name, string email, string mobile, string pass, string type, string hfval)
    {
        string res = "ok";

        LeadTracker lt = new LeadTracker();
        string clientstatuscode = "C14";

        try
        {
            if (type == "R")
            {
                if (lt.checkuserexsists(email.Trim()))
                {
                    res = "<div class='col-lg-12' id='alertpopup'><div class='form-box'><div class='form-top'><div class='form-top-left'><h3>Email ID already registered.</h3></div><div class='form-top-right' style='font-size: 20px;line-height: 0;cursor:pointer;'><i class='fa fa-times' onclick='closepopup()'></i></div></div></div></div>";
                }
                else
                {
                    Session["userSessionID"] = lt.registeruser(name.Trim(), email.Trim(), pass.Trim(), mobile.Trim(), clientstatuscode);
                }
            }
            else if (type == "L")
            {
                string usr = lt.userlogin(email.Trim(), pass.Trim());
                if (!String.IsNullOrWhiteSpace(usr))
                {
                    Session["userSessionID"] = usr;
                }
                else
                {
                    res = "<div class='col-lg-12' id='alertpopup'><div class='form-box'><div class='form-top'><div class='form-top-left'><h3>Invalid Credentials !!</h3></div><div class='form-top-right' style='font-size: 20px;line-height: 0;cursor:pointer;'><i class='fa fa-times' onclick='closepopup()'></i></div></div></div></div>";
                }

            }
            else
            {
                if (lt.forgetpass(email.Trim()))
                {
                    res = "<div class='col-lg-12' id='alertpopup'><div class='form-box'><div class='form-top'><div class='form-top-left'><h3>We have sent information about your password to your recovery email address.</h3></div><div class='form-top-right' style='font-size: 20px;line-height: 0;cursor:pointer;'><i class='fa fa-times' onclick='closepopup()'></i></div></div></div></div>";
                }
                else
                {
                    res = "<div class='col-lg-12' id='alertpopup'><div class='form-box'><div class='form-top'><div class='form-top-left'><h3>Invalid Email !!</h3></div><div class='form-top-right' style='font-size: 20px;line-height: 0;cursor:pointer;'><i class='fa fa-times' onclick='closepopup()'></i></div></div></div></div>";
                }
            }
        }
        catch
        {
            res = "error";
        }
        return res;
    }
    protected void RegisterButton_Click(object sender, EventArgs e)
    {
        string usr = usermanagement(name.Text, email.Text, mobile.Text, password.Text, "R", "");
        if (usr == "ok")
        {
            name.Text = string.Empty;
            email.Text = string.Empty;
            mobile.Text = string.Empty;
            password.Text = string.Empty;
            Response.Redirect("Filetax");
        }
        else
        {
            lbl_error.Text = usr;
        }

    }
    protected void LoginButton_Click(object sender, EventArgs e)
    {
        LeadTracker lt = new LeadTracker();
        string usr = usermanagement("", eusername.Text.Trim(), "", epassword.Text.Trim(), "L", "");
        if (usr == "ok")
        {
            eusername.Text = string.Empty;
            epassword.Text = string.Empty;
            Response.Redirect("Filetax");
        }
        else
        {
                lbl_error.Text = usr;
        }

    }
    protected void forgetButton_Click(object sender, EventArgs e)
    {
        LeadTracker lt = new LeadTracker();
        string usr = usermanagement("", txtEmailID.Text.Trim(), "", "", "F", "");
        if (usr == "ok")
        {
            txtEmailID.Text = string.Empty;         
        }
        lbl_error.Text = usr;
    }
}