using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
public partial class FinAdmin_index : System.Web.UI.Page
{
    
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public class userauthentication
    {
        public string name { get; set; }
        public string error { get; set; }

        public string page { get; set; }
    }

    [WebMethod]
    public static object Authenticate(string username, string password)
    {
        userauthentication userauthentication = new userauthentication();
 
        if (!String.IsNullOrWhiteSpace(username) && !String.IsNullOrWhiteSpace(password))
        {
            SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ToString());

            string query = "Select PlannerName, Code, UserID, PRole=(select Name from fp_ComboDetail where Code=p.PlannerRole) from fp_planner p " +
                    " where userid='" + username + "' and Pwd='" + password + "' ";

            SqlDataAdapter DA = new SqlDataAdapter(query, Con);

            DataSet DS = new DataSet();
            Con.Open();
            DA.Fill(DS);
            Con.Close();

            if (DS.Tables[0].Rows.Count > 0)
            {
                //Redirection to parent page
                HttpContext.Current.Session["AdminSessionID"] = DS.Tables[0].Rows[0]["UserId"].ToString();
                HttpContext.Current.Session["AdminSessionCode"] = DS.Tables[0].Rows[0]["Code"].ToString();
                HttpContext.Current.Session["LoginRole"] = DS.Tables[0].Rows[0]["PRole"].ToString();

                string xUserRole = DS.Tables[0].Rows[0]["PRole"].ToString();

                switch (xUserRole)
                {
                    case "Admin":
                        userauthentication.name = DS.Tables[0].Rows[0]["PlannerName"].ToString();
                        userauthentication.error = "";
                        userauthentication.page = "AdminDB.aspx";
                        break;
                    case "Operator":
                        userauthentication.name = DS.Tables[0].Rows[0]["PlannerName"].ToString();
                        userauthentication.error = "";
                        userauthentication.page = "OperatorLMS.aspx";
                        break;
                    case "Planner":
                        userauthentication.name = DS.Tables[0].Rows[0]["PlannerName"].ToString();
                        userauthentication.error = "";
                        userauthentication.page = "PlannerLMS.aspx";
                        break;
                    case "BDM":
                        userauthentication.name = DS.Tables[0].Rows[0]["PlannerName"].ToString();
                        userauthentication.error = "";
                        userauthentication.page = "PlannerLMS.aspx";
                        break;
                    case "Management":
                        userauthentication.name = DS.Tables[0].Rows[0]["PlannerName"].ToString();
                        userauthentication.error = "";
                        userauthentication.page = "PlannerLMS.aspx";
                        break;
                    default:
                        userauthentication.name = "";
                        userauthentication.error = "Invalid Username or Password";
                        userauthentication.page = "";
                        break;
                }

            }
            else
            {
                userauthentication.name = "";
                userauthentication.error = "Invalid Username or Password";
                userauthentication.page = "";
            }
        }
        else
        {
            userauthentication.name = "";
            userauthentication.error = "Please Enter Login Credentials";
            userauthentication.page = "";
        }

        return  userauthentication;
    }
}