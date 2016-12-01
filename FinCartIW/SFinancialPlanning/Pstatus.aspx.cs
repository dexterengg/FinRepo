using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class advisory_Pstatus : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            if (Session["userSessionID"] == null)
            {
                Response.Redirect("FPSelfie.aspx");
            }
            else if (Session["Payment"] == null)
            {
                Response.Redirect("src/Questions.aspx");
            }
            else
            {
                paymentstatus();
            }
        }
    }

    void paymentstatus()
    {
        string _paymentResp = Request.Form["msg"];
        string[] arrResponse = _paymentResp.Split('|'); //PG
        string merchantId = arrResponse[0];
        string _customerId = arrResponse[1];
        string txnReferenceNo = arrResponse[2];
        string bankReferenceNo = arrResponse[3];
        string txnAmount = arrResponse[4];
        string bankId = arrResponse[5];
        string bankMerchantId = arrResponse[6];
        string txnType = arrResponse[7];
        string currency = arrResponse[8];
        string itemCode = arrResponse[9];
        string securityType = arrResponse[10];
        string securityId = arrResponse[11];
        string securityPassword = arrResponse[12];
        string txnDate = arrResponse[13]; //dd-mm-yyyy
        string authStatus = arrResponse[14];
        string settlementType = arrResponse[15];
        string additionalInfo1 = arrResponse[16];
        string additionalInfo2 = arrResponse[17];
        string additionalInfo3 = arrResponse[18];
        string additionalInfo4 = arrResponse[19];
        string additionalInfo5 = arrResponse[20];
        string additionalInfo6 = arrResponse[21];
        string additionalInfo7 = arrResponse[22];
        string errorStatus = arrResponse[23];
        string _errorDescription = arrResponse[24];

        PaymentGateway pg = new PaymentGateway();

        if (authStatus == "0300")
        {
            pg.UpdatePaymentDetails(Convert.ToString(Session["custid"]), Convert.ToString(Session["userSessionID"]), txnAmount, "SUCCESS", authStatus, _paymentResp);
            litPaymentStatus.Text = "Payment of Rs. " + txnAmount + " received by Fincart !";
            litTransactionNo.Text = "Your transaction No is " + Convert.ToString(Session["custid"]);
            litAction.Text = "Your transaction is successful !";
            btnProceed.Visible = true;
        }
        else
        {
            pg.UpdatePaymentDetails(Convert.ToString(Session["custid"]), Convert.ToString(Session["userSessionID"]), txnAmount, "FAILURE", authStatus, _paymentResp);
            litPaymentStatus.Text = "Your transaction is Failed";
            litTransactionNo.Text = "Your transaction No is " + Convert.ToString(Session["custid"]);
            litAction.Text = "Please Try Again !";
            btnRetry.Visible = true;
        }
    }
    protected void btnProceed_Click(object sender, EventArgs e)
    {
        Session["Payment"] = null;
        Response.Redirect("src/Questions.aspx");
    }
    protected void btnRetry_Click(object sender, EventArgs e)
    {
        Response.Redirect("Payment.aspx");
    }
}
