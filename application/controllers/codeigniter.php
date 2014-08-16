<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
/**
* @property CI_Loader                $load
* @property CI_Form_validation       $form_validation
* @property CI_Input                 $input
* @property CI_Email                 $email
* @property Usermodel                $usermodel
* @property Doctrine                 $doctrine
* @property Geoip                    $geoip
* @property Homemodel                $homemodel
* @property Countrymodel             $countrymodel
* @property Messagemodel             $messagemodel
* @property Mapper                   $mapper
* @property \Doctrine\ORM\EntityManager $em                
*/

class CodeIgniter extends MY_Controller
{
    
    public function __construct()
    {
        parent::__construct();
        //$this->load->helper('url'); 
        $this->load->config("pd_forms");
    }
     
    /**
     * Default function that will be executed unless another method secified
     * @return type View
     */
    public function index()
    {   
        return $this->view();             
    }
    
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
                $config = $this->config->item("rules");
                $this->uploader->do_upload($config["file"]);
            }
            return $this->view();
        }
        catch(Exception $err)
        {
            log_message("error",$err->getMessage());
            return show_error($err->getMessage());
        }
    }
    
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
    
    public function pagination_demo($page=1){
        $this->load->model("messagemodel");
        $this->load->library('pagination');
        $this->load->library('app/paginationlib');
        $this->load->language("message");
        try
        {
            $pagingConfig   = $this->paginationlib->initPagination("codeigniter/pagination-demo",$this->messagemodel->get_count());
            
            $this->data["pagination_helper"]   = $this->pagination;
            $this->data["messages"] = $this->messagemodel->get_by_range((($page-1) * $pagingConfig['per_page']),$pagingConfig['per_page']);
            $this->meta["current"] = $page;
            $this->meta["total"] = ceil($this->messagemodel->get_count()/$pagingConfig['per_page']);
            $this->pagination_seo($page);
            return $this->view();             
        }
        catch (Exception $err)
        {
            log_message("error", $err->getMessage());
            return show_error($err->getMessage());
        }
    }
    
    /**
     * Controller For 'Contact Page'
     * @return type View
     */
    public function contact_demo()
    {
        try
        {
            $this->load->model("messagemodel");
            $this->load->language("message");
            $forms = $this->config->item("rules");
            $this->data["contact_form"] = $forms["contact"];
            
            if($this->input->post('submit')){
                
                $this->load->library("app/formvalidator");    
                $this->load->library("app/mapper");
                
                if($this->formvalidator->isValid("contact")){
                    
                    $message = $this->mapper->formToMessage($this->input,$this->data["contact_form"],null);
                    $this->messagemodel->save($message);
                    
                    $this->data["status"]->message = $this->lang->line("message_sent");
                    $this->data["status"]->success = TRUE;
                }
                else{
                    $this->data["status"]->message = validation_errors();
                    $this->data["status"]->success = FALSE;
                }
            }

            return $this->view();;
        }
        catch(Exception $err)
        {
            log_message("error", $err->getMessage());
            return show_error($err->getMessage());
        }
    }

}
/* End of file home.php */
/* Location: ./application/controllers/home.php */
