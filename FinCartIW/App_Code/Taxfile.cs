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
using System.Data.SqlClient;
using System.Configuration;

/// <summary>
/// Summary description for Taxfile
/// </summary>
public class Taxfile
{
    SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ToString());
    public Taxfile()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public string client_id { get; set; }
    public string email_id { get; set; }
    public string password { get; set; }
    public string channel { get; set; }
    public string HardCodedUserID { get; set; }
    public string HardCodedPassword { get; set; }
    //
    public string grant_type { get; set; }
    public string access_token { get; set; }
    public string token_type { get; set; }
    public string expires_in { get; set; }
    //
    public string Login_message { get; set; }
    public bool Save_message { get; set; }
    //
    public string first_name { get; set; }
    public string last_name { get; set; }
    public string middle_name { get; set; }
    public string pan { get; set; }
    public string dob { get; set; }

    public string mobile_no { get; set; }
    //
    public string flat_Door { get; set; }
    public string building { get; set; }
    public string road_Street { get; set; }
    public string area_Locality { get; set; }
    public string city { get; set; }
    public string state { get; set; }
    public string pincode { get; set; }
    public string country { get; set; }
    //
    public bool primary_Account { get; set; }
    public string account_ID { get; set; }
    public string bank_Name { get; set; }
    public string ifsc { get; set; }
    public string account_Number { get; set; }
    public string account_Type { get; set; }
    //
    public bool isPassword { get; set; }
    public bool addcmt { get; set; }
    public string file_ID { get; set; }
    public string fileStream { get; set; }
    public string fileName { get; set; }
    public string fileType { get; set; }
    public string file_MIME { get; set; }
    public string fileID_Encrypted { get; set; }
    public string errorMessage { get; set; }


    public string Create_Account_HRBlock(string emailid, string password)
    {
        string msg = string.Empty;

        var request = (HttpWebRequest)WebRequest.Create("https://tax.hrblock.in/webapioa/api/Signup/createAccount");

        var postData = "email_id=" + emailid + "&password=" + password + "&channel=OA&HardCodedUserID=hrbandroidappuser&HardCodedPassword=#sdrtbcd1674#@fgotd@";

        var data = Encoding.ASCII.GetBytes(postData);

        request.Method = "POST";
        request.ContentType = "application/x-www-form-urlencoded";
        request.ContentLength = data.Length;

        using (var stream = request.GetRequestStream())
        {
            stream.Write(data, 0, data.Length);
        }

        var response = (HttpWebResponse)request.GetResponse();

        var responseString = new StreamReader(response.GetResponseStream()).ReadToEnd();

        msg = responseString;

        return msg;
    }
    public string Create_Token_HRBlock(string emailid, string password)
    {
        string msg = string.Empty;

        var request = (HttpWebRequest)WebRequest.Create("https://tax.hrblock.in/webapioa/createToken");

        var postData = "grant_type=password&email_id=" + emailid + "&password=" + password + "&HardCodedUserID=hrbandroidappuser&HardCodedPassword=#sdrtbcd1674#@fgotd@";

        var data = Encoding.ASCII.GetBytes(postData);

        request.Method = "POST";
        request.ContentType = "application/x-www-form-urlencoded";
        request.ContentLength = data.Length;

        using (var stream = request.GetRequestStream())
        {
            stream.Write(data, 0, data.Length);
        }

        var response = (HttpWebResponse)request.GetResponse();

        var responseString = new StreamReader(response.GetResponseStream()).ReadToEnd();

        msg = responseString;

        return msg;
    }
    public string Login_Account_HRBlock(string emailid, string password)
    {
        string msg = string.Empty;

        var request = (HttpWebRequest)WebRequest.Create("https://tax.hrblock.in/webapioa/api/Signup/Login");

        var postData = "email_id=" + emailid + "&password=" + password + "&channel=OA&HardCodedUserID=hrbandroidappuser&HardCodedPassword=#sdrtbcd1674#@fgotd@";

        var data = Encoding.ASCII.GetBytes(postData);

        request.Method = "POST";
        request.ContentType = "application/x-www-form-urlencoded";
        request.ContentLength = data.Length;

        using (var stream = request.GetRequestStream())
        {
            stream.Write(data, 0, data.Length);
        }

        var response = (HttpWebResponse)request.GetResponse();

        var responseString = new StreamReader(response.GetResponseStream()).ReadToEnd();

        msg = responseString;

        return msg;
    }
    public string Save_Personal_details_HRBlock(string fname, string lname, string mname, string emailid, string pan, string dob, string mobile, string token)
    {
        string msg = string.Empty;

        var request = (HttpWebRequest)WebRequest.Create("https://tax.hrblock.in/webapioa/api/Personal/setPersonal");

        var postData = "{'first_name':'" + fname + "','last_name':'" + lname + "','middle_name':'" + mname + "','pan':'" + pan + "','dob':'" + dob + "','email_id':'" + emailid + "','mobile_no':'" + mobile + "'}";

        var data = Encoding.ASCII.GetBytes(postData);

        request.Method = "POST";
        request.ContentType = "application/json";
        request.ContentLength = data.Length;
        request.Headers.Add("Authorization", "bearer " + token);
        using (var stream = request.GetRequestStream())
        {
            stream.Write(data, 0, data.Length);
        }

        var response = (HttpWebResponse)request.GetResponse();

        var responseString = new StreamReader(response.GetResponseStream()).ReadToEnd();

        msg = responseString;

        return msg;
    }
    public string Get_Personal_details_HRBlock(string token)
    {
        string msg = string.Empty;

        var request = (HttpWebRequest)WebRequest.Create("https://tax.hrblock.in/webapioa/api/Personal/getPersonal");

        request.Method = "POST";
        request.Headers.Add("Authorization", "bearer " + token);

        var response = (HttpWebResponse)request.GetResponse();

        var responseString = new StreamReader(response.GetResponseStream()).ReadToEnd();

        msg = responseString;

        return msg;
    }
    public string Save_Address_details_HRBlock(string Flat_Door, string Building, string Road_Street, string Area_Locality, string City, string State, string Pincode, string Country, string token)
    {
        string msg = string.Empty;

        var request = (HttpWebRequest)WebRequest.Create("https://tax.hrblock.in/webapioa/api/Personal/saveAddressDetails");

        var postData = "{'Flat_Door':'" + Flat_Door + "','Building':'" + Building + "','Road_Street':'" + Road_Street + "','Area_Locality':'" + Area_Locality + "','City':'" + City + "','State':'" + State + "','Pincode':'" + Pincode + "','Country':'" + Country + "'}";

        var data = Encoding.ASCII.GetBytes(postData);

        request.Method = "POST";
        request.ContentType = "application/json";
        request.ContentLength = data.Length;
        request.Headers.Add("Authorization", "bearer " + token);
        using (var stream = request.GetRequestStream())
        {
            stream.Write(data, 0, data.Length);
        }

        var response = (HttpWebResponse)request.GetResponse();

        var responseString = new StreamReader(response.GetResponseStream()).ReadToEnd();

        msg = responseString;

        return msg;
    }
    public string Get_Address_details_HRBlock(string token)
    {
        string msg = string.Empty;

        var request = (HttpWebRequest)WebRequest.Create("https://tax.hrblock.in/webapioa/api/Personal/getAddressDetails");

        request.Method = "POST";
        request.Headers.Add("Authorization", "bearer " + token);

        var response = (HttpWebResponse)request.GetResponse();

        var responseString = new StreamReader(response.GetResponseStream()).ReadToEnd();

        msg = responseString;

        return msg;
    }
    public string Save_Bank_details_HRBlock(string Bank_Name, string IFSC, string Primary_Account, string Account_Number, string Account_Type, string token)
    {
        string msg = string.Empty;

        var request = (HttpWebRequest)WebRequest.Create("https://tax.hrblock.in/webapioa/api/Personal/saveBankDetails");

        var postData = "{'Bank_Name':'" + Bank_Name + "','IFSC':'" + IFSC + "','Primary_Account':'" + Primary_Account + "','Account_Number':'" + Account_Number + "','Account_Type':'" + Account_Type + "'}";

        var data = Encoding.ASCII.GetBytes(postData);

        request.Method = "POST";
        request.ContentType = "application/json";
        request.ContentLength = data.Length;
        request.Headers.Add("Authorization", "bearer " + token);
        using (var stream = request.GetRequestStream())
        {
            stream.Write(data, 0, data.Length);
        }

        var response = (HttpWebResponse)request.GetResponse();

        var responseString = new StreamReader(response.GetResponseStream()).ReadToEnd();

        msg = responseString;

        return msg;
    }
    public string Get_Bank_details_HRBlock(string token)
    {
        string msg = string.Empty;

        var request = (HttpWebRequest)WebRequest.Create("https://tax.hrblock.in/webapioa/api/Personal/getBankDetails");

        request.Method = "POST";
        request.Headers.Add("Authorization", "bearer " + token);

        var response = (HttpWebResponse)request.GetResponse();

        var responseString = new StreamReader(response.GetResponseStream()).ReadToEnd();

        msg = responseString;

        return msg;
    }
    public string Upload_Form16_HRBlock(string base64file, string fileName, string password, string token)
    {
        string msg = string.Empty;

        var request = (HttpWebRequest)WebRequest.Create("https://tax.hrblock.in/webapioa/api/Personal/Upload_File_base64");

        var postData = "{'base64file':'" + base64file + "','fileName':'" + fileName + "','password':'" + password + "'}";

        var data = Encoding.ASCII.GetBytes(postData);

        request.Method = "POST";
        request.ContentType = "application/json";
        request.ContentLength = data.Length;
        request.Headers.Add("Authorization", "bearer " + token);
        using (var stream = request.GetRequestStream())
        {
            stream.Write(data, 0, data.Length);
        }

        var response = (HttpWebResponse)request.GetResponse();

        var responseString = new StreamReader(response.GetResponseStream()).ReadToEnd();

        msg = responseString;

        return msg;
    }
    public string Get_Uploaded_Files_details_HRBlock(string token)
    {
        string msg = string.Empty;

        var request = (HttpWebRequest)WebRequest.Create("https://tax.hrblock.in/webapioa/api/Personal/getFiles");

        request.Method = "POST";
        request.Headers.Add("Authorization", "bearer " + token);

        var response = (HttpWebResponse)request.GetResponse();

        var responseString = new StreamReader(response.GetResponseStream()).ReadToEnd();

        msg = responseString;

        return msg;
    }
    public string Download_Form16_HRBlock(long File_ID, string token)
    {
        string msg = string.Empty;

        var request = (HttpWebRequest)WebRequest.Create("https://tax.hrblock.in/webapioa/api/Personal/GetfileArray");

        var postData = "{'File_ID':" + File_ID + "}";

        var data = Encoding.ASCII.GetBytes(postData);

        request.Method = "POST";
        request.ContentType = "application/json";
        request.ContentLength = data.Length;
        request.Headers.Add("Authorization", "bearer " + token);

        using (var stream = request.GetRequestStream())
        {
            stream.Write(data, 0, data.Length);
        }

        var response = (HttpWebResponse)request.GetResponse();

        var responseString = new StreamReader(response.GetResponseStream()).ReadToEnd();

        msg = responseString;

        return msg;
    }
    public string Get_Redirection_Url_HRBlock(string token)
    {
        string msg = string.Empty;

        var request = (HttpWebRequest)WebRequest.Create("https://tax.hrblock.in/webapioa/api/Signup/migrateToOA");

        request.Method = "POST";
        request.Headers.Add("Authorization", "bearer " + token);

        var response = (HttpWebResponse)request.GetResponse();

        var responseString = new StreamReader(response.GetResponseStream()).ReadToEnd();

        msg = responseString;

        return msg;
    }
    public string registertaxuser()
    {
        string res = string.Empty;

        SqlDataAdapter DA = new SqlDataAdapter(" " +

        " insert into fp_taxfilebasicdetails(client_id,email_id,password,occupation,nominee,CreatedDate,UpdatedDate,Status) " +
        " values('" + client_id + "','" + email_id + "','" + password + "','Salaried','',getdate(),getdate(),1) " +
        "  ", Con);

        DataSet DS = new DataSet();

        Con.Open();
        DA.Fill(DS);
        Con.Close();

        SqlDataAdapter DA1 = new SqlDataAdapter(" " +
" insert into fp_taxfilebankdetails(email_id,CreatedDate,UpdatedDate,Status) " +
" values('" + email_id + "',getdate(),getdate(),1) " +
"  ", Con);

        DataSet DS1 = new DataSet();

        Con.Open();
        DA1.Fill(DS1);
        Con.Close();

        SqlDataAdapter DA2 = new SqlDataAdapter(" " +
" insert into fp_taxfileuploadedfilesdetails(email_id,CreatedDate,UpdatedDate,Status) " +
" values('" + email_id + "',getdate(),getdate(),1) " +
"  ", Con);

        DataSet DS2 = new DataSet();

        Con.Open();
        DA2.Fill(DS2);
        Con.Close();

        SqlDataAdapter DAuserkey = new SqlDataAdapter(" " +

                " select email_id from fp_taxfilebasicdetails where email_id='" + email_id + "' and password='" + password + "' " +
                "  ", Con);

        DataSet DSuserkey = new DataSet();

        Con.Open();
        DAuserkey.Fill(DSuserkey);
        Con.Close();

        if (DSuserkey.Tables[0].Rows.Count > 0)
        {
            res = DSuserkey.Tables[0].Rows[0]["email_id"].ToString();
        }
        return res;
    }
    public string updatetaxuser()
    {
        string res = string.Empty;

        SqlDataAdapter DA = new SqlDataAdapter(" " +

         " update fp_taxfilebasicdetails set first_name='" + first_name + "',middle_name='" + middle_name + "',last_name='" + last_name + "',pan='" + pan + "',dob='" + dob + "',mobile_no='" + mobile_no + "' " +
         " ,flat_Door='" + flat_Door + "',building='" + building + "',road_Street='" + road_Street + "',area_Locality='" + area_Locality + "',city='" + city + "',state='" + state + "' " +
         " ,pincode='" + pincode + "',country='" + country + "',UpdatedDate=getdate() where email_id='" + email_id + "' ", Con);

        DataSet DS = new DataSet();

        Con.Open();
        DA.Fill(DS);
        Con.Close();

        SqlDataAdapter DA1 = new SqlDataAdapter(" " +
" update fp_taxfilebankdetails set primary_account=" + Convert.ToInt32(primary_Account) + ",account_id='" + account_ID + "',bank_name='" + bank_Name + "',ifsc='" + ifsc + "',account_number='" + account_Number + "' " +
" ,account_type='" + account_Type + "',UpdatedDate=getdate() where email_id='" + email_id + "' " +
"  ", Con);

        DataSet DS1 = new DataSet();

        Con.Open();
        DA1.Fill(DS1);
        Con.Close();

        SqlDataAdapter DA2 = new SqlDataAdapter(" " +
" update fp_taxfileuploadedfilesdetails  set isPassword=" + Convert.ToInt32(isPassword) + ", addcmt=" + Convert.ToInt32(addcmt) + ", file_ID='" + file_ID + "', fileStream='" + fileStream + "' " +
" ,fileName='" + fileName + "', fileType='" + fileType + "', file_MIME='" + file_MIME + "', fileID_Encrypted='" + fileID_Encrypted + "', errorMessage='" + errorMessage + "' " +
" ,UpdatedDate=getdate() where email_id='" + email_id + "' ", Con);

        DataSet DS2 = new DataSet();

        Con.Open();
        DA2.Fill(DS2);
        Con.Close();

        SqlDataAdapter DAuserkey = new SqlDataAdapter(" " +

                " select email_id from fp_taxfilebasicdetails where email_id='" + email_id + "' and password='" + password + "' " +
                "  ", Con);

        DataSet DSuserkey = new DataSet();

        Con.Open();
        DAuserkey.Fill(DSuserkey);
        Con.Close();

        if (DSuserkey.Tables[0].Rows.Count > 0)
        {
            res = DSuserkey.Tables[0].Rows[0]["email_id"].ToString();
        }
        return res;
    }
    public string checktaxuser()
    {
        string res = string.Empty;

        SqlDataAdapter DAuserkey = new SqlDataAdapter(" " +

                " select email_id from fp_taxfilebasicdetails where email_id='" + email_id + "' and password='" + password + "' " +
                "  ", Con);

        DataSet DSuserkey = new DataSet();

        Con.Open();
        DAuserkey.Fill(DSuserkey);
        Con.Close();

        if (DSuserkey.Tables[0].Rows.Count > 0)
        {
            res = DSuserkey.Tables[0].Rows[0]["email_id"].ToString();
        }
        return res;
    }
    public DataSet gettaxuserdetails()
    {
        SqlDataAdapter DAuserkey = new SqlDataAdapter(" " +
                " select * from fp_taxfilebasicdetails where email_id='" + email_id + "' " +
                " select * from fp_taxfilebankdetails where email_id='" + email_id + "' " +
                " select * from fp_taxfileuploadedfilesdetails where email_id='" + email_id + "' " +
                "  ", Con);

        DataSet DSuserkey = new DataSet();

        Con.Open();
        DAuserkey.Fill(DSuserkey);
        Con.Close();

        return DSuserkey;
    }
}