using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class OnlineInsuranceLogin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["userSessionID"] == null)
            {
                LeadTracker lt = new LeadTracker();
                string clientstatuscode = Session["clientstatuscode"] != null ? Session["clientstatuscode"].ToString() : "C9";
                DataTable dt = lt.GetCampaignDetailsByClientSatusCode(clientstatuscode);
                lt.TrackLead(dt.Rows[0]["C_Var"].ToString(), dt.Rows[0]["C_Key"].ToString(), dt.Rows[0]["C_Route"].ToString());
            }
        }
    }

    string usermanagement(string name, string email, string mobile, string pass, string type, string hfval)
    {
        string res = "ok";

        LeadTracker lt = new LeadTracker();
        string clientstatuscode = Session["clientstatuscode"] != null ? Session["clientstatuscode"].ToString() : "C6";

        try
        {
            if (type == "R")
            {
                if (lt.checkuserexsists(email.Trim()))
                {
                    res = "<div class='panel panel-success' id='alertpopup'><div class='panel-body'><div class='row'><div class='col-lg-12'><div class='float-rt'><i class='fa fa-times' onclick='closepopup()' style='cursor:pointer;'></i></div><div class='text-center'><b>Email ID already registered.</b></div></div></div></div></div>";
                }
                else
                {
                    Session["userSessionID"] = lt.registeruser(name.Trim(), email.Trim(), pass.Trim(), mobile.Trim(), clientstatuscode);
                    DataTable dt = lt.UserDetailsByEmailId(Session["userSessionID"].ToString());
                    Session["LeadName"] = dt.Rows[0]["Name"].ToString();
                    Session["LeadEmail"] = dt.Rows[0]["UserID"].ToString();
                    Session["LeadMobile"] = dt.Rows[0]["Mobile1"].ToString();
                }
            }
            else if (type == "L")
            {
                string usr = lt.userlogin(email.Trim(), pass.Trim());
                if (!String.IsNullOrWhiteSpace(usr))
                {
                    Session["userSessionID"] = usr;
                    DataTable dt = lt.UserDetailsByEmailId(Session["userSessionID"].ToString());
                    Session["LeadName"] = dt.Rows[0]["Name"].ToString();
                    Session["LeadEmail"] = dt.Rows[0]["UserID"].ToString();
                    Session["LeadMobile"] = dt.Rows[0]["Mobile1"].ToString();
                }
                else
                {
                    res = "<div class='panel panel-success' id='alertpopup'><div class='panel-body'><div class='row'><div class='col-lg-12'><div class='float-rt'><i class='fa fa-times'  style='cursor:pointer;' onclick='closepopup()'></i></div><div class='text-center'><b>Invalid Credentials !!</b></div></div></div></div></div>";
                }

            }
            else
            {
                if (lt.forgetpass(email.Trim()))
                {
                    res = "<div class='panel panel-success' id='alertpopup'><div class='panel-body'><div class='row'><div class='col-lg-12'><div class='float-rt'><i class='fa fa-times'  style='cursor:pointer;' onclick='closepopup()'></i></div><div class='text-center'><b>We have sent information about your password to your recovery email address.</b></div></div></div></div></div>";
                }
                else
                {
                    res = "<div class='panel panel-success' id='alertpopup'><div class='panel-body'><div class='row'><div class='col-lg-12'><div class='float-rt'><i class='fa fa-times'  style='cursor:pointer;' onclick='closepopup()'></i></div><div class='text-center'><b>Invalid Email !!</b></div></div></div></div></div>";
                }
            }
        }
        catch
        {
            res = "error";
        }
        return res;
    }

    string routepage()
    {
        string route = "OnlineTermInsurance", clientstatuscode = Convert.ToString(Session["clientstatuscode"]);


        switch (clientstatuscode)
        {
            case "C6": route = "OnlineCarInsurance";
                break;
            case "C7": route = "OnlineHealthInsurance";
                break;
            case "C8": route = "OnlineHomeInsurance";
                break;
            case "C9": route = "OnlineTermInsurance";
                break;
            case "C10": route = "OnlineTravelInsurance";
                break;
            case "C11": route = "OnlineTwoWheelerInsurance";
                break;
            default: route = "OnlineTermInsurance";
                break;
        }
        return route;
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
        }
        else
        {
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
        }
        else
        {
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
        }

           lbl_error.Text = usr;
    }
}