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
using System.Text;

public partial class RiskSelected : System.Web.UI.Page
{
    SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ToString());
    string xStr = "";
    SqlCommand cmd;
    int riskCode = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            ViewState["userid"] = Session["userSessionID"].ToString();

            // Select Risk from table fp_prospects                                        
            SqlDataAdapter InvGDA = new SqlDataAdapter(" " +

                    " select RiskCode=isnull(riskCode,0)  " +
                    " from fp_prospects where userid='" + ViewState["userid"] + "' " +
                    "  ", Con);

            DataSet InvGDS = new DataSet();
            Con.Open();
            InvGDA.Fill(InvGDS);
            Con.Close();

            if (InvGDS.Tables[0].Rows.Count > 0)
            {
                riskCode = Convert.ToInt32(InvGDS.Tables[0].Rows[0]["RiskCode"]);
            }

            switch (riskCode)
            {
                case 0:
                    ImgAggressive.ImageUrl = "images/aggressive.png";
                    ImgConservative.ImageUrl = "images/conservative.png";
                    ImgGrowth.ImageUrl = "images/growth.png";
                    ImgModerate.ImageUrl = "images/moderate.png";
                    ImgUltraConservative.ImageUrl = "images/ultra-conservative.png";
                    break;
                case 1:
                    ImgAggressive.ImageUrl = "images/aggressive.png";
                    ImgConservative.ImageUrl = "images/conservative.png";
                    ImgGrowth.ImageUrl = "images/growth.png";
                    ImgModerate.ImageUrl = "images/moderate.png";
                    ImgUltraConservative.ImageUrl = "images/ultra-conservative-select.png";                    
                    break;
                case 2:
                    ImgAggressive.ImageUrl = "images/aggressive.png";
                    ImgConservative.ImageUrl = "images/conservative-select.png";
                    ImgGrowth.ImageUrl = "images/growth.png";
                    ImgModerate.ImageUrl = "images/moderate.png";
                    ImgUltraConservative.ImageUrl = "images/ultra-conservative.png";
                    break;
                case 3:
                    ImgAggressive.ImageUrl = "images/aggressive.png";
                    ImgConservative.ImageUrl = "images/conservative.png";
                    ImgGrowth.ImageUrl = "images/growth.png";
                    ImgModerate.ImageUrl = "images/moderate-select.png";
                    ImgUltraConservative.ImageUrl = "images/ultra-conservative.png";
                    break;
                case 4:
                    ImgAggressive.ImageUrl = "images/aggressive.png";
                    ImgConservative.ImageUrl = "images/conservative.png";
                    ImgGrowth.ImageUrl = "images/growth-select.png";
                    ImgModerate.ImageUrl = "images/moderate.png";
                    ImgUltraConservative.ImageUrl = "images/ultra-conservative.png";
                    break;
                case 5:
                    ImgAggressive.ImageUrl = "images/aggressive-select.png";
                    ImgConservative.ImageUrl = "images/conservative.png";
                    ImgGrowth.ImageUrl = "images/growth.png";
                    ImgModerate.ImageUrl = "images/moderate.png";
                    ImgUltraConservative.ImageUrl = "images/ultra-conservative.png";  
                    break;
            }

        }
    }
    protected void ImgUltraConservative_Click(object sender, ImageClickEventArgs e)
    {
        risktype(1);
        Response.Redirect("FreePlanOutput.aspx?risk=A");
    }
    protected void ImgConservative_Click(object sender, ImageClickEventArgs e)
    {
        risktype(2);
        Response.Redirect("FreePlanOutput.aspx?risk=A");
    }
    protected void ImgModerate_Click(object sender, ImageClickEventArgs e)
    {
        risktype(3);
        Response.Redirect("FreePlanOutput.aspx?risk=A");
    }
    protected void ImgGrowth_Click(object sender, ImageClickEventArgs e)
    {
        risktype(4);
        Response.Redirect("FreePlanOutput.aspx?risk=A");
    }
    protected void ImgAggressive_Click(object sender, ImageClickEventArgs e)
    {
        risktype(5);
        Response.Redirect("FreePlanOutput.aspx?risk=A");
    }

    protected void risktype(int a)
    {
        Con.Open();
        // Code for Planner Role
        xStr = "update fp_Prospects set RiskCode="+a+"  where userid='" + ViewState["userid"] + "'";

        SqlCommand cmd = new SqlCommand(xStr, Con);
        cmd.ExecuteNonQuery();
        Con.Close();
    }
}