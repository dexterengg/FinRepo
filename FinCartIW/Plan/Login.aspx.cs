using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using System.IO;
using System.Drawing;
using System.Net;
using System.Net.Mail;

public partial class Login : System.Web.UI.Page
{
    SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ToString());
    string xStr = "";
    SqlCommand cmd;
    string xAcType = "";
    string xRisk = "";
    string xCS = "";
    string xAmount = "";
    string xPeriod = "";
    string xScore = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        eusername.Focus();
        if (!IsPostBack)
        {
            forgotpswd.Visible = false;
        }
        
    }
    protected void LoginButton_Click(object sender, EventArgs e)
    {
        //bool isValid = ucCaptcha.Validate(txtCaptcha.Text.Trim());
        //if (isValid)
        //{
            if (eusername.Text != "" && epassword.Text != "")
            {
                SqlDataAdapter DA = new SqlDataAdapter(" " +
                        " select UserID, OpType1, Risk=isnull(RiskCode,99), ClientStatus, FTimePeriod, FAmount from dbo.fp_Prospects " +
                        " where userid='" + eusername.Text + "' and pwd='" + epassword.Text + "'  " +
                        //" select * from fp_Prospects where userid='" + eusername.Text + "' and pwd='" + epassword.Text + "' " +
                        "  ", Con);

                DataSet DS = new DataSet();
                Con.Open();
                DA.Fill(DS);
                Con.Close();

                if (DS.Tables[0].Rows.Count > 0)
                {

                    //Redirection to parent page
                    Session["userSessionID"] = DS.Tables[0].Rows[0]["UserId"].ToString();
                    xAcType = DS.Tables[0].Rows[0]["OpType1"].ToString();
                    xRisk = DS.Tables[0].Rows[0]["Risk"].ToString();
                    xCS = DS.Tables[0].Rows[0]["ClientStatus"].ToString();
                    xAmount = DS.Tables[0].Rows[0]["FAmount"].ToString();
                    xPeriod = DS.Tables[0].Rows[0]["FTimePeriod"].ToString();

                    if (xRisk == "2")
                    { 
                        xScore="12";
                    }
                    if (xRisk == "3")
                    {
                        xScore="20";
                    }
                    if (xRisk == "4")
                    {
                        xScore = "30";
                    }

                    if (xAcType == "Paid")
                    {
                        Response.Redirect("MyDetails.aspx?Risk=A");
                    }
                    else if (xCS == "T")
                    {
                        Response.Redirect("https://invest.fincart.com/index.jsp?email=" + eusername.Text + "&pswd=" + epassword.Text + "");
                    }
                    else if (xRisk == "99")
                    {
                        Response.Redirect("MyDetails.aspx?Risk=A");
                    }
                    else if (xCS == "S")
                    {
                        //amt=84000&score=17.5&invage=1&risk=2.5
                        Response.Redirect("instaSIP-plan.aspx?amt=" + xAmount + "&score=" + xScore + "&invage=" + xPeriod + "&LoginType=FFF");
                    }
                    else if (xCS == "F")
                    {
                        Response.Redirect("https://invest.fincart.com/index.jsp?email=" + eusername.Text + "&pswd=" + epassword.Text + "");
                    }                    
                    else if (xAcType == "Free" && xCS == "O")
                    {
                        Response.Redirect("MyDetails.aspx?Risk=A");
                    }
                    else {
                        Response.Redirect("MyDetails.aspx?Risk=A");
                        //Response.Redirect("MyDashboard.aspx?Risk=A");
                    }

                    
                }
                else
                {

                    lblInvalidCredentials.Text = " Invalid Username or Password ";
                }
            }
        //}
        //else
        //{
        //    lblMessage.Text = "Invalid!";
        //    lblMessage.ForeColor = Color.Red;
        //}
    }

    protected void forgetButton_Click(object sender, EventArgs e)
    {
        string xEmail = txtEmailID.Text;

        SqlDataAdapter DA = new SqlDataAdapter(" select * from fp_Prospects where userid='" + xEmail + "'", Con);

        DataSet DS = new DataSet();
        Con.Open();
        DA.Fill(DS);
        Con.Close();

        if (DS.Tables[0].Rows.Count > 0)
        {

            string xSMTPDeafult = "smtp.gmail.com";
            string xUIDDeafult = "noreply@investwellonline.com";
            string xPassDeafult = "reply@no1";
            string xSSLDeafult = "yes";
            int xPortDeafult = 587;
            string fpLinkDefault = "https://www.fincart.com/Default.aspx";

            MailMessage mm = new MailMessage(DS.Tables[0].Rows[0]["Name"].ToString() + "<" + xUIDDeafult + ">", xEmail);
            NetworkCredential basicCredential = new NetworkCredential(xUIDDeafult, xPassDeafult);
            mm.Subject = "Your Password";

            string mmbody = "";

            mmbody += "<html>";
            mmbody += "<body>";
            mmbody += "<table>";
            mmbody += "<tr>";
            mmbody += "<td><h1>Dear " + DS.Tables[0].Rows[0]["Name"].ToString() + ",</h1></td>";
            mmbody += "</tr>";
            mmbody += "<tr>";
            mmbody += "<td>Your password generated successfully. Please find below password for your Fincart Account.</td>";
            mmbody += "</tr>";
            mmbody += "<tr>";
            mmbody += "<td>Password : " + DS.Tables[0].Rows[0]["Pwd"].ToString() + "</td>";
            mmbody += "</tr>";
            mmbody += "<tr>";
            mmbody += "<td>Please change your password when you login to your account for the first time</td>";
            mmbody += "</tr>";
            mmbody += "<tr>";
            mmbody += "<td>&nbsp;</td>";
            mmbody += "</tr>";
            mmbody += "<tr>";
            mmbody += "<td><a href='" + fpLinkDefault + "' target='_new'>Click Here</a> to login</td>";
            mmbody += "</tr>";
            mmbody += "<tr>";
            mmbody += "<td>&nbsp;</td>";
            mmbody += "</tr>";
            mmbody += "<tr>";
            mmbody += "<td>Best Regards</td>";
            mmbody += "</tr>";
            mmbody += "<tr>";
            mmbody += "<td>Team Fincart</td>";
            mmbody += "</tr>";
            mmbody += "</table>";
            mmbody += "</body>";
            mmbody += "</html>";

            mm.Body = mmbody;

            mm.IsBodyHtml = true;

            SmtpClient smtp = new SmtpClient();
            if (xSSLDeafult.ToUpper() == "YES")
                smtp.EnableSsl = true;
            else
                smtp.EnableSsl = false;

            smtp.Port = xPortDeafult;

            smtp.Host = xSMTPDeafult;
            smtp.UseDefaultCredentials = false;
            smtp.Credentials = basicCredential;

            smtp.Send(mm);

            FPMessageZone.Attributes["Style"] = "Display:block";
            FPZone.Attributes["Style"] = "Display:none";
        }
        else
        {
            txtInvalidEmail.Attributes["Style"] = "display: Block";
        }


    }
    protected void forgotpassword_Click(object sender, EventArgs e)
    {
        signin.Visible = false;
        forgotpswd.Visible = true;
    }
    protected void signinbutton_Click(object sender, EventArgs e)
    {
        signin.Visible = true;
        forgotpswd.Visible = false;
    }
}