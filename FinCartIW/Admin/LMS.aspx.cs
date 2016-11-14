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
using System.Collections.Generic;

public partial class Admin_LMS : System.Web.UI.Page
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

                ViewState["xCode"] = Session["AdminSessionID"].ToString();
                ViewState["xPRole"] = Session["LoginRole"].ToString();                

                if(ViewState["xPRole"].ToString() != "Admin")
                {
                    btn_trash.Visible = false;
                }
                string xCode = Session["AdminSessionID"].ToString();

                // select code for Session Name                                
                SqlDataAdapter GDA = new SqlDataAdapter(" " +

                        " select * from fp_Planner where UserID='" + ViewState["xCode"] + "' " +
                        "  ", Con);

                DataSet GDS = new DataSet();
                Con.Open();
                GDA.Fill(GDS);
                Con.Close();

                if (GDS.Tables[0].Rows.Count > 0)
                {
                    ViewState["xSessionName"] = GDS.Tables[0].Rows[0]["PlannerName"].ToString();
                    ViewState["xSessionCode"] = GDS.Tables[0].Rows[0]["Code"].ToString();
                }

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
                DDLeadType.Items.Insert(0, new ListItem("Lead Type", "-1"));

            }
            else
            {
                Response.Redirect("SessionExpired.aspx");
            }


        }

        //FillGridLMS();  
        
    }

    void FillGridLMS(string searchres)
    {
        if ((string)Session["AdminSessionID"] != null)
        {
            string xCode = Session["AdminSessionID"].ToString();
            string xSearchRes = searchres;
            string xCB = "";
            string xPlannerAssign = "";
            string xOperatorAssign = "";
            string xCustomer = "";
            string xLeadType = "";

            if (callbackRequest.Checked)
            {
                xCB = " and ClientStatus='W' ";                
            }

            if (customer.Checked)
            {
                xCustomer = " and (OPType1='Paid' or TxnAC='Y') ";
            }

            if (leads.Checked)
            {
                xCB = " ";
                xCustomer = "";
            }

            if(DDLeadType.SelectedValue.ToString() !="-1")
            {
                xLeadType = " and LeadType='" + DDLeadType.SelectedValue + "' ";
            }

            if (ViewState["xPRole"].ToString() == "Operator")
            {
                //xPlannerAssign = " and isnull(PlannerCode,'-1')='-1' ";
                //xOperatorAssign = " and (isnull(OperatorCode,'-1')='-1' or OperatorCode=" + ViewState["xSessionCode"] + ") ";
            }

            if (ViewState["xPRole"].ToString() == "Planner" || ViewState["xPRole"].ToString() == "BDM" || ViewState["xPRole"].ToString() == "Management")
            {
                //xPlannerAssign = " and isnull(PlannerCode,'-1')='-1' ";
                xOperatorAssign = " and PlannerCode=" + ViewState["xSessionCode"] + " ";
            }


            SqlDataAdapter GDA = new SqlDataAdapter(" " +

                    " select Code, PlannerCode=isnull(PlannerCode,-1),  Name, Gender, Age=(year(getdate())-year(DOB)), "+
                    " OperatorCode=isnull(OperatorCode,-1), Mobile1, Email1, City, "+
                    " Source1=(Select Name from fp_ComboDetail where Code=p.Source1 ), " +
                    " Source2=(Select Name from fp_ComboDetail where Code=p.Source2 )," +
                    " OPType1, OPType2, SiteAC, TxnAC, " +
                    " Remarks,EntryDate=Convert(varchar(11), SystemDate, 105), LeadType=isnull(LeadType,-1), " +
                    " AllocateDate=convert(varchar(11),allocateDate,105)," +                                      
                    " LastActivityDate=isnull((select convert(varchar(11), max(ActionDate), 105) "+
                    " from fp_ActivityMonitor where ClientCode=p.Code),'Create'), PlannerLock=isnull(PLock,'X')  "+
                    " from fp_prospects p where Name like '%" + xSearchRes + "%' " + xCB + " " + xPlannerAssign + " "+
                    " " + xOperatorAssign + " " + xCustomer + " " + xLeadType + " order by SystemDate desc " +
                    "  ", Con);

            DataSet GDS = new DataSet();
            Con.Open();
            GDA.Fill(GDS);
            Con.Close();

            GridViewLMS.DataSource = GDS;
            GridViewLMS.DataBind();
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
            if (ViewState["xPRole"].ToString() != "Admin")
            {
                    CheckBox chkRow = (CheckBox)e.Row.Cells[0].FindControl("chkRow");
                chkRow.Visible = false;
            }

            if (ViewState["xPRole"].ToString() == "Operator")
            {
                Label xlblPayment = (Label)e.Row.Cells[17].FindControl("lblPaymentEdit");
                xlblPayment.Visible = false;

                Label xlblFinametrica = (Label)e.Row.Cells[17].FindControl("lblFinametrica");
                xlblFinametrica.Visible = false;

                Label xlblDocuments = (Label)e.Row.Cells[17].FindControl("lblDocuments");
                xlblDocuments.Visible = false;

                Label xlblReferalPt = (Label)e.Row.Cells[17].FindControl("lblReferalPt");
                xlblReferalPt.Visible = false;

            }

            if (e.Row.Cells[18].Text == "Y" && ViewState["xPRole"].ToString() == "Admin")
            {
                DropDownList ddPlanner = (DropDownList)e.Row.Cells[11].FindControl("ddlIM");
                ddPlanner.BackColor = System.Drawing.ColorTranslator.FromHtml("#cccccc");
                ddPlanner.Enabled = false;
            }

            
            // Code for Lead acceptence by the planner
            if (e.Row.Cells[18].Text == "X" && ViewState["xPRole"].ToString() == "Planner")
            {
            
            }
            else
            {
             
                if (e.Row.Cells[18].Text == "Y" && ViewState["xPRole"].ToString() == "Planner")
                {
                    Button btAccept = (Button)e.Row.Cells[14].FindControl("btnAccept");
                    btAccept.CssClass = "GV-ButtonDisable";
                    btAccept.Enabled = false;
                }
                else
                {
                    Button btRelease = (Button)e.Row.Cells[14].FindControl("btnRelease");
                    btRelease.CssClass = "GV-ButtonDisable";
                    btRelease.Enabled = false;
                }
            }

            
            if ((string)Session["AdminSessionID"] != null)
            {
                string xCode = Session["AdminSessionID"].ToString();                

                //Find the DropDownList for Planner
                DropDownList ddlIM = (e.Row.FindControl("ddlIM") as DropDownList);

                if (ViewState["xPRole"].ToString() == "Planner" || ViewState["xPRole"].ToString() == "BDM" || ViewState["xPRole"].ToString() == "Management")
                {
                    xStr = " select Code, PlannerName from fp_Planner " +
                " where UserID='" + ViewState["xCode"] + "' ";
                }
                if (ViewState["xPRole"].ToString() == "Operator")
                {
                    xStr = " select Code, PlannerName from fp_Planner where PlannerRole='115' ";
                }
                if (ViewState["xPRole"].ToString() == "Admin")
                {
                    xStr = " select Code, PlannerName from fp_Planner ";
                }

                SqlDataAdapter IMDA = new SqlDataAdapter(xStr, Con);

                DataSet IMDS = new DataSet();
                Con.Open();
                IMDA.Fill(IMDS);
                Con.Close();

                ddlIM.DataSource = IMDS;
                ddlIM.DataTextField = "PlannerName";
                ddlIM.DataValueField = "Code";
                ddlIM.DataBind();

                //Add Default Item in the DropDownList
                ddlIM.Items.Insert(0, new ListItem("Please select", "-1"));

                //Additional condition code written for BDM and Management Login
                if (ViewState["xPRole"].ToString() == "Planner" || ViewState["xPRole"].ToString() == "BDM" || ViewState["xPRole"].ToString() == "Management")
                {
                    //Select the Planner of Prospects in DropDownList
                    string xPlannerCode = (e.Row.FindControl("lblIM") as Label).Text;
                    ddlIM.Items.FindByValue(xPlannerCode).Selected = true;
                }

                // Dropdown for Operator Code

                //Find the DropDownList for Planner
                DropDownList ddOperatorCode = (e.Row.FindControl("ddOperatorCode") as DropDownList);

                if (ViewState["xPRole"].ToString() == "Operator")
                {
                    xStr = " select Code, PlannerName from fp_Planner " +
                " where UserID='" + ViewState["xCode"] + "' ";
                }
                else
                {
                    xStr = " select Code, PlannerName from fp_Planner " +
                    " where PlannerRole=(Select Code from fp_ComboDetail where Name='Operator' ) ";
                }

                SqlDataAdapter OCDA = new SqlDataAdapter(xStr, Con);

                DataSet OCDS = new DataSet();
                Con.Open();
                OCDA.Fill(OCDS);
                Con.Close();

                ddOperatorCode.DataSource = OCDS;
                ddOperatorCode.DataTextField = "PlannerName";
                ddOperatorCode.DataValueField = "Code";
                ddOperatorCode.DataBind();

                //Add Default Item in the DropDownList
                ddOperatorCode.Items.Insert(0, new ListItem("Please select", "-1"));

                //Select the Planner of Prospects in DropDownList
                string xOperatorCode = (e.Row.FindControl("lblOperatorC") as Label).Text;

                ddOperatorCode.SelectedValue = xOperatorCode;

                // Dropdown for LeadType Code

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
                ddLeadType.Items.Insert(0, new ListItem("Please select", "-1"));

                //Select the Planner of Prospects in DropDownList
                string xLeadType = (e.Row.FindControl("lblLeadType") as Label).Text;
                ddLeadType.Items.FindByValue(xLeadType).Selected = true;
                

            }
            else
            {
                Response.Redirect("SessionExpired.aspx");
            }

        }
    }

    protected void OnUpdateClick(object sender, EventArgs e)
    {
        int clientCode = int.Parse((sender as Button).CommandArgument);
        GridViewRow row = (sender as Button).NamingContainer as GridViewRow;
        DropDownList ddlIM = row.FindControl("ddlIM") as DropDownList;
        int plannercode = int.Parse(ddlIM.SelectedItem.Value);
        DropDownList ddOperatorCode = row.FindControl("ddOperatorCode") as DropDownList;
        int opCode = int.Parse(ddOperatorCode.SelectedItem.Value);
        DropDownList ddLeadType = row.FindControl("ddLeadType") as DropDownList;
        int leadType = int.Parse(ddLeadType.SelectedItem.Value);
        Update(plannercode, clientCode, opCode, leadType);
        
    }

    private void Update(int plannercode, int clientCode, int opCode, int leadType)
    {

        SqlCommand cmd = new SqlCommand("update fp_Prospects set PlannerCode=" + plannercode + ", " +
            " AllocateDate='" + Convert.ToDateTime(System.DateTime.Now).ToString("yyyy-MM-dd") + "', OperatorCode=" + opCode + ", "+
            " LeadType=" + leadType + " where Code='" + clientCode + "'", Con);
        Con.Open();
        cmd.ExecuteNonQuery();
        Con.Close();

        String message = "NA";
        // For inserting data in Activity Monitor Table
        ActivityUpdate(clientCode, plannercode, message);

        FillGridLMS(ViewState["xSItem"].ToString());

    }

    private void ActivityUpdate(int clientCode, int plannerCode, string message)
    {
        
        
        string xPlannerName = "";
        //Code to find out the name of Planner
        SqlDataAdapter PNDA = new SqlDataAdapter(" " +

                " select PlannerName from fp_Planner where code='" + plannerCode + "' " +
                "  ", Con);

        DataSet PNDS = new DataSet();
        Con.Open();
        PNDA.Fill(PNDS);
        Con.Close();

        if (PNDS.Tables[0].Rows.Count > 0)
        {
            if(message.ToString()=="NA")
            xPlannerName = " Allocated to Planner " + PNDS.Tables[0].Rows[0]["PlannerName"].ToString();

            if (message.ToString() == "Accept")
            xPlannerName = " Lead accepted by Planner " + PNDS.Tables[0].Rows[0]["PlannerName"].ToString();

            if (message.ToString() == "Release")
            xPlannerName = " Lead released by Planner " + PNDS.Tables[0].Rows[0]["PlannerName"].ToString();

        }

        // Code to select the code for workflow from ComboDetail
        string xActivityWF = "";
        SqlDataAdapter AMDA = new SqlDataAdapter(" " +

                " select code from fp_ComboDetail where name='Workflow' " +
                "  ", Con);

        DataSet AMDS = new DataSet();
        Con.Open();
        AMDA.Fill(AMDS);
        Con.Close();

        if (AMDS.Tables[0].Rows.Count > 0)
        {
            xActivityWF = AMDS.Tables[0].Rows[0]["code"].ToString();
        }

        // Code to check whether Activity for selected client is already updated or not
        string xAssignActivity = "N";
        SqlDataAdapter ACDA = new SqlDataAdapter(" " +

                " select code from fp_ActivityMonitor where ClientCode='"+clientCode+"' and PlannerCode='"+plannerCode+"' " +
                " and (Comment Like '%accepted%' or comment like '%released%')  " +
                "  ", Con);

        DataSet ACDS = new DataSet();
        Con.Open();
        ACDA.Fill(ACDS);
        Con.Close();

        if (ACDS.Tables[0].Rows.Count > 0)
        {
            xAssignActivity = "Y";
        }



        if (plannerCode.ToString() != "-1" && xAssignActivity=="N")
        {
            xStr = " Insert into fp_ActivityMonitor " +
                    " (ClientCode,PlannerCode,Comment,Activity,ActionDate,EnteredBy,EntryDate)   " +
                    " values(" + clientCode + ", " + plannerCode + ", '" + xPlannerName + "', " +
                    " '" + xActivityWF + "', " +
                    " '" + Convert.ToDateTime(System.DateTime.Now).ToString("yyyy-MM-dd") + "'," +
                    " '" + ViewState["xSessionName"] + "', " +
                    " '" + Convert.ToDateTime(System.DateTime.Now).ToString("yyyy-MM-dd") + "' " +
                    " ) ";
            cmd = new SqlCommand(xStr, Con);
            Con.Open();
            cmd.ExecuteNonQuery();
            Con.Close();
        }
    }

    protected void DDSearchList_change(object sender, EventArgs e)
    {
        if (DDSearchList.SelectedValue == "UN")
        {
            txtSearchItem.Visible = true;
            RadioButton1.Visible = false;
            RadioButton2.Visible = false;
        }

        if (DDSearchList.SelectedValue == "PR")
        {
            txtSearchItem.Visible = false;
            RadioButton1.Visible = true;
            RadioButton1.Text = "Complete";
            RadioButton2.Visible = true;
            RadioButton2.Text = "Incomplete";
        }

        if (DDSearchList.SelectedValue == "INV")
        {
            txtSearchItem.Visible = false;
            RadioButton1.Visible = true;
            RadioButton1.Text = "Done";
            RadioButton2.Visible = true;
            RadioButton2.Text = "Not Done";
        }
    }

    protected void SearchSubmit_Click(object sender, EventArgs e)
    {

        if (DDSearchList.SelectedValue != "0")
        {
            string xDDValue = DDSearchList.SelectedValue;
            string xSearchItem = txtSearchItem.Text;

            if (RadioButton1.Checked)
            {
                xSearchItem = RadioButton1.Text;
            }
            if (RadioButton2.Checked)
            {
                xSearchItem = RadioButton2.Text;
            }

            //string xWhere = "";
            //case 1 : ""
            //xWhere = " and name like sdg";

            ViewState["xSItem"] = xSearchItem;

            FillGridLMS(ViewState["xSItem"].ToString());

            btn_trash.Enabled = true;

        }
        else
        {
            //Message
        }

    }

    protected void GridViewLMS_RowCreated(object sender, GridViewRowEventArgs e)
    {

        if (e.Row.RowType == DataControlRowType.DataRow || e.Row.RowType == DataControlRowType.Header )
        {
            e.Row.Cells[18].Visible = false;            
        }       

        if (ViewState["xPRole"].ToString() == "Operator")
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {                
                e.Row.Cells[14].Visible = false;
                e.Row.Cells[15].Visible = false;
                e.Row.Cells[16].Visible = false;
            }

            if (e.Row.RowType == DataControlRowType.Header)
            {                
                e.Row.Cells[14].Visible = false;
                e.Row.Cells[15].Visible = false;
                e.Row.Cells[16].Visible = false;
            }
        }

        if (ViewState["xPRole"].ToString() == "Planner" )
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Cells[14].Visible = true;
                e.Row.Cells[15].Visible = true;
            }

            if (e.Row.RowType == DataControlRowType.Header)
            {
                e.Row.Cells[14].Visible = true;
                e.Row.Cells[15].Visible = true;
            }
        }
        

        if (ViewState["xPRole"].ToString() == "Admin")
        {            
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Cells[14].Visible = false;
                e.Row.Cells[15].Visible = false;
                e.Row.Cells[18].Visible = false;
            }

            if (e.Row.RowType == DataControlRowType.Header)
            {
                e.Row.Cells[14].Visible = false;
                e.Row.Cells[15].Visible = false;
                e.Row.Cells[18].Visible = false;

            }
        }
    }

    protected void OnAcceptClick(object sender, EventArgs e)
    {
        int clientCode = int.Parse((sender as Button).CommandArgument);
        SqlCommand cmd = new SqlCommand("update fp_Prospects set PLock='Y' where Code='" + clientCode + "'", Con);
        Con.Open();
        cmd.ExecuteNonQuery();
        Con.Close();
        
        GridViewRow row = (sender as Button).NamingContainer as GridViewRow;
        DropDownList ddlIM = row.FindControl("ddlIM") as DropDownList;
        int plannercode = int.Parse(ddlIM.SelectedItem.Value);

        String message = "Accept";
        // For inserting data in Activity Monitor Table
        ActivityUpdate(clientCode, plannercode, message);

        FillGridLMS(ViewState["xSItem"].ToString());

    }

    protected void OnReleaseClick(object sender, EventArgs e)
    {
        int clientCode = int.Parse((sender as Button).CommandArgument);
        SqlCommand cmd = new SqlCommand("update fp_Prospects set PLock='N' where Code='" + clientCode + "'", Con);
        Con.Open();
        cmd.ExecuteNonQuery();
        Con.Close();

        GridViewRow row = (sender as Button).NamingContainer as GridViewRow;
        DropDownList ddlIM = row.FindControl("ddlIM") as DropDownList;
        int plannercode = int.Parse(ddlIM.SelectedItem.Value);
        String message = "Release";
        // For inserting data in Activity Monitor Table
        ActivityUpdate(clientCode, plannercode, message);

        // Code for entry in Prospects after planner release lead
        cmd = new SqlCommand("update fp_Prospects set PlannerCode='-1', AllocateDate=NULL where Code='" + clientCode + "'", Con);
        Con.Open();
        cmd.ExecuteNonQuery();
        Con.Close();

        FillGridLMS(ViewState["xSItem"].ToString());

    }

    protected void btn_trash_Click(object sender, EventArgs e)
    {
        lblmsg.Text = "";
        List<Int64> ids = new List<Int64>();
        foreach (GridViewRow gvrow in GridViewLMS.Rows)
        {
            CheckBox chk = (CheckBox)gvrow.FindControl("chkRow");
            HiddenField hf = (HiddenField)gvrow.FindControl("HF_DEL_LEAD");
            if (chk.Checked)
            {
                ids.Add(Convert.ToInt64(hf.Value));
            }
        }

        if (ids.Count > 0)
        {
            int res = 0;
            string idsMovingToTrash = String.Join(",",ids);
            string qry = "insert [dbo].[fp_Prospects_Trash] select * from [dbo].[fp_Prospects] where code in(" + idsMovingToTrash + ") and code not in (select code from [dbo].[fp_Prospects_Trash] where code in (" + idsMovingToTrash + "))";
            SqlCommand cmd = new SqlCommand(qry, Con);
            Con.Open();
            res=cmd.ExecuteNonQuery();
            Con.Close();

            if (res > 0)
            {
                qry = "delete [dbo].[fp_Prospects] where code in(" + idsMovingToTrash + ")";
                cmd = new SqlCommand(qry, Con);
                Con.Open();
                res = cmd.ExecuteNonQuery();
                Con.Close();
                
                if (res > 0)
                {
                    FillGridLMS(ViewState["xSItem"].ToString());
                    lblmsg.Text = ids.Count + " Leads Moved To Trash !!";
                }
            }
        }
    }
}

