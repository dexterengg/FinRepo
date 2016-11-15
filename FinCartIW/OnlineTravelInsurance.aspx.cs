using System;
using System.Collections.Generic;
using System;
using System.Collections.Generic;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
public partial class OnlineTravelInsurance : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string clientstatuscode = "C10";
            LeadTracker lt = new LeadTracker();
            DataTable dt1 = lt.GetCampaignDetailsByClientSatusCode(clientstatuscode);

            if (Session["userSessionID"] == null)
            {
                logedout.Visible = true;
                //logedin.Visible = false;
                lit_buynow.Text = "<a href='javascript:void(0);' class='btn btn-warning btn-lg' onclick='loginmsgopen()'>Buy Now</a>";
                lt.TrackLead(dt1.Rows[0]["C_Var"].ToString(), dt1.Rows[0]["C_Key"].ToString(), dt1.Rows[0]["C_Route"].ToString());
            }
            else if (Session["LeadName"] == null || Session["LeadEmail"] == null || Session["LeadMobile"] == null)
            {
                logedout.Visible = false;
                //logedin.Visible = true;
                lit_buynow.Text = "<a href='javascript:void(0);' class='btn btn-warning btn-lg' data-toggle='modal' data-target='#iframeModal'>Buy Now</a>";
                DataTable dt = lt.UserDetailsByEmailId(Session["userSessionID"].ToString());
                Session["LeadName"] = dt.Rows[0]["Name"].ToString();
                Session["LeadEmail"] = dt.Rows[0]["UserID"].ToString();
                Session["LeadMobile"] = dt.Rows[0]["Mobile1"].ToString();
                lt.TrackLead(dt1.Rows[0]["C_Var"].ToString(), dt1.Rows[0]["C_Key"].ToString(), dt1.Rows[0]["C_Route"].ToString());
                lt.campaign_lead_capture(Session["LeadEmail"].ToString(), "e515c2ffea764df9ab0e42d53b0c8adb");
            }
            else
            {
                logedout.Visible = false;
                //logedin.Visible = true;
                lit_buynow.Text = "<a href='javascript:void(0);' class='btn btn-warning btn-lg' data-toggle='modal' data-target='#iframeModal'>Buy Now</a>";
                lt.campaign_lead_capture(Session["LeadEmail"].ToString(), "e515c2ffea764df9ab0e42d53b0c8adb");
            }
        }
    }

    string usermanagement(string name, string email, string mobile, string pass, string type)
    {
        string res = "ok";

        LeadTracker lt = new LeadTracker();
        string clientstatuscode = "C10";

        try
        {
            if (type == "R")
            {
                if (lt.checkuserexsists(email.Trim()))
                {
                    res = "<div class='panel panel-success' id='alertpopup'><div class='panel-body'><div class='row'><div class='col-lg-12'><div style='float:right'><i class='fa fa-times' style='cursor:pointer;' onclick='closepopup()'>&times;</i></div><div class='text-center'><b>Email ID already registered.</b></div></div></div></div></div>";
                }
                else
                {
                    Session["userSessionID"] = lt.registeruser(name.Trim(), email.Trim(), pass.Trim(), mobile.Trim(), clientstatuscode);
                    DataTable dt = lt.UserDetailsByEmailId(Session["userSessionID"].ToString());
                    Session["LeadName"] = dt.Rows[0]["Name"].ToString();
                    Session["LeadEmail"] = dt.Rows[0]["UserID"].ToString();
                    Session["LeadMobile"] = dt.Rows[0]["Mobile1"].ToString();
                    lt.campaign_lead_capture(Session["LeadEmail"].ToString(), "e515c2ffea764df9ab0e42d53b0c8adb");
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
                    lt.campaign_lead_capture(Session["LeadEmail"].ToString(), "e515c2ffea764df9ab0e42d53b0c8adb");
                }
                else
                {
                    res = "<div class='panel panel-success' id='alertpopup'><div class='panel-body'><div class='row'><div class='col-lg-12'><div style='float:right'><i class='fa fa-times'  style='cursor:pointer;' onclick='closepopup()'>&times;</i></div><div class='text-center'><b>Invalid Credentials !!</b></div></div></div></div></div>";
                }

            }
            else
            {
                if (lt.forgetpass(email.Trim()))
                {
                    res = "<div class='panel panel-success' id='alertpopup'><div class='panel-body'><div class='row'><div class='col-lg-12'><div style='float:right'><i class='fa fa-times'  style='cursor:pointer;' onclick='closepopup()'>&times;</i></div><div class='text-center'><b>We have sent information about your password to your recovery email address.</b></div></div></div></div></div>";
                }
                else
                {
                    res = "<div class='panel panel-success' id='alertpopup'><div class='panel-body'><div class='row'><div class='col-lg-12'><div style='float:right'><i class='fa fa-times'  style='cursor:pointer;' onclick='closepopup()'>&times;</i></div><div class='text-center'><b>Invalid Email !!</b></div></div></div></div></div>";
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
        string usr = usermanagement(name.Text.Trim(), email.Text.Trim(), mobile.Text.Trim(), password.Text.Trim(), "R");
        if (usr == "ok")
        {
            name.Text = string.Empty;
            email.Text = string.Empty;
            mobile.Text = string.Empty;
            password.Text = string.Empty;

            logedout.Visible = false;
            //logedin.Visible = true;
            lit_buynow.Text = "<a href='javascript:void(0);' class='btn btn-warning btn-lg' data-toggle='modal' data-target='#iframeModal'>Buy Now</a>";
            (this.Master as Insurance).refreshuser();
        }
        else
        {
            lbl_error.Text = usr;
        }

    }

    protected void LoginButton_Click(object sender, EventArgs e)
    {
        LeadTracker lt = new LeadTracker();
        string usr = usermanagement("", eusername.Text.Trim(), "", epassword.Text.Trim(), "L");
        if (usr == "ok")
        {
            eusername.Text = string.Empty;
            epassword.Text = string.Empty;
            logedout.Visible = false;
            //logedin.Visible = true;
            lit_buynow.Text = "<a href='javascript:void(0);' class='btn btn-warning btn-lg' data-toggle='modal' data-target='#iframeModal'>Buy Now</a>";
            (this.Master as Insurance).refreshuser();
        }
        else
        {
            lbl_error.Text = usr;
        }

    }
    protected void forgetButton_Click(object sender, EventArgs e)
    {
        LeadTracker lt = new LeadTracker();
        string usr = usermanagement("", txtEmailID.Text.Trim(), "", "", "F");
        if (usr == "ok")
        {
            txtEmailID.Text = string.Empty;
        }

        lbl_error.Text = usr;
    }
}