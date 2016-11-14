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

public partial class Admin_LMSReferPoint : System.Web.UI.Page
{
    SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ToString());
    string xStr = "";
    SqlCommand cmd;    

    protected void Page_Load(object sender, EventArgs e)
    {
        ViewState["xClientCode"] = Request.QueryString["clientcode"];
        ViewState["xPlannerCode"] = Request.QueryString["plannercode"];

        ////Find the DropDownList for Planner       
        //SqlDataAdapter IMDA = new SqlDataAdapter(" " +

        //" select Code, PlannerName from fp_Planner " +
        //"  ", Con);

        //DataSet IMDS = new DataSet();
        //Con.Open();
        //IMDA.Fill(IMDS);
        //Con.Close();

        //DDPlannerName.DataSource = IMDS;
        //DDPlannerName.DataTextField = "PlannerName";
        //DDPlannerName.DataValueField = "Code";
        //DDPlannerName.DataBind();

        ////Add Default Item in the DropDownList
        //DDPlannerName.Items.Insert(0, new ListItem("Choose Planner", "-1"));

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

            FillGridLMS_RefPoint();
        }

        
    }
    void FillGridLMS_RefPoint()
    {
        if ((string)Session["AdminSessionID"] != null)
        {
            string xCode = Session["AdminSessionID"].ToString();

            SqlDataAdapter GDA = new SqlDataAdapter(" " +

                    " Select Code, RPDate=Convert(varchar(11),EntryDate,113), ClientName=(Select Name from fp_Prospects where Code=r.clientcode)," +
                    " PointAdded, ReferredBy, PlannerName=(select PlannerName from fp_Planner where Code=r.PlannerCode ) "+
                    " from fp_ReferralDetail r  where clientCode=" + ViewState["xClientCode"] + " " +
                    "  ", Con);

            DataSet GDS = new DataSet();
            Con.Open();
            GDA.Fill(GDS);
            Con.Close();

            GridViewRefPoint.DataSource = GDS;
            GridViewRefPoint.DataBind();


        }
        else
        {
            Response.Redirect("SessionExpired.aspx");
        }
    }
    protected void ReferSubmit_click(object sender, EventArgs e)
    {
        if ((string)Session["AdminSessionID"] != null)
        {

            xStr = " Insert into fp_ReferralDetail(ClientCode,PointAdded,ReferredBy,PlannerCode,EntryDate)   " +
                " values(" + ViewState["xClientCode"] + "," + txtRefPoint.Text + ",'" + txtReferredBy.Text+ "'," +
                " '" + ViewState["xPlannerCode"] + "','" + Convert.ToDateTime(System.DateTime.Now).ToString("yyyy-MM-dd") + "' " +                
                " ) ";
            cmd = new SqlCommand(xStr, Con);
            Con.Open();
            cmd.ExecuteNonQuery();
            Con.Close();
            FillGridLMS_RefPoint();

            txtRefPoint.Text = "";
            txtReferredBy.Text = "";            

        }
        else
        {
            Response.Redirect("SessionExpired.aspx");
        }
    }
    protected void GridViewRefPoint_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        if ((string)Session["AdminSessionID"] != null)
        {
            string xCode = Session["AdminSessionID"].ToString();

            GridViewRow row = (GridViewRow)GridViewRefPoint.Rows[e.RowIndex];

            Con.Open();
            SqlCommand cmd = new SqlCommand("delete FROM fp_ReferralDetail where Code='" + Convert.ToInt32(GridViewRefPoint.DataKeys[e.RowIndex].Value.ToString()) + "'", Con);
            cmd.ExecuteNonQuery();
            Con.Close();
            FillGridLMS_RefPoint();
        }
        else
        {
            Response.Redirect("SessionExpired.aspx");
        }
    }

    protected void GridViewRefPoint_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridViewRefPoint.EditIndex = e.NewEditIndex;
        FillGridLMS_RefPoint();
    }

    protected void GridViewRefPoint_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int code = Convert.ToInt32(GridViewRefPoint.DataKeys[e.RowIndex].Value.ToString());
        GridViewRow row = (GridViewRow)GridViewRefPoint.Rows[e.RowIndex];

        TextBox textRefPoint = (TextBox)row.Cells[3].Controls[0];
        TextBox textRefBy = (TextBox)row.Cells[4].Controls[0];        

        GridViewRefPoint.EditIndex = -1;
        Con.Open();

        xStr = " update fp_ReferralDetail set PointAdded='" + textRefPoint.Text + "', ReferredBy='" + textRefBy.Text + "' " +            
               " where code='" + code + "'";

        SqlCommand cmd = new SqlCommand(xStr, Con);
        cmd.ExecuteNonQuery();
        Con.Close();
        FillGridLMS_RefPoint();

    }
    protected void GridViewRefPoint_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridViewRefPoint.EditIndex = -1;
        FillGridLMS_RefPoint();
    }
}