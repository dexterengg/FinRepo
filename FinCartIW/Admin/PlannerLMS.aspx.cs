using System;
using System.Collections.Generic;
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

public partial class Admin_PlannerLMS : System.Web.UI.Page
{
    SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ToString());
    string xStr = "";
    SqlCommand cmd;

    protected void Page_Load(object sender, EventArgs e)
    {
        ViewState["xUserID"] = Session["AdminSessionID"].ToString();
        ViewState["xPRole"] = Session["LoginRole"].ToString();

        if (!IsPostBack)
        {
            FillGridTodays_Activity();
        }
    }

    void FillGridTodays_Activity()
    {
        if ((string)Session["AdminSessionID"] != null)
        {           

            SqlDataAdapter GDA = new SqlDataAdapter(" " +

                    " select Code, NextADate=convert(varchar(11),NextActionDate,105), ActionTime " +
                    " ,Activity=isnull((select Name from fp_combodetail where Code=am.Activity),'No Activity') " +
                    " ,ActivityCode=isnull(Activity,-1) " +
                    " ,ClientName=(select Name from fp_prospects where Code=am.ClientCode ) "+
                    " ,ClientPhone = (select Mobile1 from fp_prospects where Code=am.ClientCode ) "+
                    " ,ClientEmail = (select Email1 from fp_prospects where Code=am.ClientCode ) "+
                    " ,AMStatus=isnull(AMStatus,'Open') "+
                    " from fp_ActivityMonitor am "+
                    " where  PlannerCode=(select code from fp_Planner where userid='" + ViewState["xUserID"] + "') "+
                    " and NextActionDate between dateadd(dd,-3,getdate()) and getdate()+1  order by NextActionDate desc " +
                    "  ", Con);

            DataSet GDS = new DataSet();
            Con.Open();
            GDA.Fill(GDS);
            Con.Close();

            GVToDaysActivity.DataSource = GDS;
            GVToDaysActivity.DataBind();

        }
        else
        {
            Response.Redirect("SessionExpired.aspx");
        }
    }

    protected void GVToDaysActivity_OnRowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            if ((string)Session["AdminSessionID"] != null)
            {

                if((e.Row.RowState & DataControlRowState.Edit) > 0)
                {
                    //Find the DropDownList for Planner
                    DropDownList ddCActivity = (e.Row.FindControl("ddCActivity") as DropDownList);

                    xStr = " select code, Name from fp_combodetail where Combocode=16 ";

                    SqlDataAdapter IMDA = new SqlDataAdapter(xStr, Con);

                    DataSet IMDS = new DataSet();
                    Con.Open();
                    IMDA.Fill(IMDS);
                    Con.Close();

                    ddCActivity.DataSource = IMDS;
                    ddCActivity.DataTextField = "Name";
                    ddCActivity.DataValueField = "Code";
                    ddCActivity.DataBind();

                    //Add Default Item in the DropDownList
                    ddCActivity.Items.Insert(0, new ListItem( "Please select","-1"));
                    
                    DataRowView dr = e.Row.DataItem as DataRowView;                    
                    ddCActivity.SelectedValue = dr["ActivityCode"].ToString();
                    
                    //Select the Status in DropDownList
                    DropDownList ddStatus = (e.Row.FindControl("ddStatus") as DropDownList);
                    ddStatus.SelectedValue = dr["AMStatus"].ToString().Trim();


                
                }
                //Code for Tooltip on edit button start
                e.Row.Cells[9].ToolTip = "Save or Edit";
                if (e.Row.RowState == DataControlRowState.Edit || e.Row.RowState.ToString() == "Alternate, Edit")
                {
                    int i = 0;
                    foreach (TableCell cell in e.Row.Cells)
                    {
                        if (e.Row.Cells.GetCellIndex(cell) == 9)
                        {
                            ((System.Web.UI.WebControls.ImageButton)(e.Row.Cells[9].Controls[0])).ToolTip = "Update Data";
                            ((System.Web.UI.LiteralControl)(e.Row.Cells[9].Controls[1])).Text = "&nbsp;";
                            ((System.Web.UI.WebControls.ImageButton)(e.Row.Cells[9].Controls[2])).ToolTip = "Cancel Edit";
                        }
                        i++;
                    }
                }
                //Code for Tooltip on edit button end
            }
            else
            {
                Response.Redirect("SessionExpired.aspx");
            }
        }
    }

    protected void GVToDaysActivity_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GVToDaysActivity.EditIndex = e.NewEditIndex;
        FillGridTodays_Activity();
    }
    protected void GVToDaysActivity_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int code = Convert.ToInt32(GVToDaysActivity.DataKeys[e.RowIndex].Value.ToString());
        GridViewRow row = (GridViewRow)GVToDaysActivity.Rows[e.RowIndex];

        DropDownList ddActivity = row.FindControl("ddCActivity") as DropDownList;
        int xActivity = int.Parse(ddActivity.SelectedItem.Value);

        DropDownList ddStatus = row.FindControl("ddStatus") as DropDownList;
        String xStatus = ddStatus.SelectedItem.Value;        

        TextBox textActionTime = (TextBox)row.Cells[2].Controls[0];
        TextBox txtActivityDt = row.FindControl("txtActionDate") as TextBox;
        String xAcDte = txtActivityDt.Text;

        String xAcDt = "'" + xAcDte.Substring(6, 4) + '-' + xAcDte.Substring(3, 2) + '-' + xAcDte.Substring(0, 2) + "'";


        GVToDaysActivity.EditIndex = -1;
        Con.Open();

        SqlCommand cmd = new SqlCommand("update fp_ActivityMonitor set ActionTime='" + textActionTime.Text + "', "+
            " Activity=" + xActivity + ", AMStatus='" + xStatus + "', NextActionDate=" + xAcDt + " where code='" + code + "'", Con);

        cmd.ExecuteNonQuery();
        Con.Close();
        FillGridTodays_Activity();

    }
    protected void GVToDaysActivity_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GVToDaysActivity.EditIndex = -1;
        FillGridTodays_Activity();
    }
    protected void btnActivitySearch_Click(object sender, System.EventArgs e)
    {
        if ((string)Session["AdminSessionID"] != null)
        {

            String xADate = searchDate.Text;
            xADate = "'" + xADate.Substring(6, 4) + '-' + xADate.Substring(3, 2) + '-' + xADate.Substring(0, 2) + "'";

            SqlDataAdapter GDA = new SqlDataAdapter(" " +

                    " select Code, NextADate=convert(varchar(11),NextActionDate,105), ActionTime " +
                    " ,Activity=isnull((select Name from fp_combodetail where Code=am.Activity),'No Activity') " +
                    " ,ActivityCode=isnull(Activity,-1) " +
                    " ,ClientName=(select Name from fp_prospects where Code=am.ClientCode ) " +
                    " ,ClientPhone = (select Mobile1 from fp_prospects where Code=am.ClientCode ) " +
                    " ,ClientEmail = (select Email1 from fp_prospects where Code=am.ClientCode ) " +
                    " ,AMStatus=isnull(AMStatus,'Open') " +
                    " from fp_ActivityMonitor am " +
                    " where  PlannerCode=(select code from fp_Planner where userid='" + ViewState["xUserID"] + "') " +
                    " and NextActionDate=" + xADate + "  order by NextActionDate desc " +
                    "  ", Con);

            DataSet GDS = new DataSet();
            Con.Open();
            GDA.Fill(GDS);
            Con.Close();

            GVToDaysActivity.DataSource = GDS;
            GVToDaysActivity.DataBind();

        }
        else
        {
            Response.Redirect("SessionExpired.aspx");
        }
    }
}