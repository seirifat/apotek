<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Karyawan extends CI_Controller
{
	public $data = array();
	public function index()
	{
		$this->data['title'] = "Apotek";
		$this->load->view('login',$this->data);
	}
}

//End