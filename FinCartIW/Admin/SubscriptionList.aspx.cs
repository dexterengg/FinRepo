using System;
using System.Data;
using System.Collections;
using System.Collections.Concurrent;
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
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.html;
using iTextSharp.text.html.simpleparser;
using System.Text;

public partial class Admin_SubscriptionList : System.Web.UI.Page
{
    SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ToString());
    string xStr = "";
    SqlCommand cmd;
    string xClientCode = ""; 

    protected void Page_Load(object sender, EventArgs e)
    {
        FillGrid_Subscription();
    }

    void FillGrid_Subscription()
    {
        if ((string)Session["AdminSessionID"] != null)
        {
            string xCode = Session["AdminSessionID"].ToString();

            SqlDataAdapter GDA = new SqlDataAdapter(" " +

                    " select Code, Email, SubscribeDate=Convert(varchar(11),SubscribeDate,113) "+
                    " from fp_Subscription order by SubscribeDate desc  " +           
                    "  ", Con);

            DataSet GDS = new DataSet();
            Con.Open();
            GDA.Fill(GDS);
            Con.Close();

            GridViewSubscription.DataSource = GDS;
            GridViewSubscription.DataBind();            

        }
        else
        {
            Response.Redirect("SessionExpired.aspx");
        }
    }

    protected void OnPaging(object sender, GridViewPageEventArgs e)
    {
        GridViewSubscription.PageIndex = e.NewPageIndex;
        GridViewSubscription.DataBind();
        FillGrid_Subscription();

    }
}