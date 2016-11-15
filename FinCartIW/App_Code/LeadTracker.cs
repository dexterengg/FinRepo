using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;

/// <summary>
/// Summary description for LeadTracker
/// </summary>
public class LeadTracker
{
    SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ToString());
    string xStr = "";
    public LeadTracker()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    protected string GetIPAddress()
    {
        System.Web.HttpContext context = System.Web.HttpContext.Current;
        string ipAddress = context.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];

        if (!string.IsNullOrEmpty(ipAddress))
        {
            string[] addresses = ipAddress.Split(',');
            if (addresses.Length != 0)
            {
                return addresses[0];
            }
        }

        return context.Request.ServerVariables["REMOTE_ADDR"];
    }
    public bool TrackLead(string reqvar, string reqval, string route)
    {
        xStr = "insert into fp_LeadTracker(TrackerVar,TrackerVal,TrackerRoute,TrackerIp,TrackingStatus) values('" + reqvar + "','" + reqval + "','" + route + "','" + GetIPAddress() + "',1)";

        try
        {
            SqlDataAdapter DA = new SqlDataAdapter(xStr, Con);

            DataSet DS = new DataSet();

            Con.Open();
            DA.Fill(DS);
            Con.Close();

            return true;
        }
        catch
        {
            return false;
        }

    }
    public bool checkuserexsists(string email)
    {
        bool res = false;
        SqlDataAdapter DAduplicate = new SqlDataAdapter(" " +

                    " select userKey from fp_Prospects where userid='" + email + "' " +
                    "  ", Con);

        DataSet DSduplicate = new DataSet();

        Con.Open();
        DAduplicate.Fill(DSduplicate);
        Con.Close();

        if (DSduplicate.Tables[0].Rows.Count > 0)
        {
            res = true;
        }
        return res;
    }
    public DataTable UserDetailsByEmailId(string email)
    {
        DataTable res = new DataTable();
        SqlDataAdapter DAduplicate = new SqlDataAdapter(" " +

                    " select * from fp_Prospects where userid='" + email + "' " +
                    "  ", Con);

        DataSet DSduplicate = new DataSet();

        Con.Open();
        DAduplicate.Fill(DSduplicate);
        Con.Close();

        if (DSduplicate.Tables[0].Rows.Count > 0)
        {
            res = DSduplicate.Tables[0];
        }

        return res;
    }
    public string registeruser(string name, string email, string pass, string mobile, string clientstatus)
    {
        string res = string.Empty;

        SqlDataAdapter DA = new SqlDataAdapter(" " +

        " insert into fp_Prospects(Name,userid,Pwd,mobile1,email1,clientStatus,SystemDate) " +
        " values('" + name + "','" + email + "','" + pass + "','" + mobile + "','" + email + "','" + clientstatus + "','" + Convert.ToDateTime(System.DateTime.Now).ToString("yyyy-MM-dd") + "') " +
        "  ", Con);

        DataSet DS = new DataSet();

        Con.Open();
        DA.Fill(DS);
        Con.Close();


        SqlDataAdapter DAuserkey = new SqlDataAdapter(" " +

                " select UserID from fp_Prospects where userid='" + email + "' " +
                "  ", Con);

        DataSet DSuserkey = new DataSet();

        Con.Open();
        DAuserkey.Fill(DSuserkey);
        Con.Close();

        if (DSuserkey.Tables[0].Rows.Count > 0)
        {
            res = DSuserkey.Tables[0].Rows[0]["UserId"].ToString();
        }
        return res;
    }

    public static Int64 getSchemeCodeByname(string name)
    {
        SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ToString());
        string xStr = "";
        Int64 res=1017;

        Con.Close();

        SqlDataAdapter DAuserkey = new SqlDataAdapter(" " +
                " select CODE from fp_Subsidary_Scheme_Matrix where NAME='" + name + "' " +
                "  ", Con);

        DataSet DSuserkey = new DataSet();

        Con.Open();
        DAuserkey.Fill(DSuserkey);
        Con.Close();

        if (DSuserkey.Tables[0].Rows.Count > 0)
        {
            res = Convert.ToInt64(DSuserkey.Tables[0].Rows[0]["CODE"].ToString());
        }

        return res;
    }

    public string insertplan(Plan pl)
    {
        string res = string.Empty;

        string qry = " insert fp_Subsidary_Plan " +
        " select '"+pl.name+"','"+pl.email+"','"+pl.mobile+"','"+pl.currrentage+"','"+pl.retirementage+"','"+pl.lifeexpentency+"','"+pl.status+"','"+pl.Risk_Ability+"'," +
        " '"+pl.E_Fund_Amount+"','"+pl.E_Fund_SIP+"','"+pl.Risk_T_Insurance+"','"+pl.Risk_FF_Insurance+"'," +
        " "+Convert.ToInt32(pl.Retire)+",'"+pl.Retire_Amount+"','"+pl.Retire_SIP+"',"+
        " "+Convert.ToInt32(pl.Vacation)+",'"+pl.Vacation_Amount+"','"+pl.Vacation_SIP+"'," +
        " " + Convert.ToInt32(pl.Asset) + ",'" + pl.Asset_Amount + "','" + pl.Asset_SIP + "'," +
        " " + Convert.ToInt32(pl.other) + ",'" + pl.other_Amount + "','" + pl.other_SIP + "'," +
        " " + Convert.ToInt32(pl.ChildE) + ",'" + pl.ChildE_Amount + "','" + pl.ChildE_SIP + "'," +
        " " + Convert.ToInt32(pl.ChildM) + ",'" + pl.ChildM_Amount + "','" + pl.ChildM_SIP + "'," +
        " '" + pl.chartdata + "','" + pl.illness + "',getdate(),getdate(),1,'"+pl.Schemes+"'";

        SqlDataAdapter DA = new SqlDataAdapter(qry, Con);
        DataSet DS = new DataSet();

        Con.Open();
        DA.Fill(DS);
        Con.Close();


        SqlDataAdapter DAuserkey = new SqlDataAdapter(" " +
                " select email from fp_Subsidary_Plan where email='" + pl.email + "' " +
                "  ", Con);

        DataSet DSuserkey = new DataSet();

        Con.Open();
        DAuserkey.Fill(DSuserkey);
        Con.Close();

        if (DSuserkey.Tables[0].Rows.Count > 0)
        {
            res = DSuserkey.Tables[0].Rows[0]["email"].ToString();
        }
        return res;
    }
    public string campaign_lead_capture(string userid, string campaignkey)
    {
        string res = string.Empty;

        SqlDataAdapter DA = new SqlDataAdapter(" " +

        " insert into fp_Campaign_Leads(CL_UserId,CL_Campaign_Key,CL_CreatedDate,CL_UpdatedDate,CL_Status) " +
        " values('" + userid + "','" + campaignkey + "','" + Convert.ToDateTime(System.DateTime.Now).ToString("yyyy-MM-dd") + "','" + Convert.ToDateTime(System.DateTime.Now).ToString("yyyy-MM-dd") + "',1) " +
        "  ", Con);

        DataSet DS = new DataSet();

        Con.Open();
        DA.Fill(DS);
        Con.Close();


        SqlDataAdapter DAuserkey = new SqlDataAdapter(" " +

                " select CL_UserId from fp_Campaign_Leads where CL_UserId='" + userid + "' and CL_Campaign_Key='" + campaignkey + "' " +
                "  ", Con);

        DataSet DSuserkey = new DataSet();

        Con.Open();
        DAuserkey.Fill(DSuserkey);
        Con.Close();

        if (DSuserkey.Tables[0].Rows.Count > 0)
        {
            res = DSuserkey.Tables[0].Rows[0]["CL_UserId"].ToString();
        }
        return res;
    }
    public string userlogin(string username, string pass)
    {
        string res = string.Empty;
        if (!String.IsNullOrWhiteSpace(username) && !String.IsNullOrWhiteSpace(username))
        {
            SqlDataAdapter DA = new SqlDataAdapter(" " +
                    " select UserID,pwd from dbo.fp_Prospects " +
                    " where userid='" + username + "' and pwd='" + pass + "'  " +
                //" select * from fp_Prospects where userid='" + eusername.Text + "' and pwd='" + epassword.Text + "' " +
                    "  ", Con);

            DataSet DS = new DataSet();
            Con.Open();
            DA.Fill(DS);
            Con.Close();

            if (DS.Tables[0].Rows.Count > 0)
            {
                if (DS.Tables[0].Rows[0]["pwd"].ToString().Trim()==pass.Trim()) {
                    res = DS.Tables[0].Rows[0]["UserId"].ToString();
                }
            }
        }

        return res;
    }
    public DataTable GetCampaignDetailsByClientSatusCode(string ClientSatusCode)
    {
        DataTable res = new DataTable();
        if (!String.IsNullOrWhiteSpace(ClientSatusCode))
        {
            SqlDataAdapter DA = new SqlDataAdapter(" " +
                    " select * from [dbo].[fp_Campaign] " +
                    " where C_ClientSatusCode='" + ClientSatusCode + "'" +
                    "  ", Con);

            DataSet DS = new DataSet();
            Con.Open();
            DA.Fill(DS);
            Con.Close();

            if (DS.Tables[0].Rows.Count > 0)
            {
                    res = DS.Tables[0];
            }
        }

        return res;
    }
    public bool forgetpass(string email)
    {
        bool res = true;
        string xEmail = email;

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

        }
        else
        {
            res = false; 
        }
        return res;
    }
    public DataSet leaddetails(string username, string pass)
    {
            SqlDataAdapter DA = new SqlDataAdapter(" " +
                    " select * from dbo.fp_Prospects " +
                    " where userid='" + username + "' and pwd='" + pass + "'  " +
                //" select * from fp_Prospects where userid='" + eusername.Text + "' and pwd='" + epassword.Text + "' " +
                    "  ", Con);

            DataSet DS = new DataSet();
            Con.Open();
            DA.Fill(DS);
            Con.Close();

            return DS;
    }
}