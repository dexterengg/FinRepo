using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Ticket
/// </summary>
public class Ticket
{
	public Ticket()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public Int64 Id { get; set; }
    public string TicketId { get; set; }
    public string Query { get; set; }
    public string Attachment { get; set; }
    public string DepId { get; set; }
    public string RoleId { get; set; }
    public string CreatorEmail { get; set; }
    public string AssignerRoleId { get; set; }
    public string AssignByEmail { get; set; }
    public string AssignToEmail { get; set; }
    public string ReportToEmail { get; set; }
    public string UpdatedByEmail { get; set; }
    public int Status { get; set; }
    public int Priority { get; set; }
    public string OpenDate { get; set; }
    public string UpdateDate { get; set; }
}