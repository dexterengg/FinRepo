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
using System.Drawing;
using System.IO;
using System.Net;
using System.Net.Mail;

public partial class Registration : System.Web.UI.Page
{
    SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ToString());
    string xStr = "";
    SqlCommand cmd;
    string xAcType = "";
    string xRisk = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            RegistrationInit.Visible = true;
            //RegistrationStart.Visible = false;
        }
    }
    protected void RegisterButton_Click(object sender, EventArgs e)
    {
        //bool isValid = ucCaptcha.Validate(txtCaptcha.Text.Trim());
        //if (isValid)
        //{
            SqlDataAdapter DAduplicate = new SqlDataAdapter(" " +

                    " select userKey from fp_Prospects where userid='" + email.Text + "' " +
                    "  ", Con);

            DataSet DSduplicate = new DataSet();

            Con.Open();
            DAduplicate.Fill(DSduplicate);
            Con.Close();

            if (DSduplicate.Tables[0].Rows.Count == 0)
            {

                SqlDataAdapter DA = new SqlDataAdapter(" " +

                        " insert into fp_Prospects(Name,userid,Pwd,mobile1,email1,clientStatus,SystemDate) " +
                        " values('" + name.Text + "','" + email.Text + "','" + password.Text + "','" + mobile.Text + "','" + email.Text + "','X','" + Convert.ToDateTime(System.DateTime.Now).ToString("yyyy-MM-dd") + "') " +
                        "  ", Con);

                DataSet DS = new DataSet();

                Con.Open();
                DA.Fill(DS);
                Con.Close();                

                
                SqlDataAdapter DAuserkey = new SqlDataAdapter(" " +

                        " select UserID, OpType1, Risk=isnull(RiskCode,99) from fp_Prospects where userid='" + email.Text + "' " +
                        "  ", Con);

                DataSet DSuserkey = new DataSet();

                Con.Open();
                DAuserkey.Fill(DSuserkey);
                Con.Close();

                if (DSuserkey.Tables[0].Rows.Count > 0)
                {

                    //Redirection to parent page
                    Session["userSessionID"] = DSuserkey.Tables[0].Rows[0]["UserId"].ToString();
                    xAcType = DSuserkey.Tables[0].Rows[0]["OpType1"].ToString();
                    xRisk = DSuserkey.Tables[0].Rows[0]["Risk"].ToString();

                    if (xAcType == "Paid")
                    {
                        Response.Redirect("MyDetails.aspx?Risk=A");
                    }
                    else if (xRisk == "99")
                    {
                        Response.Redirect("MyDetails.aspx?Risk=A");
                    }
                    else
                    {
                        Response.Redirect("MyDashBoard.aspx");
                    }


                }


                RegistrationInit.Visible = false;
                //RegistrationStart.Visible = true;

                /*
                string xSMTPDeafult = "smtp.falconide.com";
                string xUIDDeafult = "investwell";
                string xPassDeafult = "Iwell@321";
                string xSSLDeafult = "yes";
                int xPortDeafult = 587;
                string fpLinkDefault = "http://localhost:5838/Plan/";
                //string fpLinkDefault = "https://www.fincart.com/Plan/";

                string xName = name.Text;
                string xMobile = mobile.Text;
                string xEmail = email.Text;

                MailMessage mm = new MailMessage(xName + "<noreply@investwellonline.com>", xEmail);
                NetworkCredential basicCredential = new NetworkCredential(xUIDDeafult, xPassDeafult);
                mm.Subject = "Confirm your registration for Financial Planning";

                string mmbody = "";

                mmbody += "<html>";
                mmbody += "<body>";
                mmbody += "<table>";
                mmbody += "<tr>";
                mmbody += "<td>Dear, " + xName + "</td>";
                mmbody += "</tr>";
                mmbody += "<tr>";
                mmbody += "<td>&nbsp;</td>";
                mmbody += "</tr>";
                mmbody += "<tr>";
                mmbody += "<td>We are elated to introduce a disruptive, automated do-it-yourself financial and investment planning platform that"; 
                mmbody += " helps you to plan, invest and prosper for FREE..</td>";
                mmbody += "</tr>";
                mmbody += "<tr>";
                mmbody += "<td>&nbsp;</td>";
                mmbody += "</tr>";
                mmbody += "<tr>";
                mmbody += "<td>The platform helps you in 3 ways to simplify your financial life:</td>";
                mmbody += "</tr>";
                mmbody += "<tr>";
                mmbody += "<td>";
                mmbody += "<ul>";
                mmbody += "<li>Plan: Plan goals; know how much money you will need and your monthly road-map to fulfill them.</li>";
                mmbody += "<li>Invest: Open a FREE online account; discover the schemes that will help you achieve your goals.</li>";
                mmbody += "<li>Prosper: Track your investments and monitor the progress of your money 24 x 7.</li>";
                mmbody += "</ul>";
                mmbody += "</td>";
                mmbody += "</tr>";                                               
                mmbody += "<tr>";
                mmbody += "<td>Our dream is to inculcate better investment habits and also to curb misselling of financial products. You may wish to read few interesting articles and watch few educative TV shows.</td>";
                mmbody += "</tr>";
                mmbody += "<tr>";
                mmbody += "<td>&nbsp;</td>";
                mmbody += "</tr>";
                mmbody += "<tr>";
                mmbody += "<td>We strive to improve and deliver excellence. Your feedback and suggestions will help us to improve our initiative.</td>";
                mmbody += "</tr>";
                mmbody += "<tr>";
                mmbody += "<td>&nbsp;</td>";
                mmbody += "</tr>";
                mmbody += "<tr>";
                mmbody += "<td>We wish a long-lasting and prosperous journey with Fincart.</td>";
                mmbody += "</tr>";
                mmbody += "<tr>";
                mmbody += "<td>&nbsp;</td>";
                mmbody += "</tr>";
                mmbody += "<tr>";
                mmbody += "<td>Please click on the below link to activate your account</td>";
                mmbody += "</tr>";
                mmbody += "<tr>";
                mmbody += "<td>&nbsp;</td>";
                mmbody += "</tr>";
                mmbody += "<tr>";
                mmbody += "<td><a href='" + fpLinkDefault + "RegistrationLink.aspx?UserKey=" + DSuserkey.Tables[0].Rows[0]["UserKey"].ToString() + "' target='_blank'>Click on this link to activate your account</a></td>";
                mmbody += "</tr>";
                mmbody += "<tr>";
                mmbody += "<td>&nbsp;</td>";
                mmbody += "</tr>";
                mmbody += "<tr>";
                mmbody += "<td>Regards</td>";
                mmbody += "</tr>";
                mmbody += "<tr>";
                mmbody += "<td>&nbsp;</td>";
                mmbody += "</tr>";
                mmbody += "<tr>";
                mmbody += "<td>Fincart Team</td>";
                mmbody += "</tr>";
                mmbody += "<tr>";
                mmbody += "<td>Call: +91 11 30018181</td>";
                mmbody += "</tr>";
                mmbody += "<tr>";
                mmbody += "<td>Email: <a href='mailto:info@fincart.com'>info@fincart.com</a></td>";
                mmbody += "</tr>";
                mmbody += "<tr>";
                mmbody += "<td>Feedback link: <a href='https://fp.my-portfolio.in/feedback.aspx'>Feedback</a></td>";
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

                smtp.Send(mm);*/

            }
            else
            {
                emailValidate.Text = "Email ID already registered. <a href='Login.aspx' style='color:#ff0000'>Sign IN</a>";
            }
        //}
        //else
        //{
        //    lblMessage.Text = "Invalid!";
        //    lblMessage.ForeColor = Color.Red;
        //}
    }
}