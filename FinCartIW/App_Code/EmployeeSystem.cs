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
/// Summary description for EmployeeSystem
/// </summary>
public class EmployeeSystem
{
    SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ToString());
	public EmployeeSystem()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public Employee EmployeeDetails(string email)
    {
        Employee Emp = new Employee();
        using (SqlCommand cmd = new SqlCommand("fp_SpEmployee", Con))
        {
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@UserID", email);
            cmd.Parameters.AddWithValue("@Action", "EMPLOYEEBYEMAIL");
            SqlDataAdapter DAEmp = new SqlDataAdapter(cmd);
            DataSet DSEmp = new DataSet();
            Con.Open();
            DAEmp.Fill(DSEmp);
            Con.Close();

            if (DSEmp.Tables.Count > 0)
            {
                if (DSEmp.Tables[0].Rows.Count > 0)
                {
                        Emp.Id = Convert.ToInt64(DSEmp.Tables[0].Rows[0]["Id"]);
                        Emp.EmpCode = Convert.ToString(DSEmp.Tables[0].Rows[0]["EmpCode"]);
                        Emp.DepId = Convert.ToString(DSEmp.Tables[0].Rows[0]["DepId"]);
                        Emp.RoleId = Convert.ToString(DSEmp.Tables[0].Rows[0]["RoleId"]);
                        Emp.ReportToEmpCode = Convert.ToString(DSEmp.Tables[0].Rows[0]["ReportToEmpCode"]);
                        Emp.ReportToEmail = Convert.ToString(DSEmp.Tables[0].Rows[0]["ReportToEmail"]);
                        Emp.Name = Convert.ToString(DSEmp.Tables[0].Rows[0]["Name"]);
                        Emp.UserID = Convert.ToString(DSEmp.Tables[0].Rows[0]["UserID"]);
                        Emp.Pwd = Convert.ToString(DSEmp.Tables[0].Rows[0]["Pwd"]);
                }
            }
        }

        return Emp;
    }
}