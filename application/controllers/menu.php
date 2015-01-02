<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Menu extends CI_Controller
{
    public $data = array(
        'title' => 'Menu',
        'mainview' => 'menu/list',
        'tabel_data' => '',
        'pagination' => '',
    );

    public function __construct()
    {
        parent :: __construct();
        $this->load->model('menu_model','menu',true);
    }

    public function index($offset = 0)
    {
        $this->session->unset_userdata('menuid','');
        $menu = $this->menu->cari_semua($offset);
        if($menu)
        {
            $tabel = $this->menu->buat_tabel($menu);
            $this->data['tabel_data'] = $tabel;
            //$this->data['pagination'] = $this->menu->paging(site_url('menu'));
        }
        else
        {
            $this->data['pesan'] = 'Tidak ada data menu';
        }

        $this->load->view('main',$this->data);
    }
}