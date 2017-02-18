<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Main extends CI_Controller
{
    
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
    
   ///////////////////////////////Members/////////////////////////////
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
    /////////////////////////////////Hotels////////////////////////
     public function hotels()
    {
        if ($this->input->cookie('is_logged_in')) {
           $data['results'] = $this->module->get_hotels();
            $this->load->view('hotels', $data);
        } else {
            redirect($this->config->item('site_base_url') . 'main/login');
        } 
    }
public function add_hotel($id = '')
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
          redirect($this->config->item('site_base_url') . 'main/hotels');    
        }
        $this->load->view('edit_hotel');
    }
    
    public function edit_hotel($id = '')
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
        
        $this->load->view('edit_hotel', $data);
    }
    public function delete_hotel($id = '')
    {
        $this->module->delete_members($id);
         $data['results'] = $this->module->get_members();
        $this->load->view('hotels', $data);
        
    }
    ///////////////////////////////////////////////
    public function settings()
    {
        
        if ($this->input->cookie('is_logged_in')) {
           $data['results'] = $this->module->get_hotels();
        $this->load->view('settings', $data);
        } else {
            redirect($this->config->item('site_base_url') . 'main/login');
        } 
    }
}
