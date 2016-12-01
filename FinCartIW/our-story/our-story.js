$( ".title" ).click(function() {
   $(".content").slideToggle();
   $(".content2").hide();
   $(".content3").hide();
   $(".content4").hide();
   $(".content5").hide();
});
$( ".title2" ).click(function() {
   $(".content2").slideToggle();
   $(".content").hide();
   $(".content3").hide();
   $(".content4").hide();
   $(".content5").hide();   
});
$( ".title3" ).click(function() {
   $(".content3").slideToggle();
   $(".content").hide();
   $(".content2").hide();   
   $(".content4").hide();
   $(".content5").hide();
});
$( ".title4" ).click(function() {
   $(".content4").slideToggle();
   $(".content").hide();
   $(".content2").hide();   
   $(".content3").hide();
   $(".content5").hide();
});
$( ".title5" ).click(function() {
   $(".content5").slideToggle();
   $(".content").hide();   
   $(".content2").hide();   
   $(".content3").hide();
   $(".content4").hide();
});