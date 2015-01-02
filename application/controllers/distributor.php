<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Distributor extends CI_Controller
{
    public $data = array(
        'title' => 'Menu',
        'mainview' => 'distributor/list',
        'tabel_data' => '',
        'pagination' => '',
    );

    public function __construct()
    {
        parent :: __construct();
        $this->load->model('distributor_model','distributor',true);
    }

    public function index($offset = 0)
    {
        $this->session->unset_userdata('menuid','');
        $distributor = $this->distributor->cari_semua($offset);
        if($distributor)
        {
            $tabel = $this->distributor->buat_tabel($distributor);
            $this->data['tabel_data'] = $tabel;
            //$this->data['pagination'] = $this->menu->paging(site_url('menu'));
        }
        else
        {
            $this->data['pesan'] = 'Tidak ada data distributor';
        }

        $this->load->view('main',$this->data);
    }
//    public function add()
//    {
//        $this->data['mainview'] = 'distributor/add';
//        $this->data['title'] = 'Tambah Distributor';
//        $this->load->view('main',$this->data);
//    }
//    public function add_process()
//    {
//        if($this->distributor->add())
//        {
//            $this->session->set_flashdata('pesan','Proses tambah data berhasil');
//        }
//        else
//        {
//            $this->session->set_flashdata('pesan','Proses tambah data gagal');
//        }
//        redirect('distributor');
//    }

    public function edit($distributorid)
    {
        $this->data['title'] = 'Edit Distributor';
        $this->data['mainview'] = 'distributor/edit';
        $this->data['distributor'] = $this->distributor->cari($distributorid);
        //print_r($this->data['distributor']->kode_distributor);die;
        $this->load->view('main',$this->data);
    }

    public function edit_process()
    {
        if($this->distributor->edit())
        {
            $this->session->set_flashdata('pesan','Proses edit data berhasil');
        }
        else
        {
            $this->session->set_flashdata('pesan','Proses edit data gagal');
        }
        redirect('distributor');
    }

    public function delete($distributorid)
    {
        if($this->distributor->delete($distributorid))
        {
            $this->session->set_flashdata('pesan','Proses hapus data berhasil');
        }
        else
        {
            $this->session->set_flashdata('pesan','Proses hapus data gagal');
        }
        redirect('distributor');
    }



    public function add()
    {
        $this->data['mainview'] = 'distributor/add';
        $this->data['title'] = 'Tambah Distributor';

        if($this->input->post('submit'))
        {

            if($this->distributor->validasi_tambah())
            {
                //print_r("Koko ni");die;
                if($this->distributor->add())
                {

                    $this->session->set_flashdata('pesan','Proses tambah data berhasil');
                    redirect('distributor');
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
}