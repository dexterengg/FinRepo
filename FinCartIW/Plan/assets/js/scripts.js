
jQuery(document).ready(function() {
	
    /*
        Fullscreen background
    */
    $.backstretch("assets/img/backgrounds/1.jpg");
    
    $('#top-navbar-1').on('shown.bs.collapse', function(){
    	$.backstretch("resize");
    });
    $('#top-navbar-1').on('hidden.bs.collapse', function(){
    	$.backstretch("resize");
    });
    
    /*
        Form
    */
    $('.registration-form fieldset:first-child').fadeIn('slow');
    
    $('.registration-form input[type="text"], .registration-form input[type="password"], .registration-form textarea').on('focus', function() {
    	$(this).removeClass('input-error');
    });
    
    // next step
    $('.registration-form .btn-next').on('click', function() {
    	var parent_fieldset = $(this).parents('fieldset');
    	var next_step = true;    	
    	/*parent_fieldset.find('input[type="text"], input[type="radio"], textarea').each(function() {
    	if ($('#ContentPlaceHolder1_age1:checked').length <= 0 || $('#ContentPlaceHolder1_age2:checked').length <= 0 || $('#ContentPlaceHolder1_age3:checked').length <= 0 || $('#ContentPlaceHolder1_age4:checked').length <= 0)
			{
    	        alert("Select your Age");
    			next_step = false;
    	    }
    	if ($('#ContentPlaceHolder1_status1:checked').length <= 0 || $('#ContentPlaceHolder1_status2:checked').length <= 0 || $('#ContentPlaceHolder1_status3:checked').length <= 0 || $('#ContentPlaceHolder1_status4:checked').length <= 0) {
    	        alert("Select your Marital Status");
    	        next_step = false;
    	    }
    		else {
    	        next_step = true;
    		}
    	});*/
    	
    	if( next_step ) {
    		parent_fieldset.fadeOut(400, function() {
	    		$(this).next().fadeIn();
	    	});
    	}
    	
    });
    
    // previous step
    $('.registration-form .btn-previous').on('click', function() {
    	$(this).parents('fieldset').fadeOut(400, function() {
    		$(this).prev().fadeIn();
    	});
    });
    
    // submit
    $('.registration-form').on('submit', function(e) {
    	
    	$(this).find('input[type="text"], input[type="password"], textarea').each(function() {
    		if( $(this).val() == "" ) {
    			e.preventDefault();
    			$(this).addClass('input-error');
    		}
    		else {
    			$(this).removeClass('input-error');
    		}
    	});
    	
    });
    
    
});
