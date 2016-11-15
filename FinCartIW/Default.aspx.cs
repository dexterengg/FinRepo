using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Redirect("index.aspx");
    }
    protected void searchButton_Click(object sender, ImageClickEventArgs e)
    {
        if ((string)Session["userSessionID"] != null)
        {
            if (DDWorkType.SelectedValue.ToString() == "Plan" && DDWorkList.SelectedValue.ToString() == "Free")
            {
                Response.Redirect("Plan/MyDetails.aspx");
            }

            if (DDWorkType.SelectedValue.ToString() == "Plan" && DDWorkList.SelectedValue.ToString() == "Paid")
            {
                Response.Redirect("#");
            }

            if (DDWorkType.SelectedValue.ToString() == "Transact" && DDWorkList.SelectedValue.ToString() == "Lumpsum")
            {
                Response.Redirect(""); // Like funds india. Plan/Login.aspx
            }

            if (DDWorkType.SelectedValue.ToString() == "Transact" && DDWorkList.SelectedValue.ToString() == "SIP")
            {
                Response.Redirect(""); // Insta SIP. Plan/Login.aspx
            }

            if (DDWorkType.SelectedValue.ToString() == "Transact" && DDWorkList.SelectedValue.ToString() == "Tax")
            {
                Response.Redirect(""); // Tax Planing. Plan/Login.aspx
            }

            if (DDWorkType.SelectedValue.ToString() == "Track" && DDWorkList.SelectedValue.ToString() == "New User")
            {
                Response.Redirect("Plan/MyDashBoard.aspx");
            }

            if (DDWorkType.SelectedValue.ToString() == "Track" && DDWorkList.SelectedValue.ToString() == "Existing User")
            {
                Response.Redirect("http://fincart.my-portfolio.in");
            }
        }
        else
        {
            if (DDWorkType.SelectedValue.ToString() == "Plan" && DDWorkList.SelectedValue.ToString() == "Free")
            {
                Response.Redirect("Plan/Registration.aspx");
            }

            if (DDWorkType.SelectedValue.ToString() == "Plan" && DDWorkList.SelectedValue.ToString() == "Paid")
            {
                Response.Redirect("Services.aspx");
            }

            if (DDWorkType.SelectedValue.ToString() == "Transact" && DDWorkList.SelectedValue.ToString() == "Lumpsum")
            {
                Response.Redirect("Plan/Login.aspx"); // Like funds india.
            }

            if (DDWorkType.SelectedValue.ToString() == "Transact" && DDWorkList.SelectedValue.ToString() == "SIP")
            {
                Response.Redirect("Plan/Login.aspx"); // Insta SIP
            }

            if (DDWorkType.SelectedValue.ToString() == "Transact" && DDWorkList.SelectedValue.ToString() == "Tax")
            {
                Response.Redirect("Plan/Login.aspx"); // Tax Planing
            }

            if (DDWorkType.SelectedValue.ToString() == "Track" && DDWorkList.SelectedValue.ToString() == "New User")
            {
                Response.Redirect("Plan/Registration.aspx");
            }

            if (DDWorkType.SelectedValue.ToString() == "Track" && DDWorkList.SelectedValue.ToString() == "Existing User")
            {
                Response.Redirect("http://fincart.my-portfolio.in");
            }
        }
    }
    protected void DDWorkType_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DDWorkType.SelectedItem.ToString() == "Plan")
        {
            DDWorkList.Items.Clear();          
            DDWorkList.Items.Insert(0, new ListItem("Free", "Free"));
            DDWorkList.Items.Insert(1, new ListItem("Paid", "Paid"));
        }

        if (DDWorkType.SelectedItem.ToString() == "Transact")
        {
            DDWorkList.Items.Clear();
            DDWorkList.Items.Insert(0, new ListItem("Lumpsum", "Lumpsum"));
            DDWorkList.Items.Insert(0, new ListItem("Monthly ( SIP)", "SIP"));
            DDWorkList.Items.Insert(1, new ListItem("Tax Saving", "Tax"));
        }

        if (DDWorkType.SelectedItem.ToString() == "Track")
        {
            DDWorkList.Items.Clear();
            DDWorkList.Items.Insert(0, new ListItem("New User", "New User"));
            DDWorkList.Items.Insert(0, new ListItem("Existing User", "Existing User"));  
        }
    }
}