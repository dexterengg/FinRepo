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
/// Summary description for PaymentGateway
/// </summary>
public class PaymentGateway
{
    SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ToString());
    string xStr = "";

	public PaymentGateway()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public DataTable InsertPaymentDetails(string Customer_id, string Email_id,string Amount,string Bank,string Bankid,string Currency,string Fundtype,string Invertortype,string Transactiontype,string Requestdatetime,string Paymentstate,string Authstate,string Requestdata,string Responsedata)
    {
        SqlDataAdapter DA = new SqlDataAdapter(" " +

        " insert into fp_SubsidaryPaymentDetails " +
        " select '"+Customer_id+"','"+Email_id+"','"+Amount+"','"+Bank+"','"+Bankid+"','"+Currency+"','"+Fundtype+"','"+Invertortype+"','"+Transactiontype+"','"+Requestdatetime+"','"+Paymentstate+"','"+Authstate+"','"+Requestdata+"','"+Responsedata+"',getdate(),getdate(),1 " +
        "  ", Con);

        DataSet DS = new DataSet();

        Con.Open();
        DA.Fill(DS);
        Con.Close();


        SqlDataAdapter DAuserkey = new SqlDataAdapter(" " +

                " select * from fp_SubsidaryPaymentDetails where Customer_id='" + Customer_id + "' " +
                "  ", Con);

        DataSet DSuserkey = new DataSet();

        Con.Open();
        DAuserkey.Fill(DSuserkey);
        Con.Close();

        return DSuserkey.Tables[0];
    }

    public DataTable UpdatePaymentDetails(string Customer_id, string Email_id, string Amount, string Paymentstate, string Authstate, string Responsedata)
    {
        string qry=" " +

        " update fp_SubsidaryPaymentDetails " +
        " set Paymentstate='" + Paymentstate + "',Authstate='" + Authstate + "',Responsedata='" + Responsedata + "',Updateddate=getdate() " +
        "  where Customer_id='" + Customer_id + "' and Email_id='" + Email_id + "' ";

        SqlDataAdapter DA = new SqlDataAdapter(qry, Con);

        DataSet DS = new DataSet();

        Con.Open();
        DA.Fill(DS);
        Con.Close();


        SqlDataAdapter DAuserkey = new SqlDataAdapter(" " +

                " select * from fp_SubsidaryPaymentDetails where Customer_id='" + Customer_id + "' " +
                "  ", Con);

        DataSet DSuserkey = new DataSet();

        Con.Open();
        DAuserkey.Fill(DSuserkey);
        Con.Close();

        return DSuserkey.Tables[0];
    }

    public string customerPaymentStatus(string Email_id)
    {
        string res = "PENDING";

        SqlDataAdapter DA = new SqlDataAdapter(" " +

        " select * from fp_SubsidaryPaymentDetails " +
        "  where Email_id='" + Email_id + "' order by 1 desc", Con);

        DataSet DS = new DataSet();

        Con.Open();
        DA.Fill(DS);
        Con.Close();

        if (DS.Tables.Count > 0)
        {
            if (DS.Tables[0].Rows.Count > 0)
            {
                if (DS.Tables[0].Rows[0]["Paymentstate"].ToString().Trim().ToUpper() == "SUCCESS")
                {
                    res = "SUCCESS";
                }
            }
        }
        return res;
    }
}