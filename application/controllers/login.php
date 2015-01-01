<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Login extends CI_Controller
{
	public $data = array();
	
	public function __construct()
	{
		parent :: __construct();
		$this->load->model('login_model','login',true);
		$this->load->library('form_validation');
	}
	
	public function index()
	{
        $this->data['title'] = "Login";
        if($this->session->userdata('login')==TRUE)
        {
            redirect('main');
        }
        else
        {
            if($this->login->validasi())
            {
                if($this->login->cek_user())
                {
                    redirect('main');
                }
                else
                {
                    $this->data['pesan'] = "User atau password salah.";
                    $this->load->view('form_login',$this->data);
                }
            }
            else
            {
                $this->load->view('form_login',$this->data);
            }
        }
	}
	
	public function logout()
	{
		$this->login->logout();
        redirect('login');
	}
}

//End login.php