jQuery(document).ready(function(jQuery){ 
    
    var popup_delay = jQuery("#popup_delay").html();
    jQuery('#facebookpopup-fanback').delay(popup_delay).fadeIn('medium',
    function() { 
        setCookie("show_fb_popup_box", 'shown', 7); 
    });
    
    jQuery('#facebookpopup-fanclose, #facebookpopup-fan-exit').click(function(){
        jQuery('#facebookpopup-fanback').stop().fadeOut('medium');

    });
});

function setCookie(cname, cvalue, exdays) {
    var d = new Date();
    d.setTime(d.getTime() + (exdays*24*60*60*1000));
    var expires = "expires="+d.toGMTString();
    document.cookie = cname + "=" + cvalue + "; " + expires;
}
