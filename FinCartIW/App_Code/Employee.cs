using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Employee
/// </summary>
public class Employee
{
	public Employee()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public Int64 Id { get; set; }
    public string EmpCode { get; set; }
    public string DepId { get; set; }
    public string RoleId { get; set; }
    public string ReportToEmpCode { get; set; }
    public string ReportToEmail { get; set; }
    public string Name { get; set; }
    public string UserID { get; set; }
    public string Pwd { get; set; }
    public string Address { get; set; }
    public string City { get; set; }
    public string Pin { get; set; }
    public string State { get; set; }
    public string Country { get; set; }
    public string Phone { get; set; }
    public string EmergencyPhone { get; set; }
    public string OfficeEmail { get; set; }
    public string PersonalEmail { get; set; }
    public string DOB { get; set; }
    public string DOJ { get; set; }
    public string DOR { get; set; }
    public string Salary { get; set; }
    public string BloodGroup { get; set; }
    public string CreatedDate { get; set; }
    public string UpdatedDate { get; set; }
    public string UpdatedByEmail { get; set; }
    public string Status { get; set; }
}