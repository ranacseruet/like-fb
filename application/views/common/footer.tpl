{if $smarty.const.ENVIRONMENT != "development"}
<div class="span12" style="margin: 0px auto">
<!-- sidebar-responsive -->
<ins class="adsbygoogle"
     style="display:block"
     data-ad-client="ca-pub-7238030838481733"
     data-ad-slot="7582746338"
     data-ad-format="auto"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>
{/if}
</div>
<div class="container" >
    <div class="row">
        <div class="col-md-6">
            Powered By <a href="http://codesamplez.com" class="btn btn-link">CodeSamplez.com</a>
        </div>
   
        <div class="col-md-6">
            Back To <a href="http://demo.codesamplez.com" class="btn btn-link">Demo.CodeSamplez.com</a></br>
            <iframe src="//www.facebook.com/plugins/likebox.php?href=http%3A%2F%2Fwww.facebook.com%2Fcodesamplez&amp;width=292&amp;height=62&amp;show_faces=false&amp;colorscheme=light&amp;stream=false&amp;border_color&amp;header=false&amp;appId=276364829074878" scrolling="no" frameborder="0" style="border:none; overflow:hidden; width:292px; height:62px;" allowTransparency="true"></iframe>
        </div>
    </div>
    <div class="clear"></div>
    {if $is_logged_in AND $is_admin}
        <a href="{$base_url}admin">Administration</a>
    {/if}
</div> 
        