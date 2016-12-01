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

public partial class RegistrationLink : System.Web.UI.Page
{
    SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ToString());
    string xStr = "";
    SqlCommand cmd;
    string xCurrentUK = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        xCurrentUK = Request.QueryString["UserKey"].ToString();

        SqlDataAdapter DA = new SqlDataAdapter(" " +

                " select * from fp_Prospects where userkey='" + xCurrentUK + "' " +
                "  ", Con);

        DataSet DS = new DataSet();
        Con.Open();
        DA.Fill(DS);
        Con.Close();

        username.Text = DS.Tables[0].Rows[0]["userid"].ToString();

        if (DS.Tables[0].Rows.Count == 0)
        {
            Response.Redirect("RegistrationExpired.aspx");
        }

    }
    protected void RegisterLavel1_Click(object sender, EventArgs e)
    {
        xStr = "update fp_Prospects set UserID='" + username.Text + "', Pwd='" + upassword.Text + "',  UserKey=newid() where UserKey='" + xCurrentUK + "'";
        cmd = new SqlCommand(xStr, Con);
        Con.Open();
        cmd.ExecuteNonQuery();
        Con.Close();
        Session["userSessionID"] = username.Text ;
        Response.Redirect("MyDetails.aspx?Risk=A");
    }
}