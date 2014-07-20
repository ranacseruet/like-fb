<?php
global $fb_opt_name,$gp_opt_name,$popup_fb_page,$popup_delay,$fb_popup_box;
if(isset($_POST["submit"])){ 
    $fb_show                = $_POST[$fb_opt_name];
    update_option($fb_opt_name, $fb_show);
    $gplus_show             = $_POST[$gp_opt_name];
    update_option($gp_opt_name, $gplus_show);
    $popup_fb_page_show     =  $_POST[$popup_fb_page];
    update_option($popup_fb_page, $popup_fb_page_show);
    $popup_delay_show       =  $_POST[$popup_delay];
    update_option($popup_delay, $popup_delay_show);
    $fb_popup_box_show      =  $_POST[$fb_popup_box];
    update_option($fb_popup_box, $fb_popup_box_show);
    
    echo '<div id="message" class="updated fade"><p>Options Updates</p></div>';
}
else{
    $fb_show             = get_option($fb_opt_name);
    $gplus_show          = get_option($gp_opt_name);
    $popup_fb_page_show  = get_option($popup_fb_page);
    $popup_delay_show    = get_option($popup_delay);
    $fb_popup_box_show   = get_option($fb_popup_box);
}
?>
<div class="wrap">
    <?php screen_icon(); ?>
    <h2>Welcome To Like FB Plugin Administration Page</h2>
    <br />
    <br />
    <div class="like-fb-left">
        <fieldset>
            <legend>General Settings</legend>
            <form id="like_fb" method="post" action=""> 
                <input type="checkbox" name="<?php echo $fb_opt_name; ?>" <?php echo $fb_show?"checked='checked'":""; ?> /> &nbsp; <span> Show Facebook Like Button </span>
                <br /><br />
                <input type="checkbox" name="<?php echo $gp_opt_name; ?>" <?php echo $gplus_show?"checked='checked'":""; ?> /> &nbsp; <span> Show Google+ Button </span>
                <br /><br />
                <h3>Setting for facebook popup box</h3>
                <br /><br />
                <input type="checkbox" name="<?php echo $fb_popup_box; ?>" <?php echo $fb_popup_box_show?"checked='checked'":""; ?> /> &nbsp; <span> Show Facebook  Popup Box</span>
                <br /><br />
                <label for="<?php echo $popup_fb_page;?>">Facebook Page</label>
                http://www.facebook.com/<input type="text" name="<?php echo $popup_fb_page;?>" value="<?php echo $popup_fb_page_show?$popup_fb_page_show:"codesamplez"; ?>" />
                <br /><br />
                <div>
                    <label for="<?php echo $popup_delay;?>">Popup Delay</label>
                    <input type="text" name="<?php echo $popup_delay;?>" value="<?php echo $popup_delay_show?$popup_delay_show:"2"; ?>" /> sec
                </div>
                <p>
                    <input type="submit" value="Save" class="button button-primary" name="submit" />
                </p>
            </form>
        </fieldset>        
    </div>

    <?php include(__DIR__."/support.php"); ?>
    <link rel="stylesheet" type="text/css" href="<?php echo site_url() ?>/wp-content/plugins/like-fb/css/like-fb.css"  />
