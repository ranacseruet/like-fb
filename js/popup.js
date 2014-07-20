jQuery(document).ready(function(jQuery){ 
    var delay = jQuery("#popup_delay").html();
    var fancy = setTimeout(function () {
        
        jQuery.fancybox.open([{
            content: jQuery(".popup")
        }])
    }, delay);
});
