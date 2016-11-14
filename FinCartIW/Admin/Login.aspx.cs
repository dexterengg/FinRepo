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

public partial class Admin_Login : System.Web.UI.Page
{
    SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ToString());
    string xStr = "";
    SqlCommand cmd;

    protected void Page_Load(object sender, EventArgs e)
    {

    }    
    protected void AdminLoginSumbit_click(object sender, EventArgs e)
    {
        if (txtAdminUserName.Text != "" && txtAdminPassword.Text != "")
        {
            SqlDataAdapter DA = new SqlDataAdapter(" " +
                    
                    //" select UserId, PRole='A' from fp_Prospects "+
                    //" where userid='" + txtAdminUserName.Text + "' and pwd='" + txtAdminPassword.Text + "'  and Category='A' " +
                    //" union All "+
                    //" Select UserID, PRole=(select Name from fp_ComboDetail where Code=p.PlannerRole) from fp_planner p "+
                    //" where userid='" + txtAdminUserName.Text + "' and Pwd='" + txtAdminPassword.Text + "' " +
                    //"  ", Con);
                    
                    " Select Code, UserID, PRole=(select Name from fp_ComboDetail where Code=p.PlannerRole) from fp_planner p " +
                    " where userid='" + txtAdminUserName.Text + "' and Pwd='" + txtAdminPassword.Text + "' " +
                    "  ", Con);

            DataSet DS = new DataSet();
            Con.Open();
            DA.Fill(DS);
            Con.Close();

            if (DS.Tables[0].Rows.Count > 0)
            {                
                //Redirection to parent page
                Session["AdminSessionID"] = DS.Tables[0].Rows[0]["UserId"].ToString();
                Session["AdminSessionCode"] = DS.Tables[0].Rows[0]["Code"].ToString();
                Session["LoginRole"] = DS.Tables[0].Rows[0]["PRole"].ToString();

                string xUserRole = DS.Tables[0].Rows[0]["PRole"].ToString();

                    switch (xUserRole)
                    {
                        case "Admin":
                            Response.Redirect("AdminDB.aspx");                            
                            break;                            
                        case "Operator":                                
                            Response.Redirect("OperatorLMS.aspx");                            
                            break;
                        case "Planner":   
                            Response.Redirect("PlannerLMS.aspx");                            
                            break;
                        case "BDM":
                            Response.Redirect("PlannerLMS.aspx");
                            break;
                        case "Management":
                            Response.Redirect("PlannerLMS.aspx");
                            break;
                        default :                        
                            lblInvalidCredentials.Text = " Invalid Username or Password ";
                            break;                        
                    }
                
            }
            else
            {

                lblInvalidCredentials.Text = " Invalid Username or Password ";
            }
        }


    }
}