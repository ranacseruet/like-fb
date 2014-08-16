<h1>HTML5 Audio Player Demo:</h1>
<p>
    This following demo will demonstrate you how the HTML5 audio file playing works in real world. It has preload="metadata" with no autplay
    option. Use the player control to start playing the sample music. It has two alternative audio format(mp3 and ogg), should you should be
    able to play it on any browser you like without any issue. But if you are still facing any, contact me by commeting on the tutorial page.
    Enjoy!
</p>
<p class="text-center">
    <a href="http://codesamplez.com/programming/html5-audio-api-tutorial " class="btn btn-info btn-large">Visit The HTML5 Audio API Tutorial</a>
</p>
<hr>
<p>
<div class="row-fluid">
    <audio controls preload="metadata"> 
        <source src="{$base_url}audio/music.mp3" type="audio/mpeg">
        <source src="{$base_url}audio/music.ogg" type="audio/ogg">
    </audio>
</div>
</p>
<hr>
<h2>HTML5 Audio Player Code:</h2>
<pre class="prettyprint linenums languague-html">
   {literal}
        &lt;audio controls preload="metadata"&gt;
            &lt;source src="{$base_url}audio/music.mp3" type="audio/mpeg"&gt;
            &lt;source src="{$base_url}audio/music.ogg" type="audio/ogg"&gt;
        &lt;/audio&gt;
   {/literal}    
</pre>