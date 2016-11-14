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

public partial class Admin_ActivityMonitoring : System.Web.UI.Page
{

    SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ToString());
    string xStr = "";
    SqlCommand cmd;
    //string xClientCode = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        ViewState["xClientCode"] = Request.QueryString["clientcode"];
        ViewState["xPlannerCode"] = Request.QueryString["plannercode"];

        if (!IsPostBack)
        {
            if ((string)Session["AdminSessionID"] != null)
            {
                string xCode = Session["AdminSessionID"].ToString();

                // select code for groupcode                                
                SqlDataAdapter GDA = new SqlDataAdapter(" " +

                        " select * from fp_Planner where UserID='" + xCode + "' " +
                        "  ", Con);

                DataSet GDS = new DataSet();
                Con.Open();
                GDA.Fill(GDS);
                Con.Close();

                if (GDS.Tables[0].Rows.Count > 0)
                {
                    ViewState["xSessionName"] = GDS.Tables[0].Rows[0]["PlannerName"].ToString();                    
                }

            }
            else
            {
                Response.Redirect("SessionExpired.aspx");
            }

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
                        
            // Code for Activity List Combo
            SqlDataAdapter RDA = new SqlDataAdapter(" " +

            " select * from fp_ComboDetail where comboCode=16 " +
            "  ", Con);

            DataSet RDS = new DataSet();
            Con.Open();
            RDA.Fill(RDS);
            Con.Close();

            DDToDoActivity.DataSource = RDS;
            DDToDoActivity.DataTextField = "Name";
            DDToDoActivity.DataValueField = "Code";
            DDToDoActivity.DataBind();

            DDToDoActivity.Items.Insert(0, new ListItem("Choose Activity", "-1"));

            FillGridLMS_Activity();

        }
        
    }
    
    protected void ActivitySubmit_click(object sender, EventArgs e)
    {
        if ((string)Session["AdminSessionID"] != null)
        {

            string xNADt = "NULL";
            if (txtNextActionDate.Text != "")
            {
                xNADt = "'" + txtNextActionDate.Text.Substring(6, 4) + '-' + txtNextActionDate.Text.Substring(3, 2) + '-' + txtNextActionDate.Text.Substring(0, 2) + "'";
            }

            string actcomment = txtActivityComment.Text;
            string xActivity = actcomment.Replace("'", "''");

            string xNAT = DDNZTHour.SelectedValue + ":" + DDNZTMinute.SelectedValue;            

            xStr = " Insert into fp_ActivityMonitor "+
                " (ClientCode,PlannerCode,Comment,Activity,ActionDate,NextActionDate,EnteredBy,ActionTime,EntryDate, AMStatus)   " +
                " values(" + ViewState["xClientCode"] + ", " + ViewState["xPlannerCode"] + ", '" + xActivity + "', " +
                " '" + DDToDoActivity.SelectedValue + "', " +
                " '" + Convert.ToDateTime(System.DateTime.Now).ToString("yyyy-MM-dd") + "',"+
                " " + xNADt + ", " +
                " '" + ViewState["xSessionName"] + "', '" + xNAT + "', " +
                " '" + Convert.ToDateTime(System.DateTime.Now).ToString("yyyy-MM-dd") + "', " +
                " 'Open' ) ";
            cmd = new SqlCommand(xStr, Con);
            Con.Open();
            cmd.ExecuteNonQuery();
            Con.Close();
            FillGridLMS_Activity();

            txtActivityComment.Text = "";
            txtNextActionDate.Text = "";                      
        }
        else
        {
            Response.Redirect("SessionExpired.aspx");
        }
    }

    void FillGridLMS_Activity()
    {
        if ((string)Session["AdminSessionID"] != null)
        {
            string xCode = Session["AdminSessionID"].ToString();

            SqlDataAdapter GDA = new SqlDataAdapter(" " +

                    " select Code, CDate=Convert(varchar(11), EntryDate, 105), Comment, EnteredBy, "+
                    " NextADate=Convert(varchar(11),NextActionDate,105) "+
                    " ,ActionTime, Activity=(Select Name from fp_combodetail where Code=am.Activity) "+
                    " from fp_ActivityMonitor am where ClientCode='" + ViewState["xClientCode"] + "' order by EntryDate desc  " +                    
                    "  ", Con);

            DataSet GDS = new DataSet();
            Con.Open();
            GDA.Fill(GDS);
            Con.Close();

            GridViewActivity.DataSource = GDS;
            GridViewActivity.DataBind();

        }
        else
        {
            Response.Redirect("SessionExpired.aspx");
        }
    }

    protected void GridViewActivity_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        if ((string)Session["AdminSessionID"] != null)
        {
            string xCode = Session["AdminSessionID"].ToString();

            GridViewRow row = (GridViewRow)GridViewActivity.Rows[e.RowIndex];
            
            Con.Open();
            SqlCommand cmd = new SqlCommand("delete FROM fp_ActivityMonitor where Code='" + Convert.ToInt32(GridViewActivity.DataKeys[e.RowIndex].Value.ToString()) + "'", Con);
            cmd.ExecuteNonQuery();
            Con.Close();
            FillGridLMS_Activity();
        }
        else
        {
            Response.Redirect("SessionExpired.aspx");
        }
    }
    protected void GridViewActivity_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridViewActivity.EditIndex = e.NewEditIndex;
        FillGridLMS_Activity();
    }
    protected void GridViewActivity_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int code = Convert.ToInt32(GridViewActivity.DataKeys[e.RowIndex].Value.ToString());
        GridViewRow row = (GridViewRow)GridViewActivity.Rows[e.RowIndex];        

        TextBox textComment = (TextBox)row.Cells[2].Controls[0];        

        GridViewActivity.EditIndex = -1;
        Con.Open();

        SqlCommand cmd = new SqlCommand("update fp_ActivityMonitor set Comment='" + textComment.Text + "' where code='" + code + "'", Con);
        cmd.ExecuteNonQuery();
        Con.Close();
        FillGridLMS_Activity();

    }
    protected void GridViewActivity_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridViewActivity.EditIndex = -1;
        FillGridLMS_Activity();
    }
    protected void DDToDoActivity_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DDToDoActivity.SelectedItem.ToString() == "Notes")
        {
            DDNZTHour.Visible = false;
            DDNZTMinute.Visible = false;
            txtNextActionDate.Visible = false;
        }
        else
        {
            DDNZTHour.Visible = true;
            DDNZTMinute.Visible = true;
            txtNextActionDate.Visible = true;
        }

    }
}