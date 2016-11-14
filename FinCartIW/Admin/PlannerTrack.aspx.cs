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

public partial class Admin_PlannerTrack : System.Web.UI.Page
{
    SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ToString());
    string xStr = "";
    SqlCommand cmd;

    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            if ((string)Session["AdminSessionID"] != null)
            {
                // Select Code for Lead Type Combo
                SqlDataAdapter RDA = new SqlDataAdapter(" " +
                " select Code, Name from fp_ComboDetail where ComboCode=19 order by 2 " +
                "  ", Con);

                DataSet RDS = new DataSet();
                Con.Open();
                RDA.Fill(RDS);
                Con.Close();

                DDLeadType.DataSource = RDS;
                DDLeadType.DataTextField = "Name";
                DDLeadType.DataValueField = "Code";
                DDLeadType.DataBind();
                DDLeadType.Items.Insert(0, new ListItem("All Lead Type", "-1"));


                SqlDataAdapter IMDA = new SqlDataAdapter(" select Code, PlannerName from fp_Planner where plannername not in ('Admin','Planner','Operator') ", Con);

                DataSet IMDS = new DataSet();
                Con.Open();
                IMDA.Fill(IMDS);
                Con.Close();

                ddlplanner.DataSource = IMDS;
                ddlplanner.DataTextField = "PlannerName";
                ddlplanner.DataValueField = "Code";
                ddlplanner.DataBind();
            }
            else
            {
                Response.Redirect("SessionExpired.aspx");
            }
        }
    }

    void FillGridLMS(string plannercode)
    {
        if ((string)Session["AdminSessionID"] != null)
        {
            string xCode = Session["AdminSessionID"].ToString();
            string xSearchRes = "";
            string xCB = "";
            string xPlannerAssign = "";
            string xOperatorAssign = "";
            string xCustomer = "";
            string xLeadType = "";

            if (DDLeadType.SelectedValue.ToString() != "-1")
            {
                xLeadType = " and LeadType='" + DDLeadType.SelectedValue + "' ";
            }

           xOperatorAssign = " and PlannerCode=" + plannercode + " ";
           string sr = " " +
                   " select Code, PlannerCode=isnull(PlannerCode,-1),  Name, Gender, Age=(year(getdate())-year(DOB)), " +
                   " OperatorCode=isnull(OperatorCode,-1), Mobile1, Email1, City, " +
                   " Source1=isnull((Select Name from fp_ComboDetail where Code=p.Source1 ),'N/A'), " +
                   " Source2=isnull((Select Name from fp_ComboDetail where Code=p.Source2 ),'N/A')," +
                   " Source3=isnull((Select C_Name from fp_Campaign where C_ClientSatusCode=p.ClientStatus ),'N/A')," +
                   " OPType1, OPType2, SiteAC, TxnAC, " +
                   " Remarks,EntryDate=Convert(varchar(11), SystemDate, 105), LeadType=isnull(LeadType,-1), " +
                   " AllocateDate=convert(varchar(11),allocateDate,105)," +
                   " LastActivityDate=isnull((select convert(varchar(11), max(ActionDate), 105) " +
                   " from fp_ActivityMonitor where ClientCode=p.Code),'Create'), PlannerLock=isnull(PLock,'X')  " +
                   " from fp_prospects p where Name like '%" + xSearchRes + "%' " + xCB + " " + xPlannerAssign + " " +
                   " " + xOperatorAssign + " " + xCustomer + " " + xLeadType + " order by SystemDate desc " +
                   "  ";
            SqlDataAdapter GDA = new SqlDataAdapter(sr, Con);

            DataSet GDS = new DataSet();
            Con.Open();
            GDA.Fill(GDS);
            Con.Close();

            GridViewLMS.DataSource = GDS;
            GridViewLMS.DataBind();
            GridViewLMS_excel.DataSource = GDS;
            GridViewLMS_excel.DataBind();
        }
        else
        {
            Response.Redirect("SessionExpired.aspx");
        }
    }

    protected void OnPaging(object sender, GridViewPageEventArgs e)
    {
        GridViewLMS.PageIndex = e.NewPageIndex;
        GridViewLMS.DataBind();
        FillGridLMS(ViewState["xSItem"].ToString());

    }

    protected void GridViewLMS_OnRowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            if ((string)Session["AdminSessionID"] != null)
            {
                string xCode = Session["AdminSessionID"].ToString();

                //Find the DropDownList for Planner
                DropDownList ddLeadType = (e.Row.FindControl("ddLeadType") as DropDownList);

                SqlDataAdapter LTDA = new SqlDataAdapter(" " +

                " select Code, Name from fp_ComboDetail where ComboCode=19 order by Name " +
                "  ", Con);

                DataSet LTDS = new DataSet();
                Con.Open();
                LTDA.Fill(LTDS);
                Con.Close();

                ddLeadType.DataSource = LTDS;
                ddLeadType.DataTextField = "Name";
                ddLeadType.DataValueField = "Code";
                ddLeadType.DataBind();

                //Add Default Item in the DropDownList
                ddLeadType.Items.Insert(0, new ListItem("N/A", "-1"));

                //Select the Planner of Prospects in DropDownList
                string xLeadType = (e.Row.FindControl("lblLeadType") as Label).Text;
                ddLeadType.Items.FindByValue(xLeadType).Selected = true;

                string clientcode = (e.Row.FindControl("lblclientcode") as Label).Text;
                GridView GridViewActivity = (e.Row.FindControl("GridViewActivity") as GridView);
                string qr = " " +

                    " select Code, CDate=Convert(varchar(11), EntryDate, 105), Comment, EnteredBy, " +
                    " NextADate=Convert(varchar(11),NextActionDate,105) " +
                    " ,ActionTime, Activity=(Select Name from fp_combodetail where Code=am.Activity) " +
                    " from fp_ActivityMonitor am where ClientCode='" + clientcode + "' order by EntryDate desc  " +
                    "  ";

                SqlDataAdapter GDA = new SqlDataAdapter(qr, Con);

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
    }

    protected void GridViewLMS_RowCreated(object sender, GridViewRowEventArgs e)
    {


    }

    protected void SearchSubmit_Click(object sender, EventArgs e)
    {
        ViewState["xSItem"] = ddlplanner.SelectedValue;
        FillGridLMS(ViewState["xSItem"].ToString());
    }

    protected void ExportExcel()
    {
        Response.Clear();
        Response.Buffer = true;
        Response.ContentType = "application/vnd.ms-excel";
        Response.AddHeader("content-disposition", "attachment;filename=" + ddlplanner.SelectedItem.Text.Replace(" ", "_") + "_Activities_" + DateTime.Now.ToString("yyyy-dd-M--HH-mm-ss").Replace("-", "_") + ".xls");
        Response.Charset = "";
        this.EnableViewState = false;
        System.IO.StringWriter sw = new System.IO.StringWriter();
        System.Web.UI.HtmlTextWriter htw = new System.Web.UI.HtmlTextWriter(sw);
        GridViewLMS_excel.RenderControl(htw);
        Response.Write(sw.ToString());
        Response.End();
    }
    public override void VerifyRenderingInServerForm(Control control)
    {
        /* Confirms that an HtmlForm control is rendered for the specified ASP.NET
           server control at run time. */
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        ExportExcel();
    }
    protected void GridViewLMS_excel_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            if ((string)Session["AdminSessionID"] != null)
            {
                string xCode = Session["AdminSessionID"].ToString();

                //Find the DropDownList for Planner
                Label LeadType = (e.Row.FindControl("LeadType") as Label);
                string xLeadType = (e.Row.FindControl("lblLeadType") as Label).Text;

                SqlDataAdapter LTDA = new SqlDataAdapter(" " +

                " select Name from fp_ComboDetail where ComboCode=19 and code=" + xLeadType + "" +
                "  ", Con);

                DataSet LTDS = new DataSet();
                Con.Open();
                LTDA.Fill(LTDS);
                Con.Close();
                if (LTDS.Tables[0].Rows.Count > 0)
                {
                    LeadType.Text = LTDS.Tables[0].Rows[0]["Name"].ToString();
                }
                else
                {
                    LeadType.Text = "N/A";
                }

                string clientcode = (e.Row.FindControl("lblclientcode") as Label).Text;
                GridView GridViewActivity = (e.Row.FindControl("GridViewActivity") as GridView);
                string qr = " " +

                    " select Code, CDate=Convert(varchar(11), EntryDate, 105), Comment, EnteredBy, " +
                    " NextADate=Convert(varchar(11),NextActionDate,105) " +
                    " ,ActionTime, Activity=(Select Name from fp_combodetail where Code=am.Activity) " +
                    " from fp_ActivityMonitor am where ClientCode='" + clientcode + "' order by EntryDate desc  " +
                    "  ";

                SqlDataAdapter GDA = new SqlDataAdapter(qr, Con);

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
    }
}