<%@ Page Title="Know Your Fund" Language="C#" MasterPageFile="DashBoard.master" AutoEventWireup="true" 
    CodeFile="KnowFund.aspx.cs" EnableEventValidation="false" Inherits="KnowFund" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">    
    <div class="my-db-area">
        <div class="toparea">
            <h1>List of Funds to Invest</h1>            
        </div>
        <div class="goalSchemes">
            <h2>For Goals</h2>
            <asp:GridView ID="GridViewSchemes" runat="server" AutoGenerateColumns="false" Width="100%" GridLines="None" 
                DataKeyNames="Exlcode"  >
                    <Columns> 
                        <asp:TemplateField Visible="false">
                            <ItemTemplate>
                                <asp:Label id="lblexlcode" runat ="server" text='<%# Eval("Exlcode")%>' />
                            </ItemTemplate>
                        </asp:TemplateField>                                           
                        <asp:BoundField DataField="ShName" HeaderText="Scheme Name"   >
                        <HeaderStyle HorizontalAlign="Left" Width="80%" />
                        <ItemStyle HorizontalAlign="Left" Width="80%" />
                        </asp:BoundField>  
                        <asp:BoundField DataField="SIPAmt" HeaderText="SIP Amount" DataFormatString="{0:##,##,##,##,###}"   >
                        <HeaderStyle HorizontalAlign="right" Width="10%" />
                        <ItemStyle HorizontalAlign="right" Width="10%" />
                        </asp:BoundField> 
                        <asp:TemplateField HeaderText="" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>                                            
                                <a href="#" id="link2"  class="md-trigger" data-modal="Modal-LMSEdit<%# Eval("Exlcode") %>">Scheme Detail</a>
                                <div class="md-modalBig md-effect-1" id='Modal-LMSEdit<%# Eval("Exlcode") %>'>
			                        <div class="md-content">
				                        <h3>Scheme Details<span><a href="#" class="md-close" style="text-decoration:none;">X</a></span></h3>
                                        <div>
                                            <iframe src="SchemeDetail.aspx?exlcode=<%# Eval("Exlcode") %>" width="100%" height="420px" scrolling="no" frameborder="0"></iframe>
                                        </div>				                        
			                        </div>
		                        </div>
                                <div class="md-overlay"></div><!-- the overlay element --> 

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
        <div class="goalSchemes">
            <h2>For Retirement</h2>
            <asp:GridView ID="GridViewRetirement" runat="server" AutoGenerateColumns="false" Width="100%" GridLines="None" >
                <Columns>                                        
                    <asp:BoundField DataField="ShName" HeaderText="Scheme Name"   >
                    <HeaderStyle HorizontalAlign="Left" Width="80%" />
                    <ItemStyle HorizontalAlign="Left" Width="80%" />
                    </asp:BoundField>  
                    <asp:BoundField DataField="SIPAmt" HeaderText="SIP Amount"  DataFormatString="{0:##,##,##,##,###}"   >
                    <HeaderStyle HorizontalAlign="right" Width="10%" />
                    <ItemStyle HorizontalAlign="right" Width="10%" />
                    </asp:BoundField> 
                    <asp:TemplateField HeaderText="" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>                                            
                            <a href="#" id="link2"  class="md-trigger" data-modal="Modal-LMSEdit<%# Eval("Exlcode") %>">Scheme Detail</a>
                            <div class="md-modalBig md-effect-1" id='Modal-LMSEdit<%# Eval("Exlcode") %>'>
			                    <div class="md-content">
				                    <h3>Scheme Details<span><a href="#" class="md-close" style="text-decoration:none;">X</a></span></h3>
                                    <div>
                                        <iframe src="SchemeDetail.aspx?exlcode=<%# Eval("Exlcode") %>" width="100%" height="420px" scrolling="no" frameborder="0"></iframe>
                                    </div>				                        
			                    </div>
		                    </div>
                            <div class="md-overlay"></div><!-- the overlay element --> 

                        </ItemTemplate>
                    </asp:TemplateField>                                                                                                                                                       
            </Columns>
            <AlternatingRowStyle CssClass="GV-AlternatingRowStyleBig" />
            <EditRowStyle CssClass="GV-EditRow" />                                                                       
            <HeaderStyle CssClass="GV-HeaderStyleBig" />
            <PagerStyle CssClass="GV-PagerStyle" />
            <RowStyle CssClass="GV-RowStyleBig" />
            <SelectedRowStyle CssClass="GV-SelectedRowStyle" />    
        </asp:GridView>
        </div>
        <div class="startSIPDiv">
            <asp:LinkButton ID="btnInvestNow" runat="server"  class="startSIP" OnClick="btnInvestNow_Click" >Invest Now</asp:LinkButton>                        
        </div>
        <div class="goalSchemes">
            <h2>For Insurance</h2>
            <p>Click on a link below to buy online insurance instantly. Speak to someone in our support team if you need complete guidance...</p>
            <a href="http://ops.hdfclife.com/ops/click2protectPlus.do?source=fincart.com" target="_blank"><img src="images/hdfc-click2protect.jpg" width="201" height="80" /></a>
            <a href="http://ops.hdfclife.com/ops/main.do?source=&catagoery=CC&productcode=UC1" target="_blank"><img src="images/hdfc-click2invest.jpg" width="201" height="80" /></a>
            <a href="http://ops.hdfclife.com/ops/cancercare.do?source=Fincart_CancerCare" target="_blank"><img src="images/hdfc-cacer.jpg" width="201" height="80" /></a>
            <a href="http://www.religarehealthinsurance.com/religare/buy-health-insurance-policy-plan-online.html?agentId=20004978&utm_source=fincart" target="_blank"><img src="images/religare.jpg" width="201" height="80" /></a>
        </div>                        
    </div>     
</asp:Content>

