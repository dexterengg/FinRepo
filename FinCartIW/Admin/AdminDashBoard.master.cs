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

public partial class Admin_AdminDashBoard : System.Web.UI.MasterPage
{
    SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ToString());
    string xStr = "";
    SqlCommand cmd;

    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.Cache.SetExpires(DateTime.Now.AddSeconds(-1));
        Response.Cache.SetNoStore();

        if (Session["CurrentPageURL"] != null)
        {
            Session["PreviousPageURL"] = Session["CurrentPageURL"];
        }
        Session["CurrentPageURL"] = Request.Url;
        

        if (!IsPostBack)
        {
            if ((string)Session["AdminSessionID"] != null)
            {

                ViewState["xUserID"] = Session["AdminSessionID"].ToString();
                ViewState["xCode"] = Session["AdminSessionCode"].ToString();
                ViewState["xPRole"] = Session["LoginRole"].ToString();            

                if (Session["LoginRole"].ToString() == "Operator")
                {
                    UserMenu.Visible = false;
                    dbOperator.Visible = true;
                    WorkshopMenu.Visible = false;
                    TemplateMenu.Visible = false;
                    SubscriptionMenu.Visible = false;
                    TrackingMenu.Visible = false;
                    Trash.Visible = false;
                    LeadPassword.Visible = false;
                }

                if (Session["LoginRole"].ToString() == "Planner" || Session["LoginRole"].ToString() == "BDM")
                {
                    dbPlanner.Visible = true;
                    dbOperator.Visible = false;                    
                    WorkshopMenu.Visible = false;
                    TemplateMenu.Visible = false;
                    SubscriptionMenu.Visible = false;
                    TrackingMenu.Visible = false;
                    Trash.Visible = false;
                    LeadPassword.Visible = false;
                }
                if (Session["LoginRole"].ToString() == "Admin" || Session["LoginRole"].ToString() == "Management")
                {
                    dbAdmin.Visible = true;
                }


                SqlDataAdapter DA = new SqlDataAdapter(" " +                    

                    " Select PlannerName from fp_planner " +
                    " where Code='" + ViewState["xCode"] + "' " +
                    "  ", Con);

                DataSet DS = new DataSet();
                Con.Open();
                DA.Fill(DS);
                Con.Close();

                if (DS.Tables[0].Rows.Count > 0)
                {
                    lblUserName.Text = DS.Tables[0].Rows[0]["PlannerName"].ToString();
                    lblUserRole.Text = "\"" + ViewState["xPRole"].ToString() + "\"";
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
        Session["AdminSessionID"] = null;
        Session.Abandon();
        Response.Redirect("Login.aspx");
    }
}
