<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Main extends CI_Controller
{
    
    /**
     * Index Page for this controller.
     *
     * Maps to the following URL
     * 		http://example.com/index.php/welcome
     *	- or -
     * 		http://example.com/index.php/welcome/index
     *	- or -
     * Since this controller is set as the default controller in
     * config/routes.php, it's displayed at http://example.com/
     *
     * So any other public methods not prefixed with an underscore will
     * map to /index.php/welcome/<method_name>
     * @see https://codeigniter.com/user_guide/general/urls.html
     */
    public function __construct()
    {
        parent::__construct();
        
        
    }
    
    public function index()
    {
        if ($this->input->cookie('is_logged_in')) {
            redirect($this->config->item('site_base_url').'main/dashboard');
        } else {
            echo $this->config->item('site_base_url');
            redirect($this->config->item('site_base_url') . 'main/login');
        }
        
    }
    
    public function dashboard()
    {
       if ($this->input->cookie('is_logged_in')) {
            $this->load->view('index');
        } else {
            redirect($this->config->item('site_base_url') . 'main/login');
        } 
       
        
        
    }
    public function login()
    {
              
        if ($this->input->server('REQUEST_METHOD') === 'POST') {
            $username         = $this->input->post('username');
            $password         = $this->encrip_password($this->input->post('password'));
            $valid_credential = $this->module->admin_login($username, $password);
            if (!empty($valid_credential)) { 
            	            	
                redirect($this->config->item('site_base_url') . 'main/dashboard');
                
            } else {
                redirect($this->config->item('site_base_url') . 'main/login');
            }
        }
        $this->load->view('login');
    }
    public function logout()
    {
        delete_cookie("is_logged_in");
        delete_cookie("user_id");
        $this->session->sess_destroy();
         redirect($this->config->item('site_base_url'));
    }
    function encrip_password($password)
    {
        return md5($password);
    }
    
    
    
    public function members()
    {
        
        if ($this->input->cookie('is_logged_in')) {
           $data['results'] = $this->module->get_members();
        $this->load->view('members', $data);
        } else {
            redirect($this->config->item('site_base_url') . 'main/login');
        } 
    }
    
    public function add_member($id = '')
    {
        if ($this->input->post()) {
            $data_to_add = array(
                'member_name' => addslashes($this->input->post('member_name')),
                'status' => addslashes($this->input->post('status')),
                'date_modified' => date('Y-m-d H:i:s'),
                'member_email' => addslashes($this->input->post('member_email')),
                'member_address' => addslashes($this->input->post('member_address'))
            );
             $this->module->add_members($data_to_add);
          redirect($this->config->item('site_base_url') . 'main/members');    
        }
        $this->load->view('edit_member');
    }
    
    public function edit_member($id = '')
    {
        if ($this->input->server('REQUEST_METHOD') === 'POST') {
            
            $data_to_update = array(
                'member_name' => addslashes($this->input->post('member_name')),
                'status' => addslashes($this->input->post('status')),
                'date_modified' => date('Y-m-d H:i:s'),
                'member_address' => addslashes($this->input->post('member_address'))
            );
           $this->module->update_members($id,$data_to_update);
       }
       $data['results'] = $this->module->get_members_by_id($id);
        // print_r($data['results']);
        // die();
        $data['id']      = $id;
        
        $this->load->view('edit_member', $data);
    }
    public function delete_member($id = '')
    {
        $this->module->delete_members($id);
         $data['results'] = $this->module->get_members();
        $this->load->view('members', $data);
        
    }
}
