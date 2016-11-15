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

public partial class Insurance : System.Web.UI.MasterPage
{
    SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ToString());
    string xStr = "";
    SqlCommand cmd;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {

            refreshuser();
        }
    }

    public void refreshuser()
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

        if ((string)Session["userSessionID"] != null)
        {
            ViewState["userid"] = Session["userSessionID"].ToString();
            // Select Client Name from table fp_prospects                                        
            SqlDataAdapter InvGDA = new SqlDataAdapter(" " +

                    " select Name, Risk=isnull(Riskcode,'99') from fp_prospects where userid='" + ViewState["userid"] + "' " +
                    "  ", Con);

            DataSet InvGDS = new DataSet();
            Con.Open();
            InvGDA.Fill(InvGDS);
            Con.Close();

            if (InvGDS.Tables[0].Rows.Count > 0)
            {
                if (InvGDS.Tables[0].Rows[0]["Risk"].ToString() == "99")
                {
                    lblWelcome.Text = "<a href='Plan/MyDetails.aspx?Risk=A' style='color:#04a2eb'>My Details</a>&nbsp;&nbsp;|&nbsp;&nbsp;" + "Welcome, " + InvGDS.Tables[0].Rows[0]["Name"].ToString();
                }
                else
                {
                    lblWelcome.Text = "<a href='Plan/MyDashBoard.aspx' style='color:#04a2eb'>My Dashboard</a>&nbsp;&nbsp;|&nbsp;&nbsp;" + "Welcome, " + InvGDS.Tables[0].Rows[0]["Name"].ToString();
                }
            }

        }
        else
        {
            lblWelcome.Text = "Welcome Guest";
        }

    }

    protected void LoginD_Click(object sender, EventArgs e)
    {
        Session["userSessionID"] = null;
        Session.Abandon();
        Response.Redirect("Plan/Login.aspx");
    }
    protected void signin_Click(object sender, EventArgs e)
    {
        Response.Redirect("Plan/Login.aspx");
    }
    protected void CallBackSubmit_Click(object sender, EventArgs e)
    {
        //formtop.Style.Add("display", "block");

        SqlDataAdapter DA = new SqlDataAdapter(" " +

                " insert into fp_Prospects(Name,CountryCode,Mobile1,Email1,ClientStatus,SystemDate) " +
                " values('" + txtName.Text + "','" + txtCountryCode.Text + "','" + txtMobile.Text + "','" + txtEmail.Text + "', " +
                " 'W','" + Convert.ToDateTime(System.DateTime.Now).ToString("yyyy-MM-dd") + "') " +
                "  ", Con);

        DataSet DS = new DataSet();

        Con.Open();
        DA.Fill(DS);
        Con.Close();

        formtop.Visible = false;
        lblCallBackSubmit.Text = "Thank you for the call back request, our financial plannner will call you very soon.";

    }
    protected void butNewsletter_Click1(object sender, EventArgs e)
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
        butNewsletter.Visible = false;
    }
}
