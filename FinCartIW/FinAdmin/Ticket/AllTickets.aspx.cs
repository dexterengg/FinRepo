using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class FinAdmin_Ticket_AllTickets : System.Web.UI.Page
{
    TicketSystem tsystem = new TicketSystem();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["AdminSessionID"] != null)
        {
            if (Session["grid"]==null)
            {
                Session["grid"]="A";
            }
            bindTickets();
        }
        else
        {
            Response.Redirect("/FinAdmin/");
        }

    }

    void bindTickets()
    {
        string gridfor = Convert.ToString(Session["grid"]);
        if (gridfor == "R")
        {
            lbltickets.Text = "Tickets Report To Me";
            tableReport.Visible = true;
            tableAssign.Visible = false;
        }
        else
        {
            lbltickets.Text = "Tickets Assign To Me";
            tableReport.Visible = false;
            tableAssign.Visible = true;

        }
        ReportTicketsRepeater.DataSource = tsystem.SelectTicketByReportingEmail(Session["AdminSessionID"].ToString());
        ReportTicketsRepeater.DataBind();
        AssignTicketsRepeater.DataSource = tsystem.SelectTicketByAssigneeEmail(Session["AdminSessionID"].ToString());
        AssignTicketsRepeater.DataBind();        
    }
    
    [WebMethod]
    public static string deleteTicket(string tid)
    {
        TicketSystem tsystem = new TicketSystem();
        int i = tsystem.DeleteTicket(tid);
        return i > 0 ? "y" : "n";
    }
    protected void ALinkButton_Click(object sender, EventArgs e)
    {
        Session["grid"] = "A";
        bindTickets();
    }
    protected void RLinkButton_Click(object sender, EventArgs e)
    {
        Session["grid"] = "R";
        bindTickets();
    }

    [WebMethod]
    public static Ticket GetTicketDetails(string tid,string creatoremail)
    {
        TicketSystem tsystem = new TicketSystem();
        return tsystem.SelectTicketByTicketId(tid,creatoremail);
    }

    [WebMethod]
    public static string updateticket(string id, string sub, string tat, string qry, string status, string priority, string attachfile)
    {
        TicketSystem tsystem = new TicketSystem();
        Ticket tc = new Ticket();
        tc.Id = Convert.ToInt64(id.Trim());
        tc.Subject = sub.Trim();
        tc.Tat = tat.Trim();
        tc.Query = qry.Trim();
        tc.Attachment = attachfile;
        tc.UpdatedByEmail = HttpContext.Current.Session["AdminSessionID"].ToString();
        tc.Status = Convert.ToInt32(status.Trim());
        tc.Priority = Convert.ToInt32(priority.Trim());
        int i = tsystem.UpdateTicket(tc);

        return i > 0 ? "y" : "n";
    }
}