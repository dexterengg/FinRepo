using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class FinAdmin_MasterPage : System.Web.UI.MasterPage
{
    EmployeeSystem es = new EmployeeSystem();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["AdminSessionID"] != null)
        {
            if (!IsPostBack)
            {
                Employee emp = new Employee();
                emp = es.EmployeeDetails(Session["AdminSessionID"].ToString());
                lblEmpEmail.Text = emp.UserID;
                lblEmpName.Text = emp.Name;
            }
        }
        else
        {
            Response.Redirect("/FinAdmin/");
        }
    }
    protected void LinkButton_oldDashboard_Click(object sender, EventArgs e)
    {

        string xUserRole = Session["LoginRole"].ToString();

        switch (xUserRole)
        {
            case "Admin":
                Response.Redirect("/Admin/AdminDB.aspx");
                break;
            case "Operator":
                Response.Redirect("/Admin/OperatorLMS.aspx");
                break;
            case "Planner":
                Response.Redirect("/Admin/PlannerLMS.aspx");
                break;
            case "BDM":
                Response.Redirect("/Admin/PlannerLMS.aspx");
                break;
            case "Management":
                Response.Redirect("/Admin/PlannerLMS.aspx");
                break;
            default:
                Response.Redirect("/FinAdmin/");
                break;
        }
    }
}
