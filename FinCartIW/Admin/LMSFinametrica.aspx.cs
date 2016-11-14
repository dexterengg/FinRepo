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

public partial class Admin_LMSFinametrica : System.Web.UI.Page
{
    SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ToString());
    string xStr = "";
    SqlCommand cmd;    

    protected void Page_Load(object sender, EventArgs e)
    {
        ViewState["xClientCode"] = Request.QueryString["clientcode"];
        ViewState["xPlannerCode"] = Request.QueryString["plannercode"];

        if (!IsPostBack)
        {
            // select for Investor Name                                
            SqlDataAdapter InvGDA = new SqlDataAdapter(" " +

                    " select * from fp_Prospects where Code='" + ViewState["xClientCode"] + "' " +
                    "  ", Con);

            DataSet InvGDS = new DataSet();
            Con.Open();
            InvGDA.Fill(InvGDS);
            Con.Close();

            if (InvGDS.Tables[0].Rows.Count > 0)
            {
                lblInvName.Text = InvGDS.Tables[0].Rows[0]["Name"].ToString();
            }

            // Code for Risk Category List Combo
            SqlDataAdapter RDA = new SqlDataAdapter(" " +

            " select SrNo, Risk from fp_RiskPer order by srno " +
            "  ", Con);

            DataSet RDS = new DataSet();
            Con.Open();
            RDA.Fill(RDS);
            Con.Close();

            DDRiskProfile.DataSource = RDS;
            DDRiskProfile.DataTextField = "Risk";
            DDRiskProfile.DataValueField = "SrNo";
            DDRiskProfile.DataBind();

            DDRiskProfile.Items.Insert(0, new ListItem("Choose Risk Category", "-1"));

            FillGridLMS_Finametrica();
        }        
    }

    void FillGridLMS_Finametrica()
    {
        if ((string)Session["AdminSessionID"] != null)
        {
            string xCode = Session["AdminSessionID"].ToString();

            SqlDataAdapter GDA = new SqlDataAdapter(" " +

                    " select Code, FDate=Convert(varchar(11),EntryDate,113), "+
                    " ClientNAme=(Select Name from fp_Prospects where Code=fd.clientcode), FileName, " +
                    " PlannerName=(select PlannerName from fp_Planner where Code=fd.PlannerCode ) "+
                    " from fp_FinametricaDetail fd where clientCode=" + ViewState["xClientCode"] + " " +
                    "  ", Con);

            DataSet GDS = new DataSet();
            Con.Open();
            GDA.Fill(GDS);
            Con.Close();

            GridViewFinametrica.DataSource = GDS;
            GridViewFinametrica.DataBind();


        }
        else
        {
            Response.Redirect("SessionExpired.aspx");
        }
    }

    protected void FinametricaSubmit_click(object sender, EventArgs e)
    {
        if ((string)Session["AdminSessionID"] != null)
        {

            if(txtFinametricaFile.HasFile)
            {
                try
                {
                    string filename = Path.GetFileName(txtFinametricaFile.FileName);
                    txtFinametricaFile.SaveAs(Server.MapPath("~/Admin/FinametricaReport/") + ViewState["xClientCode"] + "" + filename);
                    txtFileNotUpload.Text = "Upload status: File uploaded!";

                    SqlCommand cmd;

                    xStr = " Insert into fp_FinametricaDetail(ClientCode,FileName,PlannerCode,EntryDate)   " +
                        " values(" + ViewState["xClientCode"] + ",'" + ViewState["xClientCode"] + filename + "', " +
                        " '" + ViewState["xPlannerCode"] + "', '" + Convert.ToDateTime(System.DateTime.Now).ToString("yyyy-MM-dd") + "' " +
                        " ) ";
                    cmd = new SqlCommand(xStr, Con);
                    Con.Open();
                    cmd.ExecuteNonQuery();
                    Con.Close();

                }
                catch(Exception ex)
                {
                    txtFileNotUpload.Text = "Upload status: The file could not be uploaded. The following error occured: " + ex.Message;
                }
            }
            else
            {
                txtFileNotUpload.Text = "Select a file for upload";
            }

            FillGridLMS_Finametrica();         

        }
        else
        {
            Response.Redirect("SessionExpired.aspx");
        }
    }
    protected void GridViewFinametrica_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        if ((string)Session["AdminSessionID"] != null)
        {

            // select fileName

            string xFileName = "";
            SqlDataAdapter GDA = new SqlDataAdapter(" " +

                    " select FileName from fp_FinametricaDetail where Code='" + Convert.ToInt32(GridViewFinametrica.DataKeys[e.RowIndex].Value.ToString()) + "' " +
                    "  ", Con);

            DataSet GDS = new DataSet();
            Con.Open();
            GDA.Fill(GDS);
            Con.Close();

            if (GDS.Tables[0].Rows.Count > 0)
            {
                xFileName = GDS.Tables[0].Rows[0]["FileName"].ToString();
            }

            string path = Server.MapPath("~/Admin/FinametricaReport/" + xFileName);
            FileInfo file = new FileInfo(path);
            if (file.Exists)//check file exsit or not
            {
                file.Delete();
            }
                        
            GridViewRow row = (GridViewRow)GridViewFinametrica.Rows[e.RowIndex];
            Con.Open();            
            SqlCommand cmd = new SqlCommand("delete FROM fp_FinametricaDetail where Code='" + Convert.ToInt32(GridViewFinametrica.DataKeys[e.RowIndex].Value.ToString()) + "'", Con);
            cmd.ExecuteNonQuery();
            Con.Close();   

            FillGridLMS_Finametrica();
        }
        else
        {
            Response.Redirect("SessionExpired.aspx");
        }
    }
}