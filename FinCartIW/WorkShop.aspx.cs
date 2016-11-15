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


public partial class Website_WorkShop : System.Web.UI.Page
{
    SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ToString());
    string xStr = "";
    SqlCommand cmd;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            WSBindList();
        }

    }
    private void WSBindList()
    {
        SqlDataAdapter RDA = new SqlDataAdapter(" " +
            " Select Code, WorkShopDetail=CourseName+' - '+convert(varchar(11),CourseDate,113)+' - '+CourseTime+' - '+Location " +
            " from fp_WorkShop order by EditDate desc " +
            "  ", Con);

        DataSet RDS = new DataSet();
        Con.Open();
        RDA.Fill(RDS);
        Con.Close();

        rbWorkShop.DataSource = RDS;
        rbWorkShop.DataTextField = "WorkShopDetail";
        rbWorkShop.DataValueField = "Code";
        rbWorkShop.DataBind();
    } 

    protected void WSRegistration_Click(object sender, EventArgs e)
    {
        //bool isValid = ucCaptcha.Validate(txtCaptcha.Text.Trim());
        //if (isValid)
        //{
            xStr = " Insert into fp_WorkShopRegister " +
                " (FullName,City,CountryCode,Email,Mobile,CourseCode,InfoFrom,InfoCancellation,RegisterDate)   " +
                " values('" + txtFullName.Text + "', '" + txtCity.Text + "','" + txtCountryCode .Text+ "', '" + txtEmail.Text + "', " +
                " '" + txtMobileNo.Text + "', '"+rbWorkShop.SelectedValue +"', '"+rbWSInfo.SelectedValue+"', " +
                "  '" + rbContactInfo.SelectedValue + "', '" + Convert.ToDateTime(System.DateTime.Now).ToString("yyyy-MM-dd") + "' " +
                "  ) ";
            cmd = new SqlCommand(xStr, Con);
            Con.Open();
            cmd.ExecuteNonQuery();
            Con.Close();
            
            ShowPopupMessage("Your Registration Done Successfully!", PopupMessageType.Success);

            // Mail Sent

            string xSMTPDeafult = "smtp.falconide.com";
            string xUIDDeafult = "investwell";
            string xPassDeafult = "Iwell@321";
            string xSSLDeafult = "yes";
            int xPortDeafult = 587;
            //string fpLinkDefault = "http://localhost:5838/";
            //string fpLinkDefault = "http://dem4.my-portfolio.in/";

            string xName = txtFullName.Text;
            string xMobile = txtMobileNo.Text;
            string xEmail = txtEmail.Text;
            string xCC = txtCountryCode.Text;
            string xCity = txtCity.Text;
            string xWorkshop = rbWorkShop.SelectedItem.ToString();
            string xWSContact = rbContactInfo.SelectedItem.ToString();
            string xWSInfo = rbWSInfo.SelectedItem.ToString();

            MailMessage mm = new MailMessage(xName + "<noreply@investwellonline.com>", xEmail);
            NetworkCredential basicCredential = new NetworkCredential(xUIDDeafult, xPassDeafult);
            mm.Subject = "Confirmation of your registration for Workshop";

            string mmbody = "";

            mmbody += "<html>";
            mmbody += "<body>";
            mmbody += "<table cellspacing='2' cellpadding='2' border='1'>";
            mmbody += "<tr>";
            mmbody += "<td colspan='2'><h1>Welcome to FinCart Workshops</h1></td>";
            mmbody += "</tr>";
            mmbody += "<tr>";
            mmbody += "<td colspan='2'>&nbsp;</td>";
            mmbody += "</tr>";
            mmbody += "<tr>";
            mmbody += "<td colspan='2'>Below are the details for your workshop registration</td>";
            mmbody += "</tr>";
            mmbody += "<tr>";
            mmbody += "<td colspan='2'>&nbsp;</td>";
            mmbody += "</tr>";
            mmbody += "<tr>";
            mmbody += "<td>Full Name</td>";
            mmbody += "<td>" + xName + "</td>";
            mmbody += "</tr>";
            mmbody += "<tr>";
            mmbody += "<td>City</td>";
            mmbody += "<td>" + xCity + "</td>";
            mmbody += "</tr>";
            mmbody += "<tr>";
            mmbody += "<td>Email</td>";
            mmbody += "<td>" + xEmail + "</td>";
            mmbody += "</tr>";
            mmbody += "<tr>";
            mmbody += "<td>Contact No.</td>";
            mmbody += "<td>" + xCC + "-" + xMobile + "</td>";
            mmbody += "</tr>";
            mmbody += "<tr>";
            mmbody += "<td>Workshop Selected</td>";
            mmbody += "<td>" + xWorkshop + "</td>";
            mmbody += "</tr>";
            mmbody += "<tr>";
            mmbody += "<td>How did you hear about us?</td>";
            mmbody += "<td>" + xWSInfo + "</td>";
            mmbody += "</tr>";
            mmbody += "<tr>";
            mmbody += "<td>On cancellation, I will be notified via</td>";
            mmbody += "<td>" + xWSContact + "</td>";
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

            txtFullName.Text = "";
            txtCity.Text = "";
            txtMobileNo.Text = "";
            txtEmail.Text = "";
            //txtCaptcha.Text = "";

            rbContactInfo.ClearSelection();
            rbWorkShop.ClearSelection();
            rbWSInfo.ClearSelection();


        //}
        //else
        //{
        //    lblMessage.Text = "Invalid!";
        //    lblMessage.ForeColor = Color.Red;
        //}
    }

    /// <summary>
    /// Details: Change modal popup image according to PopupMessageType
    /// </summary>
    /// <param name="message"></param>
    /// <param name="messageType"></param>
    private void ShowPopupMessage(string message, PopupMessageType messageType)
    {
        switch (messageType)
        {

            case PopupMessageType.Success:
                lblMessagePopupHeading.Text = "Success";

                break;
            default:
                lblMessagePopupHeading.Text = "Information";

                break;
        }

        lblMessagePopupText.Text = message;
        mpeMessagePopup.Show();
        //formtop.Style.Add("display", "none");
    }

    /// <summary>
    /// Message type enum
    /// </summary>
    public enum PopupMessageType
    {
        Error,
        Message,
        Warning,
        Success
    }
}