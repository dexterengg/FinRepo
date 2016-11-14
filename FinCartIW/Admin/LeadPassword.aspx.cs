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
using System.Text;
public partial class Admin_LeadPassword : System.Web.UI.Page
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
                bindListbox();
            }
            else
            {
                Response.Redirect("SessionExpired.aspx");
            }


        }
        //FillGridLMS();  
    }

    void bindListbox()
    {
        string qry = "select code, userid from fp_Prospects where userid is not null order by userid";
        SqlDataAdapter GDA = new SqlDataAdapter(qry, Con);
        DataSet GDS = new DataSet();
        Con.Open();
        GDA.Fill(GDS);
        Con.Close();
        lstUserids.DataSource = GDS;
        lstUserids.DataTextField = "userid";
        lstUserids.DataValueField = "code";
        lstUserids.DataBind();
    }

    void FillGridLMS(string searchres)
    {
        if ((string)Session["AdminSessionID"] != null)
        {
            string qry="select Code, Name, Mobile1, Email1, Pwd from fp_Prospects where userid in ("+searchres+")";
            SqlDataAdapter GDA = new SqlDataAdapter(qry, Con);
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
        FillGridLMS(ViewState["AllIDs"].ToString());
    }

    protected void Submit(object sender, EventArgs e)
    {
        lblmsg.Text = "";
        SqlDataAdapter ACDA = new SqlDataAdapter("select * from fp_Secret_Pins where PinFor='LeadPassword'", Con);
        DataSet ACDS = new DataSet();
        Con.Open();
        ACDA.Fill(ACDS);
        Con.Close();

        if (ACDS.Tables[0].Rows.Count > 0)
        {
            if (txtpin.Text.Trim() == ACDS.Tables[0].Rows[0]["Pin"].ToString().Trim())
            {
                List<string> ids = new List<string>();
                foreach (ListItem item in lstUserids.Items)
                {
                    if (item.Selected)
                    {
                        ids.Add("'" + item.Text + "'");
                    }
                }
                ViewState["AllIDs"] = string.Join(",", ids);

                FillGridLMS(ViewState["AllIDs"].ToString());
            }
            else
            {
                lblmsg.Text = "Invalid pin !!";
            }
        }
    }
}