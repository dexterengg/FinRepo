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
                bindTickets("A");
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

    protected void TicketsRepeater_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "D")
        {
            int id = tsystem.DeleteTicket(e.CommandArgument.ToString());
            bindTickets("R");
        }
    }
    protected void ALinkButton_Click(object sender, EventArgs e)
    {
        bindTickets("A");
    }
    protected void RLinkButton_Click(object sender, EventArgs e)
    {
        bindTickets("R");
    }
}