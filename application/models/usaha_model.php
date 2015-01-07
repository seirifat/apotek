<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Usaha_model extends CI_Controller
{
	public $tabel = 'usaha';
	public $perpage = 3;
	public $offset = 0;

    public function search_all($offset)
    {
//        if(is_null($offset) || empty($offset))
//        {
//            $this->offset = 0;
//        }
//        else
//        {
//            $this->offset = ($offset * $this->perpage) - $this->perpage;
//        }

        return $this->db->select('*')
            ->from($this->tabel)
            ->limit($this->perpage,$offset)
            ->get()
            ->result();
    }

    public function search($usahaid)
    {
        return $this->db->select('*')
            ->from($this->tabel)
            ->where('usahaid',$usahaid)
            ->limit(1)
            ->get()
            ->row();
    }

    public function count_all()
    {
        return $this->db->count_all($this->tabel);
    }

    public function buat_tabel($data)
    {
        $this->load->library('table');
        $tmpl = array(
            'table_open' => '<table class="table table-striped">'
        );
        $this->table->set_template($tmpl);
        $this->table->set_heading('No','Kode','Nama usaha','Alamat','Nomor Kontak 1','Nomor Kontak 2','Email','Fax','Kode Pos','Status','Action');
        $no = 0 + $this->offset;
        foreach($data as $row)
        {
            $this->table->add_row(
                ++$no,
                $row->kode_usaha,
                $row->nama_usaha,
                $row->alamat,
                $row->no_kontak_1,
                $row->no_kontak_2,
                $row->email,
                $row->fax,
                $row->kode_pos,
                $row->status==1?"<div class='tooltip-demo'><label class='label label-success' title='Aktif'><i class='glyphicon glyphicon-ok'></i></label></div>":"<label class='label label-danger' title='Non Aktif'><i class='glyphicon glyphicon-remove'></i></label>",
                anchor(
                    'usaha/edit/'.$row->usahaid,
                    '<i class="fa fa-pencil"></i>',
                    array('class' => 'btn btn-sm btn-warning')
                ).' '.
                anchor(
                    'usaha/delete/'.$row->usahaid,
                    '<i class="fa fa-trash-o"></i>',
                    array('class' => 'btn btn-sm btn-danger','onclick'=>"return confirm('Anda yakin akan menghapus data ini?')")
                )
            );
        }
        $table = $this->table->generate();
        return $table;
    }

    public function paging($base_url)
    {
        $this->load->library('pagination');
        $config = array(
            'base_url' => $base_url,
            'total_rows' => $this->count_all(),
            'per_page' => $this->perpage,
            'full_tag_open' => "<ul class='pagination pagination-sm'>",
            'full_tag_close' => "</ul>",
            'num_tag_open' => "<li>",
            'num_tag_close' => "</li>",
            'cur_tag_open' => "<li class='active'><a href=#>",
            'cur_tag_close' => "</a></li>",
            'next_tag_open' => "<li>",
            'next_tag_close' => "</li>",
            'prev_tag_open' => "<li>",
            'prev_tag_close' => "</li>",
            'first_tag_open' => "<li>",
            'first_tag_close' => "</li>",
            'last_tag_open' => "<li>",
            'last_tag_close' => "</li>",
        );
        $this->pagination->initialize($config);
        return $this->pagination->create_links();
    }

    //public function paging

    public function validasi_add()
    {
        $this->form_validation->set_rules('kode_usaha','Kode usaha','required|is_unique[usaha.kode_usaha]');
        $this->form_validation->set_rules('nama_usaha','Nama usaha','required');
        $this->form_validation->set_rules('alamat','Alamat','required');
        $this->form_validation->set_rules('no_kontak_1','Nomor kontak','required|numeric');
        $this->form_validation->set_rules('no_kontak_2','Nomor kontak','trim|numeric');
        $this->form_validation->set_rules('email','Nomor kontak','trim|valid_email');
        $this->form_validation->set_rules('fax','Fax','trim|numeric');
        $this->form_validation->set_rules('kode_pos','Kode pos','trim|numeric');
        $this->form_validation->set_rules('status','Status','trim');
        if($this->form_validation->run())
        {
            return TRUE;
        }
        else
        {
            return FALSE;
        }
    }
    public function validasi_edit()
    {
        $this->form_validation->set_rules('nama_usaha','Nama usaha','required');
        $this->form_validation->set_rules('alamat','Alamat','required');
        $this->form_validation->set_rules('no_kontak_1','Nomor kontak','required|numeric');
        $this->form_validation->set_rules('no_kontak_2','Nomor kontak','trim|numeric');
        $this->form_validation->set_rules('email','Nomor kontak','trim|valid_email');
        $this->form_validation->set_rules('fax','Fax','trim|numeric');
        $this->form_validation->set_rules('kode_pos','Kode pos','trim|numeric');
        $this->form_validation->set_rules('status','Status','trim');
        if($this->form_validation->run())
        {
            return TRUE;
        }
        else
        {
            return FALSE;
        }
    }

    public function add()
    {
        $usaha = array(
            'kode_usaha' => $this->input->post('kode_usaha'),
            'nama_usaha' => $this->input->post('nama_usaha'),
            'alamat' => $this->input->post('alamat'),
            'no_kontak_1' => $this->input->post('no_kontak_1'),
            'no_kontak_2' => $this->input->post('no_kontak_2'),
            'email' => $this->input->post('email'),
            'fax' => $this->input->post('fax'),
            'kode_pos' => $this->input->post('kode_pos'),
            'status' => $this->input->post('status'),
        );
        $this->db->insert($this->tabel,$usaha);
        if($this->db->affected_rows()>0)
        {
            return TRUE;
        }
        else
        {
            return FALSE;
        }
    }
    public function edit($usahaid)
    {
        $usaha = array(
            //'kode_usaha' => $this->input->post('kode_usaha'),
            'nama_usaha' => $this->input->post('nama_usaha'),
            'alamat' => $this->input->post('alamat'),
            'no_kontak_1' => $this->input->post('no_kontak_1'),
            'no_kontak_2' => $this->input->post('no_kontak_2'),
            'email' => $this->input->post('email'),
            'fax' => $this->input->post('fax'),
            'kode_pos' => $this->input->post('kode_pos'),
            'status' => $this->input->post('status'),
        );
        $this->db->where('usahaid',$usahaid);
        $this->db->update($this->tabel,$usaha);
        if($this->db->affected_rows()>0)
        {
            return TRUE;
        }
        else
        {
            return FALSE;
        }
    }

    public function delete($usahaid)
    {
        $this->db->where('usahaid',$usahaid);
        $this->db->delete($this->tabel);
        if($this->db->affected_rows()>0)
        {
            return true;
        }
        else
        {
            return false;
        }
    }

}

//End