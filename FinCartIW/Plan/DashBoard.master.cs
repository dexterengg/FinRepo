using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using System.IO;
using System.Net;
using System.Net.Mail;

public partial class DashBoard : System.Web.UI.MasterPage
{
    SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ToString());
    string xStr = "";
    string xEmail = "";
    string xPswd = "";
    string xRisk = "";
    string xCS = "";
    SqlCommand cmd;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userSessionID"] != null)
        {
            LoginD.Visible = true;
            signin.Visible = false;
        }
        else
        {
            LoginD.Visible = false;
            signin.Visible = true;
        }
        
        if(Request.Url.ToString().Contains("MyDashBoard"))
        {
            menuMydashboard.Attributes["Class"]="active";
        }

        if (Request.Url.ToString().Contains("FreePlanOutput"))
        {
            menuPlanoutput.Attributes["Class"] = "active";
        }

        if (Request.Url.ToString().Contains("MyDetails"))
        {
            menuProfile.Attributes["Class"] = "active";
        }

        if (Request.Url.ToString().Contains("ChangePassword"))
        {
            changepass.Attributes["Class"] = "active";
        }

        if (!Page.IsPostBack)
        {

            ViewState["userid"] = Session["userSessionID"].ToString();

            if ((string)Session["userSessionID"] != null)
            {
                // Select Client Name from table fp_prospects                                        
                SqlDataAdapter InvGDA = new SqlDataAdapter(" " +

                        " select Name, Risk=isnull(RiskCode, 99), ClientStatus from fp_prospects where userid='" + ViewState["userid"] + "' " +
                        "  ", Con);

                DataSet InvGDS = new DataSet();
                Con.Open();
                InvGDA.Fill(InvGDS);
                Con.Close();

                if (InvGDS.Tables[0].Rows.Count > 0)
                {
                    lblWelcome.Text = "Welcome, "+InvGDS.Tables[0].Rows[0]["Name"].ToString();
                    xRisk = InvGDS.Tables[0].Rows[0]["Risk"].ToString();
                    xCS = InvGDS.Tables[0].Rows[0]["ClientStatus"].ToString();
                }

                if (xRisk == "99")
                {
                    menuMydashboard.Visible = false;
                    menuPlanoutput.Visible = false;
                }
                if (xCS == "O")
                {
                    menuMydashboard.Visible = false;
                    menuPlanoutput.Visible = false;
                }
                if (xCS == "F" || xCS.Contains("C"))
                {
                    menuMydashboard.Visible = false;
                    menuPlanoutput.Visible = false;
                }

            }            
            else
            {
                Response.Redirect("SessionExpired.aspx");
            }

        }
    }

    protected void LoginD_Click(object sender, EventArgs e)
    {
        Session["userSessionID"] = null;
        Session.Abandon();
        Response.Redirect("Login.aspx");
    }
    protected void signin_Click(object sender, EventArgs e)
    {
        Response.Redirect("Login.aspx");
    }
    protected void btnTransact_Click(object sender, EventArgs e)
    {
        // Select Risk from table fp_prospects                                        
        SqlDataAdapter InvGDA = new SqlDataAdapter(" " +

                " select UserId, Pwd from fp_prospects p where userid='" + ViewState["userid"] + "' " +
                "  ", Con);

        DataSet InvGDS = new DataSet();
        Con.Open();
        InvGDA.Fill(InvGDS);
        Con.Close();

        if (InvGDS.Tables[0].Rows.Count > 0)
        {
            xEmail = InvGDS.Tables[0].Rows[0]["UserId"].ToString();
            xPswd = InvGDS.Tables[0].Rows[0]["Pwd"].ToString();
        }


        Response.Redirect("https://invest.fincart.com/index.jsp?email=" + xEmail + "&pswd=" + xPswd + "");
    }
    protected void CallBackSubmit_Click(object sender, EventArgs e)
    {
        //formtop.Style.Add("display", "block");

        SqlDataAdapter DA = new SqlDataAdapter(" " +

                " insert into fp_CallBack(CBName,CBMobile,CBEmail,CountryCode,CBStatus,EntryDate) " +
                " values('" + txtName.Text + "','" + txtMobile.Text + "','" + txtEmail.Text + "','" + txtCountryCode.Text + "' " +
                " ,'X','" + Convert.ToDateTime(System.DateTime.Now).ToString("yyyy-MM-dd") + "') " +
                "  ", Con);

        DataSet DS = new DataSet();

        Con.Open();
        DA.Fill(DS);
        Con.Close();

        formtop.Visible = false;
        lblCallBackSubmit.Text = "Thank you for the call back request, our financial plannner will call you very soon.";

    }
    protected void butNewsletter_Click(object sender, ImageClickEventArgs e)
    {
        if (newsletter.Text.Trim() != "")
        {
            SqlDataAdapter DA = new SqlDataAdapter(" " +

                    " insert into fp_Subscription(Email,SubscribeDate) " +
                    " values('" + newsletter.Text + "', '" + Convert.ToDateTime(System.DateTime.Now).ToString("yyyy-MM-dd") + "') " +
                    "  ", Con);

            DataSet DS = new DataSet();

            Con.Open();
            DA.Fill(DS);
            Con.Close();

            subscribeSuccess.Visible = true;
            newsletter.Visible = false;
        }
        

    }

}
