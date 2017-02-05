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
        $this->load->view('index');
        
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
    
    
    
    public function patients()
    {
        
        if ($this->input->cookie('is_logged_in')) {
           $data['results'] = $this->module->get_patients();
        $this->load->view('patients', $data);
        } else {
            redirect($this->config->item('site_base_url') . 'main/login');
        } 
       
        
    }
    
    public function add_patient($id = '')
    {
        if ($this->input->post()) {
            
            print_r($this->input->post());
            die;
            
            
        }
        $data['results'] = $this->module->get_patients();
        $this->load->view('edit_patient', $data);
    }
    
    public function edit_patient($id = '')
    {
        
        
        if ($this->input->server('REQUEST_METHOD') === 'POST') {
            
            $data_to_store = array(
                'first_name' => addslashes($this->input->post('first_name')),
                'middle_name' => addslashes($this->input->post('middle_name')),
                'last_name' => md5(addslashes($this->input->post('last_name'))),
                'date_of_birth' => addslashes($this->input->post('date_of_birth')),
                'gender' => addslashes($this->input->post('gender')),
                'ocupation' => addslashes($this->input->post('ocupation')),
                'marital_status' => addslashes($this->input->post('marital_status')),
                'status' => addslashes($this->input->post('status')),
                'date_modified' => date('Y-m-d H:i:s'),
                'address' => addslashes($this->input->post('address'))
            );
            
            
        }
        
        $data['results'] = $this->module->get_patients_by_id($id);
        $data['id']      = $id;
        
        $this->load->view('edit_patient', $data);
    }
    public function delete_patient($id = '')
    {
        
        $this->load->view('edit_patient', $data);
        
    }
}
