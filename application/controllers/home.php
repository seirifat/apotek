<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Home extends CI_Controller
{
	public $data = array();
	public function index()
	{
		$this->data['title'] = 'Home';
		$this->load->view('home',$this->data);
	}
}