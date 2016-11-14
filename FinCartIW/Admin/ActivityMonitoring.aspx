<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ActivityMonitoring.aspx.cs" Inherits="Admin_ActivityMonitoring" %>
<%@ Register TagPrefix="AdExternalLinkAs"  TagName="AdExternalLinkAs"  Src="~/Admin/ExternalLinks.ascx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <AdExternalLinkAs:AdExternalLinkAs id="externallink" runat="server" />    
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">    
    <script src="https://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
    <script>
        $(document).ready(function () {
            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
            Sys.WebForms.PageRequestManager.getInstance().beginAsyncPostBack();
            function EndRequestHandler(sender, args) {
                $("#txtNextActionDate").datepicker({
                    changeMonth: true,
                    changeYear: true,
                    dateFormat: 'dd-mm-yy',
                });
            }
        });
  </script>
    <script>
        $(document).ready(function () {

            $("#AddComment").click(function () {
                $("#CommentZone").show(1000);
            });
        });
	</script>
    <style type="text/css">   
    .ErrorControl
    {
        background-color: #ffffff !important;
        border: solid 1px #f00 !important;
    }
</style>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>  
         
            <div>Investor Name : <asp:Label ID="lblInvName" runat="server" Text=""></asp:Label></div>                           

        <%--<div><a href="#" id="AddComment" class="ButtonSmall"><i class="fa fa-comment"></i>&nbsp;Add Activity</a></div>--%>
        <%--<asp:UpdatePanel ID="UpdatePanelActivity" runat="server">
                <ContentTemplate> --%>
                    <asp:GridView ID="GridViewActivity" runat="server" AutoGenerateColumns="false" Width="100%" OnRowDeleting="GridViewActivity_RowDeleting" OnRowEditing="GridViewActivity_RowEditing" OnRowUpdating="GridViewActivity_RowUpdating" OnRowCancelingEdit="GridViewActivity_RowCancelingEdit" DataKeyNames="Code" >
            <Columns>
                <asp:BoundField DataField="Code" Visible="false"  />
                <asp:BoundField DataField="CDate" HeaderText="Date" HeaderStyle-HorizontalAlign="Left" ReadOnly="true" ItemStyle-HorizontalAlign="Left"  >
                <HeaderStyle HorizontalAlign="Left" />
                <ItemStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="Comment" HeaderText="Comment" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left"  >
                <HeaderStyle HorizontalAlign="Left" />
                <ItemStyle HorizontalAlign="Left" />
                </asp:BoundField>                           
                <asp:BoundField DataField="EnteredBy" HeaderText="Enter By" HeaderStyle-HorizontalAlign="center" ReadOnly="true" ItemStyle-HorizontalAlign="center" >
                <HeaderStyle HorizontalAlign="Center" />
                <ItemStyle HorizontalAlign="Center" />                            
                </asp:BoundField>                
                <asp:BoundField DataField="NextADate" HeaderText="Next Action Date" HeaderStyle-HorizontalAlign="Left" ReadOnly="true" ItemStyle-HorizontalAlign="Left"  >
                <HeaderStyle HorizontalAlign="Left" />
                <ItemStyle HorizontalAlign="Left" />
                </asp:BoundField>                           
                <asp:BoundField DataField="ActionTime" HeaderText="Action Time" HeaderStyle-HorizontalAlign="center" ReadOnly="true" ItemStyle-HorizontalAlign="center" >
                <HeaderStyle HorizontalAlign="Center" />
                <ItemStyle HorizontalAlign="Center" />                            
                </asp:BoundField>
                <asp:BoundField DataField="Activity" HeaderText="Activity" HeaderStyle-HorizontalAlign="Left" ReadOnly="true" ItemStyle-HorizontalAlign="Left"  >
                <HeaderStyle HorizontalAlign="Left" />
                <ItemStyle HorizontalAlign="Left" />
                </asp:BoundField>                                           
                <asp:CommandField EditImageUrl="~/images/edit.png"  ButtonType="Image"  ShowEditButton="true" UpdateImageUrl="~/images/updates.png" CancelImageUrl="~/images/cancel.png" >
                                        
                </asp:CommandField>
                <asp:CommandField ShowDeleteButton="true" ButtonType="Image" DeleteImageUrl="~/images/delete.png" >
                                        
                </asp:CommandField>           
            </Columns>
            <AlternatingRowStyle CssClass="GV-AlternatingRowStyle" />
            <EditRowStyle CssClass="GV-EditRow" />                                                                       
            <HeaderStyle CssClass="GV-HeaderStyleModal" />
            <PagerStyle CssClass="GV-PagerStyle" />
            <RowStyle CssClass="GV-RowStyle" />
            <SelectedRowStyle CssClass="GV-SelectedRowStyle" />    
        </asp:GridView>
        <br /><br />
        <div><h2><i class="fa fa-comment"></i>&nbsp;Add New Activity</h2></div>
        <div class="hr-cbp-mc-form" id="CommentZone" >  
                         
                <div class="hr-cbp-mc-column"> 
                    <div class="hr-cbp-mc-column-inner">
                        <asp:DropDownList ID="DDToDoActivity" runat="server" OnSelectedIndexChanged="DDToDoActivity_SelectedIndexChanged" AutoPostBack="true"  CssClass="inputfieldSmall" ValidationGroup="LMSActivity">
                        </asp:DropDownList>
                    </div>                                                                      
                    <div class="hr-cbp-mc-column-inner">                        
                        <asp:TextBox type="text" id="txtNextActionDate" placeholder="Next Action Date" CssClass="inputfieldSmall" TabIndex="4" Text=""  runat="server"  ValidationGroup="LMSActivity" />
                        <asp:RequiredFieldValidator ID="RequiredDrawer" ValidationGroup="LMSActivity" runat="server" ErrorMessage="" ControlToValidate="txtNextActionDate"></asp:RequiredFieldValidator> 
                        <%--<ajxct:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtNextActionDate"  Format="dd-MM-yyyy" SkinID="2" Animated="true"  />--%>                        
                    </div>
                    <div class="hr-cbp-mc-column-inner">                        
                        <asp:DropDownList ID="DDNZTHour" runat="server" CssClass="inputfieldSmall">
                            <asp:ListItem Value="-1">Choose Hour</asp:ListItem>
                            <asp:ListItem Value="01">01</asp:ListItem>
                            <asp:ListItem Value="02">02</asp:ListItem>
                            <asp:ListItem Value="03">03</asp:ListItem>
                            <asp:ListItem Value="04">04</asp:ListItem>
                            <asp:ListItem Value="05">05</asp:ListItem>
                            <asp:ListItem Value="06">06</asp:ListItem>
                            <asp:ListItem Value="07">07</asp:ListItem>
                            <asp:ListItem Value="08">08</asp:ListItem>
                            <asp:ListItem Value="09">09</asp:ListItem>
                            <asp:ListItem Value="10">10</asp:ListItem>
                            <asp:ListItem Value="11">11</asp:ListItem>
                            <asp:ListItem Value="12">12</asp:ListItem>
                            <asp:ListItem Value="13">13</asp:ListItem>
                            <asp:ListItem Value="14">14</asp:ListItem>
                            <asp:ListItem Value="15">15</asp:ListItem>
                            <asp:ListItem Value="16">16</asp:ListItem>
                            <asp:ListItem Value="17">17</asp:ListItem>
                            <asp:ListItem Value="18">18</asp:ListItem>
                            <asp:ListItem Value="19">19</asp:ListItem>
                            <asp:ListItem Value="20">20</asp:ListItem>
                            <asp:ListItem Value="21">21</asp:ListItem>
                            <asp:ListItem Value="22">22</asp:ListItem>
                            <asp:ListItem Value="23">23</asp:ListItem>
                            <asp:ListItem Value="24">24</asp:ListItem>
                        </asp:DropDownList>                       
                    </div>
                    <div class="hr-cbp-mc-column-inner">                                               
                        <asp:DropDownList ID="DDNZTMinute" runat="server" CssClass="inputfieldSmall" >
                            <asp:ListItem Value="-1">Choose Minute</asp:ListItem>
                            <asp:ListItem Value="05">05</asp:ListItem>
                            <asp:ListItem Value="10">10</asp:ListItem>
                            <asp:ListItem Value="15">15</asp:ListItem>
                            <asp:ListItem Value="20">20</asp:ListItem>
                            <asp:ListItem Value="25">25</asp:ListItem>
                            <asp:ListItem Value="30">30</asp:ListItem>
                            <asp:ListItem Value="35">35</asp:ListItem>
                            <asp:ListItem Value="40">40</asp:ListItem>
                            <asp:ListItem Value="45">45</asp:ListItem>
                            <asp:ListItem Value="50">50</asp:ListItem>
                            <asp:ListItem Value="55">55</asp:ListItem>                            
                        </asp:DropDownList>
                    </div>                                        
                </div>
                <div class="hr-cbp-mc-column">                    
                    <asp:TextBox type="text" id="txtActivityComment" placeholder="Activity Comment" Width="90%" Rows="3" CssClass="inputfieldSmall" TabIndex="1"  runat="server"  ValidationGroup="LMSActivity" />                                        
                    <asp:RequiredFieldValidator ID="RequiredPaymentDate" ValidationGroup="LMSActivity" runat="server" ErrorMessage="" ControlToValidate="txtActivityComment"></asp:RequiredFieldValidator> 
                </div>
                <div class="hr-cbp-mc-column">
                    <asp:LinkButton ID="ActivitySubmit" runat="server" CssClass="ButtonSmall" TabIndex="10" OnClick="ActivitySubmit_click" ValidationGroup="LMSActivity">Add</asp:LinkButton>
                </div>
                
    
        </div>
        
    <%--</ContentTemplate>   
            </asp:UpdatePanel>--%>
    </form>
    <script type="text/javascript">
        function WebForm_OnSubmit() {
            if (typeof (ValidatorOnSubmit) == "function" && ValidatorOnSubmit() == false) {
                for (var i in Page_Validators) {
                    try {
                        var control = document.getElementById(Page_Validators[i].controltovalidate);
                        if (!Page_Validators[i].isvalid) {
                            control.className = "ErrorControl";
                        } else {
                            control.className = "";
                        }
                    } catch (e) { }
                }
                return false;
            }
            return true;
        }
</script>
</body>
</html>
