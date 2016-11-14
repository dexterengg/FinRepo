using System;
using System.Data;
using System.Collections;
using System.Collections.Concurrent;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using System.IO;
using System.Text;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.html;
using iTextSharp.text.html.simpleparser;
using System.Text;


public partial class Admin_WSParticipationList : System.Web.UI.Page
{
    SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ToString());
    string xStr = "";
    SqlCommand cmd;
    string xClientCode = ""; 

    protected void Page_Load(object sender, EventArgs e)
    {
        //if (!IsPostBack)
        //{
            FillGrid_ParticipationList();
        //}
    }

    void FillGrid_ParticipationList()
    {
        if ((string)Session["AdminSessionID"] != null)
        {
            string xCode = Session["AdminSessionID"].ToString();

            SqlDataAdapter GDA = new SqlDataAdapter(" " +

                    " select FullName, City, Email, Mobile, "+
                    " CourseName=(Select CourseName from fp_WorkShop where code=wsr.CourseCode ), "+
                    " InfoFrom, InfoCancellation, RegDate=convert(varchar(11), RegisterDate, 113) "+
                    " from fp_WorkShopRegister wsr order by RegisterDate desc " +
                    "  ", Con);

            DataSet GDS = new DataSet();
            Con.Open();
            GDA.Fill(GDS);
            Con.Close();

            GridViewParticipant.DataSource = GDS;
            GridViewParticipant.DataBind();

            CreateDetailPDF(Server.MapPath("") + "/Tmp/" + xCode + "ParticipationList.pdf", "Fincart Ltd.", "Workshop", "Disclaimer", GDS);
            ExportToExcelDetail(Server.MapPath("") + "/Tmp/" + xCode + "ParticipationList.xls", "Fincart Ltd.", "Workshop", "Disclaimer", GDS);
                
        }
        else
        {
            Response.Redirect("SessionExpired.aspx");
        }
    }

    #region EXCEL PDF EXPORT START

    public void CreateDetailPDF(string PDFNAME, string COMPNAME, string GROUPNAME, string DESCLAIMER, DataSet xdsTotPur)
    {

        Font CompanyNameFont = FontFactory.GetFont("Verdana", 12F, Font.BOLD, BaseColor.BLACK);
        Font CompanyAddFont = FontFactory.GetFont("Verdana", 10F, Font.BOLD, BaseColor.BLACK);
        Font ReportHeadingFont = FontFactory.GetFont("Verdana", 10F, Font.BOLD, BaseColor.BLACK);
        Font DisclaimerFont = FontFactory.GetFont("Verdana", 6F, Font.NORMAL, BaseColor.BLACK);
        Font GroupNameHeadFont = FontFactory.GetFont("Verdana", 11F, Font.BOLD, BaseColor.RED);
        Font VerdanaRedBold = FontFactory.GetFont("Verdana", 8F, Font.BOLD, BaseColor.RED);
        Font VerdanaRed = FontFactory.GetFont("Verdana", 8F, Font.NORMAL, BaseColor.RED);
        Font VerdanaBlackBold = FontFactory.GetFont("Verdana", 8F, Font.BOLD, BaseColor.BLACK);
        Font VerdanaBlack = FontFactory.GetFont("Verdana", 6F, Font.NORMAL, BaseColor.BLACK);
        Font VerdanaBlueBold = FontFactory.GetFont("Verdana", 8F, Font.BOLD, BaseColor.BLUE);
        Font VerdanaBlue = FontFactory.GetFont("Verdana", 8F, Font.NORMAL, BaseColor.BLUE);
        Document pdfDoc = new Document(PageSize.A4, 25f, 25f, 25f, 25f);
        FileStream output = new FileStream(PDFNAME, FileMode.Create);
        PdfWriter writer = PdfWriter.GetInstance(pdfDoc, output);
        writer.PageEvent = new PDFFooter();
        pdfDoc.Open();

        Paragraph CompName = new Paragraph(COMPNAME, CompanyNameFont);
        CompName.Alignment = Element.ALIGN_LEFT;

        Paragraph ReportHeading = new Paragraph("Participation List - [Register Client for Workshop]", ReportHeadingFont);
        ReportHeading.Alignment = Element.ALIGN_LEFT;

        Paragraph AsOnDate = new Paragraph("As on " + DateTime.Today.ToString("dd-MM-yyyy"), VerdanaBlack);
        Paragraph GroupName = new Paragraph(GROUPNAME, GroupNameHeadFont);

        PdfPTable table = new PdfPTable(8);
        table.HeaderRows = 1;
        table.TotalWidth = 500f;
        float[] widthColumns = new float[] { 70, 70, 110, 50, 50, 50, 50, 60 };
        table.SetTotalWidth(widthColumns);
        table.LockedWidth = true;
        table.DefaultCell.Border = 1;

        PdfPTable nested = new PdfPTable(8);
        nested.TotalWidth = 500f;
        float[] widthColumns1 = new float[] { 70, 70, 110, 50, 50, 50, 50, 60 };
        nested.SetTotalWidth(widthColumns1);
        nested.LockedWidth = true;
        nested.DefaultCell.Border = 1;

        //PdfPCell BlankCell1 = new PdfPCell(new Phrase("", VerdanaBlack));
        //DesignPDFCell(BlankCell1, 2, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0);
        //BlankCell1.Colspan = 4;
        //nested.AddCell(BlankCell1);

        PdfPCell BlankCell2 = new PdfPCell(CompName);
        DesignPDFCell(BlankCell2, 2, 2, 0, 0, 0, 0, 20, 0, 0, 0, 0);
        BlankCell2.Colspan = 8;
        nested.AddCell(BlankCell2);        

        PdfPCell ReportHeadCell = new PdfPCell(ReportHeading);
        DesignPDFCell(ReportHeadCell, 2, 1, 0, 0, 0, 0, 20, 0, 0, 0, 0);
        ReportHeadCell.Colspan = 8;
        nested.AddCell(ReportHeadCell);        

        PdfPCell ReportDateCell = new PdfPCell(AsOnDate);
        DesignPDFCell(ReportDateCell, 2, 2, 0, 0, 0, 0, 20, 0, 0, 0, 0);
        ReportDateCell.Colspan = 8;
        nested.AddCell(ReportDateCell);


        PdfPCell FullName = new PdfPCell(new Phrase("Full Name" + Environment.NewLine + "", VerdanaBlack));
        PdfPCell City = new PdfPCell(new Phrase("City" + Environment.NewLine + "", VerdanaBlack));
        PdfPCell Email = new PdfPCell(new Phrase("Email" + Environment.NewLine + "", VerdanaBlack));
        PdfPCell Mobile = new PdfPCell(new Phrase("Mobile" + Environment.NewLine + "", VerdanaBlack));
        PdfPCell CourseName = new PdfPCell(new Phrase("CourseName" + Environment.NewLine + "", VerdanaBlack));
        PdfPCell InfoFrom = new PdfPCell(new Phrase("InfoFrom" + Environment.NewLine + "", VerdanaBlack));
        PdfPCell InfoCancellation = new PdfPCell(new Phrase("InfoCancellation" + Environment.NewLine + "", VerdanaBlack));
        PdfPCell RegDate = new PdfPCell(new Phrase("RegDate" + Environment.NewLine + "", VerdanaBlack));


        DesignPDFCell(FullName, 1, 0, 1, 1, 1, 1, 25, 5, 0, 0, 2);
        DesignPDFCell(City, 1, 0, 1, 0, 1, 1, 25, 5, 0, 0, 2);
        DesignPDFCell(Email, 0, 2, 1, 0, 1, 1, 25, 5, 0, 0, 2);
        DesignPDFCell(Mobile, 0, 2, 1, 0, 1, 1, 25, 5, 0, 0, 2);
        DesignPDFCell(CourseName, 0, 2, 1, 0, 1, 1, 25, 5, 0, 0, 2);
        DesignPDFCell(InfoFrom, 0, 2, 1, 0, 1, 1, 25, 5, 0, 0, 2);
        DesignPDFCell(InfoCancellation, 0, 2, 1, 0, 1, 1, 25, 5, 0, 0, 2);
        DesignPDFCell(RegDate, 0, 2, 1, 0, 1, 1, 25, 5, 0, 0, 2);


        nested.AddCell(FullName);
        nested.AddCell(City);
        nested.AddCell(Email);
        nested.AddCell(Mobile);
        nested.AddCell(CourseName);
        nested.AddCell(InfoFrom);
        nested.AddCell(InfoCancellation);
        nested.AddCell(RegDate);


        PdfPCell PageHeaderCell = new PdfPCell(nested);
        DesignPDFCell(PageHeaderCell, 2, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0);
        PageHeaderCell.Colspan = 8;
        table.AddCell(PageHeaderCell);        


        for (int iTotData = 0; iTotData < xdsTotPur.Tables[0].Rows.Count; iTotData++)
        {            
            
            FullName = new PdfPCell(new Phrase(xdsTotPur.Tables[0].Rows[iTotData]["FullName"].ToString(), VerdanaBlack));
            City = new PdfPCell(new Phrase(xdsTotPur.Tables[0].Rows[iTotData]["City"].ToString(), VerdanaBlack));
            Email = new PdfPCell(new Phrase(xdsTotPur.Tables[0].Rows[iTotData]["Email"].ToString(), VerdanaBlack));
            Mobile = new PdfPCell(new Phrase(xdsTotPur.Tables[0].Rows[iTotData]["Mobile"].ToString(), VerdanaBlack));
            CourseName = new PdfPCell(new Phrase(xdsTotPur.Tables[0].Rows[iTotData]["CourseName"].ToString(), VerdanaBlack));
            InfoFrom = new PdfPCell(new Phrase(xdsTotPur.Tables[0].Rows[iTotData]["InfoFrom"].ToString(), VerdanaBlack));
            InfoCancellation = new PdfPCell(new Phrase(xdsTotPur.Tables[0].Rows[iTotData]["InfoCancellation"].ToString(), VerdanaBlack));
            RegDate = new PdfPCell(new Phrase(xdsTotPur.Tables[0].Rows[iTotData]["RegDate"].ToString(), VerdanaBlack));


            DesignPDFCell(FullName, 1, 0, 0, 1, 1, 0, 14, 5, 0, 0, 2);
            DesignPDFCell(City, 1, 0, 0, 0, 1, 0, 14, 5, 0, 0, 2);
            DesignPDFCell(Email, 0, 2, 0, 0, 1, 0, 14, 5, 0, 0, 2);
            DesignPDFCell(Mobile, 0, 2, 0, 0, 1, 0, 14, 5, 0, 0, 2);
            DesignPDFCell(CourseName, 0, 2, 0, 0, 1, 0, 14, 5, 0, 0, 2);
            DesignPDFCell(InfoFrom, 0, 2, 0, 0, 1, 0, 14, 5, 0, 0, 2);
            DesignPDFCell(InfoCancellation, 0, 2, 0, 0, 1, 0, 14, 5, 0, 0, 2);
            DesignPDFCell(RegDate, 0, 2, 0, 0, 1, 0, 14, 5, 0, 0, 2);

            table.AddCell(FullName);
            table.AddCell(City);
            table.AddCell(Email);
            table.AddCell(Mobile);
            table.AddCell(CourseName);
            table.AddCell(InfoFrom);
            table.AddCell(InfoCancellation);
            table.AddCell(RegDate);
            

        }

        //FullName = new PdfPCell(new Phrase(DESCLAIMER, VerdanaBlack));
        //FullName.Colspan = 8;
        //FullName.NoWrap = false;
        //DesignPDFCell(FullName, 1, 0, 0, 1, 1, 1, -1, 25, 0, 0, 2);
        //table.AddCell(FullName);

        PdfPCell BlankCell1 = new PdfPCell(new Phrase("", VerdanaBlack));
        DesignPDFCell(BlankCell1, 2, 0, 1, 0, 0, 0, 20, 0, 0, 0, 0);
        BlankCell1.Colspan = 8;
        table.AddCell(BlankCell1);

        pdfDoc.Add(table);
        pdfDoc.Close();

    }



    public void DesignPDFCell(PdfPCell CellName, Int32 vAlign, Int32 hAlign, Int32 Top_Border_Width, Int32 Left_Border_Width, Int32 Right_Border_Width, Int32 Bottom_Border_Width, Int32 CellHeight, Int32 Padding_Top, Int32 Padding_Left, Int32 Padding_Right, Int32 Padding_Bottom)
    {

        CellName.VerticalAlignment = vAlign;
        CellName.HorizontalAlignment = hAlign;
        CellName.BorderWidthTop = Top_Border_Width;
        CellName.BorderWidthRight = Right_Border_Width;
        CellName.BorderWidthLeft = Left_Border_Width;
        CellName.BorderWidthBottom = Bottom_Border_Width;

        if (CellHeight == -1)
        { }
        else
        {
            CellName.FixedHeight = CellHeight;
        }

        CellName.PaddingTop = 5;
        CellName.PaddingBottom = 2;



        CellName.BorderColorTop = BaseColor.LIGHT_GRAY;
        CellName.BorderColorBottom = BaseColor.LIGHT_GRAY;
        CellName.BorderColorLeft = BaseColor.LIGHT_GRAY;
        CellName.BorderColorRight = BaseColor.LIGHT_GRAY;
    }



    public class PDFFooter : PdfPageEventHelper
    {
        // write on top of document

        Font VerdanaBlack = FontFactory.GetFont("Verdana", 8F, Font.NORMAL, BaseColor.BLACK);
        Font VerdanaBlackBold = FontFactory.GetFont("Verdana", 8F, Font.BOLD, BaseColor.BLACK);

        public override void OnOpenDocument(PdfWriter writer, Document document)
        {

            //base.OnOpenDocument(writer, document);
            //PdfPTable tabFot = new PdfPTable(new float[] { 1F });
            //tabFot.SpacingAfter = 10F;

            //PdfPCell cell;

            //tabFot.TotalWidth = 300F;

            //cell = new PdfPCell(new Phrase("Header"));

            //tabFot.AddCell(cell);

            //tabFot.WriteSelectedRows(0, -1, 150, document.Top, writer.DirectContent);

        }

        // write on start of each page
        public override void OnStartPage(PdfWriter writer, Document document)
        {
            base.OnStartPage(writer, document);
        }

        // write on end of each page
        public override void OnEndPage(PdfWriter writer, Document document)
        {
            base.OnEndPage(writer, document);
            PdfPTable tabPageFooter = new PdfPTable(1);
            PdfPCell PageFooterCell;
            tabPageFooter.TotalWidth = 800F;
            Paragraph PageNo = new Paragraph("Page " + (writer.PageNumber).ToString(), VerdanaBlack);

            PageFooterCell = new PdfPCell(PageNo);
            PageFooterCell.VerticalAlignment = 1;
            PageFooterCell.HorizontalAlignment = 1;
            PageFooterCell.BorderWidthTop = 1;
            PageFooterCell.BorderWidthRight = 0;
            PageFooterCell.BorderWidthLeft = 0;
            PageFooterCell.BorderWidthBottom = 0;
            PageFooterCell.FixedHeight = 30;
            PageFooterCell.PaddingTop = 8f;
            PageFooterCell.PaddingBottom = 5f;

            PageFooterCell.BorderColorTop = BaseColor.BLACK;
            PageFooterCell.BorderColorBottom = BaseColor.LIGHT_GRAY;
            PageFooterCell.BorderColorLeft = BaseColor.LIGHT_GRAY;
            PageFooterCell.BorderColorRight = BaseColor.LIGHT_GRAY;

            tabPageFooter.AddCell(PageFooterCell);
            tabPageFooter.WriteSelectedRows(0, -1, 20, document.Bottom, writer.DirectContent);

        }

        //write on close of document
        public override void OnCloseDocument(PdfWriter writer, Document document)
        {
            base.OnCloseDocument(writer, document);
            //tabReportFooter.WriteSelectedRows(0, -1, 20, document.Top - 300, writer.DirectContent);
        }
    }

    #endregion


    // Other PDF format



    public void ExportToExcelDetail(string XLSNAME, string COMPNAME, string GROUPNAME, string DESCLAIMER, DataSet xdsTotPur)
    {

        string filename = XLSNAME;

        int tblborder = 1;
        StreamWriter SW;
        SW = File.CreateText(filename);
        StringBuilder objSB = new StringBuilder();

        objSB.Append("<Table border=" + tblborder + "  width=100%>");
        objSB.Append("<tr>");
            objSB.Append("<td colspan='8'>");
                objSB.Append("<Table border=0  width=100%>");
                objSB.Append("<tr>");
                objSB.Append("<td colspan='8' height='100px' align=right  style='color:#CF0206;font-weight:bold' >" + COMPNAME + "</td>");
                objSB.Append("</tr>");
                objSB.Append("<tr>");
                objSB.Append("<td colspan='8' height='200px' ></td>");
                objSB.Append("</tr>");

                objSB.Append("<tr>"); 
                objSB.Append("<td colspan='8' height='100px' align=center  style='color:#CF0206;Font-Size:20;font-weight:bold' >Participation List</td>"); 
                objSB.Append("</tr>");


                objSB.Append("<tr>"); 
                objSB.Append("<td colspan='8' height='100px' align=center  style='color:#CF0206;Font-Size:12;font-weight:bold' ></td>"); 
                objSB.Append("</tr>");        

                objSB.Append("</Table>");
            objSB.Append("</td>");
        objSB.Append("</tr>");

        objSB.Append("<tr>");
            objSB.Append("<td align=left  bgColor='#0A6CFE' style='color:#FDFF6B;font-weight:bold;width:50%'>Full Name</td>");
            objSB.Append("<td align=left  bgColor='#0A6CFE' style='color:#FDFF6B;font-weight:bold'>City</td>");
            objSB.Append("<td align=right bgColor='#0A6CFE' style='color:#FDFF6B;font-weight:bold'>Email</td>");
            objSB.Append("<td align=right bgColor='#0A6CFE' style='color:#FDFF6B;font-weight:bold'>Mobile</td>");
            objSB.Append("<td align=right bgColor='#0A6CFE' style='color:#FDFF6B;font-weight:bold'>Course Name</td>");        
            objSB.Append("<td align=right bgColor='#0A6CFE' style='color:#FDFF6B;font-weight:bold'>Info From</td>");
            objSB.Append("<td align=right bgColor='#0A6CFE' style='color:#FDFF6B;font-weight:bold'>Cancel</td>");
            objSB.Append("<td align=right bgColor='#0A6CFE' style='color:#FDFF6B;font-weight:bold'>Reg Date</td>");
        objSB.Append("</tr>");

        for (int i = 0; i < xdsTotPur.Tables[0].Rows.Count; i++)
        {
            objSB.Append("<tr>");
            objSB.Append("<td align=left>" + xdsTotPur.Tables[0].Rows[i]["FullName"].ToString() + "</td>");
            objSB.Append("<td align=left>" + xdsTotPur.Tables[0].Rows[i]["City"].ToString() + "</td>");
            objSB.Append("<td align=left>" + xdsTotPur.Tables[0].Rows[i]["Email"].ToString() + "</td>");
            objSB.Append("<td align=left>" + xdsTotPur.Tables[0].Rows[i]["Mobile"].ToString() + "</td>");
            objSB.Append("<td align=left>" + xdsTotPur.Tables[0].Rows[i]["CourseName"].ToString() + "</td>");
            objSB.Append("<td align=left>" + xdsTotPur.Tables[0].Rows[i]["InfoFrom"].ToString() + "</td>");
            objSB.Append("<td align=left>" + xdsTotPur.Tables[0].Rows[i]["InfoCancellation"].ToString() + "</td>");

            string Divdate = string.Format("{0:dd-MM-yyyy}", xdsTotPur.Tables[0].Rows[i]["RegDate"].ToString().Substring(0, 10));
            objSB.Append("<td align=left>" + Divdate + "</td>");
            objSB.Append("</tr>");
        }

        objSB.Append("</Table>");
        SW.Write(objSB.ToString());
        SW.Close();
        //Response.Redirect(fullpath);

    }

    protected void exportPDF_Click(object sender, EventArgs e)
    {
        Response.Redirect("Tmp/" + Session["AdminSessionID"].ToString() + "ParticipationList.pdf");
        //btnExportPDF_Click();
    }

    protected void exportExl_Click(object sender, EventArgs e)
    {
        Response.Redirect("Tmp/" + Session["AdminSessionID"].ToString() + "ParticipationList.xls");
    }
}