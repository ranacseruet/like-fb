<h1>Javascript Audio Controller Demo:</h1>
<p>
    This following demo will demonstrate you how we can control a html5 audio with help of Javacsript/jQuery. We can perform almost every
    operations such as load,start,stop,pause,move forward,move backward etc with a little trick of jQuery code. Also, this demo will help 
    you how you can load alternative audio if one format isn't supported by browser. Such as, "audio/mpeg"(.mp3) format isn't supported by
    mozilla firefox browser. So, for that, we can load an alternate version. If you are using other browser than mozilla, then you should
    be able to listen a pitbull music(internation love, YAY!), which is in .mp3 format . For firefox users, it will alternatively load a
    small size sample audio which is in .ogg format. Test out it for yourself!
    
    If you are facing any issue on running the demo, please let me know by commenting on the original tutorial page as mentioned below.
    Enjoy!
</p>
<p class="text-center">
    <a href="http://codesamplez.com/programming/control-html5-audio-with-jquery " class="btn btn-info btn-large">Visit The jQuery Audio control Tutorial</a>
</p>
<hr>
<p>
<div class="row-fluid">
    <div class="span12 alert-success text-center">
    </div>
    <div class="span12">
         &nbsp;
    </div>
    <div class="span12">
        <div class="span4">
            <audio class="audioDemo" controls preload="none"> 
                <source src="{$base_url}audio/pitbull.mp3" type="audio/mpeg">
                <source src="{$base_url}audio/music.ogg" type="audio/ogg">
            </audio>
        </div>
        <div class="span8">
            <a class="btn load">Load Audio</a>
            <a class="btn btn-success start">Start Audio</a>
           
            <a class="btn back">&lt;&lt;</a>
            <a class="btn forward"> &gt;&gt;</a>
            
            <a class="btn btn-info pause">Pause Audio</a>
            <a class="btn btn-danger stop">Stop Audio</a>
            <br><br>
            <a class="btn volume-up">Volume Up</a>
            <a class="btn volume-down">Volume down</a>
            <a class="btn mute">Toggle Volume On/Off</a>
        </div>
    </div>
</div>
</p>
<hr>
<h2>Audio Player HTML5 Code:</h2>
<pre class="prettyprint linenums languague-html">
   {literal}
        &lt;audio controls preload="none"&gt;
            &lt;source src="{$base_url}audio/pitbull.mp3" type="audio/mpeg"&gt;
            &lt;source src="{$base_url}audio/music.ogg" type="audio/ogg"&gt;
        &lt;/audio&gt;
   {/literal}    
</pre>
<h2>Javascript Audio Controller Code:</h2>
<pre class="prettyprint linenums languague-html">
   {literal}
        var audio;
        //jInit is my own site standard which is triggered after aynschronous loading of javascript
        //libraries. You can here use $(document).ready instead, in general case.
        function jInit(){
            audio = $(".audioDemo");
            addEventHandlers();
        }

        function addEventHandlers(){
            $("a.load").click(loadAudio);
            $("a.start").click(startAudio);
            $("a.forward").click(forwardAudio);
            $("a.back").click(backAudio);
            $("a.pause").click(pauseAudio);
            $("a.stop").click(stopAudio);
            $("a.volume-up").click(volumeUp);
            $("a.volume-down").click(volumeDown);
            $("a.mute").click(toggleMuteAudio);
        }

        function loadAudio(){
            audio.bind("load",function(){
                $(".alert-success").html("Audio Loaded succesfully");
            });
            audio.trigger('load');
        }

        function startAudio(){
            audio.trigger('play');
        }

        function pauseAudio(){
            audio.trigger('pause');
        }

        function stopAudio(){
            pauseAudio();
            audio.prop("currentTime",0);
        }

        function forwardAudio(){
            pauseAudio();
            audio.prop("currentTime",audio.prop("currentTime")+5);
            startAudio();
        }

        function backAudio(){
            pauseAudio();
            audio.prop("currentTime",audio.prop("currentTime")-5);
            startAudio();
        }

        function volumeUp(){
            var volume = audio.prop("volume")+0.2;
            if(volume >1){
                volume = 1;
            }
            audio.prop("volume",volume);
        }

        function volumeDown(){
            var volume = audio.prop("volume")-0.2;
            if(volume <0){
                volume = 0;
            }
            audio.prop("volume",volume);
        }

        function toggleMuteAudio(){
            audio.prop("muted",!audio.prop("muted"));
        }
   {/literal}    
</pre>