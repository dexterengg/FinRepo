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

public partial class Admin_AddSchemeMatrix : System.Web.UI.Page
{
    SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ToString());
    string xStr = "";
    SqlCommand cmd;
    string xClientCode = "";

    // Connection from My-portfolio
    SqlConnection mycon = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ToString());
    string xMyStr = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        ViewState["xUserID"] = Session["AdminSessionID"].ToString();
        ViewState["xPRole"] = Session["LoginRole"].ToString();

        if (!IsPostBack)
        {
            if ((string)Session["AdminSessionID"] != null)
            {
                // Code for AMC/Fund House Combo

                SqlDataAdapter RDA = new SqlDataAdapter(" " +

                " Select Code, AMCName=Name from Fund_Master where Name like '%Mutual Fund%' order by name " +
                "  ", mycon);

                DataSet RDS = new DataSet();
                Con.Open();
                RDA.Fill(RDS);
                Con.Close();

                ddAMC.DataSource = RDS;
                ddAMC.DataTextField = "AMCName";
                ddAMC.DataValueField = "Code";
                ddAMC.DataBind();

                //Add Default Item for AMC
                ddAMC.Items.Insert(0, new ListItem("Please Select AMC", "-1"));


                // Code for AMC/Fund House Combo

                SqlDataAdapter CatgRDA = new SqlDataAdapter(" " +

                " select distinct Category from fp_RiskObjMatrix order by category " +
                "  ", Con);

                DataSet CatgRDS = new DataSet();
                Con.Open();
                CatgRDA.Fill(CatgRDS);
                Con.Close();

                ddCategory.DataSource = CatgRDS;
                ddCategory.DataTextField = "Category";
                ddCategory.DataValueField = "Category";
                ddCategory.DataBind();

                //Add Default Item for Category
                ddCategory.Items.Insert(0, new ListItem("Please Select Category", "-1"));


            }
            else
            {
                Response.Redirect("SessionExpired.aspx");
            }

            FillGrid_SchemeMatrix();
        }
    }

    void FillGrid_SchemeMatrix()
    {
        if ((string)Session["AdminSessionID"] != null)
        {           

            SqlDataAdapter GDA = new SqlDataAdapter(" " +

                    " select Code, Category, Sname from fp_SchemeMatrix order by Category " +                    
                    "  ", Con);

            DataSet GDS = new DataSet();
            Con.Open();
            GDA.Fill(GDS);
            Con.Close();

            GridViewSchemeMatrix.DataSource = GDS;
            GridViewSchemeMatrix.DataBind();
        }
        else
        {
            Response.Redirect("SessionExpired.aspx");
        }
    }

    protected void GridViewSchemeMatrix_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        if ((string)Session["AdminSessionID"] != null)
        {
            string xCode = Session["AdminSessionID"].ToString();

            GridViewRow row = (GridViewRow)GridViewSchemeMatrix.Rows[e.RowIndex];

            Con.Open();
            SqlCommand cmd = new SqlCommand("delete FROM fp_SchemeMatrix where Code='" + Convert.ToInt32(GridViewSchemeMatrix.DataKeys[e.RowIndex].Value.ToString()) + "'", Con);
            cmd.ExecuteNonQuery();
            Con.Close();
            FillGrid_SchemeMatrix();
        }
        else
        {
            Response.Redirect("SessionExpired.aspx");
        }
    }
    protected void SchemeSubmit_click(object sender, EventArgs e)
    {
        if ((string)Session["AdminSessionID"] != null)
        {
            
            string xSchemeCode = ddScheme.SelectedValue;
            string[] FSE = xSchemeCode.Split('$'); 
            string xFCode= FSE[0];
            string xSCode = FSE[1];
            string xExlCode = FSE[2];
            string xSchemeName = ddScheme.SelectedItem.ToString();
            string xCategory = ddCategory.SelectedValue;

            xStr = " Insert into fp_SchemeMatrix(Category,Fcode,SCode,Exlcode,SName,Allocation,Bid) " +
                    " values('" + xCategory + "','" + xFCode + "','" + xSCode + "','" + xExlCode + "', " +
                    " '" + xSchemeName + "', 100, '20037') ";                    
            cmd = new SqlCommand(xStr, Con);
            Con.Open();
            cmd.ExecuteNonQuery();
            Con.Close();
            FillGrid_SchemeMatrix();
                        

        }
        else
        {
            Response.Redirect("SessionExpired.aspx");
        }
    }
    protected void ddCategory_change(object sender, EventArgs e)
    {
        // Code for Scheme Combo

        String xAMC = ddAMC.SelectedValue;
        String xCategory = ddCategory.SelectedValue;
        string xType = "";
        if(xCategory.ToString() !="Debt: Arbitrage")
        {
            xType=" and type='G' ";
        }

        SqlDataAdapter CatgRDA = new SqlDataAdapter(" " +
        
        " select SSCode=[Fcode]+'$'+[Scode]+'$'+cast(Exlcode as varchar) , Sname from schmst "+
        " where Objective='"+xCategory+"' "+
        " and Fcode='" + xAMC + "' and DirPlan='N' "+xType+" and sname not like '%Reinv' and sname not like '%Susp%' order by sname " +
        "  ", mycon);

        DataSet CatgRDS = new DataSet();
        Con.Open();
        CatgRDA.Fill(CatgRDS);
        Con.Close();

        ddScheme.DataSource = CatgRDS;
        ddScheme.DataTextField = "Sname";
        ddScheme.DataValueField = "SSCode";
        ddScheme.DataBind();

        //Add Default Item for Category
        //ddScheme.Items.Insert(0, new ListItem("Please Select Scheme", "-1"));
    }
    protected void ddAMC_change(object sender, EventArgs e)
    {
        ddScheme.Items.Clear();
        ddCategory.ClearSelection();
    }
}