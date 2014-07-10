<?php
    global $fb_opt_name,$gp_opt_name;
if(isset($_POST["submit"])){ 
    $fb_show = $_POST[$fb_opt_name];
    update_option($fb_opt_name, $fb_show);
    $gplus_show = $_POST[$gp_opt_name];
    update_option($gp_opt_name, $gplus_show);
    
    echo '<div id="message" class="updated fade"><p>Options Updates</p></div>';
}
else{
    $fb_show = get_option($fb_opt_name);
    $gplus_show = get_option($gp_opt_name);
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
        <form method="post" action=""> 
            <input type="checkbox" name="<?php echo $fb_opt_name; ?>" <?php echo $fb_show?"checked='checked'":""; ?> /> &nbsp; <span> Show Facebook Like Button </span>
            <br /><br />
            <input type="checkbox" name="<?php echo $gp_opt_name; ?>" <?php echo $gplus_show?"checked='checked'":""; ?> /> &nbsp; <span> Show Google+ Button </span>
            <p><input type="submit" value="Save" class="button button-primary" name="submit" /></p>
        </form>
    </fieldset>        
</div>
<?php include(__DIR__."/support.php"); ?>
<link rel="stylesheet" type="text/css" href="<?php echo site_url() ?>/wp-content/plugins/like-fb/like-fb.css"  />