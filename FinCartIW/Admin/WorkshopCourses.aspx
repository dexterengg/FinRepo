<%@ Page Title="Fincart Workshop Courses" Language="C#" MasterPageFile="~/Admin/AdminDashBoard.master" AutoEventWireup="true" CodeFile="WorkshopCourses.aspx.cs" Inherits="Admin_WorkshopCourses" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajax" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AdminContentPlaceHolder" Runat="Server">
    <link rel="stylesheet" href="../css/datepicker.css" type="text/css" />
    <script src="https://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
    <script type="text/javascript" >
        $(document).ready(function () {
            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
            Sys.WebForms.PageRequestManager.getInstance().beginAsyncPostBack();
            function EndRequestHandler(sender, args) {
                $("#AdminContentPlaceHolder_txtCourseDate").datepicker({
                    changeMonth: true,
                    changeYear: true,
                    dateFormat: 'dd-mm-yy'
                });
                
            }
        });
</script>
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>  
    
    <asp:UpdatePanel ID="UpdatePanelUser" runat="server">
            <ContentTemplate>
                <div class="hr-normal-cbp-mc-form" id="WSCourseEntry" runat="server">
                    <h1>Add Workshop Course</h1>
                        <div class="hr-normal-cbp-mc-column">
                            <div class="hr-normal-cbp-mc-column-inner">
                                <label for="coursename"><span class="mandatory">#</span>Course Name <asp:RequiredFieldValidator ID="ReqCourseName" ValidationGroup="wscourse" runat="server" ErrorMessage="Required" Display="Dynamic" ControlToValidate="txtCourseName" CssClass="mandatory"></asp:RequiredFieldValidator></label>
                                <asp:TextBox type="text" name="coursename" id="txtCourseName" CssClass="inputfield" TabIndex="1"  runat="server"  ValidationGroup="wscourse" />                                 
                            </div>
                            <div class="hr-normal-cbp-mc-column-inner">
                                <label for="coursedate" ><span class="mandatory">#</span>Date &nbsp; <asp:RequiredFieldValidator ID="ReqCourseDate" ValidationGroup="wscourse" runat="server" ErrorMessage="Required" Display="Dynamic" ControlToValidate="txtCourseDate" CssClass="mandatory"></asp:RequiredFieldValidator>  
                                    <%--<ajax:CalendarExtender ID="CECourseDate" runat="server" TargetControlID="txtCourseDate" 
                                                        PopupButtonID="txtCourseDate" Format="dd-MM-yyyy">
                                </ajax:CalendarExtender>   --%>                               
                                </label>
                                <asp:TextBox type="text" id="txtCourseDate" CssClass="inputfield" TabIndex="2"  runat="server"  ValidationGroup="wscourse" />  
                                                            
                            </div>
                            <div class="hr-normal-cbp-mc-column-inner">
                                <label for="coursetime"><span class="mandatory">#</span>Course Time <asp:RequiredFieldValidator ID="ReqCourseTime" ValidationGroup="wscourse" runat="server" ErrorMessage="Required" Display="Dynamic" ControlToValidate="txtCourseTime" CssClass="mandatory"></asp:RequiredFieldValidator>                                    
                                </label>
                                <asp:TextBox type="text" name="coursetime" id="txtCourseTime" CssClass="inputfield" TabIndex="3"  runat="server"  ValidationGroup="wscourse" />
                                
                            </div>
                            <div class="hr-normal-cbp-mc-column-inner">
                                <label for="wslocation" ><span class="mandatory">#</span>Location  <asp:RequiredFieldValidator ID="ReqLocation" ValidationGroup="wscourse" runat="server" ErrorMessage="Required" Display="Dynamic" ControlToValidate="txtLocation" CssClass="mandatory"></asp:RequiredFieldValidator>                                                                     
                                </label>  
                                <asp:TextBox type="text" name="wslocation" id="txtLocation" CssClass="inputfield" TabIndex="4"  runat="server"  ValidationGroup="wscourse" />                              
                            </div>
                        </div>
                        <div class="hr-normal-cbp-mc-column">
                            <div class="hr-normal-cbp-mc-column-inner">
                                <label for="courseprice" >Price</label>
                                <asp:DropDownList ID="ddCoursePrice" name="courseprice" TabIndex="5" CssClass="inputfield" runat="server" ValidationGroup="wscourse" >           
                                    <asp:ListItem Value="Free">Free</asp:ListItem>
                                    <asp:ListItem Value="Paid">Paid</asp:ListItem>
                                </asp:DropDownList>
                                
                            </div>                              
                            <div class="hr-normal-cbp-mc-column-inner">
                                <label for="speakername"><span class="mandatory">#</span>Speaker Name <asp:RequiredFieldValidator ID="ReqSpeakerName" ValidationGroup="wscourse" runat="server" ErrorMessage="Required" Display="Dynamic" ControlToValidate="txtSpeakerName" CssClass="mandatory"></asp:RequiredFieldValidator>

                                </label>
                                <asp:TextBox type="text" name="speakername" id="txtSpeakerName" CssClass="inputfield" TabIndex="6"  runat="server"  ValidationGroup="wscourse" />
                            </div>
                            <div class="hr-normal-cbp-mc-column-inner">
                                <label for="speakerdetails" >Speaker Details</label>
                                <asp:TextBox type="text" name="speakerdetails" id="txtSpeakerDetails" CssClass="inputfield" TabIndex="7"  runat="server"  ValidationGroup="wscourse" />                                
                            </div>                              
                        </div>                    
                    <div class="hr-normal-cbp-mc-column">
                        <div class="hr-normal-cbp-mc-column-inner">
                                <label for="coursedescription" ><span class="mandatory">#</span>Description <asp:RequiredFieldValidator ID="ReqDescription" ValidationGroup="wscourse" runat="server" ErrorMessage="Required" Display="Dynamic" ControlToValidate="txtCourseDescription" CssClass="mandatory"></asp:RequiredFieldValidator></label>
                                <textarea runat="server" id="txtCourseDescription" tabindex="8" name="remarks"></textarea>                                                                  
                            </div>
                            <div class="hr-normal-cbp-mc-column-inner">
                                <label for="coursevideo1" >Video 1</label>
                                <asp:TextBox type="text" name="coursevideo1" id="txtVideo1" CssClass="inputfield" TabIndex="9"  runat="server"  ValidationGroup="wscourse" />                                
                            </div>                            
                            <div class="hr-normal-cbp-mc-column-inner">
                                <label for="coursevideo2" >Video 2</label>
                                <asp:TextBox type="text" name="coursevideo2" id="txtVideo2" CssClass="inputfield" TabIndex="10"  runat="server"  ValidationGroup="wscourse" />                                
                            </div>
                            <div class="hr-normal-cbp-mc-column-inner">
                                <asp:LinkButton ID="UserSubmit" runat="server" CssClass="DBbuttonSmall" TabIndex="11" OnClick="WSCourseSubmit_click" ValidationGroup="wscourse">Add</asp:LinkButton> <span class="mandatory" style="float:right; margin-top:22px;"># Fields are mandatory</span>
                            </div>  
                            
                    </div>
                                          
                    </div>
                    <br />
                    <div class="GV-Area">
                        <asp:GridView ID="GridViewCourse" runat="server" AutoGenerateColumns="False" GridLines="None" 
                                 DataKeyNames="Code"  Width="100%" OnRowEditing="GridViewCourse_RowEditing" OnRowUpdating="GridViewCourse_RowUpdating" OnRowCancelingEdit="GridViewCourse_RowCancelingEdit" OnRowDeleting="GridViewCourse_RowDeleting" OnRowCreated="GridViewCourse_RowCreated" OnRowDataBound="GridViewCourse_OnRowDataBound">
                                <Columns>
                                    <asp:BoundField DataField="Code" Visible="false"  />
                                    <asp:BoundField DataField="CourseName" HeaderText="Course Name" HeaderStyle-HorizontalAlign="Left" ControlStyle-Width="100" ControlStyle-CssClass="GV-ControlStyle" />       
                                    <asp:TemplateField HeaderText="Date" ItemStyle-HorizontalAlign="left"  ControlStyle-CssClass="GV-ControlStyle" >
                                       <ItemTemplate >
                                          <asp:Label ID="lblCourseADate" BackColor="Transparent" runat="server" Text='<%# Eval("CourseDT") %>' >
		                            </asp:Label>
                                       </ItemTemplate>
                                       <EditItemTemplate >
                                           <asp:TextBox ID="txtCourseDate" Width="80" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "CourseDT") %>'></asp:TextBox>
                                            <ajax:CalendarExtender ID="CECourseDate" runat="server" TargetControlID="txtCourseDate" 
                                                                    PopupButtonID="txtCourseDate" Format="dd-MM-yyyy">
                                            </ajax:CalendarExtender>
                                       </EditItemTemplate>
                                   </asp:TemplateField>
                                    <asp:BoundField DataField="CourseTime" HeaderText="Time" HeaderStyle-HorizontalAlign="Left" ControlStyle-Width="70" ControlStyle-CssClass="GV-ControlStyle"/>
                                    <asp:BoundField DataField="Location"  HeaderText="Location" HeaderStyle-HorizontalAlign="Left" ControlStyle-CssClass="GV-ControlStyle" />                                        
                                    <asp:BoundField DataField="SpeakerName" HeaderText="Speaker Name" HeaderStyle-HorizontalAlign="left" ControlStyle-Width="80" ControlStyle-CssClass="GV-ControlStyle" />
                                    <asp:BoundField DataField="SpeakerDetails" HeaderText="Speaker Details" HeaderStyle-HorizontalAlign="left" ItemStyle-HorizontalAlign="left" ControlStyle-Width="100" ControlStyle-CssClass="GV-ControlStyle" />                                        
                                   
                                    <asp:BoundField DataField="CourseDescription" HeaderText="Course Details" HeaderStyle-HorizontalAlign="Left"  ControlStyle-CssClass="GV-ControlStyle" />
                                    <asp:BoundField DataField="VideoURL1" HeaderText="Video" HeaderStyle-HorizontalAlign="Left" ControlStyle-CssClass="GV-ControlStyle" />
                                    <asp:CommandField EditImageUrl="~/images/edit.png"  ButtonType="Image"  ShowEditButton="true" UpdateImageUrl="~/images/updates.png" CancelImageUrl="~/images/cancel.png"  >
                                        
                                    </asp:CommandField>                                      
                                    <asp:TemplateField >
	                                    <ItemTemplate>		                                    
                                            <asp:ImageButton ID="delButton" runat="server" CommandName="Delete" ImageUrl="~/images/delete.png"
                                                OnClientClick="return confirm('Are you sure you want to delete this Workshop Course?');" />
	                                    </ItemTemplate>
                                    </asp:TemplateField>                                                                      
                                </Columns>
                                <AlternatingRowStyle CssClass="GV-AlternatingRowStyle" />
                                <EditRowStyle CssClass="GV-EditRow" />                                    
                                <HeaderStyle CssClass="GV-HeaderStyle" />
                                <PagerStyle CssClass="GV-PagerStyle" />
                                <RowStyle CssClass="GV-RowStyle" />
                                <SelectedRowStyle CssClass="GV-SelectedRowStyle" /> 
                            </asp:GridView>
                    </div>

                <%--**********************************************--%>
            <%--Message popup area start--%>
            <%--**********************************************--%>
            <asp:Button runat="server" ID="btnMessagePopupTargetButton" Style="display: none;" />
            <ajax:ModalPopupExtender ID="mpeMessagePopup" runat="server" PopupControlID="pnlMessageBox"
                TargetControlID="btnMessagePopupTargetButton" OkControlID="btnOk" CancelControlID="btnCancel"
                BackgroundCssClass="MessageBoxPopupBackground">
            </ajax:ModalPopupExtender>
            <asp:Panel runat="server" ID="pnlMessageBox" 
                   BackColor="White" Width="420" 
                   Style="display: none; border: 1px solid #859ab1;">
                <div class="popupHeader" style="width: 420px;">
                    <asp:Label ID="lblMessagePopupHeading" Text="Information" 
                        runat="server"></asp:Label><asp:LinkButton
                        ID="btnCancel" runat="server" 
                         Style="float: right; margin-right: 5px;">X</asp:LinkButton>
                </div>
                <div style="max-height: 500px; width: 420px; overflow: hidden;">
                    <div style="float:left; width:380px; margin:20px;">
                        <table style="padding: 0; border-spacing: 0; border-collapse: collapse; width: 100%;">
                            <tr>
                                <td style="text-align: left; vertical-align: top; width: 11%;">
                                    <i class="fa fa-thumbs-up fa-2x"></i>                                    
                                </td>
                                <td style="width: 2%;">
                                </td>
                                <td style="text-align: left; vertical-align: top; width: 87%;">
                                    <p style="margin: 0px; padding: 0px; color: #5F0202;">
                                        
                                            <asp:Label runat="server" ID="lblMessagePopupText"></asp:Label>
                                    </p>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: right; vertical-align: top;" colspan="3">
                                    <div style="margin-right: 0px; float: right; width: auto;">
                                        <asp:LinkButton ID="btnOk" runat="server" 
                                            CssClass="popup_button">Ok</asp:LinkButton>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </asp:Panel>
            <%--**********************************************--%>
            <%--Message popup area end--%>
            <%--**********************************************--%>
            </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

