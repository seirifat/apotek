<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Main extends CI_Controller
{
	public $data = array();

    public function __construct()
    {
        parent :: __construct();
        if(!$this->session->userdata('login'))
        {
            redirect('login');
        }
    }

	public function index()
	{
        $this->data['mainview'] = 'home/home';
		$this->data['title'] = 'Home';
        $this->load->view('main',$this->data);
	}
}