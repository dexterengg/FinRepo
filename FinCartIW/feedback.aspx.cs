using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using System.IO;
using System.Net;
using System.Net.Mail;

public partial class website_feedback : System.Web.UI.Page
{
    SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ToString());
    string xStr = "";
    SqlCommand cmd;

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ExperienceButton_Click(object sender, EventArgs e)
    {
        SqlDataAdapter DA = new SqlDataAdapter(" " +

                        " insert into fp_Feedback(FName,FTitle,FDescription,FEmail,QueryType,EntryDate) " +
                        " values('" + txtExperienceName.Text + "','" + txtExperienceTitle.Text + "','" + txtExperienceDescription.Value + "', "+
                        " '" + txtExperienceEmail.Text + "','Feedback', " +
                        " '" + Convert.ToDateTime(System.DateTime.Now).ToString("yyyy-MM-dd") + "') " +
                        "  ", Con);

        DataSet DS = new DataSet();

        Con.Open();
        DA.Fill(DS);
        Con.Close();

        lblExperienceSuccess.Visible = true;
        lblExperienceSuccess.Text = " Feedback Posted Successfully! Thank You";

        //if (lblExperienceSuccess.Visible == true)
        //{
        //    string xSMTPDeafult = "smtp.falconide.com";
        //    string xUIDDeafult = "investwell";
        //    string xPassDeafult = "Iwell@321";
        //    string xSSLDeafult = "yes";
        //    int xPortDeafult = 587;

        //    string xName = txtExperienceName.Text;
        //    string xTitle = txtExperienceTitle.Text;
        //    string xDesc = txtExperienceDescription.Value;
        //    string xEmailFrom = txtExperienceEmail.Text;
        //    string xEmail = "rajiv.gogoi@fincart.com";
        //    //string xEmail = txtEmail.Text;

        //    MailMessage mm = new MailMessage(xName + "<noreply@investwellonline.com>", xEmail);
        //    NetworkCredential basicCredential = new NetworkCredential(xUIDDeafult, xPassDeafult);
        //    mm.Subject = "Feedback from website www.fincart.com";

        //    string mmbody = "";

        //    mmbody += "<html>";
        //    mmbody += "<body>";
        //    mmbody += "<table cellspacing='1' cellpadding='5' width='400px' border='1' >";
        //    mmbody += "<tr>";
        //    mmbody += "<td colspan='2'><h1>Feedback post by user below</h1></td>";
        //    mmbody += "</tr>";
        //    mmbody += "<tr>";
        //    mmbody += "<td colspan='2'>&nbsp;</td>";
        //    mmbody += "</tr>";
        //    mmbody += "<tr>";
        //    mmbody += "<td>Name</td>";
        //    mmbody += "<td>" + xName + "</td>";
        //    mmbody += "</tr>";
        //    mmbody += "<tr>";
        //    mmbody += "<td>Email ID</td>";
        //    mmbody += "<td>" + xEmailFrom + "</td>";
        //    mmbody += "</tr>";
        //    mmbody += "<tr>";
        //    mmbody += "<td>Title</td>";
        //    mmbody += "<td>" + xTitle + "</td>";
        //    mmbody += "</tr>";
        //    mmbody += "<tr>";
        //    mmbody += "<td>Description</td>";
        //    mmbody += "<td>" + xDesc + "</td>";
        //    mmbody += "</tr>";
        //    mmbody += "<tr>";
        //    mmbody += "<td colspan='2'>&nbsp;</td>";
        //    mmbody += "</tr>";
        //    mmbody += "</table>";
        //    mmbody += "</body>";
        //    mmbody += "</html>";

        //    mm.Body = mmbody;

        //    mm.IsBodyHtml = true;

        //    SmtpClient smtp = new SmtpClient();
        //    if (xSSLDeafult.ToUpper() == "YES")
        //        smtp.EnableSsl = true;
        //    else
        //        smtp.EnableSsl = false;

        //    smtp.Port = xPortDeafult;

        //    smtp.Host = xSMTPDeafult;
        //    smtp.UseDefaultCredentials = false;
        //    smtp.Credentials = basicCredential;

        //    smtp.Send(mm);
        //}

    }
    protected void IdeaSubmit_Click(object sender, EventArgs e)
    {
        SqlDataAdapter DA = new SqlDataAdapter(" " +

                        " insert into fp_Feedback(FName,FTitle,FDescription,FEmail,QueryType,EntryDate) " +
                        " values('" + txtIdeaName.Text + "','" + txtIdeaTitle.Text + "','" + txtIdeaDescription.Value + "', " +
                        " '" + txtIdeaEmail.Text + "','Idea', " +
                        " '" + Convert.ToDateTime(System.DateTime.Now).ToString("yyyy-MM-dd") + "') " +
                        "  ", Con);

        DataSet DS = new DataSet();

        Con.Open();
        DA.Fill(DS);
        Con.Close();

        //string xSMTPDeafult = "smtp.falconide.com";
        //string xUIDDeafult = "investwell";
        //string xPassDeafult = "Iwell@321";
        //string xSSLDeafult = "yes";
        //int xPortDeafult = 587;

        //string xName = txtIdeaName.Text;
        //string xTitle = txtIdeaTitle.Text;
        //string xDesc = txtIdeaDescription.Value;
        //string xEmailFrom = txtIdeaEmail.Text;
        //string xEmail = "rajiv.gogoi@fincart.com";
        ////string xEmail = txtEmail.Text;

        //MailMessage mm = new MailMessage(xName + "<noreply@investwellonline.com>", xEmail);
        //NetworkCredential basicCredential = new NetworkCredential(xUIDDeafult, xPassDeafult);
        //mm.Subject = "Idea Posted from website www.fincart.com";

        //string mmbody = "";

        //mmbody += "<html>";
        //mmbody += "<body>";
        //mmbody += "<table cellspacing='1' cellpadding='5' width='400px' border='1' >";
        //mmbody += "<tr>";
        //mmbody += "<td colspan='2'><h1>Idea post by user below</h1></td>";
        //mmbody += "</tr>";
        //mmbody += "<tr>";
        //mmbody += "<td colspan='2'>&nbsp;</td>";
        //mmbody += "</tr>";
        //mmbody += "<tr>";
        //mmbody += "<td>Name</td>";
        //mmbody += "<td>" + xName + "</td>";
        //mmbody += "</tr>";
        //mmbody += "<tr>";
        //mmbody += "<td>Email ID</td>";
        //mmbody += "<td>" + xEmail + "</td>";
        //mmbody += "</tr>";
        //mmbody += "<tr>";
        //mmbody += "<td>Title</td>";
        //mmbody += "<td>" + xTitle + "</td>";
        //mmbody += "</tr>";
        //mmbody += "<tr>";
        //mmbody += "<td>Description</td>";
        //mmbody += "<td>" + xDesc + "</td>";
        //mmbody += "</tr>";
        //mmbody += "<tr>";
        //mmbody += "<td colspan='2'>&nbsp;</td>";
        //mmbody += "</tr>";
        //mmbody += "</table>";
        //mmbody += "</body>";
        //mmbody += "</html>";

        //mm.Body = mmbody;

        //mm.IsBodyHtml = true;

        //SmtpClient smtp = new SmtpClient();
        //if (xSSLDeafult.ToUpper() == "YES")
        //    smtp.EnableSsl = true;
        //else
        //    smtp.EnableSsl = false;

        //smtp.Port = xPortDeafult;

        //smtp.Host = xSMTPDeafult;
        //smtp.UseDefaultCredentials = false;
        //smtp.Credentials = basicCredential;

        //smtp.Send(mm);

        lblIdeaSuccess.Visible = true;
        lblIdeaSuccess.Text = " Idea Posted Successfully! Thank You";

    }
    protected void BugSubmit_Click(object sender, EventArgs e)
    {
        SqlDataAdapter DA = new SqlDataAdapter(" " +

                        " insert into fp_Feedback(FName,FTitle,FDescription,FEmail,QueryType,EntryDate) " +
                        " values('" + txtBugName.Text + "','" + txtBugTitle.Text + "','" + txtBugDescription.Value + "', " +
                        " '" + txtBugEmail.Text + "','Bug', " +
                        " '" + Convert.ToDateTime(System.DateTime.Now).ToString("yyyy-MM-dd") + "') " +
                        "  ", Con);

        DataSet DS = new DataSet();

        Con.Open();
        DA.Fill(DS);
        Con.Close();

        //string xSMTPDeafult = "smtp.falconide.com";
        //string xUIDDeafult = "investwell";
        //string xPassDeafult = "Iwell@321";
        //string xSSLDeafult = "yes";
        //int xPortDeafult = 587;

        //string xName = txtBugName.Text;
        //string xTitle = txtBugTitle.Text;
        //string xDesc = txtBugDescription.Value;
        //string xEmailFrom = txtBugEmail.Text;
        //string xEmail = "rajiv.gogoi@fincart.com";
        ////string xEmail = txtEmail.Text;

        //MailMessage mm = new MailMessage(xName + "<noreply@investwellonline.com>", xEmail);
        //NetworkCredential basicCredential = new NetworkCredential(xUIDDeafult, xPassDeafult);
        //mm.Subject = "Bug Posted from website www.fincart.com";

        //string mmbody = "";

        //mmbody += "<html>";
        //mmbody += "<body>";
        //mmbody += "<table cellspacing='1' cellpadding='5' width='400px' border='1' >";
        //mmbody += "<tr>";
        //mmbody += "<td colspan='2'><h1>Bug post by user below</h1></td>";
        //mmbody += "</tr>";
        //mmbody += "<tr>";
        //mmbody += "<td colspan='2'>&nbsp;</td>";
        //mmbody += "</tr>";
        //mmbody += "<tr>";
        //mmbody += "<td>Name</td>";
        //mmbody += "<td>" + xName + "</td>";
        //mmbody += "</tr>";
        //mmbody += "<tr>";
        //mmbody += "<td>Email ID</td>";
        //mmbody += "<td>" + xEmail + "</td>";
        //mmbody += "</tr>";
        //mmbody += "<tr>";
        //mmbody += "<td>Title</td>";
        //mmbody += "<td>" + xTitle + "</td>";
        //mmbody += "</tr>";
        //mmbody += "<tr>";
        //mmbody += "<td>Description</td>";
        //mmbody += "<td>" + xDesc + "</td>";
        //mmbody += "</tr>";
        //mmbody += "<tr>";
        //mmbody += "<td colspan='2'>&nbsp;</td>";
        //mmbody += "</tr>";
        //mmbody += "</table>";
        //mmbody += "</body>";
        //mmbody += "</html>";

        //mm.Body = mmbody;

        //mm.IsBodyHtml = true;

        //SmtpClient smtp = new SmtpClient();
        //if (xSSLDeafult.ToUpper() == "YES")
        //    smtp.EnableSsl = true;
        //else
        //    smtp.EnableSsl = false;

        //smtp.Port = xPortDeafult;

        //smtp.Host = xSMTPDeafult;
        //smtp.UseDefaultCredentials = false;
        //smtp.Credentials = basicCredential;

        //smtp.Send(mm);

        lblBugSuccess.Visible = true;
        lblBugSuccess.Text = " Problem Posted Successfully! Thank You";
    }
}