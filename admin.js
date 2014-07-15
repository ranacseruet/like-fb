jQuery(document).ready(function(jQuery){ 
    jQuery( "#like_fb" ).validate({
        rules: {
            popup_delay: {
            number: true,
            required:true
            }
        },
        errorPlacement: function( label, element ) {         
            element.parent().append( label ); 
        }
     });
});