<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Login_model extends CI_Controller
{
	public $tabel = 'member';
	
	public function validasi()
	{
        $this->form_validation->set_rules('username','Username','required');
        $this->form_validation->set_rules('password','Password','required');
        if($this->form_validation->run())
        {
            return true;
        }
        else
        {
            return false;
        }
	}

    public function cek_user()
    {
        $username = $this->input->post('username');
        $password = md5($this->input->post('password'));
        $query = $this->db->where('username', $username)
            ->where('password',$password)
            ->limit(1)
            ->get($this->tabel);
        if($query->num_rows() == 1)
        {
            $data = array('username' => $username, 'login' => TRUE);
            $this->session->set_userdata($data);
            return true;
        }
        else
        {
            return false;
        }
    }

    public function logout()
    {
        $this->session->unset_userdata(array('username' => '' , 'login' => FALSE));
        $this->session->sess_destroy();
    }

}

//End