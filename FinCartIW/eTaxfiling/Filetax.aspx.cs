using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Net;
using System.Text;
using System.IO;
using Json;
using System.Web.Script.Serialization;
public partial class eTaxfilling_Filetax : System.Web.UI.Page
{
    LeadTracker lt = new LeadTracker();
    Taxfile tax = new Taxfile();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["userSessionID"] == null)
            {
                Response.Redirect("Registration");
            }
            else
            {
                lt.TrackLead("taxid", "d19cfcdc7a524dcfb204184941966737", "Tax_Filling");
                lt.campaign_lead_capture(Session["userSessionID"].ToString(), "d19cfcdc7a524dcfb204184941966737");
                BindUserDetails();
            }
        }
        else
        {
            divprocessing.Visible = true;
            divmain.Visible = false;
            divthankyou.Visible = false;
            sucsess.Visible = false;
            failure.Visible = false;
        }

    }
    void BindUserDetails()
    {
        DataTable dt = lt.UserDetailsByEmailId(Session["userSessionID"].ToString());

        if (dt.Rows.Count > 0)
        {
            Session["pass"] = Convert.ToString(dt.Rows[0]["Pwd"]);
            tax.email_id = Session["userSessionID"].ToString();
            tax.password = Session["pass"].ToString();

            if (!String.IsNullOrWhiteSpace(tax.checktaxuser()))
            {
                DataSet ds = tax.gettaxuserdetails();
                emailaddresspersonal.Value = ds.Tables[0].Rows[0]["email_id"].ToString();
                firstname.Value = ds.Tables[0].Rows[0]["first_name"].ToString();
                middlename.Value = ds.Tables[0].Rows[0]["middle_name"].ToString();
                lastname.Value = ds.Tables[0].Rows[0]["last_name"].ToString();
                pancard.Value = ds.Tables[0].Rows[0]["pan"].ToString();
                dob.Value = ds.Tables[0].Rows[0]["dob"].ToString();
                mobilenumber.Value = ds.Tables[0].Rows[0]["mobile_no"].ToString();

                flatdoor.Value = ds.Tables[0].Rows[0]["flat_Door"].ToString();
                Building.Value = ds.Tables[0].Rows[0]["building"].ToString();
                roadstreet.Value = ds.Tables[0].Rows[0]["road_Street"].ToString();
                arealocality.Value = ds.Tables[0].Rows[0]["area_Locality"].ToString();
                city.Value = ds.Tables[0].Rows[0]["city"].ToString();
                state.Value = ds.Tables[0].Rows[0]["state"].ToString();
                pincode.Value = ds.Tables[0].Rows[0]["pincode"].ToString();
                country.Value = ds.Tables[0].Rows[0]["country"].ToString();

                dd_primaryaccount.SelectedValue = Convert.ToBoolean(ds.Tables[1].Rows[0]["primary_account"]).ToString().ToLower();
                bankaccountnumber.Value = ds.Tables[1].Rows[0]["account_number"].ToString();
                IFSCcode.Value = ds.Tables[1].Rows[0]["ifsc"].ToString();
                bankname.Value = ds.Tables[1].Rows[0]["bank_name"].ToString();
                dd_accounttype.SelectedValue = ds.Tables[1].Rows[0]["account_type"].ToString();
            }
            else
            {
                string Name = Convert.ToString(dt.Rows[0]["Name"]);

                if (!String.IsNullOrWhiteSpace(Name))
                {
                    string[] namearr = Name.Split(' ');
                    if (namearr.Length > 2)
                    {
                        firstname.Value = namearr[0];
                        middlename.Value = namearr[1];
                        lastname.Value = namearr[2];
                    }
                    else if (namearr.Length > 1)
                    {
                        firstname.Value = namearr[0];
                        lastname.Value = namearr[1];
                    }
                    else
                    {
                        firstname.Value = namearr[0];
                    }
                }

                emailaddresspersonal.Value = Session["userSessionID"].ToString();
                mobilenumber.Value = Convert.ToString(dt.Rows[0]["Mobile1"]);
                dob.Value = Convert.ToString(dt.Rows[0]["DOB"]);
                pancard.Value = Convert.ToString(dt.Rows[0]["PAN"]);

                //flatdoor.Value = "";
                //roadstreet.Value = "";
                //arealocality.Value = "";
                city.Value = Convert.ToString(dt.Rows[0]["City"]);
                state.Value = Convert.ToString(dt.Rows[0]["State"]);
                pincode.Value = Convert.ToString(dt.Rows[0]["Pin"]);
                country.Value = Convert.ToString(dt.Rows[0]["Country"]);

                //bankaccountnumber.Value = "";
                //IFSCcode.Value = "";
                //bankname.Value = "";
                //dd_accounttype.SelectedValue = "";
            }
        }
    }
    protected void taxfileButton_Click(object sender, EventArgs e)
    {
        try
        {

            string result = string.Empty;

            result = tax.Login_Account_HRBlock(emailaddresspersonal.Value.Trim(), Convert.ToString(Session["pass"]));
            if (!String.IsNullOrWhiteSpace(result))
            {
                dynamic data = JsonParser.Deserialize(result);
                tax.email_id = emailaddresspersonal.Value.Trim();
                tax.password = Convert.ToString(Session["pass"]);
                tax.Login_message = data.message;
                tax.client_id = Convert.ToString(data.client_id);
            }

            if (tax.Login_message != "LoginSuccess")
            {
                result = tax.Create_Account_HRBlock(emailaddresspersonal.Value.Trim(), Convert.ToString(Session["pass"]));
                if (!String.IsNullOrWhiteSpace(result))
                {
                    dynamic data = JsonParser.Deserialize(result);
                    tax.email_id = emailaddresspersonal.Value.Trim();
                    tax.password = Convert.ToString(Session["pass"]);
                    tax.Login_message = data.message == "" ? "LoginSuccess" : data.message;
                    tax.client_id = Convert.ToString(data.client_id);
                }
            }

            if (tax.Login_message == "LoginSuccess")
            {
                result = tax.Create_Token_HRBlock(emailaddresspersonal.Value.Trim(), Convert.ToString(Session["pass"]));
                if (!String.IsNullOrWhiteSpace(result))
                {
                    dynamic data = JsonParser.Deserialize(result);
                    tax.access_token = data.access_token;
                    tax.token_type = data.token_type;
                    tax.expires_in = Convert.ToString(data.expires_in);

                    result = tax.Save_Personal_details_HRBlock(firstname.Value.Trim(), lastname.Value.Trim(), middlename.Value.Trim(), emailaddresspersonal.Value.Trim(), pancard.Value.Trim(), dob.Value.Trim(), mobilenumber.Value.Trim(), tax.access_token);
                    if (!String.IsNullOrWhiteSpace(result))
                    {
                        data = JsonParser.Deserialize(result);
                        tax.Save_message = data.result;
                        if (tax.Save_message)
                        {
                            result = tax.Get_Personal_details_HRBlock(tax.access_token);
                            if (!String.IsNullOrWhiteSpace(result))
                            {
                                data = JsonParser.Deserialize(result);
                                tax.first_name = data.first_name;
                                tax.middle_name = data.middle_name;
                                tax.last_name = data.last_name;
                                tax.pan = data.pan;
                                tax.dob = data.dob;
                                tax.mobile_no = data.mobile_no;

                                result = tax.Save_Address_details_HRBlock(flatdoor.Value.Trim(), Building.Value.Trim(), roadstreet.Value.Trim(), arealocality.Value.Trim(), city.Value.Trim(), state.Value.Trim(), pincode.Value.Trim(), country.Value.Trim(), tax.access_token);
                                if (!String.IsNullOrWhiteSpace(result))
                                {
                                    data = JsonParser.Deserialize(result);
                                    tax.Save_message = data.result;
                                    if (tax.Save_message)
                                    {
                                        result = tax.Get_Address_details_HRBlock(tax.access_token);
                                        if (!String.IsNullOrWhiteSpace(result))
                                        {
                                            data = JsonParser.Deserialize(result);
                                            tax.flat_Door = Convert.ToString(data.flat_door);
                                            tax.building = data.building;
                                            tax.road_Street = data.road_street;
                                            tax.area_Locality = data.area_locality;
                                            tax.city = data.city;
                                            tax.state = data.state;
                                            tax.pincode = data.pincode;
                                            tax.country = data.country;

                                            result = tax.Save_Bank_details_HRBlock(bankname.Value.Trim(), IFSCcode.Value.Trim(), dd_primaryaccount.SelectedValue, bankaccountnumber.Value.Trim(), dd_accounttype.SelectedValue, tax.access_token);
                                            if (!String.IsNullOrWhiteSpace(result))
                                            {
                                                data = JsonParser.Deserialize(result);
                                                tax.Save_message = data.result;
                                                if (tax.Save_message)
                                                {
                                                    result = tax.Get_Bank_details_HRBlock(tax.access_token);
                                                    if (!String.IsNullOrWhiteSpace(result))
                                                    {
                                                        List<bankdetails> bankdetail = new JavaScriptSerializer().Deserialize<List<bankdetails>>(result);

                                                        tax.primary_Account = bankdetail[bankdetail.Count - 1].primary_account;
                                                        tax.account_ID = bankdetail[bankdetail.Count - 1].account_id;
                                                        tax.bank_Name = bankdetail[bankdetail.Count - 1].bank_name;
                                                        tax.ifsc = bankdetail[bankdetail.Count - 1].ifsc;
                                                        tax.account_Number = bankdetail[bankdetail.Count - 1].account_number;
                                                        tax.account_Type = bankdetail[bankdetail.Count - 1].account_type;

                                                        if (FileUpload1.HasFile)
                                                        {
                                                            result = tax.Upload_Form16_HRBlock(Convert.ToBase64String(FileUpload1.FileBytes), FileUpload1.FileName, pdfpassword.Value.Trim(), tax.access_token);
                                                            if (!String.IsNullOrWhiteSpace(result))
                                                            {
                                                                data = JsonParser.Deserialize(result);
                                                                tax.Save_message = data.result;
                                                                if (tax.Save_message)
                                                                {
                                                                    result = tax.Get_Uploaded_Files_details_HRBlock(tax.access_token);
                                                                    //result = tax.Download_Form16_HRBlock(fileid, token);
                                                                    if (!String.IsNullOrWhiteSpace(result))
                                                                    {
                                                                        List<uploadedfilesdetails> uploadedfilesdetail = new JavaScriptSerializer().Deserialize<List<uploadedfilesdetails>>(result);
                                                                        tax.isPassword = uploadedfilesdetail[uploadedfilesdetail.Count - 1].ispassword;
                                                                        tax.addcmt = uploadedfilesdetail[uploadedfilesdetail.Count - 1].addcmt;
                                                                        tax.file_ID = uploadedfilesdetail[uploadedfilesdetail.Count - 1].file_id;
                                                                        tax.fileStream = uploadedfilesdetail[uploadedfilesdetail.Count - 1].filestream;
                                                                        tax.fileName = uploadedfilesdetail[uploadedfilesdetail.Count - 1].filename;
                                                                        tax.fileType = uploadedfilesdetail[uploadedfilesdetail.Count - 1].filetype;
                                                                        tax.file_MIME = uploadedfilesdetail[uploadedfilesdetail.Count - 1].file_mime;
                                                                        tax.fileID_Encrypted = uploadedfilesdetail[uploadedfilesdetail.Count - 1].fileid_encrypted;
                                                                        tax.errorMessage = uploadedfilesdetail[uploadedfilesdetail.Count - 1].errormessage;

                                                                        if (!String.IsNullOrWhiteSpace(tax.checktaxuser()))
                                                                        {
                                                                            tax.updatetaxuser();

                                                                            result = tax.Get_Redirection_Url_HRBlock(tax.access_token);
                                                                            if (!String.IsNullOrWhiteSpace(result))
                                                                            {
                                                                                data = JsonParser.Deserialize(result);
                                                                                Response.Clear();
                                                                                System.Text.StringBuilder sb = new System.Text.StringBuilder();
                                                                                sb.Append("<html>");
                                                                                sb.AppendFormat(@"<body onload='document.forms[""form""].submit()'>");
                                                                                sb.AppendFormat("<form name='form' action='{0}' method='post'>", "https://tax.hrblock.in/corporate_partners/input.aspx");
                                                                                sb.AppendFormat("<input type='hidden' name='tInputInfo' value='{0}'>", data.result);
                                                                                sb.Append("</form>");
                                                                                sb.Append("</body>");
                                                                                sb.Append("</html>");
                                                                                Response.Write(sb.ToString());
                                                                                Response.End();
                                                                            }

                                                                            divprocessing.Visible = false;
                                                                            divmain.Visible = false;
                                                                            divthankyou.Visible = true;
                                                                            sucsess.Visible = true;
                                                                            failure.Visible = false;
                                                                            taxfileButton.Visible = false;
                                                                        }
                                                                        else
                                                                        {
                                                                            tax.registertaxuser();
                                                                            tax.updatetaxuser();

                                                                            result = tax.Get_Redirection_Url_HRBlock(tax.access_token);
                                                                            if (!String.IsNullOrWhiteSpace(result))
                                                                            {
                                                                                data = JsonParser.Deserialize(result);
                                                                                Response.Clear();
                                                                                System.Text.StringBuilder sb = new System.Text.StringBuilder();
                                                                                sb.Append("<html>");
                                                                                sb.AppendFormat(@"<body onload='document.forms[""form""].submit()'>");
                                                                                sb.AppendFormat("<form name='form' action='{0}' method='post'>", "https://tax.hrblock.in/corporate_partners/input.aspx");
                                                                                sb.AppendFormat("<input type='hidden' name='tInputInfo' value='{0}'>", data.result);
                                                                                sb.Append("</form>");
                                                                                sb.Append("</body>");
                                                                                sb.Append("</html>");
                                                                                Response.Write(sb.ToString());
                                                                                Response.End();
                                                                            }

                                                                            divprocessing.Visible = false;
                                                                            divmain.Visible = false;
                                                                            divthankyou.Visible = true;
                                                                            sucsess.Visible = true;
                                                                            failure.Visible = false;
                                                                            taxfileButton.Visible = false;
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        catch (Exception ex)
        {

            divprocessing.Visible = false;
            divmain.Visible = false;
            divthankyou.Visible = true;
            sucsess.Visible = false;
            failure.Visible = true;
            taxfileButton.Visible = false;
        }

    }
    protected void lnkbtn_refile_Click(object sender, EventArgs e)
    {
        Response.Redirect("Filetax");
    }
    protected void lnkbtn_home_Click(object sender, EventArgs e)
    {
        Response.Redirect("../Default");
    }
}
public class bankdetails
{
    public bool primary_account;
    public string account_id;
    public string bank_name;
    public string ifsc;
    public string account_number;
    public string account_type;
}
public class uploadedfilesdetails
{
    public bool ispassword;
    public bool addcmt;
    public string file_id;
    public string filestream;
    public string filename;
    public string filetype;
    public string file_mime;
    public string fileid_encrypted;
    public string errormessage;
}