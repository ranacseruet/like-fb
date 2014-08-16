<h1>CodeIgniter File Upload Tutorial Demo:</h1>

<p>
    This small demo will show you how the codeigniter file upload tutorial would work in real time implementation. Here in this example demo,
    you will be able to upload a single file at a time with file type restricted to gif,jpg,png,jpeg,pdf,doc and xml . After a file uploaded 
    successfully, you should be able to see the details of the uploaded file that codeigniter preserve in its internal variable.
</p>

<form action="" method="POST" enctype="multipart/form-data" >
    Select File To Upload:<br />
    <input type="file" name="userfile" multiple="multiple"  />
    <br /><br />
    <input type="submit" name="submit" value="Upload" class="btn btn-success" />
</form>

{if isset($uploaded_file)}
    {foreach from=$uploaded_file key=name item=value}
        {$name} : {$value}
        <br />
    {/foreach}    
{/if} 

<br /><br />

<a href="http://codesamplez.com/development/codeigniter-file-upload" class="btn btn-info">Back To The CodeIgniter File Upload Tutorial Page</a>
<br /><br />
Controller Function Code:

<pre class="prettyprint linenums languague-php">
   {literal}
            /**
     * the demo for file upload tutorial on codesamplez.com
     * @return view
     */
    public function file_upload_demo()
    {
        try
        {
            if($this->input->post("submit")){        
                $this->load->library("app/uploader");
                $this->uploader->do_upload();
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
            
            &lt;input type="submit" name="submit" value="Upload" class="btn btn-success" /&gt;
        &lt;/form&gt;

        {if isset($uploaded_file)}
            {foreach from=$uploaded_file key=name item=value}
                {$name} : {$value}
                &lt;br /&gt;
            {/foreach}    
        {/if}
   {/literal}    
</pre>


our application's 'uploader' library Code:

<pre class="prettyprint linenums languague-php">
    {literal}
/**
 * Description of uploader
 *
 * @author Rana
 */
class Uploader {
    var $config;
    public function __construct() {
        $this->ci =& get_instance();
        
        $this->config =  array(
                  'upload_path'     => dirname($_SERVER["SCRIPT_FILENAME"])."/files/",
                  'upload_url'      => base_url()."files/",
                  'allowed_types'   => "gif|jpg|png|jpeg|pdf|doc|xml",
                  'overwrite'       => TRUE,
                  'max_size'        => "1000KB",
                  'max_height'      => "768",
                  'max_width'       => "1024"   
                );
    }
    
    public function do_upload(){
        
        $this->remove_dir($this->config["upload_path"], false);
        
        $this->ci->load->library('upload', $this->config);
        if($this->ci->upload->do_upload())
        {
            $this->ci->data['status']->message = "File Uploaded Successfully";
            $this->ci->data['status']->success = TRUE;
            $this->ci->data["uploaded_file"] = $this->ci->upload->data();
        }
        else
        {
            $this->ci->data['status']->message = $this->ci->upload->display_errors();
            $this->ci->data['status']->success = FALSE;
        }
    }
    
    function remove_dir($dir, $DeleteMe) {
        if(!$dh = @opendir($dir)) return;
        while (false !== ($obj = readdir($dh))) {
            if($obj=='.' || $obj=='..') continue;
            if (!@unlink($dir.'/'.$obj)) $this->remove_dir($dir.'/'.$obj, true);
        }

        closedir($dh);
        if ($DeleteMe){
            @rmdir($dir);
        }
    
    }
}

    {/literal}    
</pre>