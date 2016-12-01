<%@ Page Title="Risk Last Chosen" Language="C#" MasterPageFile="DashBoard.master" AutoEventWireup="true" CodeFile="RiskSelected.aspx.cs" Inherits="RiskSelected" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <div class="my-db-area">
    <div id="slider">
            <h1>Your last-selected risk</h1>
            <h3>Your last-selected risk profile gets circled in red.
Which risk appetite describes you the closest at this time? Think carefully and click to proceed....
</h3>
            <div class="risk-image"><asp:ImageButton ID="ImgUltraConservative" runat="server" OnClick="ImgUltraConservative_Click" /></div>
            <div class="risk-image"><asp:ImageButton ID="ImgConservative" runat="server" OnClick="ImgConservative_Click" /></div>
            <div class="risk-image"><asp:ImageButton ID="ImgModerate" runat="server" OnClick="ImgModerate_Click" /></div>
            <div class="risk-image"><asp:ImageButton ID="ImgGrowth" runat="server" OnClick="ImgGrowth_Click" /></div>
            <div class="risk-image"><asp:ImageButton ID="ImgAggressive" runat="server" OnClick="ImgAggressive_Click" /></div>
        </div>
          </div>  
</asp:Content>

