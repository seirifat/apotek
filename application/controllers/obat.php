<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Obat extends CI_Controller
{
	public $data = array();
	public function index()
	{
		$this->data['title'] = "Apotek";
		$this->load->view('obat',$this->data);
	}
}

//End login.php