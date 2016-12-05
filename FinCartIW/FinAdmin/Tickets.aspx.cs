using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class FinAdmin_Tickets : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //filldepartment();
        }

    }

    [WebMethod]
    public static List<Department> GetDepartments()
    {
        TicketSystem tsystem = new TicketSystem();
        return tsystem.DepartmentList();
    }

    [WebMethod]
    public static List<Role> GetRoles(string depid)
    {
        TicketSystem tsystem = new TicketSystem();
        return tsystem.RoleList(depid, HttpContext.Current.Session["roleid"].ToString());
    }

    [WebMethod]
    public static List<Employee> GetAssignTo(string roleid)
    {
        TicketSystem tsystem = new TicketSystem();
        return tsystem.EmployeeList(roleid, HttpContext.Current.Session["AdminSessionID"].ToString());
    }

    [WebMethod]
    public static List<Employee> GetReportTo(string depid, string assignuserid)
    {
        TicketSystem tsystem = new TicketSystem();
        return tsystem.ReportingRoleList(depid, HttpContext.Current.Session["roleid"].ToString(), HttpContext.Current.Session["AdminSessionID"].ToString(), assignuserid);
    }

    [WebMethod]
    public static string addticket(string qry, string depid,string roleid,string assigntoemail,string reporttoemail,string status,string priority,string attachfile)
    {
        TicketSystem tsystem = new TicketSystem();
        Ticket tc = new Ticket();
        tc.Query = qry.Trim();
        tc.Attachment = attachfile;
        tc.DepId = depid.Trim();
        tc.RoleId = roleid.Trim();
        tc.CreatorEmail = HttpContext.Current.Session["AdminSessionID"].ToString();
        tc.AssignerRoleId = HttpContext.Current.Session["roleid"].ToString();
        tc.AssignToEmail = assigntoemail.Trim();
        tc.ReportToEmail = reporttoemail.Trim();
        tc.Status = Convert.ToInt32(status.Trim());
        tc.Priority = Convert.ToInt32(priority.Trim());
        int i = tsystem.CreateTicket(tc);

        return i>0?"y":"n";
    }

}