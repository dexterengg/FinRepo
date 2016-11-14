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

public partial class Admin_AddLead : System.Web.UI.Page
{
    SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ToString());
    string xStr = "";
    string xQuery = "";
    SqlCommand cmd;     

    protected void Page_Load(object sender, EventArgs e)
    {
        txtDOB.Attributes.Add("readonly", "readonly");
        txtAnnvDate.Attributes.Add("readonly", "readonly");

        if (!IsPostBack)
        {

            txtInvestorName.Focus();

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

            // Code for Source 2
            //SqlDataAdapter S2DA = new SqlDataAdapter(" " +

            //" select Code, PlannerName from fp_Planner p where PlannerRole in (Select Code from fp_ComboDetail where Name<>'Admin') " +
            //"  ", Con);

            //DataSet S2DS = new DataSet();
            //Con.Open();
            //S2DA.Fill(S2DS);
            //Con.Close();

            //DDSource2.DataSource = S2DS.Tables[0];
            //DDSource2.DataTextField = "PlannerName";
            //DDSource2.DataValueField = "Code";
            //DDSource2.DataBind(); 

            DDSource2.Items.Insert(0, new ListItem("Select Source2", "0"));

        }
        
    }
    protected void AddLeadSubmit_click(object sender, EventArgs e)
    {
        if ((string)Session["AdminSessionID"] != null)
        {

            string xDOB = "NULL";
            if (txtDOB.Text != "")
            {                
                xDOB = "'" + txtDOB.Text.Substring(6, 4) + '-' + txtDOB.Text.Substring(3, 2) + '-' + txtDOB.Text.Substring(0, 2) + "'";
            }

            string xAnnDate = "NULL";
            if (txtAnnvDate.Text != "")
            {                
                xAnnDate = "'" + txtAnnvDate.Text.Substring(6, 4) + '-' + txtAnnvDate.Text.Substring(3, 2) + '-' + txtAnnvDate.Text.Substring(0, 2) + "'";
            }

            string xCity = "NULL";
            if (txtCity.Text != "")
            {
                xCity = "'" + txtCity.Text + "'";
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



            xQuery = " Insert into fp_Prospects(Name,UserID,Pwd,Category,ClientStatus,Gender,DOB,Mobile1,Mobile2,Email1,Email2, " +
                    " City,State,Pin,AnniversaryDate, "+
                    " Source1,Source2,OpType1,OpType2,SiteAC,TxnAC,Remarks,SystemDate)   " +
                " values('" + txtInvestorName.Text + "','" + txtEmail1.Text + "','11ABC6522','C', 'M', '" + DDGender.SelectedValue + "', " +
                " " + xDOB + ", '" + txtMobile1.Text + "', " +
                " '" + txtMobile2.Text + "','" + txtEmail1.Text + "', '" + txtEmail2.Text + "', '" + txtCity.Text + "', " +
                " '" + txtState.Text + "', '" + txtPin.Text + "', " + xAnnDate + ", " +
                " '" + DDSource1.SelectedValue + "', '" + DDSource2.SelectedValue + "', '" + DDOPtype1.SelectedValue+ "', " +
                " '" + DDOpType2.SelectedValue + "', '" + DDSiteAC.SelectedValue + "', '" + DDTxnAC.SelectedValue + "',   " +
                " '" + txtRemarks.Value + "',  '" + Convert.ToDateTime(System.DateTime.Now).ToString("yyyy-MM-dd") + "' " +
                " ) ";
            //Response.Write(xQuery);
            cmd = new SqlCommand(xQuery, Con);
            Con.Open();
            cmd.ExecuteNonQuery();
            Con.Close();

            //ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "anything", "alert('Data Submitted Sucessfully');", true);

            txtInvestorName.Text = "";
            txtEmail1.Text = "";
            txtDOB.Text = "";
            txtMobile1.Text = "";
            txtMobile2.Text = "";
            txtCity.Text = "";
            txtPin.Text = "";
            txtState.Text = "";
            txtMobile1.Text = "";
            txtMobile2.Text = "";
            txtEmail1.Text = "";
            txtEmail2.Text = "";
            txtAnnvDate.Text = "";

            ShowPopupMessage("Data Submitted Successfully!", PopupMessageType.Success);
        }
        else
        {
            Response.Redirect("SessionExpired.aspx");
        }
    }

    /// <summary>
    /// Details: Change modal popup image according to PopupMessageType
    /// </summary>
    /// <param name="message"></param>
    /// <param name="messageType"></param>
    private void ShowPopupMessage(string message, PopupMessageType messageType)
    {
        switch (messageType)
        {

            case PopupMessageType.Success:
                lblMessagePopupHeading.Text = "Success";

                break;
            default:
                lblMessagePopupHeading.Text = "Information";

                break;
        }

        lblMessagePopupText.Text = message;
        mpeMessagePopup.Show();
        //formtop.Style.Add("display", "none");
    }

    /// <summary>
    /// Message type enum
    /// </summary>
    public enum PopupMessageType
    {
        Error,
        Message,
        Warning,
        Success
    }
    protected void DDOpType1_change(object sender, EventArgs e)
    {
        if (DDOPtype1.SelectedItem.ToString() == "Free")
        {
            DDOpType2.Items.Clear();
            DDOpType2.Items.Insert(0, new ListItem("Transact", "T"));
        }

        if (DDOPtype1.SelectedItem.ToString() == "Paid")
        {
            DDOpType2.Items.Clear();
            DDOpType2.Items.Insert(0, new ListItem("Transact", "T"));
            DDOpType2.Items.Insert(1, new ListItem("Customized Plan", "CP"));
            DDOpType2.Items.Insert(2, new ListItem("Fully Assisted Plan", "FAP"));
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

        DDSource2.Items.Insert(0, new ListItem("Select Source2", "0"));
    }
}