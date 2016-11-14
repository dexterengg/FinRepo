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

public partial class Admin_LMSPayment : System.Web.UI.Page
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

            FillGridLMS_Payment();
        }
    }

    void FillGridLMS_Payment()
    {
        if ((string)Session["AdminSessionID"] != null)
        {
            string xCode = Session["AdminSessionID"].ToString();

            SqlDataAdapter GDA = new SqlDataAdapter(" " +

                    " select Code, PDate=Convert(varchar(11),PaymentDate,113), ClientNAme=(Select Name from fp_Prospects "+
                    " where Code=pd.clientcode), Amount,Instrument,Drawer,Drawee,Payer,Payee,PaymentMode, " +
                    " PlannerName=(select PlannerName from fp_Planner where Code=pd.PlannerCode ), " +
                    " EntryDate from fp_PaymentDetail pd  where clientCode=" + ViewState["xClientCode"] + " " +                    
                    "  ", Con);

            DataSet GDS = new DataSet();
            Con.Open();
            GDA.Fill(GDS);
            Con.Close();

            GridViewPayment.DataSource = GDS;
            GridViewPayment.DataBind();


        }
        else
        {
            Response.Redirect("SessionExpired.aspx");
        }
    }

    protected void GridViewPayment_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        if ((string)Session["AdminSessionID"] != null)
        {
            string xCode = Session["AdminSessionID"].ToString();

            GridViewRow row = (GridViewRow)GridViewPayment.Rows[e.RowIndex];

            Con.Open();
            SqlCommand cmd = new SqlCommand("delete FROM fp_PaymentDetail where Code='" + Convert.ToInt32(GridViewPayment.DataKeys[e.RowIndex].Value.ToString()) + "'", Con);
            cmd.ExecuteNonQuery();
            Con.Close();
            FillGridLMS_Payment();
        }
        else
        {
            Response.Redirect("SessionExpired.aspx");
        }
    }

    protected void GridViewPayment_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridViewPayment.EditIndex = e.NewEditIndex;
        FillGridLMS_Payment();
    }

    protected void GridViewPayment_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int code = Convert.ToInt32(GridViewPayment.DataKeys[e.RowIndex].Value.ToString());
        GridViewRow row = (GridViewRow)GridViewPayment.Rows[e.RowIndex];

        TextBox textAmount = (TextBox)row.Cells[3].Controls[0];
        TextBox textInstrument = (TextBox)row.Cells[4].Controls[0];
        TextBox textDrawer = (TextBox)row.Cells[5].Controls[0];
        TextBox textDrawee = (TextBox)row.Cells[6].Controls[0];
        TextBox textPayer = (TextBox)row.Cells[7].Controls[0];
        TextBox textPayee = (TextBox)row.Cells[8].Controls[0];
        TextBox textPMode = (TextBox)row.Cells[9].Controls[0];

        GridViewPayment.EditIndex = -1;
        Con.Open();

        xStr = "update fp_PaymentDetail set Amount='" + textAmount.Text + "', Instrument='" + textInstrument.Text+ "'," +
            " Drawer='" + textDrawer.Text + "', Drawee='" + textDrawee.Text + "' ,Payer='" + textPayer.Text + "', "+
            " Payee='" + textPayee.Text + "', PaymentMode='" + textPMode.Text + "' where code='" + code + "'";        

        SqlCommand cmd = new SqlCommand(xStr, Con);
        cmd.ExecuteNonQuery();
        Con.Close();
        FillGridLMS_Payment();

    }
    protected void GridViewPayment_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridViewPayment.EditIndex = -1;
        FillGridLMS_Payment();
    }

    protected void PaymentSubmit_click(object sender, EventArgs e)
    {
        if ((string)Session["AdminSessionID"] != null)
        {
            
            string xPaymentDate = "NULL";
            if (txtPaymentDate.Text != "")
            {
                xPaymentDate = "'" + Convert.ToDateTime(txtPaymentDate.Text).ToString("yyyy-MM-dd") + "'";
                xPaymentDate = "'" + txtPaymentDate.Text.Substring(6, 4) + '-' + txtPaymentDate.Text.Substring(3, 2) + '-' + txtPaymentDate.Text.Substring(0, 2) + "'";
            }

            xStr = " Insert into fp_PaymentDetail(ClientCode,PaymentDate,Amount,Instrument,Drawer,Drawee,Payer,Payee,PaymentMode,PlannerCode,EntryDate)   " +
                " values(" + ViewState["xClientCode"] + "," + xPaymentDate + ",'" + txtAmount.Text + "',"+
                " '" + txtInstrument.Text + "','" + txtDrawer.Text + "', " +
                " '" + txtDrawee.Text + "','" + txtPayer.Text + "', '" + txtPayee.Text + "', '" + txtPaymentMode.Text + "', "+
                " '" + ViewState["xPlannerCode"] + "', '" + Convert.ToDateTime(System.DateTime.Now).ToString("yyyy-MM-dd") + "' " +
                " ) ";
            cmd = new SqlCommand(xStr, Con);
            Con.Open();
            cmd.ExecuteNonQuery();
            Con.Close();
            FillGridLMS_Payment();

            txtAmount.Text = "";
            txtInstrument.Text = "";
            txtDrawer.Text = "";
            txtDrawee.Text = "";
            txtPayer.Text = "";
            txtPayee.Text = "";
            txtPaymentMode.Text = "";            

        }
        else
        {
            Response.Redirect("SessionExpired.aspx");
        }
    }
}