using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Plan_ChangePassword : System.Web.UI.Page
{
    SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnsave_Click(object sender, EventArgs e)
    {
        if ((string)Session["userSessionID"] != null)
        {
            SqlDataAdapter DA = new SqlDataAdapter(" " +
                            " select UserID, OpType1, Risk=isnull(RiskCode,99), ClientStatus, FTimePeriod, FAmount from dbo.fp_Prospects " +
                            " where userid='" + Session["userSessionID"].ToString() + "' and pwd='" + txtOldPassword.Text.Trim() + "'  " +
                //" select * from fp_Prospects where userid='" + eusername.Text + "' and pwd='" + epassword.Text + "' " +
                            "  ", Con);

            DataSet DS = new DataSet();
            Con.Open();
            DA.Fill(DS);
            Con.Close();

            if (DS.Tables[0].Rows.Count > 0)
            {
                SqlDataAdapter DA1 = new SqlDataAdapter(" " +
                            " update dbo.fp_Prospects set pwd='" + txtNewPassword.Text.Trim() + "'" +
                            " where userid='" + Session["userSessionID"].ToString() + "' and pwd='" + txtOldPassword.Text.Trim() + "'  " +
                    //" select * from fp_Prospects where userid='" + eusername.Text + "' and pwd='" + epassword.Text + "' " +
                            "  ", Con);

                DataSet DS1 = new DataSet();
                Con.Open();
                DA1.Fill(DS1);
                Con.Close();


                errormsg.ForeColor = System.Drawing.Color.Green;
                errormsg.Text = "Password Changed Successfully.";
            }
            else {
                errormsg.ForeColor = System.Drawing.Color.Red;
                errormsg.Text = "Invalid Old Password!!";
            }
        }
    }
}