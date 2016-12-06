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
        if (!IsPostBack)
        {
            bindTickets();
        }

    }

    [WebMethod]
    public static List<Ticket> GetTickets()
    {
        TicketSystem tsystem = new TicketSystem();
        return tsystem.SelectTicketByEmail(HttpContext.Current.Session["AdminSessionID"].ToString());
    }

    void bindTickets()
    {
        TicketsRepeater.DataSource = tsystem.SelectTicketByEmail(HttpContext.Current.Session["AdminSessionID"].ToString());
        TicketsRepeater.DataBind();
    }
    protected void OnPaging(object sender, GridViewPageEventArgs e)
    {
        //TicketsRepeater.PageIndex = e.NewPageIndex;
        //TicketsRepeater.DataBind();
    }
    protected void TicketsRepeater_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "D")
        {
            int id = tsystem.DeleteTicket(e.CommandArgument.ToString());
            bindTickets();
        }
    }
}