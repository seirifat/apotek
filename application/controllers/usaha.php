<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Usaha extends CI_Controller
{
    public $data = array(
        'title' => 'Menu',
        'mainview' => 'usaha/list',
        'tabel_data' => '',
        'pagination' => '',
        'data_usaha' => '',
    );

    public function __construct()
    {
        parent :: __construct();
        $this->load->model('usaha_model','usaha',true);
    }

    public function index($offset = 0)
    {
        $this->session->unset_userdata('usahaid','');
        $usaha = $this->usaha->search_all($offset);
        if($usaha)
        {
            $tabel = $this->usaha->buat_tabel($usaha);
            $this->data['tabel_data'] = $tabel;
            $this->data['pagination'] = $this->usaha->paging(site_url('usaha/page'));
        }
        else
        {
            $this->data['pesan'] = 'Tidak ada data usaha';
        }

        $this->load->view('main',$this->data);
    }

    public function add()
    {
        $this->data['mainview'] = 'usaha/add';
        $this->data['title'] = 'Tambah usaha';

        if($this->input->post('submit'))
        {

            if($this->usaha->validasi_add())
            {
                //print_r("Koko ni");die;
                if($this->usaha->add())
                {

                    $this->session->set_flashdata('pesan','Proses tambah data berhasil');
                    redirect('usaha');
                }
                else
                {
                    $this->data['pesan'] = 'Pesan tambah data gagal';
                    $this->load->view('main',$this->data);
                }
            }
            else
            {
                $this->load->view('main',$this->data);
            }
        }
        else
        {
            $this->load->view('main',$this->data);
        }
    }

    public function edit($usahaid = null)
    {
        $this->data['form_action'] = 'usaha/edit/'.$usahaid;
        $this->data['mainview'] = 'usaha/edit';
        $this->data['title'] = 'Edit usaha';

        if($this->input->post('submit'))
        {

            if($this->usaha->validasi_edit($usahaid))
            {
                //print_r("Koko ni");die;
                if($this->usaha->edit($usahaid))
                {
                    $this->session->set_flashdata('pesan','Proses edit data berhasil');
                    redirect('usaha');
                }
                else
                {
                    $this->data['pesan'] = 'Pesan edit data gagal';
                    $this->load->view('main',$this->data);
                }
            }
            else
            {
                //print_r("Koko ni");die;
                $this->load->view('main',$this->data);
            }
        }
        else
        {
            $dataDist = $this->usaha->search($usahaid);
            foreach($dataDist as $row => $value)
            {
                $this->data['data_usaha'][$row] = $value;
            }
            $this->load->view('main',$this->data);
        }
    }

    public function delete($usahaid)
    {
        if($this->usaha->delete($usahaid))
        {
            $this->session->set_flashdata('pesan','Proses hapus data berhasil');
        }
        else
        {
            $this->session->set_flashdata('pesan','Proses hapus data gagal');
        }
        redirect('usaha');
    }
}