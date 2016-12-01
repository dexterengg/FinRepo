<%@ Page Title="" Language="C#" MasterPageFile="~/Plan/Website.master" AutoEventWireup="true" CodeFile="SampleOutput.aspx.cs" Inherits="Plan_SampleOutput" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="MainContainer" style="margin-top:4.8%;">
        <iframe width="100%" height="600" scrolling="auto" src="pdf/sample-fincart-mini-output.pdf" frameborder="0"></iframe>
    </div>
</asp:Content>

