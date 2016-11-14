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

public partial class Admin_LMSEdit : System.Web.UI.Page
{
    SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ToString());
    string xStr = "";
    SqlCommand cmd;  

    protected void Page_Load(object sender, EventArgs e)
    {
        ViewState["xClientCode"] = Request.QueryString["clientcode"];
        EditSuccess.Style.Add("Display", "none");

        if (!IsPostBack)
        {

            // Code for Source 1
            SqlDataAdapter S1DA = new SqlDataAdapter(" " +

            " select Code, Name from fp_ComboDetail where ComboCode=17 and ParentCode is NULL order by Name " +
            "  ", Con);

            DataSet S1DS = new DataSet();
            Con.Open();
            S1DA.Fill(S1DS);
            Con.Close();

            DDSource1.DataSource = S1DS.Tables[0];
            DDSource1.DataTextField = "Name";
            DDSource1.DataValueField = "Code";
            DDSource1.DataBind();

            DDSource1.Items.Insert(0, new ListItem("Select Source1", "0"));

            //// Code for Source 2
            //SqlDataAdapter S2DA = new SqlDataAdapter(" " +

            //" select Code, PlannerName from fp_Planner p where PlannerRole in (Select Code from fp_ComboDetail where Name<>'Admin') " +
            //"  ", Con);

            //DataSet S2DS = new DataSet();
            //Con.Open();
            //S2DA.Fill(S2DS);
            //Con.Close();

            //DDSource2.DataSource = S2DS;
            //DDSource2.DataTextField = "PlannerName";
            //DDSource2.DataValueField = "Code";
            //DDSource2.DataBind();

            DDSource2.Items.Insert(0, new ListItem("Select Source2", "0"));

            // select for Investor Name                                
            SqlDataAdapter InvGDA = new SqlDataAdapter(" " +

                    " Select Name, Gender, Age=(year(getdate())-year(DOB)), Email1, Mobile1, Mobile2, Email2, City, Source1, Source2, " +
                    " OpType1, OpType2, SiteAC, TxnAC, Remarks from fp_Prospects  where Code='" + ViewState["xClientCode"] + "' " +
                    "  ", Con);

            DataSet InvGDS = new DataSet();
            Con.Open();
            InvGDA.Fill(InvGDS);
            Con.Close();

            if (InvGDS.Tables[0].Rows.Count > 0)
            {                
                txtClientName.Text = InvGDS.Tables[0].Rows[0]["Name"].ToString();
                DDGender.SelectedValue = InvGDS.Tables[0].Rows[0]["Gender"].ToString();
                txtAge.Text = InvGDS.Tables[0].Rows[0]["Age"].ToString();                
                txtEmailID2.Text = InvGDS.Tables[0].Rows[0]["Email2"].ToString();
                txtMobile1.Text = InvGDS.Tables[0].Rows[0]["Mobile1"].ToString();
                txtMobile2.Text = InvGDS.Tables[0].Rows[0]["Mobile2"].ToString();
                txtCity.Text = InvGDS.Tables[0].Rows[0]["City"].ToString();
                DDOpType1.SelectedValue = InvGDS.Tables[0].Rows[0]["OpType1"].ToString();
                DDOpType2.SelectedValue = InvGDS.Tables[0].Rows[0]["OpType2"].ToString();
                DDSiteAC.SelectedValue = InvGDS.Tables[0].Rows[0]["SiteAC"].ToString(); ;
                DDSource1.SelectedValue = InvGDS.Tables[0].Rows[0]["Source1"].ToString();
                DDSource2.SelectedValue = InvGDS.Tables[0].Rows[0]["Source2"].ToString();
                DDTxnAC.Text = InvGDS.Tables[0].Rows[0]["TxnAC"].ToString();
                txtRemarks.Text = InvGDS.Tables[0].Rows[0]["Remarks"].ToString();
            }
            
        } 
    }
    protected void LMSEditSubmit_click(object sender, EventArgs e)
    {
        if ((string)Session["AdminSessionID"] != null)
        {

            xStr = " Update fp_Prospects set Name='" + txtClientName.Text + "', " +
            " Gender='" + DDGender.SelectedValue + "', Mobile1='" + txtMobile1.Text + "', " +
            " Mobile2='" + txtMobile2.Text + "', Email2='" + txtEmailID2.Text + "', " +
            " City='" + txtCity.Text + "', Source1='" + DDSource1.SelectedValue + "',Source2='" + DDSource2.SelectedValue + "', " +
            " OpType1='" + DDOpType1.SelectedValue + "', OpType2='" + DDOpType2.SelectedValue + "', " +
            " SiteAC='" + DDSiteAC.SelectedValue + "', TxnAC='" + DDTxnAC.SelectedValue + "', Remarks='" + txtRemarks.Text + "' " +
            " where Code='" + ViewState["xClientCode"] + "'  ";  
            cmd = new SqlCommand(xStr, Con);
            Con.Open();
            cmd.ExecuteNonQuery();
            Con.Close();

            EditZone.Style.Add("Display","none");
            EditSuccess.Style.Add("Display", "block");
        }
        else
        {
            Response.Redirect("SessionExpired.aspx");
        }
    }

    protected void DDSource1_SelectedIndexChanged(object sender, EventArgs e)
    {
        SqlDataAdapter S2DA = new SqlDataAdapter(" " +

                " select Name, Code from fp_ComboDetail where Combocode=17 and ParentCode='" + DDSource1.SelectedValue + "'  order by Name " +
                "  ", Con);

        DataSet S2DS = new DataSet();
        Con.Open();
        S2DA.Fill(S2DS);
        Con.Close();

        DDSource2.DataSource = S2DS;
        DDSource2.DataTextField = "Name";
        DDSource2.DataValueField = "Code";
        DDSource2.DataBind();
    }
}