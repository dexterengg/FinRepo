using System;
using System.Collections;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.Xml.Linq;
using System.Data;
using System.Configuration;
using System.Collections.Generic;
using System.Collections;

using AjaxControlToolkit;
using System.Data.SqlClient;

/// <summary>
/// Summary description for WebService
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
// [System.Web.Script.Services.ScriptService]
[System.Web.Script.Services.ScriptService]
public class WebService : System.Web.Services.WebService
{


    SqlConnection mycon = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ToString());



    [WebMethod]
    public string[] GetScheme(string prefixText, int count)
    {
        // int count = 10;
        string sql = " Select Name=sname,Code=exlcode, objective  from schmst where sname like @prefixText and " +
              " objective<>'ULIP' and sname not like '~%' and fcode not in ('E0001','E0000','F0000','F0001','E1001') " +
              " and close_Date is NULL and ACT_INact='Y' and viewstatus='Y' order by 1 ";
        SqlDataAdapter da = new SqlDataAdapter(sql, mycon);
        //”Your Connection String Comes Here”));
        da.SelectCommand.Parameters.Add("@prefixText",
            SqlDbType.VarChar, 50).Value = "%" + prefixText + "%";
        DataTable dt = new DataTable();
        da.Fill(dt);
        List<string> custList = new List<string>();
        string custItem = string.Empty;
        string[] items = new string[dt.Rows.Count];
        int i = 0;
        foreach (DataRow dr in dt.Rows)
        {
            //custItem = AutoCompleteExtender.CreateAutoCompleteItem(dr[0].ToString(), dr[1].ToString());
            //custList.Add(custItem);

            //items.SetValue(dr["Name"].ToString(), i);
            items[i] = AjaxControlToolkit.AutoCompleteExtender.CreateAutoCompleteItem(dr[0].ToString(), dr[1].ToString());
            i++;
        }
        return items.ToArray();
    }


}

