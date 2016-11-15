<%@ Page Language="C#" Title="Ideas & Feedback" MasterPageFile="~/Website.master" AutoEventWireup="true" CodeFile="feedback.aspx.cs" Inherits="website_feedback" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   

    <link rel="stylesheet" type="text/css" href="horizontaltab/easy-responsive-tabs.css" />        
    <script src="horizontaltab/easyResponsiveTabs.js"></script>        
    <div class="MainContainerWeb">
    <div class="main">
        <div class="wrap2">
                <div>
                <!--Horizontal Tab-->
                <div id="parentHorizontalTab">
	                <ul class="resp-tabs-list hor_1">
		                <li>Share your experience with us</li>
		                <li>Add a New Idea</li>
		                <li>Report a Bug</li>
	                </ul>
	                <div class="resp-tabs-container hor_1">
		                <div>
			                <asp:UpdatePanel ID="ExperiencePanel" runat="server">
                                <ContentTemplate>                                    
                                    <div class="TabContainer">
                                        <div class="tabContentLeft">
                                            <div class="feedbackColoum">
                                                <span3><i class="fa fa-bars"></i></span3>
                                                <asp:TextBox ID="txtExperienceTitle" runat="server" CssClass="TabInputfield" placeholder="Title" ValidationGroup="experience"></asp:TextBox>                                        
                                            </div>                                                                        
                                            <div class="feedbackColoum">
                                                <span2><i class="fa fa-file-text-o"></i></span2>
                                                <textarea runat="server" id="txtExperienceDescription" class="TabInputfield" placeholder="Description of the experience"  name="address"  ValidationGroup="experience"></textarea>                                        
                                            </div>  
                                            <div>
                                                <span3><i class="fa fa-user"></i></span3>
                                                <asp:TextBox ID="txtExperienceName" runat="server" CssClass="TabInputfield" placeholder="Name" ValidationGroup="experience"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="ReqExperienceName" ValidationGroup="experience" runat="server" ErrorMessage="Enter your name" Display="Dynamic" ControlToValidate="txtExperienceName" CssClass="mandatory"></asp:RequiredFieldValidator>
                                            </div>                                   
                                            <div>
                                                <span3><i class="fa fa-envelope-o"></i></span3>
                                                <asp:TextBox ID="txtExperienceEmail" runat="server" CssClass="TabInputfield" placeholder="Email" ValidationGroup="experience" ></asp:TextBox>                                        
                                                <asp:RequiredFieldValidator ID="ReqExperienceEmail" ValidationGroup="experience" runat="server" ErrorMessage="Enter your emailid" Display="Dynamic" ControlToValidate="txtExperienceEmail" CssClass="mandatory"></asp:RequiredFieldValidator>
                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" 
                                                runat="server" ErrorMessage="Please Enter Valid Email ID"
                                                    ValidationGroup="experience" ControlToValidate="txtExperienceEmail" Display="Dynamic"                     
                                                    CssClass="mandatory" 
                                                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
                                                    </asp:RegularExpressionValidator>
                                            </div>                                                                                                          
                                            <div>
                                                <asp:LinkButton ID="ExperienceButton" runat="server" CssClass="TabButton" OnClick="ExperienceButton_Click" ValidationGroup="experience" >Submit</asp:LinkButton>
                                                <asp:Label ID="lblExperienceSuccess" CssClass="message" runat="server" Text="" Visible="false"></asp:Label>
                                            </div>                                   
                                        </div>
                                        <div class="tabContentRight">
                                            <h2>Add your experiences with us</h2>
                                            <p>
                                                Did you have a good experience with us? Please fill out and submit this form in order to submit a testimonial to our friendly support-staff.
                                            </p>           
                                            <p>
                                                Best regards, Fincart.com
                                            </p>                         
                                        </div>
                                    </div>
                                </ContentTemplate>   
                            </asp:UpdatePanel>

		                </div>
		                <div>
			                   <asp:UpdatePanel ID="IdeaPanel" runat="server">
                                <ContentTemplate>                                    
                                    <div class="TabContainer">                                
                                        <div class="tabContentLeft">
                                            <div class="feedbackColoum">
                                                <span3><i class="fa fa-bars"></i></span3>
                                                <asp:TextBox ID="txtIdeaTitle" runat="server" CssClass="TabInputfield" placeholder="Title" ValidationGroup="idea"></asp:TextBox>                                        
                                            </div>                                                                        
                                            <div class="feedbackColoum">
                                                <span2><i class="fa fa-file-text-o"></i></span2>
                                                <textarea runat="server" id="txtIdeaDescription" class="TabInputfield" placeholder="Description of the idea"  name="address"  ValidationGroup="idea"></textarea>                                        
                                            </div>  
                                            <div>
                                                <span3><i class="fa fa-user"></i></span3>
                                                <asp:TextBox ID="txtIdeaName" runat="server" CssClass="TabInputfield" placeholder="Name" ValidationGroup="idea"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="ReqIdeaName" ValidationGroup="idea" runat="server" ErrorMessage="Enter your name" Display="Dynamic" ControlToValidate="txtIdeaName" CssClass="mandatory"></asp:RequiredFieldValidator>
                                            </div>                                    
                                            <div>
                                                <span3><i class="fa fa-envelope-o"></i></span3>
                                                <asp:TextBox ID="txtIdeaEmail" runat="server" CssClass="TabInputfield" placeholder="Email" ValidationGroup="idea" ></asp:TextBox>                                        
                                                <asp:RequiredFieldValidator ID="ReqIdeaEmail" ValidationGroup="idea" runat="server" ErrorMessage="Enter your emailid" Display="Dynamic" ControlToValidate="txtIdeaEmail" CssClass="mandatory"></asp:RequiredFieldValidator>
                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" 
                                                runat="server" ErrorMessage="Please Enter Valid Email ID"
                                                    ValidationGroup="idea" ControlToValidate="txtIdeaEmail" Display="Dynamic"                     
                                                    CssClass="mandatory" 
                                                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
                                                    </asp:RegularExpressionValidator>
                                            </div>                                                                                           
                                            <div>
                                                <asp:LinkButton ID="IdeaSubmit" runat="server" CssClass="TabButton" OnClick="IdeaSubmit_Click" ValidationGroup="idea" >Submit</asp:LinkButton>                                         
                                                <asp:Label ID="lblIdeaSuccess" runat="server" CssClass="message" Text="" Visible="false"></asp:Label>
                                            </div>
                                        </div>
                                        <div class="tabContentRight">
                                            <h2>Add a new idea</h2>
                                            <p>
                                                We would like to get your ideas on how our website should be improved. Tell us about new features we should consider or how we can improve existing features.
                                            </p>           
                                            <p>
                                                Best regards, Fincart.com
                                            </p>                                                       
                                        </div>
                                    </div>
                                </ContentTemplate>   
                            </asp:UpdatePanel>                
		                </div>
		                <div>
			                 <asp:UpdatePanel ID="BugPanel" runat="server">
                                <ContentTemplate>                                    
                                    <div class="TabContainer">
                                        <div class="tabContentLeft">
                                            <div class="feedbackColoum">
                                                <span3><i class="fa fa-bars"></i></span3>
                                                <asp:TextBox ID="txtBugTitle" runat="server" CssClass="TabInputfield" placeholder="Title" ValidationGroup="bug"></asp:TextBox>                                        
                                            </div>                                                                        
                                            <div class="feedbackColoum">
                                                <span2><i class="fa fa-file-text-o"></i></span2>
                                                <textarea runat="server" id="txtBugDescription" class="TabInputfield" placeholder="Description of the problem"  name="address"  ValidationGroup="bug"></textarea>                                        
                                            </div>
                                            <div>
                                                <span3><i class="fa fa-user"></i></span3>
                                                <asp:TextBox ID="txtBugName" runat="server" CssClass="TabInputfield" placeholder="Name" ValidationGroup="bug"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="ReqBugName" ValidationGroup="bug" runat="server" ErrorMessage="Enter your name" Display="Dynamic" ControlToValidate="txtBugName" CssClass="mandatory"></asp:RequiredFieldValidator>
                                            </div>                                       
                                            <div>
                                                <span3><i class="fa fa-envelope-o"></i></span3>
                                                <asp:TextBox ID="txtBugEmail" runat="server" CssClass="TabInputfield" placeholder="Email" ValidationGroup="bug" ></asp:TextBox>                                        
                                                 <asp:RequiredFieldValidator ID="ReqBugEmail" ValidationGroup="bug" runat="server" ErrorMessage="Enter your emailid" Display="Dynamic" ControlToValidate="txtBugEmail" CssClass="mandatory"></asp:RequiredFieldValidator>
                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" 
                                                runat="server" ErrorMessage="Please Enter Valid Email ID"
                                                    ValidationGroup="bug" ControlToValidate="txtBugEmail" Display="Dynamic"                     
                                                    CssClass="mandatory" 
                                                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
                                                    </asp:RegularExpressionValidator>
                                            </div>                                                                                           
                                            <div>
                                                <asp:LinkButton ID="BugSubmit" runat="server" CssClass="TabButton" OnClick="BugSubmit_Click" ValidationGroup="bug" >Submit</asp:LinkButton>
                                                <asp:Label ID="lblBugSuccess" runat="server" Text="" CssClass="message" Visible="false"></asp:Label>
                                            </div>
                                        </div>
                                        <div class="tabContentRight">
                                            <h2>Report a Bug</h2>
                                            <p>
                                                Are you experiencing problems with this website? Please fill out and submit this form in order to submit a bug report to our friendly support-staff.
                                            </p>           
                                            <p>
                                                Best regards, Fincart.com
                                            </p>                                                   
                                        </div>
                                    </div>
                                </ContentTemplate>   
                            </asp:UpdatePanel> 
		                </div>
	                </div>
                    <div class="clear"></div>
                </div>
            </div>
        </div>
    </div>
        <!-- Main Container end -->
        </div>
    

    <script type="text/javascript">
        $(document).ready(function () {

            $('#parentHorizontalTab').easyResponsiveTabs({
                type: 'default', //Types: default, vertical, accordion
                width: 'auto', //auto or any width like 600px
                fit: true, // 100% fit in a container
                closed: 'accordion', // Start closed if in accordion view
                tabidentify: 'hor_1', // The tab groups identifier
                activate: function (event) { // Callback function if tab is switched
                    var $tab = $(this);
                    var $info = $('#nested-tabInfo');
                    var $name = $('span', $info);

                    $name.text($tab.text());

                    $info.show();
                }
            });

        });
</script>
    </asp:Content>

