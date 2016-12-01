using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Text;
using System.IO;
using System.Security.Cryptography;

public partial class advisory_Payment : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["userSessionID"] == null)
            {
                Response.Redirect("FPSelfie.aspx");
            }
            else if (Session["Payment"] == null)
            {
                Response.Redirect("src/Questions.aspx");
            }
        }
    }
    public string GetSHA256(string requestData,string secretKey)
    {
     
        System.Text.ASCIIEncoding encoding = new System.Text.ASCIIEncoding();

        byte[] keyByte = encoding.GetBytes(secretKey);

        HMACSHA256 hmacsha256 = new HMACSHA256(keyByte);

        byte[] messageBytes = encoding.GetBytes(requestData);

        byte[] hashmessage = hashmessage = hmacsha256.ComputeHash(messageBytes);

        return ByteToString(hashmessage);
    }
    public static string ByteToString(byte[] buff)
    {
        string sbinary = "";

        for (int i = 0; i < buff.Length; i++)
        {
            sbinary += buff[i].ToString("X2"); // hex format
        }
        return (sbinary);
    }
    string createCheckSumValue(string requestdata,string secretKey)
    {
        return GetSHA256(requestdata, secretKey).ToUpper();
    }
    void pay(string customerid,string amount,string bank,string bankid,string currency,string fundtype,string investortype,string transactiontype,DateTime datetime,string returnurl)
    {
        Session["custid"] = customerid;
        string requestUrl = "https://www.billdesk.com/pgidsk/PGIMerchantRequestHandler";
        string requestData = "FINCARTAS|" + customerid + "|NA|" + amount + "|" + bankid + "|NA|NA|" + currency + "|DIRECT|R|fincartas|NA|NA|F|NA|NA|NA-NA|" + bank + "MFD-NA-NA-NA|" + fundtype + "|" + investortype + "-NA-NA-NA-NA-NA-" + transactiontype + "-NA-NA|" + datetime.ToString("yyyyMMddHHmmss") + "-" + amount + "-NA-NA|" + returnurl + "";
        string checkSumKey = "ILnRHncVgTFz";
        string checkSumValue = createCheckSumValue(requestData,checkSumKey);
        string hiddenRequestId = "PGIME1000";
        string hiddenOperation = "ME100";

        //var postData = "{'msg':'FINCARTAS|26|NA|2.00|IDB|NA|NA|INR|DIRECT|R|fincartas|NA|NA|F|NA|NA|ARN-87554|IDBIMFD-NA-NA-NA|LIQUID|RESIDENT-15425-NA-NA-NA-NA-L-NA-NA|20130706125634-2.00-NA-NA|https://fincart.com/advisory/pstatus.aspx|EBB7B3EA6514EB0A4C2DE194526C4B4216DE9A884605003CF9DA26B9FFCFBCD9'}";

        string postData = "msg=" + requestData + "|" + checkSumValue + "&hidRequestId=" + hiddenRequestId + "&hidOperation=" + hiddenOperation;

        PaymentGateway pg = new PaymentGateway();
        pg.InsertPaymentDetails(customerid, Convert.ToString(Session["userSessionID"]), amount, bank, bankid, currency, fundtype, investortype, transactiontype, datetime.ToString(), "PENDING", "", postData, "");

        Response.Redirect(requestUrl+"?"+postData);

    }
    protected void btnpay_Click(object sender, EventArgs e)
    {
        pay(Guid.NewGuid().ToString().Replace("-", ""), lblamount.Text.Trim(), ddl_bank.SelectedItem.Text, ddl_bank.SelectedValue, "INR", "LIQUID", "RESIDENT", "L", DateTime.Now, "http://fincart.com/SFinancialPlanning/pstatus");
    }
}