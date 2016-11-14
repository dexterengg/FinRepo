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

public partial class Admin_LMSDocument : System.Web.UI.Page
{
    SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ToString());
    string xStr = "";
    SqlCommand cmd;    

    protected void Page_Load(object sender, EventArgs e)
    {
        ViewState["xClientCode"] = Request.QueryString["clientcode"];
        ViewState["xPlannerCode"] = Request.QueryString["plannercode"];

        if (!IsPostBack)
        {
            // select for Investor Name                                
            SqlDataAdapter InvGDA = new SqlDataAdapter(" " +

                    " select * from fp_Prospects where Code='" + ViewState["xClientCode"] + "' " +
                    "  ", Con);

            DataSet InvGDS = new DataSet();
            Con.Open();
            InvGDA.Fill(InvGDS);
            Con.Close();

            if (InvGDS.Tables[0].Rows.Count > 0)
            {
                lblInvName.Text = InvGDS.Tables[0].Rows[0]["Name"].ToString();
            }            

            FillGridLMS_Document();
        } 
        
    }

    void FillGridLMS_Document()
    {
        if ((string)Session["AdminSessionID"] != null)
        {
            string xCode = Session["AdminSessionID"].ToString();

            SqlDataAdapter GDA = new SqlDataAdapter(" " +

                    " select Code, DDate=Convert(varchar(11),EntryDate,113), FileType, "+
                    " ClientNAme=(Select Name from fp_Prospects where Code=fd.clientcode), FileName, "+
                    " PlannerName=(select PlannerName from fp_Planner where Code=fd.PlannerCode ) "+
                    " from fp_Documentdetail fd where clientCode=" + ViewState["xClientCode"] + "  " +                    
                    "  ", Con);

            DataSet GDS = new DataSet();
            Con.Open();
            GDA.Fill(GDS);
            Con.Close();

            GridViewDocument.DataSource = GDS;
            GridViewDocument.DataBind();


        }
        else
        {
            Response.Redirect("SessionExpired.aspx");
        }
    }

    protected void GridViewDocument_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        if ((string)Session["AdminSessionID"] != null)
        {

            // select fileName

            string xFileName = "";
            SqlDataAdapter GDA = new SqlDataAdapter(" " +

                    " select FileName from fp_Documentdetail where Code='" + Convert.ToInt32(GridViewDocument.DataKeys[e.RowIndex].Value.ToString()) + "' " +
                    "  ", Con);

            DataSet GDS = new DataSet();
            Con.Open();
            GDA.Fill(GDS);
            Con.Close();

            if (GDS.Tables[0].Rows.Count > 0)
            {
                xFileName = GDS.Tables[0].Rows[0]["FileName"].ToString();
            }

            string path = Server.MapPath("~/Admin/Documents/" + xFileName);
            FileInfo file = new FileInfo(path);
            if (file.Exists)//check file exsit or not
            {
                file.Delete();
            }

            GridViewRow row = (GridViewRow)GridViewDocument.Rows[e.RowIndex];
            Con.Open();
            SqlCommand cmd = new SqlCommand("delete FROM fp_Documentdetail where Code='" + Convert.ToInt32(GridViewDocument.DataKeys[e.RowIndex].Value.ToString()) + "'", Con);
            cmd.ExecuteNonQuery();
            Con.Close();

            FillGridLMS_Document();
        }
        else
        {
            Response.Redirect("SessionExpired.aspx");
        }
    }
    protected void DocumentSubmit_click(object sender, EventArgs e)
    {
        if ((string)Session["AdminSessionID"] != null)
        {

            string[] validFileTypes = { "pdf", "doc", "xls" };
            string ext = System.IO.Path.GetExtension(txtFinametricaFile.PostedFile.FileName);
            bool isValidFile = false;
            for (int i = 0; i < validFileTypes.Length; i++)
            {
                if (ext == "." + validFileTypes[i])
                {
                    isValidFile = true;
                    break;
                }
            }
            if (!isValidFile)
            {
                Label1.ForeColor = System.Drawing.Color.Red;
                Label1.Text = "Invalid File. Please upload a File with extension " +  string.Join(", ", validFileTypes);                
            }
            else
            {

                if (txtFinametricaFile.HasFile)
                {
                    try
                    {
                        string filename = Path.GetFileName(txtFinametricaFile.FileName);
                        txtFinametricaFile.SaveAs(Server.MapPath("~/Admin/Documents/") + ViewState["xClientCode"] + "" + filename);
                        txtFileNotUpload.Text = "Upload status: File uploaded!";

                        SqlCommand cmd;

                        xStr = " Insert into fp_Documentdetail(ClientCode,FileType,FileName,PlannerCode,EntryDate)   " +
                            " values(" + ViewState["xClientCode"] + ",'" + txtFileType.SelectedValue + "', " +
                            " '" + ViewState["xClientCode"] + filename + "', '" + ViewState["xPlannerCode"] + "', " +
                            "  '" + Convert.ToDateTime(System.DateTime.Now).ToString("yyyy-MM-dd") + "' " +
                            " ) ";
                        cmd = new SqlCommand(xStr, Con);
                        Con.Open();
                        cmd.ExecuteNonQuery();
                        Con.Close();

                    }
                    catch (Exception ex)
                    {
                        txtFileNotUpload.Text = "Upload status: The file could not be uploaded. The following error occured: " + ex.Message;
                    }
                }
                else
                {
                    txtFileNotUpload.Text = "Select a file for upload";
                }

                FillGridLMS_Document();
            }
        }
        else
        {
            Response.Redirect("SessionExpired.aspx");
        }
    }
}