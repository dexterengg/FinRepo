<%@ Page Title="Transaction Type" Language="C#" MasterPageFile="Website.master" AutoEventWireup="true" CodeFile="accountType.aspx.cs" Inherits="accountType" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <script type="text/javascript">

        $(document).ready(function () {
            var amount = 0;
            var risk = 0;
            var amount2 = 0;
            $("input:radio[name=category]").click(function () {
                amount = $(this).val();
                //alert(amount);	
                $("#slider1").first().hide("slow", function showNext() {
                    $(this).next("#slider2").show("slow", showNext);
                });
            });

            $("input:button[name=goButton]").click(function () {
                amount = $("#cusAmount").val();
                //alert(amount);
                $("#slider1").first().hide("slow", function showNext() {
                    $(this).next("#slider2").show("slow", showNext);
                });

            });

            $("input:radio[name=risk]").click(function () {
                risk = $(this).val();
                //alert(risk);		
                //$( "#slider2" ).hide();
                $("#mfcslider").submit(); // Form submission.
                {
                    if (amount == "transact") {
                        document.location.href = "http://www.google.com";
                    }

                    if (amount == "fullyAssured") {
                        document.location.href = "PaidPlanOutput.aspx?tranType=" + amount + "&risk=" + risk + "";
                    }

                    if (amount == "financialPlan") {
                        //document.location.href = "MyDashBoard.aspx?tranType=" + amount + "&risk=" + risk + "";
                        document.location.href = "MyDetails.aspx?tranType=" + amount + "&risk=" + risk + "";
                    }
                    //document.location.href="http://www.google.com";
                }
            });

            $("a.radio-picture").click(function () {
                var $id = $(this).attr('id');
                $("a.radio-picture").removeClass('green-border');
                $("a#" + $id).addClass('green-border');
            });
        });


        function set_radio($inputid) {
            $("input#" + $inputid).click();
        }
</script>  
    <div class="my-db-area">
        
    <div id="slider">
	<div class="slide" id="slider1">
    	<h1>Select an option</h1>
        <p>
            <input type="radio" value="transact" name="category" id="category_1" class="hidden" />
            <a id="category_5000" href="javascript:set_radio('category_1');" class="radio-picture">&nbsp;</a>          			
    
            <input type="radio" value="financialPlan" name="category" id="category_2" class="hidden"  />
            <a id="category_10000" href="javascript:set_radio('category_2');" class="radio-picture">&nbsp;</a>
    
            <input type="radio" value="fullyAssured" name="category" id="category_3" class="hidden"  />
            <a id="category_15000" href="javascript:set_radio('category_3');" class="radio-picture">&nbsp;</a>               
        </p>
         <p>
            <span class="tranText">we can choose for you, you confirm, you transact<br />
            (what's best for you)
                </span>
             <span class="tranText">you make a plan, we suggest our researched pool, you confirm, you transact<br />
            (what's best for you)
                </span>
             <span class="tranText">we research your money, we suggest, we discuss, you approve, you transact<br />
            (we get to know each other too)
                </span>
        </p>
        <p>
            <a href="MyDashBoard.aspx?risk=A" ><i class="fa fa-fighter-jet"></i>Take me to my Dashboard</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <a href="#" ><i class="fa fa-fighter-jet"></i>Paid Plan Option</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <a href="#" ><i class="fa fa-fighter-jet"></i>Renew Plan</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </p>       
    </div>
    <div class="slide" id="slider2">
	    <h1>Select your risk profile</h1>
    	<p>
        	<input type="radio" value="1" name="risk" id="risk_1" class="hidden" />
            <a id="category_ultraconservative" href="javascript:set_radio('risk_1');" class="radio-pictureRisk">&nbsp;</a>
    
            <input type="radio" value="2" name="risk" id="risk_2" class="hidden" />
            <a id="category_conservative" href="javascript:set_radio('risk_2');" class="radio-pictureRisk">&nbsp;</a>
    
            <input type="radio" value="3" name="risk" id="risk_3" class="hidden" />
            <a id="category_moderate" href="javascript:set_radio('risk_3');" class="radio-pictureRisk">&nbsp;</a> 
            
            <input type="radio" value="4" name="risk" id="risk_4" class="hidden" />
            <a id="category_growth" href="javascript:set_radio('risk_4');" class="radio-pictureRisk">&nbsp;</a>               
            
            <input type="radio" value="5" name="risk" id="risk_5" class="hidden" />
            <a id="category_aggressive" href="javascript:set_radio('risk_5');" class="radio-pictureRisk">&nbsp;</a>                             
        </p>
        <%--<p>            
            
            <input type="button" value="Go >>" id="goButton" name="goButton" class="button" />
        </p>--%>
    </div>    
</div>
        </div>
            
</asp:Content>

