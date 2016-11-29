using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Role
/// </summary>
public class Role
{
	public Role()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public Int64 Id { get; set; }
    public string Code { get; set; }
    public string DepCode { get; set; }
    public string RoleName { get; set; }
    public string Level { get; set; }
    public string CreatorEmail { get; set; }
    public string Status { get; set; }
    public string CreatedDate { get; set; }
    public string UpdatedDate { get; set; }
}