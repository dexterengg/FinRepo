using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class FinAdmin_tickesystem : System.Web.UI.Page
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
        return tsystem.ReportingRoleList(depid, HttpContext.Current.Session["roleid"].ToString(), HttpContext.Current.Session["AdminSessionID"].ToString(),assignuserid);
    }

}