jQuery(document).ready(function(jQuery){ 
    var popup_delay = jQuery("#popup_delay").html();
    jQuery('#facebookpopup-fanback').delay(popup_delay).fadeIn('medium');
    jQuery('#facebookpopup-fanclose, #facebookpopup-fan-exit').click(function(){
        jQuery('#facebookpopup-fanback').stop().fadeOut('medium');

    });
});
