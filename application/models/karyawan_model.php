<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Karyawan_model extends CI_Controller
{
	public $tabel = 'karyawan';
	
	public function cek_login($username, $password)
	{
		$this->db->select('*');
		$this->db->from($this->tabel);
		$this->db->where('username',$username);
		$this->db->where('password',$password);
		$query = $this->db->get();
		return $query;
		// if($query->num_rows()>0)
		// {
			// $data['username'] = $username;
			// $data['login'] = true;
			// $this->session->set_userdata($data);
			// return true;
		// }
		// else
		// {
			// return false;
		// }
	}
}

//End