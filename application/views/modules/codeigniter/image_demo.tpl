<h1>CodeIgniter Image Manipulation Demo:</h1>

<p>
    This small demo will show you how the codeigniter image manipulation tutorial would work in real time implementation. Here in this example demo,
    you will be able to upload a single image file at a time with file type restricted to <strong>gif,jpg,png and jpeg</strong> . After the image uploaded 
    successfully, you should be able to see the details of the uploaded image that codeigniter preserve in its internal variable and see how the image
    process makes effect on the original image, side by side. You can choose the specific mode with which you want the image to be processed. Cheers.
</p>

<p class="text-center">
    <a href="http://codesamplez.com/development/codeigniter-image-manipulation" class="btn btn-info btn-large">Visit The CodeIgniter Image Manipulation Tutorial</a>
</p>

<form action="" method="POST" enctype="multipart/form-data" >
    Select File To Upload:<br />
    <input type="file" name="userfile" multiple="multiple"  />
    <br /><br />
    <label>Select Mode:</label>        
    <input type="radio" name="mode" value="crop" checked="checked" /> &nbsp; Crop
    <input type="radio" name="mode" value="resize" /> &nbsp; Resize
    <input type="radio" name="mode" value="rotate" /> &nbsp; Rotate
    <input type="radio" name="mode" value="watermark" /> &nbsp; Water Mark
    <br /><br />
    <input type="submit" name="submit" value="Upload" class="btn btn-success" />
</form>

{if isset($uploaded_file)}
    
    <div class="row">
        <div class="span6">
            Original Image: <img src="{$base_url}/images/{$uploaded_file.client_name}" />
        </div>
        <div class="span6">
            Processed Image: <img src="{$base_url}/images/{$uploaded_file.raw_name}_thumb{$uploaded_file.file_ext}" />
        </div>
    </div>
        <h2>File Details:</h2>
    {foreach from=$uploaded_file key=name item=value}
        {$name} : {$value}
        <br />
    {/foreach}    
{/if} 

<br /><br />

Controller Function Code:

<pre class="prettyprint linenums languague-php">
   {literal}
     /**
     * demo for image manipulation with codeigniter tutorial on codesamplez.com
     */
    public function image_demo()
    {
        try
        {
            if($this->input->post("submit")){        
                $this->load->library("app/uploader");
                $config = $this->config->item("rules");
                $this->uploader->do_upload($config["image"]);
                
                $image_data                          =   $this->upload->data();
                $config["manipulation"]['source_image']      =   $image_data['full_path'];
                $this->load->library('image_lib', $config["manipulation"]); 
                
                
                switch($this->input->post("mode"))
                {
                    case "crop":
                        $this->image_lib->crop();
                        break;
                    case "resize":
                        $this->image_lib->resize();
                        break;
                    case "rotate":
                        $config["manipulation"]['rotation_angle'] = '90';
                        $this->image_lib->initialize($config["manipulation"]); 
                        $this->image_lib->rotate();
                        break;
                    case "watermark":
                        $config["manipulation"]['wm_text'] = 'Copyright 2013 - CodeSamplez.com';
                        $config["manipulation"]['wm_type'] = 'text';
                        $this->image_lib->initialize($config["manipulation"]); 
                        $this->image_lib->watermark();    
                }
            }
            return $this->view();
        }
        catch(Exception $err)
        {
            log_message("error",$err->getMessage());
            return show_error($err->getMessage());
        }
    }
   {/literal}    
</pre>

Smarty Template View Code:

<pre class="prettyprint linenums languague-php">
   {literal}
    &lt;form action="" method="POST" enctype="multipart/form-data" &gt;
        Select File To Upload:&lt;br /&gt;
        &lt;input type="file" name="userfile" multiple="multiple"  /&gt;
        &lt;br /&gt;&lt;br /&gt;
        &lt;label>Select Mode:&lt;/label&gt;        
        &lt;input type="radio" name="mode" value="crop" checked="checked" /&gt; &nbsp; Crop
        &lt;input type="radio" name="mode" value="resize" /&gt; &nbsp; Resize
        &lt;input type="radio" name="mode" value="rotate" /&gt; &nbsp; Rotate
        &lt;input type="radio" name="mode" value="watermark" /&gt; &nbsp; Water Mark
        &lt;br /&gt;&lt;br /&gt;
        &lt;input type="submit" name="submit" value="Upload" class="btn btn-success" /&gt;
    &lt;/form&gt;

{if isset($uploaded_file)}
    
    &lt;div class="row"&gt;
        &lt;div class="span6"&gt;
            Original Image: &gt;img src="{$base_url}/images/{$uploaded_file.client_name}" /&gt;
        &lt;/div&gt;
        &lt;div class="span6"&gt;
            Processed Image: &gt;img src="{$base_url}/images/{$uploaded_file.raw_name}_thumb{$uploaded_file.file_ext}" /&gt;
        &lt;/div&gt;
    &lt;/div&gt;
        &lt;h2&gt;File Details:&gt;/h2&gt;
    {foreach from=$uploaded_file key=name item=value}
        {$name} : {$value}
        &lt;br /&gt;
    {/foreach}    
{/if} 
   {/literal}    
</pre>


our application's 'uploader' library Code is exactly same as the one shown on <a href="{$base_url}/codeigniter/file-upload-demo">codeigniter file upload demo</a>.