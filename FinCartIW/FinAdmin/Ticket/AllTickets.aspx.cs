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
            if (!IsPostBack)
            {
                bindTickets("R");
            }
        }
        else
        {
            Response.Redirect("/FinAdmin/");
        }

    }

    void bindTickets(string gridfor)
    {
        if (gridfor == "R")
        {
            TicketsRepeater.DataSource = tsystem.SelectTicketByReportingEmail(Session["AdminSessionID"].ToString());
            TicketsRepeater.DataBind();
        }
        else
        {
            TicketsRepeater.DataSource = tsystem.SelectTicketByAssigneeEmail(Session["AdminSessionID"].ToString());
            TicketsRepeater.DataBind();
        }
        
    }

    protected void TicketsRepeater_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "D")
        {
            int id = tsystem.DeleteTicket(e.CommandArgument.ToString());
            bindTickets("R");
        }
    }
}