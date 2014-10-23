jQuery(document).ready(function(jQuery){ 
    
    var popup_delay = jQuery("#popup_delay").html();
	var get_cookie = getCookie("show_fb_popup_box");
	
	if (get_cookie == ""){
		console.log("enter");
		jQuery('#facebookpopup-fanback').delay(popup_delay).fadeIn('medium',
		function() { 
			setCookie("show_fb_popup_box", 'shown', 7); 
		});

		jQuery('#facebookpopup-fanclose, #facebookpopup-fan-exit').click(function(){
			jQuery('#facebookpopup-fanback').stop().fadeOut('medium');

		});
		jQuery('.already-liked-btn').click(function(){
			setCookie("show_fb_popup_box", 'shown', 365); 
			jQuery('#facebookpopup-fanback').stop().fadeOut('medium');
		});
	}
});

function setCookie(cname, cvalue, exdays) {
    var d = new Date();
    d.setTime(d.getTime() + (exdays*24*60*60*1000));
    var expires = "expires="+d.toGMTString();
    var path    = "path=/";
    document.cookie = cname + "=" + cvalue + "; " + expires + "; " + path;
}

function getCookie(cname) {
    var name = cname + "=";
    var ca = document.cookie.split(';');
    for(var i=0; i<ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0)==' ') c = c.substring(1);
        if (c.indexOf(name) != -1) return c.substring(name.length,c.length);
    }
    return "";
}
