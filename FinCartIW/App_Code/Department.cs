using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Department
/// </summary>
public class Department
{
	public Department()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public Int64 Id { get; set; }
    public string Code { get; set; }
    public string Name { get; set; }
    public string CreatorEmail { get; set; }
    public string Status { get; set; }
    public string CreatedDate { get; set; }
    public string UpdatedDate { get; set; }
}