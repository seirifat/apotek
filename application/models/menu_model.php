<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Menu_model extends CI_Controller
{
	public $tabel = 'menu';
	public $perpage = 10;
	public $offset = 0;

    public function cari_semua($offset)
    {
        if(is_null($offset) || empty($offset))
        {
            $this->offset = 0;
        }
        else
        {
            $this->offset = ($offset * $this->perpage) - $this->perpage;
        }

        return $this->db->select('*')
            ->from($this->tabel)
            ->get()
            ->result();
    }

    public function buat_tabel($data)
    {
        $this->load->library('table');
        $tmpl = array(
            'table_open' => '<table class="table table-striped">'
        );
        $this->table->set_template($tmpl);
        $this->table->set_heading('No','Nama Menu','URL','Urutan','C','R','U','D','Action');
        $no = 0 + $this->offset;
        foreach($data as $row)
        {
            $this->table->add_row(
                ++$no,$row->nama_menu,$row->url,$row->urutan,$row->c,$row->r,$row->u,$row->d,
                anchor(
                    'menu/edit'.$row->menuid,
                    '<i class="fa fa-pencil"></i>',
                    array('class' => 'btn btn-sm btn-warning')
                ).' '.
                anchor(
                    'menu/delete'.$row->menuid,
                    '<i class="fa fa-trash-o"></i>',
                    array('class' => 'btn btn-sm btn-danger','onclick'=>"return confirm('Anda yakin akan menghapus data ini?')")
                )
            );
        }
        $table = $this->table->generate();
        return $table;
    }

    //public function paging

}

//End