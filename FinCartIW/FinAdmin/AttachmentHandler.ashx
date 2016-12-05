<%@ WebHandler Language="C#" Class="AttachmentHandler" %>

using System;
using System.Web;

public class AttachmentHandler : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        if (context.Request.Files.Count > 0)
        {
             try
             {
                 HttpFileCollection files = context.Request.Files;
                 //for (int i = 0; i < files.Count; i++)
                 //{
                 //    HttpPostedFile file = files[i];
                 //    string filepath = "~/uploads/" + file.FileName;
                 //    string fname = context.Server.MapPath(filepath);
                 //    file.SaveAs(fname);
                 //}

                 HttpPostedFile file = files[0];
                 string filepath = "/Admin/TicketAttachments/" + Guid.NewGuid().ToString()+"_" + file.FileName.Replace(" ","_");
                 string fname = context.Server.MapPath(filepath);
                 file.SaveAs(fname);

                 context.Response.ContentType = "text/plain";
                 context.Response.Write(filepath);
             }
             catch (Exception ex)
             {
                 context.Response.ContentType = "text/plain";
                 context.Response.Write("");
             }
        }    
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}