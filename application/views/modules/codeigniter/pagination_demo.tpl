<h1>CodeIgniter Pagination Demo:</h1>
<p>
    This is a small example demo application based on codeigniter pagination tutorial. You can checkout how the pagination would
    work on your real time application. Currently few example data are added and are paginated. However, you can add as many data
    you want using the <a href="{$base_url}codeigniter/contact-demo">codeigniter contact demo page</a>. Also, please refer to the complete code below the example to see how this is
    working behind the scene.
</p>
<p class="text-center">
    <a class="btn btn-info btn-large" href="http://codesamplez.com/development/codeigniter-pagination-tutorial">View The Codeigniter Pagination Tutorial</a>
</p>
<hr>
<h2>Contact Messages Listings:</h2>
<form action="" method="POST">
    <table cellspacing="0" cellpadding="4" border="0" class="table">
        <thead>
            <tr>
                <th> <input type="checkbox" value=""/> </th>
                <th> Id </th>
                <th> Name </th>
                <th> Email </th>
                <th> Subject </th>
                <th> Message </th>
                <th> Sent </th>
            </tr>
        </thead>
        <tbody>

            {foreach from=$messages item=message name="outer"}
                <tr>
                    <td> <input type="checkbox" name="id[]" value="{$message->getId()}"/> </td>
                    <td> {$message->getId()} </td>
                    <td> {$message->getName()} </td>
                    <td> {$message->getEmail()} </td>
                    <td> {$message->getSubject()} </td>
                    <td> {$message->getMessage()|truncate:80} </td>
                    <td> {$message->getTime()|date_format} </td>
                </tr>
            {/foreach}

        </tbody>
    </table>       
<br />
<div class="clear">
    <ul class="pagination">
        {$pagination_helper->create_links()}
    </ul>    
</div>
</form>
<hr>
<h2>The Controller Code:</h2>
<pre class="prettyprint linenums languague-php">
   {literal}
    public function pagination_demo($page=1){
        $this->load->model("messagemodel");
        $this->load->library('pagination');
        $this->load->library('app/paginationlib');
        $this->load->language("message");
        try
        {
            $pagingConfig   = $this->paginationlib->initPagination("/codeigniter/pagination-demo",$this->messagemodel->get_count());
            
            $this->data["pagination_helper"]   = $this->pagination;
            $this->data["messages"] = $this->messagemodel->get_by_range((($page-1) * $pagingConfig['per_page']),$pagingConfig['per_page']);
            
            return $this->view();             
        }
        catch (Exception $err)
        {
            log_message("error", $err->getMessage());
            return show_error($err->getMessage());
        }
    }
   {/literal}    
</pre>

<h2>The Library Code:</h2>
<pre class="prettyprint linenums languague-php">
   {literal}
    /**
     *Initialize the pagination rules for cities page 
     * @return Pagination
     */
class Paginationlib {
    //put your code here
    function __construct() {
         $this->ci =& get_instance();
    }

    public function initPagination($base_url,$total_rows){
        $config['per_page']          = 1;
        $config['uri_segment']       = 3;
        $config['base_url']          = base_url().$base_url;
        $config['total_rows']        = $total_rows;
        $config['use_page_numbers']  = TRUE;
        
        $config['first_tag_open'] = $config['last_tag_open']= $config['next_tag_open']= $config['prev_tag_open'] = $config['num_tag_open'] = '<li>';
        $config['first_tag_close'] = $config['last_tag_close']= $config['next_tag_close']= $config['prev_tag_close'] = $config['num_tag_close'] = '</li>';
        
        $config['cur_tag_open'] = "<li><span><b>";
        $config['cur_tag_close'] = "</b></span></li>";
        
        $this->ci->pagination->initialize($config);
        return $config;    
    }
    
}
   {/literal}    
</pre>

<h2>The View Code:</h2>
<pre class="prettyprint linenums languague-php">
   {literal}
    &lt;form action="{$base_url}admin/message/delete" method="POST"&gt;
    &lt;table cellspacing="0" cellpadding="4" border="0" class="table"&gt;
        &lt;thead&gt;
            &lt;tr&gt;
                &lt;th&gt; &lt;input type="checkbox" value=""/&gt; &lt;/th&gt;
                &lt;th&gt; Id &lt;/th&gt;
                &lt;th&gt; Name &lt;/th&gt;
                &lt;th&gt; Email &lt;/th&gt;
                &lt;th&gt; Subject &lt;/th&gt;
                &lt;th&gt; Message &lt;/th&gt;
                &lt;th&gt; Sent &lt;/th&gt;
            &lt;/tr&gt;
        &lt;/thead&gt;
        &lt;tbody&gt;

            {foreach from=$messages item=message name="outer"}
                &lt;tr&gt;
                    &lt;td&gt; &lt;input type="checkbox" name="id[]" value="{$message->getId()}"/&gt; &lt;/td&gt;
                    &lt;td&gt; {$message->getId()} &lt;/td&gt;
                    &lt;td&gt; {$message->getName()} &lt;/td&gt;
                    &lt;td&gt; {$message->getEmail()} &lt;/td&gt;
                    &lt;td&gt; {$message->getSubject()} &lt;/td&gt;
                    &lt;td&gt; {$message->getMessage()|truncate:80} &lt;/td&gt;
                    &lt;td&gt; {$message->getTime()|date_format} &lt;/td&gt;
                &lt;/tr&gt;
            {/foreach}

        &lt;/tbody&gt;
    &lt;/table&gt;      
    &lt;br /&gt;
    &lt;div class="clear pagination"&gt;
        &lt;ul&gt;
            {$pagination_helper->create_links()}
        &lt;/ul&gt;    
    &lt;/div&gt;
    &lt;/form&gt;
   {/literal}    
</pre>