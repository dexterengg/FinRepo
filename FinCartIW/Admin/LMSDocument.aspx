<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LMSDocument.aspx.cs" Inherits="Admin_LMSDocument" %>
<%@ Register TagPrefix="AdExternalLinkAs"  TagName="AdExternalLinkAs"  Src="~/Admin/ExternalLinks.ascx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <AdExternalLinkAs:AdExternalLinkAs id="externallink" runat="server" />
    <script>
        $(document).ready(function () {

            $("#AddComment").click(function () {
                $("#CommentZone").show(1000);
                $("#Label1").hide();
            });
        });
	</script>     

</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div>Investor Name : <asp:Label ID="lblInvName" runat="server" Text=""></asp:Label></div>
        <asp:GridView ID="GridViewDocument" runat="server" AutoGenerateColumns="false" Width="100%"
             OnRowDeleting="GridViewDocument_RowDeleting" DataKeyNames="Code"  >
            <Columns>
                <asp:BoundField DataField="Code" Visible="false"  />
                <asp:BoundField DataField="DDate" HeaderText="Date" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left"  >
                <HeaderStyle HorizontalAlign="Left" />
                <ItemStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="ClientNAme" HeaderText="Username" HeaderStyle-HorizontalAlign="Left" ReadOnly="true" ItemStyle-HorizontalAlign="Left"  >
                <HeaderStyle HorizontalAlign="Left" />
                <ItemStyle HorizontalAlign="Left" />
                </asp:BoundField>   
                <asp:BoundField DataField="FileType" HeaderText="File Type" HeaderStyle-HorizontalAlign="center" ReadOnly="true" ItemStyle-HorizontalAlign="center" >
                <HeaderStyle HorizontalAlign="Center" />
                <ItemStyle HorizontalAlign="Center" />                            
                </asp:BoundField>                                                                      
                <asp:TemplateField HeaderText = "File Name" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <a href="Documents/<%#Eval("FileName") %>" id="link2" target="_blank"><%#Eval("FileName") %></a>
                    </ItemTemplate>
                </asp:TemplateField>                                          
                <asp:BoundField DataField="PlannerName" HeaderText="Planner Name" HeaderStyle-HorizontalAlign="center" ReadOnly="true" ItemStyle-HorizontalAlign="center" >
                <HeaderStyle HorizontalAlign="Center" />
                <ItemStyle HorizontalAlign="Center" />                            
                </asp:BoundField>                                
                <asp:CommandField ShowDeleteButton="true" ButtonType="Image"  DeleteImageUrl="~/images/delete.png" >                                        
                </asp:CommandField>                                         
            </Columns>

            <AlternatingRowStyle CssClass="GV-AlternatingRowStyle" />
            <EditRowStyle CssClass="GV-EditRow" />                                                                       
            <HeaderStyle CssClass="GV-HeaderStyleModal" />
            <PagerStyle CssClass="GV-PagerStyle" />
            <RowStyle CssClass="GV-RowStyle" />
            <SelectedRowStyle CssClass="GV-SelectedRowStyle" />    
        </asp:GridView>
        
        <div><a href="#" id="AddComment" class="ButtonSmall"><i class="fa fa-plus-square"></i>&nbsp;Add Report</a></div>

        <div class="hr-cbp-mc-form" id="CommentZone" style="display:none">
            <div class="hr-cbp-mc-column">                                                          
                <div class="hr-cbp-mc-column-inner">                    
                    <asp:DropDownList ID="txtFileType" runat="server" CssClass="inputfieldSmall" >
                        <asp:ListItem Value="-1">--Select File Type--</asp:ListItem>
                        <asp:ListItem Value="Client Aggrement">Client Aggrement</asp:ListItem>
                        <asp:ListItem Value="Application Form">Application Form</asp:ListItem>
                    </asp:DropDownList>
                </div>   
                <div class="hr-cbp-mc-column-inner">
                    <asp:FileUpload ID="txtFinametricaFile" runat="server" />                  
                </div>                                             
                <div class="hr-cbp-mc-column-inner">
                    <asp:LinkButton ID="DocumentSubmit" runat="server" CssClass="ButtonSmall" TabIndex="10" OnClick="DocumentSubmit_click" ValidationGroup="LMSFinametrica">Add</asp:LinkButton>
                </div>
            </div>
            <div class="mandatory">Note: Document should be in .pdf/.xls/.doc format </div>
        </div>
        <asp:Label ID="Label1" runat="server" Text="" CssClass="lblTextInfo"></asp:Label>
        <asp:Label ID="txtFileNotUpload" runat="server" Text="" CssClass="lblTextInfo"></asp:Label>

    </div>
    </form>
</body>
</html>
