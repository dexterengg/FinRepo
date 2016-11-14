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

public partial class Admin_WorkshopCourses : System.Web.UI.Page
{
    SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ToString());
    string xStr = "";
    SqlCommand cmd;
    string xClientCode = ""; 

    protected void Page_Load(object sender, EventArgs e)
    {
        ViewState["xUserID"] = Session["AdminSessionID"].ToString();
        ViewState["xPRole"] = Session["LoginRole"].ToString();

        

        if (!IsPostBack)
        {
            if (ViewState["xPRole"].ToString() == "Admin")
            {
                WSCourseEntry.Visible = true;
            }
            else
            {
                WSCourseEntry.Visible = false;
            }

            
            FillGrid_CourseDetail();
        }
    }
    protected void WSCourseSubmit_click(object sender, EventArgs e)
    {
        if ((string)Session["AdminSessionID"] != null)
        {

        string xCourseDt = "NULL";
        if (txtCourseDate.Text != "")
        {
            xCourseDt = "'" + txtCourseDate.Text.Substring(6, 4) + '-' + txtCourseDate.Text.Substring(3, 2) + '-' + txtCourseDate.Text.Substring(0, 2) + "'";
        }

        xStr = " Insert into fp_WorkShop(CourseName,CourseDate,CourseTime,Location,Price,CourseDescription, " +
                " SpeakerName,SpeakerDetails,VideoURL1,VideoURL2,WSStatus,EditDate)   " +
                " values('" + txtCourseName.Text + "'," + xCourseDt + ",'" + txtCourseTime.Text + "','" + txtLocation.Text + "', " +
                " '" + ddCoursePrice.SelectedValue + "', '" + txtCourseDescription.Value + "', '" + txtSpeakerName.Text + "', " +
                " '" + txtSpeakerDetails.Text + "','" + txtVideo1.Text + "', '" + txtVideo2.Text + "','Y', " +
                " '" + Convert.ToDateTime(System.DateTime.Now).ToString("yyyy-MM-dd") + "' " +                
                " ) ";
        cmd = new SqlCommand(xStr, Con);
        Con.Open();
        cmd.ExecuteNonQuery();
        Con.Close();
        FillGrid_CourseDetail();

        txtCourseName.Text = "";
        txtCourseTime.Text = "";
        txtCourseDate.Text = "";
        txtLocation.Text = "";
        txtCourseDescription.Value = "";
        txtSpeakerName.Text = "";
        txtSpeakerDetails.Text = "";
        txtVideo1.Text = "";
        txtVideo2.Text = "";

        ShowPopupMessage("Data Submitted Successfully!", PopupMessageType.Success);

        }
        else
        {
            Response.Redirect("SessionExpired.aspx");
        }
    }

    void FillGrid_CourseDetail()
    {
        if ((string)Session["AdminSessionID"] != null)
        {
            string xCode = Session["AdminSessionID"].ToString();

            SqlDataAdapter GDA = new SqlDataAdapter(" " +

                    " select Code,CourseName,CourseDT=convert(varchar(11),CourseDate,105), CourseTime,Location, "+
                    " Price,CourseDescription,SpeakerName,SpeakerDetails, "+
                    " VideoURL1,VideoURL2 from fp_WorkShop where WSStatus='Y' " +                    
                    "  ", Con);

            DataSet GDS = new DataSet();
            Con.Open();
            GDA.Fill(GDS);
            Con.Close();

            GridViewCourse.DataSource = GDS;
            GridViewCourse.DataBind();


        }
        else
        {
            Response.Redirect("SessionExpired.aspx");
        }
    }

    protected void GridViewCourse_OnRowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //Label xCDate = (Label)e.Row.Cells[2].FindControl("lblCourseADate");
            //xCDate.BackColor = System.Drawing.Color.Transparent;
        }

    }

    protected void GridViewCourse_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        if ((string)Session["AdminSessionID"] != null)
        {
            string xCode = Session["AdminSessionID"].ToString();

            GridViewRow row = (GridViewRow)GridViewCourse.Rows[e.RowIndex];

            Con.Open();
            SqlCommand cmd = new SqlCommand("delete FROM fp_WorkShop where Code='" + Convert.ToInt32(GridViewCourse.DataKeys[e.RowIndex].Value.ToString()) + "'", Con);
            cmd.ExecuteNonQuery();
            Con.Close();
            FillGrid_CourseDetail();
        }
        else
        {
            Response.Redirect("SessionExpired.aspx");
        }
    }
    protected void GridViewCourse_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridViewCourse.EditIndex = -1;
        FillGrid_CourseDetail();
    }
    protected void GridViewCourse_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridViewCourse.EditIndex = e.NewEditIndex;
        FillGrid_CourseDetail();
    }
    protected void GridViewCourse_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int code = Convert.ToInt32(GridViewCourse.DataKeys[e.RowIndex].Value.ToString());
        GridViewRow row = (GridViewRow)GridViewCourse.Rows[e.RowIndex];

        TextBox textCourseName = (TextBox)row.Cells[1].Controls[0];
        TextBox textCourseTime = (TextBox)row.Cells[3].Controls[0];
        TextBox textLocation = (TextBox)row.Cells[4].Controls[0];
        TextBox textSpeakerName = (TextBox)row.Cells[5].Controls[0];
        TextBox textSpeakerDetail = (TextBox)row.Cells[6].Controls[0];
        TextBox textCourseDetail = (TextBox)row.Cells[7].Controls[0];
        TextBox textVideoURL1 = (TextBox)row.Cells[8].Controls[0];
        TextBox txtCourseDt = row.FindControl("txtCourseDate") as TextBox;
        String xAcDte = txtCourseDt.Text;

        String xAcDt = "'" + xAcDte.Substring(6, 4) + '-' + xAcDte.Substring(3, 2) + '-' + xAcDte.Substring(0, 2) + "'";


        GridViewCourse.EditIndex = -1;
        Con.Open();

        SqlCommand cmd = new SqlCommand("update fp_Workshop set CourseName='" + textCourseName.Text + "', " +
            " CourseDate=" + xAcDt + ", CourseTime='" + textCourseTime.Text + "', Location='" + textLocation.Text + "', "+
            " SpeakerName='" + textSpeakerName.Text + "',  SpeakerDetails='" + textSpeakerDetail .Text+ "', "+
            " CourseDescription='" + textCourseDetail.Text + "', VideoURL1='" + textVideoURL1 .Text+ "' " +
            "  where code='" + code + "'", Con);

        cmd.ExecuteNonQuery();
        Con.Close();
        FillGrid_CourseDetail();
    }

    /// <summary>
    /// Details: Change modal popup image according to PopupMessageType
    /// </summary>
    /// <param name="message"></param>
    /// <param name="messageType"></param>
    private void ShowPopupMessage(string message, PopupMessageType messageType)
    {
        switch (messageType)
        {

            case PopupMessageType.Success:
                lblMessagePopupHeading.Text = "Success";

                break;
            default:
                lblMessagePopupHeading.Text = "Information";

                break;
        }

        lblMessagePopupText.Text = message;
        mpeMessagePopup.Show();
        //formtop.Style.Add("display", "none");
    }

    /// <summary>
    /// Message type enum
    /// </summary>
    public enum PopupMessageType
    {
        Error,
        Message,
        Warning,
        Success
    }
    protected void GridViewCourse_RowCreated(object sender, GridViewRowEventArgs e)
    {
        if (ViewState["xPRole"].ToString() == "Operator" || ViewState["xPRole"].ToString() == "Planner")
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Cells[9].Visible = false;
                e.Row.Cells[10].Visible = false;                
            }

            if (e.Row.RowType == DataControlRowType.Header)
            {
                e.Row.Cells[9].Visible = false;
                e.Row.Cells[10].Visible = false;                
            }
        }
    }
}