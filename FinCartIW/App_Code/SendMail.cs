using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Web;

/// <summary>
/// Summary description for SendMail
/// </summary>
public class SendMail
{
    MailMessage myMailMessage;
    SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ToString());
    void SendCompletedCallback(object sender, AsyncCompletedEventArgs e)
    {
        string subject = (string)e.UserState;

        if (e.Cancelled)
        {
            string cancelled = string.Format("[{0}] Send canceled.", subject);
            //Console.WriteLine(cancelled);
        }
        if (e.Error != null)
        {
            string error = String.Format("[{0}] {1}", subject, e.Error.ToString());
            //Console.WriteLine(error);
        }
        else
        {
            //Console.WriteLine("Email sent.");
        }
    }

    public string body_contact(string name, string email, string mobile)
    {
        StringBuilder Body = new StringBuilder();
        Body.Append("<b>Name:</b> " + name + ". <br/><br/>");
        Body.Append("<b>Email:</b> " + email + ". <br/><br/>");
        Body.Append("<b>Mobile:</b> " + mobile + "");
        return Body.ToString();
    }
    public string SendEmail(string email_from_name, string email_from_emailid, string[] mail_to, int mail_to_cout, string attachment, string subject, string body)
    {
        SqlDataAdapter AEDA = new SqlDataAdapter("select * from fp_EmailSetting", Con);
        DataSet AEDS = new DataSet();
        Con.Open();
        AEDA.Fill(AEDS);
        Con.Close();
        
        return EmailSent(AEDS.Tables[0].Rows[0]["Name"].ToString(),AEDS.Tables[0].Rows[0]["email_from"].ToString(), mail_to, mail_to_cout, attachment, 
            AEDS.Tables[0].Rows[0]["Host"].ToString(), AEDS.Tables[0].Rows[0]["Port"].ToString(), AEDS.Tables[0].Rows[0]["email"].ToString(), 
            AEDS.Tables[0].Rows[0]["pass"].ToString(), subject, body);
    }

    public string EmailSent(string Name, string strEmailAddrFrom, string[] strEmailAddrTo, int intTotalEmailTo, string strAttachement, string Host, string Port, string CrdMailId, string CrdPass, string Subject, string Body)
    {

        string strSent = " ";
        try
        {
            // Initializes a new instance of the System.Net.Mail.MailMessage class. 
            myMailMessage = new MailMessage();

            // Obtains the e-mail address of the person the e-mail is being sent to. 

            for (int NumberOfEmails = 0; NumberOfEmails < intTotalEmailTo; NumberOfEmails++)
            {
                myMailMessage.To.Add(new MailAddress(strEmailAddrTo[NumberOfEmails]));
            }


            // Obtains the e-mail address of the person sending the message. 
            myMailMessage.From = new MailAddress(strEmailAddrFrom, Name);

            // You can add additional addresses by simply calling .Add again. 
            // Support not added in the current example UI. 
            // 
            // myMailMessage.To.Add( new System.Net.Mail.MailAddress( "addressOne@example.com" )); 
            // myMailMessage.To.Add( new System.Net.Mail.MailAddress( "addressTwo@example.com" )); 
            // myMailMessage.To.Add( new System.Net.Mail.MailAddress( "addressThree@example.com" )); 


            // You can also specify a friendly name to be displayed within the e-mail 
            // application on the client-side for the To Address. 
            // Support not added in the current example UI. 
            // See the example below: 
            // 
            // myMailMessage.To.Add(new System.Net.Mail.MailAddress( this.txtToAddress.Text, "My Name Here" )); 
            // myMailMessage.From(new System.Net.Mail.MailAddress( this.txtToAddress.Text, "Another Name Here" )); 

            // System.Net.Mail also supports Carbon Copy(CC) and Blind Carbon Copy (BCC) 
            // Support not added in the current example UI. 
            // See the example below: 
            // 
            // myMailMessage.CC.Add ( new System.Net.Mail.MailAddress( "carbonCopy@example.com" )); 
            // myMailMessage.Bcc.Add( new System.Net.Mail.MailAddress( "blindCarbonCopy@example.com" )); 

            // Obtains the subject of the e-mail message 
            myMailMessage.Subject = Subject;

            // Obtains the body of the e-mail message. 
            myMailMessage.Body = Body;

            // Listed below are the two message formats that can be used: 
            // 1. Text 
            // 2. HTML 
            // 
            // The default format is Text.                     
            myMailMessage.IsBodyHtml = true;


            // Listed below are the three priority levels that can be used: 
            // 1. High 
            // 2. Normal 
            // 3. Low 
            // 
            // The default priority level is Normal. 
            // 
            // This section of code determines which priority level 
            // was checked by the user. 

            myMailMessage.Priority = MailPriority.High;

            //myMailMessage.Priority = MailPriority.Normal; 

            //myMailMessage.Priority = MailPriority.Low; 

            // Not Yet Implement
            // This section of code determines if the e-mail message is going to 
            // have an attachment. 
            //if (strAttachement != "" || strAttachement != null)
            //{
            //    Attachment att = new Attachment(strAttachement);
            //    myMailMessage.Attachments.Add(att);
            //}


            // Custom headers can also be added to the MailMessage. 
            // These custom headers can be used to tag an e-mail message 
            // with information that can be useful in tracking an e-mail 
            // message. 
            // 
            // Support not added in the current example UI. 
            // See the example below: 
            // myMailMessage.Headers.Add( "Titan-Company", "Titan Company Name" ); 

            // Initializes a new instance of the System.Net.Mail.SmtpClient class. 
            SmtpClient myMailClient = new SmtpClient();

            // Obtains the email server name or IP address to use when sending the e-mail. 
            myMailClient.Host = Host;

            // Defines the port number to use when connecting to the mail server. 
            // The default port number for SMTP is 25/TCP. 
            myMailClient.Port = Convert.ToInt32(Port);

            // Specifies the delivery method to use when sending the e-mail 
            // message. Listed below are the three delivery methods 
            // that can be used by namespace System.Net.Mail 
            // 
            // 1. Network = sent through the network to an SMTP server. 
            // 2. PickupDirectoryFromIis = copied to the pickup directory used by a local IIS server. 
            // 3. SpecifiedPickupDirectory    = is copied to the directory specified by the 
            // SmtpClient.PickupDirectoryLocation property. 

            myMailClient.DeliveryMethod = SmtpDeliveryMethod.Network;

            // Initializes a new instance of the System.Net.NetworkCredential class. 
            NetworkCredential myMailCredential = new NetworkCredential();

            // Obtains the user account needed to authenticate to the mail server. 
            myMailCredential.UserName = CrdMailId;

            // Obtains the user password needed to authenticate to the mail server. 
            myMailCredential.Password = CrdPass;

            // In this example we are providing credentials to use to authenticate to 
            // the e-mail server. Your can also use the default credentials of the 
            // currently logged on user. For client applications, this is the desired 
            // behavior in most scenarios. In those cases the bool value would be set to true. 
            //myMailClient.UseDefaultCredentials = true; 

            // Obtains the credentials needed to authenticate the sender. 
            myMailClient.Credentials = myMailCredential;

            // Set the method that is called back when the send operation ends. 
            myMailClient.SendCompleted += new SendCompletedEventHandler(SendCompletedCallback);

            // Sends the message to the defined e-mail for processing 
            // and delivery with feedback. 
            // 
            // In the current example randomToken generation was not added. 
            // 
            //string randomToken = "randonTokenTestValue"; 
            //myMailClient.SendAsync( myMailMessage, randomToken );
            object userState = myMailMessage;
            try
            {
                //you can also call myMailClient.SendAsync(myMailMessage, userState);
                //Console.WriteLine("Mail Sending In progress");
                myMailClient.Send(myMailMessage);
                myMailMessage.Dispose();
                strSent = "Mail Sent !!";
            }
            catch (System.Net.Mail.SmtpException ex)
            {
                // Console.WriteLine(ex.Message, "Send Mail Error");
                strSent = strSent + ex.Message;
            }
        }

        // Catches an exception that is thrown when the SmtpClient is not able to complete a 
        // Send or SendAsync operation to a particular recipient. 
        catch (System.Net.Mail.SmtpException exSmtp)
        {
            // Console.WriteLine("Exception occurred:" + exSmtp.Message, "SMTP Exception Error");
            strSent = strSent + "Exception occurred:" + exSmtp.Message;
        }

        // Catches general exception not thrown using the System.Net.Mail.SmtpException above. 
        // This general exception also will catch invalid formatted e-mail addresses, because 
        // a regular expression has not been added to this example to catch this problem. 
        catch (System.Exception exGen)
        {
            // Console.WriteLine("Exception occurred:" + exGen.Message, "General Exception Error");
            strSent = strSent + "Exception occurred:" + exGen.Message;
        }
        return strSent;
    }
}