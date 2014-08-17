<?php
/*
Plugin Name: Like FB
Plugin URI: http://wordpress.org/extend/plugins/like-fb/
Description: Very Simple light weight plugin to integrate facebook like button on every post
Version: 2.1.6
Author: Md. Ali Ahsan Rana	
Author URI: http://codesamplez.com
License: GPL2
*/
/*  Copyright 2010  MD. ALI AHSAN RANA  (email : admin@codesamplez.com)

    This program is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License, version 2, as 
    published by the Free Software Foundation.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program; if not, write to the Free Software
    Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
*/

$fb_opt_name       = "like_fb_show";
$gp_opt_name       = "like_gplus_show";
$popup_fb_page     = "popup_fb_page";
$popup_delay       = "popup_delay";
$fb_popup_box      = "fb_popup_box";
$page_not_like_box    = "page_not_like_box";
session_start();

/*************Plugin Functions****************/
function get_the_like_button($url){
    $iframe = "<iframe src=\"//www.facebook.com/plugins/like.php?href={$url}&amp;send=false&amp;layout=box_count&amp;width=0&amp;show_faces=false&amp;font=lucida+grande&amp;colorscheme=light&amp;action=like&amp;height=0&amp;appId=276364829074878\" scrolling=\"no\" frameborder=\"0\" style=\"border:none; overflow:hidden; width:50px; height:70px;\" allowTransparency=\"true\"></iframe>";
    return $iframe;	
}

function get_the_plus_button($size="tall"){
    $plus_code = "
                    <div class=\"g-plusone\" data-size=\"{$size}\"></div>
                    <script type=\"text/javascript\">
                      (function() {
                        var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true;
                        po.src = 'https://apis.google.com/js/plusone.js';
                        var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);
                      })();
                    </script>";
    return $plus_code;
}

function like_fb($content)  {
        global $fb_opt_name,$gp_opt_name,$page_not_like_box;
	//retrieve post id
	$post_id =  get_the_ID();
	//retrieve post url
	$current_url = get_permalink($post_id);
	//encode the url
	$url = urlencode($current_url);
	
	$posted_page_permalinks      = htmlspecialchars(get_option($page_not_like_box));
        $posted_page_permalinks      = explode("\r\n", $posted_page_permalinks);
        
        $post_values = get_post_custom( $post_id );
        $post_check = isset( $post_values['meta_box_fb_like_check'] ) ? esc_attr( $post_values['meta_box_fb_like_check'][0])  : 'on';
    
        if( !(in_array($current_url, $posted_page_permalinks)) && $post_check !='off'){
            $plugin_content = "<div style='float:left;margin-right:7px;' class='like-fb'>";

            $nl = FALSE;
            if(get_option($fb_opt_name)){
                $plugin_content .= get_the_like_button($url);
                $nl = TRUE;
            }

            if(get_option($gp_opt_name)){
                if($nl){
                    $plugin_content .= "<br />";
                }
                $plugin_content .= get_the_plus_button();
            }
            $plugin_content .= "</div>";

            $content = $plugin_content.$content;
        }
        
    return $content;
}

function popup_box(){
        global $popup_fb_page,$popup_delay,$fb_popup_box;  
        
        if(get_option($fb_popup_box) && !isset($_COOKIE['show_fb_popup_box'])){
                             
                $popup_fb_url  = get_option($popup_fb_page);
                $delay         = get_option($popup_delay);

                
                $footer = file_get_contents(dirname(__FILE__).'/front_end_popup.php');
                $footer = str_replace('__URL__', $popup_fb_url, $footer);
                $footer = str_replace('__DELAY__', $delay*1000, $footer);
                echo $footer;
            
        }
        
}



function fancybox_scripts() {
    wp_enqueue_script( 'page_script', plugins_url( 'js/popup.js' , __FILE__ ), array(),NULL,TRUE);
    wp_enqueue_style( 'popup_style', plugins_url( 'css/popup.css' , __FILE__ ));
    
}



/***************Plugin Functions****************/

/****** Admin Functions *********/

function like_fb_menu() {
	add_options_page( 'Like FB Plugin Options', 'Like FB', 'manage_options', 'like-fb-option', 'like_fb_plugin_options' );
}

function like_fb_plugin_options() {
	if ( !current_user_can( 'manage_options' ) )  {
		wp_die( __( 'You do not have sufficient permissions to access this page.' ) );
	}
	include __DIR__."/options.php";
}

//inline settings menu on admin section
function inline_settings_link( $links ) {
    $settings_link = '<a href="'.admin_url( 'options-general.php?page=like-fb-option' ).'">Settings</a>';
    array_push( $links, $settings_link );
    return $links;
}

$plugin = plugin_basename( __FILE__ );


//add meta box on each post/page on admin section
function fb_like_meta_box_add()
{
    add_meta_box( 'my-meta-box-id', 'Like-FB', 'meta_box_fb_like', 'post', 'normal', 'high' );
    add_meta_box( 'my-meta-box-id', 'Like-FB', 'meta_box_fb_like', 'page', 'normal', 'high' );

}

function meta_box_fb_like()
{
    global $post;
    $values = get_post_custom( $post->ID );
    $check = isset( $values['meta_box_fb_like_check'] ) ? esc_attr( $values['meta_box_fb_like_check'][0])  : 'on';
    
    // We'll use this nonce field later on when saving.
    wp_nonce_field( 'my_meta_box_nonce', 'meta_box_nonce' );
    ?>
    <p>
        <input type="checkbox" id="meta_box_fb_like_check" name="meta_box_fb_like_check" <?php checked( $check, 'on' ); ?> />
        <label for="meta_box_fb_like_check">Show Facebook & Goggle+ like button </label>
        <a href="options-general.php?page=like-fb-option" style="float:right">Advance Settings</a>
    </p>
    <?php
}

//save fb_like meta box data 
function fb_like_meta_box_save( $post_id )
{
    // Bail if we're doing an auto save
    if( defined( 'DOING_AUTOSAVE' ) && DOING_AUTOSAVE ) return;
     
    // if our nonce isn't there, or we can't verify it, bail
    if( !isset( $_POST['meta_box_nonce'] ) || !wp_verify_nonce( $_POST['meta_box_nonce'], 'my_meta_box_nonce' ) ) return;
     
    // if our current user can't edit this post, bail
    if( !current_user_can( 'edit_post' ) ) return;
     
    $chk = isset( $_POST['meta_box_fb_like_check'] )? 'on' : 'off';
    update_post_meta( $post_id, 'meta_box_fb_like_check', $chk );
}

/************End Admin Functions**************/

add_action( 'add_meta_boxes', 'fb_like_meta_box_add' );
add_action( 'save_post', 'fb_like_meta_box_save' );
add_filter('the_content', 'like_fb'); 
if(get_option($fb_popup_box) && !isset($_COOKIE['show_fb_popup_box'])){
    add_action('wp_enqueue_scripts', 'fancybox_scripts');
}
add_action('wp_footer', 'popup_box');

add_action( 'admin_menu', 'like_fb_menu' );
add_filter( "plugin_action_links_$plugin", 'inline_settings_link' );
