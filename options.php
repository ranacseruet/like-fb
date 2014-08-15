<?php
global $fb_opt_name,$gp_opt_name,$popup_fb_page,$popup_delay,$fb_popup_box,$page_not_like_box;

if(isset($_POST["submit"])){ 
    
    $fb_show                =  $_POST[$fb_opt_name];
    $gplus_show             =  $_POST[$gp_opt_name];
    $popup_fb_page_show     =  $_POST[$popup_fb_page];
    $fb_popup_box_show      =  $_POST[$fb_popup_box];
    $popup_delay_show       =  $_POST[$popup_delay];
    $page_not_like_box_show    =  $_POST[$page_not_like_box];
    
    if($fb_popup_box_show){
        if (is_numeric ($popup_delay_show)){
            
            updateField($fb_show,$gplus_show,$popup_fb_page_show,$popup_delay_show,$fb_popup_box_show,$page_not_like_box_show);
        }
        else{
            echo '<div id="message" class="updated fade error"><p>Popup Delay must be numeric </p></div>';
        }
    }
    else{
        updateField($fb_show,$gplus_show,$popup_fb_page_show,$popup_delay_show,$fb_popup_box_show,$page_not_like_box_show);
    }
    
    
}
else{
    $fb_show             = get_option($fb_opt_name);
    $gplus_show          = get_option($gp_opt_name);
    $popup_fb_page_show  = get_option($popup_fb_page);
    $popup_delay_show    = get_option($popup_delay);
    $fb_popup_box_show   = get_option($fb_popup_box);
    $page_not_like_box_show = get_option($page_not_like_box);
}

function updateField($fb_show,$gplus_show,$popup_fb_page_show,$popup_delay_show,$fb_popup_box_show,$page_not_like_box_show=NULL){
    
    global $fb_opt_name,$gp_opt_name,$popup_fb_page,$popup_delay,$fb_popup_box,$page_not_like_box;
    
    update_option($fb_opt_name, $fb_show);
    update_option($gp_opt_name, $gplus_show);
    update_option($popup_fb_page, $popup_fb_page_show);
    update_option($popup_delay, $popup_delay_show);
    update_option($fb_popup_box, $fb_popup_box_show);
    update_option($page_not_like_box, $page_not_like_box_show);

    echo '<div id="message" class="updated fade"><p>Options Updates</p></div>';
}

?>
<div class="wrap">
    <?php screen_icon(); ?>
    <h2>Welcome To Like FB Plugin Administration Page</h2>
    <br />
    <br />
    <div class="like-fb-left">
        <fieldset>
            <legend>Settings</legend>
            <form id="like_fb" method="post" action=""> 
                <h3>Setting for Single Click Facebook Like/Google+ Button</h3>  
                <input type="checkbox" name="<?php echo $fb_opt_name; ?>" <?php echo $fb_show?"checked='checked'":""; ?> /> &nbsp; <span> Show Facebook Like Button </span>
                <br /><br />
                <input type="checkbox" name="<?php echo $gp_opt_name; ?>" <?php echo $gplus_show?"checked='checked'":""; ?> /> &nbsp; <span> Show Google+ Button </span>
                <br /><br />
                <div id="page_not_like_box">
                    Add page url in which page you don't want to show the Facebook & Google+ button<br/>
                    <textarea rows="5" cols="50" name='<?php echo $page_not_like_box;?>'><?php echo $page_not_like_box_show;?></textarea>
                </div>
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
    
