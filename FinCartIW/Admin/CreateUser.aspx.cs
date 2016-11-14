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

public partial class Admin_CreateUser : System.Web.UI.Page
{
    SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ToString());
    string xStr = "";
    SqlCommand cmd;
    string xClientCode = ""; 

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if ((string)Session["AdminSessionID"] != null)
            {
                ViewState["xCode"] = Session["AdminSessionID"].ToString();
                ViewState["xPRole"] = Session["LoginRole"].ToString(); 
                
                // Code for Planner Role
                SqlDataAdapter RDA = new SqlDataAdapter(" " +

                " select * from fp_ComboDetail where comboCode=15 " +
                "  ", Con);

                DataSet RDS = new DataSet();
                Con.Open();
                RDA.Fill(RDS);
                Con.Close();

                DDPlannerRole.DataSource = RDS;
                DDPlannerRole.DataTextField = "Name";
                DDPlannerRole.DataValueField = "Code";
                DDPlannerRole.DataBind();

                DDPlannerRole.Items.Insert(0, new ListItem("Select Role", "0"));

                // Code for Report To
                SqlDataAdapter RDA2 = new SqlDataAdapter(" " +

                " select Code, ReportName=PlannerName from fp_Planner order by PlannerName " +
                //" where PlannerRole=(Select Code from fp_ComboDetail where Name='Management' ) " +                
                "  ", Con);

                DataSet RDS2 = new DataSet();
                Con.Open();
                RDA2.Fill(RDS2);
                Con.Close();

                DropDownReportTo.DataSource = RDS2;
                DropDownReportTo.DataTextField = "ReportName";
                DropDownReportTo.DataValueField = "Code";
                DropDownReportTo.DataBind();
                
            }
            else
            {
                Response.Redirect("SessionExpired.aspx");
            }
            FillGrid_User();   
        }
        
    }

    protected void UserSubmit_click(object sender, EventArgs e)
    {
        if ((string)Session["AdminSessionID"] != null)
        {
            string xAddress = "NULL";
            if (txtAddress.Text != "")
            {
                xAddress = "'" + txtAddress.Text + "'";
            }

            string xState = "NULL";
            if (txtState.Text != "")
            {
                xState = "'" + txtState.Text + "'";
            }

            string xPin = "NULL";
            if (txtPin.Text != "")
            {
                xPin = "'" + txtPin.Text + "'";
            }

            string xReportTo = "NULL";
            if (DropDownReportTo.SelectedValue != "")
            {
                xReportTo = "'" + DropDownReportTo.SelectedValue + "'";
            }
            

            xStr = " Insert into fp_Planner(PlannerName,ContactName,UserID,Pwd,Address,City,Pin,State,Mobile1,Mobile2,Email, "+
            " AlternateEmail,OpenDate,PlannerRole,ReportTo)   " +
                " values('" + txtPlannerName.Text + "','" + txtContactName.Text + "','" + txtEmail1.Text + "','" + txtPassword.Text + "', "+
                " '" + txtAddress.Text + "', '"+txtCity.Text+"', '"+txtPin.Text+"', '"+txtState.Text+"', " +
                " '" + txtMobile1.Text + "','" + txtMobile2.Text + "', '" + txtEmail1.Text + "', '" + txtEmail2.Text + "', "+
                " '" + Convert.ToDateTime(System.DateTime.Now).ToString("yyyy-MM-dd") + "', " +
                " " + DDPlannerRole.SelectedValue + ", " + xReportTo + " " +
                " ) ";
            cmd = new SqlCommand(xStr, Con);
            Con.Open();
            cmd.ExecuteNonQuery();
            Con.Close();
            FillGrid_User();

            txtPlannerName.Text = "";
            txtContactName.Text = "";
            txtEmail1.Text = "";
            txtPassword.Text = "";
            txtAddress.Text = "";
            txtCity.Text = "";
            txtPin.Text = "";
            txtState.Text = "";
            txtMobile1.Text = "";
            txtMobile2.Text = "";
            txtEmail1.Text = "";
            txtEmail2.Text = "";            
        }
        else
        {
            Response.Redirect("SessionExpired.aspx");
        }
    }

    void FillGrid_User()
    {
        if ((string)Session["AdminSessionID"] != null)
        {
            string xCode = Session["AdminSessionID"].ToString();

            SqlDataAdapter GDA = new SqlDataAdapter(" " +

                    " select Code, PlannerName=PlannerName+'-'+(Select left(Name,1) from fp_ComboDetail where Code=p.PlannerRole ) " +
                    " ,UserID,Pwd,City,Mobile=Mobile1,Website, PlannerRole=(Select Name from fp_ComboDetail "+
                    " where Code=p.PlannerRole ), "+
                    " ReportTo=(select Name from fp_prospects where Code=p.ReportTo) from fp_Planner p  " +
                    "  ", Con);

            DataSet GDS = new DataSet();
            Con.Open();
            GDA.Fill(GDS);
            Con.Close();

            GridViewUser.DataSource = GDS;
            GridViewUser.DataBind();


        }
        else
        {
            Response.Redirect("SessionExpired.aspx");
        }
    }

    protected void GridViewUser_RowCreated(object sender, GridViewRowEventArgs e)
    {       

        if (ViewState["xPRole"].ToString() == "Planner")
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Cells[3].Visible = false;                
            }

            if (e.Row.RowType == DataControlRowType.Header)
            {
                e.Row.Cells[3].Visible = false;                
            }
        }

    }

    protected void GridViewUser_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridViewUser.EditIndex = e.NewEditIndex;
        FillGrid_User();
    }

    protected void GridViewUser_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int code = Convert.ToInt32(GridViewUser.DataKeys[e.RowIndex].Value.ToString());
        GridViewRow row = (GridViewRow)GridViewUser.Rows[e.RowIndex];

        TextBox textRefPoint = (TextBox)row.Cells[3].Controls[0];
        TextBox textRefBy = (TextBox)row.Cells[4].Controls[0];

        GridViewUser.EditIndex = -1;
        Con.Open();

        xStr = " update fp_Planner set PointAdded='" + textRefPoint.Text + "', ReferredBy='" + textRefBy.Text + "' " +
               " where code='" + code + "'";

        SqlCommand cmd = new SqlCommand(xStr, Con);
        cmd.ExecuteNonQuery();
        Con.Close();
        FillGrid_User();

    }
    protected void GridViewUser_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridViewUser.EditIndex = -1;
        FillGrid_User();
    }

    protected void DDPlannerRole_change(object sender, EventArgs e)
    {
        string xRPT = "";
        if (DDPlannerRole.SelectedItem.ToString() == "Admin")
        {
            divReportTo.Visible = false;
        }

        if (DDPlannerRole.SelectedItem.ToString() == "Management")
        {
            divReportTo.Visible = true;
            xRPT = "Management";
            ReportTo(xRPT);
        }
        if (DDPlannerRole.SelectedItem.ToString() == "Operator")
        {
            divReportTo.Visible = true;
            xRPT = "Operator";
            ReportTo(xRPT);
        }
        if (DDPlannerRole.SelectedItem.ToString() == "Planner")
        {
            divReportTo.Visible = true;
            xRPT = "Planner";
            ReportTo(xRPT);
        }
    }

    protected void ReportTo(string rpt)
    {
        string xxRPT = rpt;

        if (xxRPT.ToString() == "Management")
        {
            xStr = "select Code, PlannerName from fp_Planner p where PlannerRole=(Select Code from fp_ComboDetail where Name='Admin')";
        }

        if (xxRPT.ToString() == "Planner")
        {
            xStr = "select Code, PlannerName from fp_Planner p where PlannerRole in (Select Code from fp_ComboDetail where Name<>'Operator')";
        }

        if (xxRPT.ToString() == "Operator")
        {
            xStr = "select Code, PlannerName from fp_Planner p where PlannerRole in (Select Code from fp_ComboDetail where Name<>'Planner')";
        }

        SqlDataAdapter RDA2 = new SqlDataAdapter(xStr, Con);

        DataSet RDS2 = new DataSet();
        Con.Open();
        RDA2.Fill(RDS2);
        Con.Close();

        DropDownReportTo.DataSource = RDS2;
        DropDownReportTo.DataTextField = "PlannerName";
        DropDownReportTo.DataValueField = "Code";
        DropDownReportTo.DataBind();
    }
    protected void GridViewUser_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }
}