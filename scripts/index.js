/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

window.onload = function(){
    steal(script_base_url+"libraries/jquery/jquery-2.0.2.min.js",loadJqueryPlugins);
    google.load("maps","3.8", {"other_params":"sensor=true",callback:loadGoogleMapPlugin});
}

function loadJqueryPlugins(){
    steal(//script_base_url+"libraries/javascriptmvc/jquerymx-3.2.custom.min_1.js",
          //script_base_url+"libraries/jquery/jquery-ui-1.8.11.custom.min.js",
          script_base_url+"libraries/jquery/plugins/jquery.form.js",
          //script_base_url+"libraries/bootstrap.js",
          script_base_url+"prettify.js",
          script_base_url+"libraries/jquery/plugins/jquery.validate.js",jqueryPluginsLoaded);
    $.getScript(script_base_url+"libraries/bootstrap.js");      
}

function loadGoogleMapPlugin(){
    steal(script_base_url+"libraries/gmap/gmaps.js",googleMapPluginsLoaded);
}

function jqueryPluginsLoaded(){
    
    $("form").each(function(){
        $(this).validate(validateOptions);
    });
    prettyPrint();
    if(window.jInit){
        jInit();
    }
}

function googleMapPluginsLoaded(){
    if(window.gInit){
        gInit();
    }
}

/****** Custom validation error ********/
function myErrorPlacement(error, element) {
            offset = element.position();
            error.insertBefore(element);
            error.addClass('message');  // add a class to the wrapper
            error.css('position', 'absolute');
            error.css('left',offset.left + element.outerWidth());
            error.css('top', offset.top);
        }
var validateOptions = {
        errorElement: "span",
        wrapper: "span",
        errorPlacement:myErrorPlacement
    };        
/******* XXX ********/    