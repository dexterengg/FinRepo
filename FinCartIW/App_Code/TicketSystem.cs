using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;

/// <summary>
/// Summary description for TicketSystem
/// </summary>
public class TicketSystem
{
    SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ToString());
    public TicketSystem()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public int CreateTicket(Ticket tc)
    {
        int res = 0;

        using (SqlCommand cmd = new SqlCommand("fp_SpManageTickets", Con))
        {
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Query", tc.Query);
            cmd.Parameters.AddWithValue("@Attachment", tc.Attachment);
            cmd.Parameters.AddWithValue("@DepId", tc.DepId);
            cmd.Parameters.AddWithValue("@RoleId", tc.RoleId);
            cmd.Parameters.AddWithValue("@CreatorEmail", tc.CreatorEmail);
            cmd.Parameters.AddWithValue("@AssignerRoleId", tc.AssignerRoleId);
            cmd.Parameters.AddWithValue("@AssignToEmail", tc.AssignToEmail);
            cmd.Parameters.AddWithValue("@ReportToEmail", tc.ReportToEmail);
            cmd.Parameters.AddWithValue("@Status", tc.Status);
            cmd.Parameters.AddWithValue("@Priority", tc.Priority);
            cmd.Parameters.AddWithValue("@Action", "INSERT");
            Con.Open();
            res=cmd.ExecuteNonQuery();
        }

        return res;
    }
    public int UpdateTicket(Ticket tc)
    {
        int res = 0;

        using (SqlCommand cmd = new SqlCommand("fp_SpManageTickets", Con))
        {
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Id", tc.Id);
            cmd.Parameters.AddWithValue("@Query", tc.Query);
            cmd.Parameters.AddWithValue("@Attachment", tc.Attachment);
            cmd.Parameters.AddWithValue("@DepId", tc.DepId);
            cmd.Parameters.AddWithValue("@UpdatedByEmail", tc.UpdatedByEmail);
            cmd.Parameters.AddWithValue("@Status", tc.Status);
            cmd.Parameters.AddWithValue("@Priority", tc.Priority);
            cmd.Parameters.AddWithValue("@Action", "UPDATE");
            Con.Open();
            res = cmd.ExecuteNonQuery();
        }

        return res;
    }
    public int ReassignTicket(Ticket tc)
    {
        int res = 0;

        using (SqlCommand cmd = new SqlCommand("fp_SpManageTickets", Con))
        {
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Id", tc.Id);
            cmd.Parameters.AddWithValue("@TicketId", tc.@TicketId);
            cmd.Parameters.AddWithValue("@AssignerRoleId", tc.AssignerRoleId);
            cmd.Parameters.AddWithValue("@AssignToEmail", tc.AssignToEmail);
            cmd.Parameters.AddWithValue("@ReportToEmail", tc.ReportToEmail);
            cmd.Parameters.AddWithValue("@UpdatedByEmail", tc.UpdatedByEmail);
            cmd.Parameters.AddWithValue("@Action", "REASSIGN");
            Con.Open();
            res = cmd.ExecuteNonQuery();
        }

        return res;
    }
    public Ticket SelectTicketByTicketId(string tktid, string creatoremail)
    {
       Ticket tc=new Ticket();
        using (SqlCommand cmd = new SqlCommand("fp_SpManageTickets", Con))
        {
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@TicketId", tktid);
            cmd.Parameters.AddWithValue("@CreatorEmail", creatoremail);
            cmd.Parameters.AddWithValue("@Action", "SELECTBYTICKETID");
            SqlDataAdapter DAticket = new SqlDataAdapter(cmd);
            DataSet DSticket = new DataSet();
            Con.Open();
            DAticket.Fill(DSticket);
            Con.Close();

            if (DSticket.Tables.Count > 0)
            {
                if (DSticket.Tables[0].Rows.Count > 0)
                {
                    tc.Id = Convert.ToInt64(DSticket.Tables[0].Rows[0]["Id"]);
                    tc.TicketId = Convert.ToString(DSticket.Tables[0].Rows[0]["TicketId"]);
                    tc.Query = Convert.ToString(DSticket.Tables[0].Rows[0]["Query"]);
                    tc.Attachment = Convert.ToString(DSticket.Tables[0].Rows[0]["Attachment"]);
                    tc.DepId = Convert.ToString(DSticket.Tables[0].Rows[0]["DepId"]);
                    tc.RoleId = Convert.ToString(DSticket.Tables[0].Rows[0]["RoleId"]);
                    tc.CreatorEmail = Convert.ToString(DSticket.Tables[0].Rows[0]["CreatorEmail"]);
                    tc.AssignerRoleId = Convert.ToString(DSticket.Tables[0].Rows[0]["AssignerRoleId"]);
                    tc.AssignByEmail = Convert.ToString(DSticket.Tables[0].Rows[0]["AssignByEmail"]);
                    tc.AssignToEmail = Convert.ToString(DSticket.Tables[0].Rows[0]["AssignToEmail"]);
                    tc.ReportToEmail = Convert.ToString(DSticket.Tables[0].Rows[0]["ReportToEmail"]);
                    tc.UpdatedByEmail = Convert.ToString(DSticket.Tables[0].Rows[0]["UpdatedByEmail"]);
                    tc.Status = Convert.ToInt32(DSticket.Tables[0].Rows[0]["Status"]);
                    tc.Priority = Convert.ToInt32(DSticket.Tables[0].Rows[0]["Priority"]);
                    tc.OpenDate = Convert.ToString(DSticket.Tables[0].Rows[0]["OpenDate"]);
                    tc.UpdateDate = Convert.ToString(DSticket.Tables[0].Rows[0]["UpdateDate"]);
                }
            }
        }

        return tc;
    }
    public List<Ticket> SelectTicketByEmail(string email)
    {
        List<Ticket> tcList = new List<Ticket>();
        Ticket tc;
        using (SqlCommand cmd = new SqlCommand("fp_SpManageTickets", Con))
        {
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@CreatorEmail", email);
            cmd.Parameters.AddWithValue("@Action", "SELECTBYEMAIL");
            SqlDataAdapter DAticket = new SqlDataAdapter(cmd);
            DataSet DSticket = new DataSet();
            Con.Open();
            DAticket.Fill(DSticket);
            Con.Close();

            if (DSticket.Tables.Count > 0)
            {
                if (DSticket.Tables[0].Rows.Count > 0)
                {
                    foreach (DataRow dr in DSticket.Tables[0].Rows)
                    {
                        tc = new Ticket();
                        tc.Id = Convert.ToInt64(dr["Id"]);
                        tc.TicketId = Convert.ToString(dr["TicketId"]);
                        tc.Query = Convert.ToString(dr["Query"]);
                        tc.Attachment = Convert.ToString(dr["Attachment"]);
                        tc.DepId = Convert.ToString(dr["DepId"]);
                        tc.RoleId = Convert.ToString(dr["RoleId"]);
                        tc.CreatorEmail = Convert.ToString(dr["CreatorEmail"]);
                        tc.AssignerRoleId = Convert.ToString(dr["AssignerRoleId"]);
                        tc.AssignByEmail = Convert.ToString(dr["AssignByEmail"]);
                        tc.AssignToEmail = Convert.ToString(dr["AssignToEmail"]);
                        tc.ReportToEmail = Convert.ToString(dr["ReportToEmail"]);
                        tc.UpdatedByEmail = Convert.ToString(dr["UpdatedByEmail"]);
                        tc.Status = Convert.ToInt32(dr["Status"]);
                        tc.Priority = Convert.ToInt32(dr["Priority"]);
                        tc.OpenDate = Convert.ToString(dr["OpenDate"]);
                        tc.UpdateDate = Convert.ToString(dr["UpdateDate"]);
                        tcList.Add(tc);
                    }
                }
            }
        }

        return tcList;
    }
    public List<Ticket> SelectAllTickets(string email)
    {
        List<Ticket> tcList = new List<Ticket>();
        Ticket tc;
        using (SqlCommand cmd = new SqlCommand("fp_SpManageTickets", Con))
        {
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Action", "SELECTALL");
            SqlDataAdapter DAticket = new SqlDataAdapter(cmd);
            DataSet DSticket = new DataSet();
            Con.Open();
            DAticket.Fill(DSticket);
            Con.Close();

            if (DSticket.Tables.Count > 0)
            {
                if (DSticket.Tables[0].Rows.Count > 0)
                {
                    foreach (DataRow dr in DSticket.Tables[0].Rows)
                    {
                        tc = new Ticket();
                        tc.Id = Convert.ToInt64(dr["Id"]);
                        tc.TicketId = Convert.ToString(dr["TicketId"]);
                        tc.Query = Convert.ToString(dr["Query"]);
                        tc.Attachment = Convert.ToString(dr["Attachment"]);
                        tc.DepId = Convert.ToString(dr["DepId"]);
                        tc.RoleId = Convert.ToString(dr["RoleId"]);
                        tc.CreatorEmail = Convert.ToString(dr["CreatorEmail"]);
                        tc.AssignerRoleId = Convert.ToString(dr["AssignerRoleId"]);
                        tc.AssignByEmail = Convert.ToString(dr["AssignByEmail"]);
                        tc.AssignToEmail = Convert.ToString(dr["AssignToEmail"]);
                        tc.ReportToEmail = Convert.ToString(dr["ReportToEmail"]);
                        tc.UpdatedByEmail = Convert.ToString(dr["UpdatedByEmail"]);
                        tc.Status = Convert.ToInt32(dr["Status"]);
                        tc.Priority = Convert.ToInt32(dr["Priority"]);
                        tc.OpenDate = Convert.ToString(dr["OpenDate"]);
                        tc.UpdateDate = Convert.ToString(dr["UpdateDate"]);
                        tcList.Add(tc);
                    }
                }
            }
        }

        return tcList;
    }
    public List<Department> DepartmentList()
    {
        List<Department> DepList = new List<Department>();
        Department dep;
        using (SqlCommand cmd = new SqlCommand("fp_SpFillDropDown", Con))
        {
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Action", "DEPARTMENT");
            SqlDataAdapter DADep = new SqlDataAdapter(cmd);
            DataSet DSDep = new DataSet();
            Con.Open();
            DADep.Fill(DSDep);
            Con.Close();

            if (DSDep.Tables.Count > 0)
            {
                if (DSDep.Tables[0].Rows.Count > 0)
                {
                    foreach (DataRow dr in DSDep.Tables[0].Rows)
                    {
                        dep = new Department();
                        dep.Id = Convert.ToInt64(dr["Id"]);
                        dep.Code = Convert.ToString(dr["Code"]);
                        dep.Name = Convert.ToString(dr["Name"]);
                        dep.CreatorEmail = Convert.ToString(dr["CreatorEmail"]);
                        dep.Status = Convert.ToString(dr["Status"]);
                        dep.CreatedDate = Convert.ToString(dr["CreatedDate"]);
                        dep.UpdatedDate = Convert.ToString(dr["UpdatedDate"]);
                        DepList.Add(dep);
                    }
                }
            }
        }

        return DepList;
    }
    public List<Role> RoleList(string depid,string roleid)
    {
        List<Role> RList = new List<Role>();
        Role r;
        using (SqlCommand cmd = new SqlCommand("fp_SpFillDropDown", Con))
        {
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@DepId", depid);
            cmd.Parameters.AddWithValue("@RoleId", roleid);
            cmd.Parameters.AddWithValue("@Action", "ROLE");
            SqlDataAdapter DAr = new SqlDataAdapter(cmd);
            DataSet DSr = new DataSet();
            Con.Open();
            DAr.Fill(DSr);
            Con.Close();

            if (DSr.Tables.Count > 0)
            {
                if (DSr.Tables[0].Rows.Count > 0)
                {
                    foreach (DataRow dr in DSr.Tables[0].Rows)
                    {
                        r = new Role();
                        r.Id = Convert.ToInt64(dr["Id"]);
                        r.Code = Convert.ToString(dr["Code"]);
                        r.DepCode = Convert.ToString(dr["DepCode"]);
                        r.RoleName = Convert.ToString(dr["Role"]);
                        r.Level = Convert.ToString(dr["Level"]);
                        r.CreatorEmail = Convert.ToString(dr["CreatorEmail"]);
                        r.Status = Convert.ToString(dr["Status"]);
                        r.CreatedDate = Convert.ToString(dr["CreatedDate"]);
                        r.UpdatedDate = Convert.ToString(dr["UpdatedDate"]);
                        RList.Add(r);
                    }
                }
            }
        }

        return RList;
    }
    public List<Employee> EmployeeList(string roleid,string userid)
    {
        List<Employee> EmpList = new List<Employee>();
        Employee Emp;
        using (SqlCommand cmd = new SqlCommand("fp_SpFillDropDown", Con))
        {
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@UserID", userid);
            cmd.Parameters.AddWithValue("@RoleId", roleid);
            cmd.Parameters.AddWithValue("@Action", "EMPLOYEE");
            SqlDataAdapter DAEmp = new SqlDataAdapter(cmd);
            DataSet DSEmp = new DataSet();
            Con.Open();
            DAEmp.Fill(DSEmp);
            Con.Close();

            if (DSEmp.Tables.Count > 0)
            {
                if (DSEmp.Tables[0].Rows.Count > 0)
                {
                    foreach (DataRow dr in DSEmp.Tables[0].Rows)
                    {
                        Emp = new Employee();
                        Emp.Id = Convert.ToInt64(dr["Id"]);
                        Emp.EmpCode = Convert.ToString(dr["EmpCode"]);
                        Emp.DepId = Convert.ToString(dr["DepId"]);
                        Emp.RoleId = Convert.ToString(dr["RoleId"]);
                        Emp.ReportToEmpCode = Convert.ToString(dr["ReportToEmpCode"]);
                        Emp.ReportToEmail = Convert.ToString(dr["ReportToEmail"]);
                        Emp.Name = Convert.ToString(dr["Name"]);
                        Emp.UserID = Convert.ToString(dr["UserID"]);
                        Emp.Pwd = Convert.ToString(dr["Pwd"]);
                        EmpList.Add(Emp);
                    }
                }
            }
        }

        return EmpList;
    }
    public List<Employee> ReportingRoleList(string depid, string roleid, string userid, string assignuserid)
    {
        List<Employee> EmpList = new List<Employee>();
        Employee Emp;
        using (SqlCommand cmd = new SqlCommand("fp_SpFillDropDown", Con))
        {
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@UserID", userid);
            cmd.Parameters.AddWithValue("@AssignUserID", assignuserid);
            cmd.Parameters.AddWithValue("@DepId", depid);
            cmd.Parameters.AddWithValue("@RoleId", roleid);
            cmd.Parameters.AddWithValue("@Action", "REPORTING");
            SqlDataAdapter DAEmp = new SqlDataAdapter(cmd);
            DataSet DSEmp = new DataSet();
            Con.Open();
            DAEmp.Fill(DSEmp);
            Con.Close();

            if (DSEmp.Tables.Count > 0)
            {
                if (DSEmp.Tables[0].Rows.Count > 0)
                {
                    foreach (DataRow dr in DSEmp.Tables[0].Rows)
                    {
                        Emp = new Employee();
                        Emp.Id = Convert.ToInt64(dr["Id"]);
                        Emp.EmpCode = Convert.ToString(dr["EmpCode"]);
                        Emp.DepId = Convert.ToString(dr["DepId"]);
                        Emp.RoleId = Convert.ToString(dr["RoleId"]);
                        Emp.ReportToEmpCode = Convert.ToString(dr["ReportToEmpCode"]);
                        Emp.ReportToEmail = Convert.ToString(dr["ReportToEmail"]);
                        Emp.Name = Convert.ToString(dr["Name"]);
                        Emp.UserID = Convert.ToString(dr["UserID"]);
                        Emp.Pwd = Convert.ToString(dr["Pwd"]);
                        EmpList.Add(Emp);
                    }
                }
            }
        }

        return EmpList;
    }

}