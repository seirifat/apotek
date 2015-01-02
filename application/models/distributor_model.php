<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Distributor_model extends CI_Controller
{
	public $tabel = 'distributor';
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

    public function cari($distributorid)
    {
        return $this->db->select('*')
            ->from($this->tabel)
            ->where('distributorid',$distributorid)
            ->limit(1)
            ->get()
            ->row();
    }

    public function buat_tabel($data)
    {
        $this->load->library('table');
        $tmpl = array(
            'table_open' => '<table class="table table-striped">'
        );
        $this->table->set_template($tmpl);
        $this->table->set_heading('No','Kode','Nama Distributor','Alamat','Nomor Kontak 1','Nomor Kontak 2','Email','Fax','Kode Pos','Status','Action');
        $no = 0 + $this->offset;
        foreach($data as $row)
        {
            $this->table->add_row(
                ++$no,
                $row->kode_distributor,
                $row->nama_distributor,
                $row->alamat,
                $row->no_kontak_1,
                $row->no_kontak_2,
                $row->email,
                $row->fax,
                $row->kode_pos,
                $row->status==1?"<div class='tooltip-demo'><label class='label label-success' title='Aktif'><i class='glyphicon glyphicon-ok'></i></label></div>":"<label class='label label-danger' title='Non Aktif'><i class='glyphicon glyphicon-remove'></i></label>",
                anchor(
                    'distributor/edit/'.$row->distributorid,
                    '<i class="fa fa-pencil"></i>',
                    array('class' => 'btn btn-sm btn-warning')
                ).' '.
                anchor(
                    'distributor/delete/'.$row->distributorid,
                    '<i class="fa fa-trash-o"></i>',
                    array('class' => 'btn btn-sm btn-danger','onclick'=>"return confirm('Anda yakin akan menghapus data ini?')")
                )
            );
        }
        $table = $this->table->generate();
        return $table;
    }

    //public function paging

    public function validasi_tambah()
    {
        $this->form_validation->set_rules('kode_distributor','Kode Distributor','required|is_unique[distributor.kode_distributor]');
        $this->form_validation->set_rules('nama_distributor','Nama Distributor','required');
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
        $distributor = array(
            'kode_distributor' => $this->input->post('kode_distributor'),
            'nama_distributor' => $this->input->post('nama_distributor'),
            'alamat' => $this->input->post('alamat'),
            'no_kontak_1' => $this->input->post('no_kontak_1'),
            'no_kontak_2' => $this->input->post('no_kontak_2'),
            'email' => $this->input->post('email'),
            'fax' => $this->input->post('fax'),
            'kode_pos' => $this->input->post('kode_pos'),
            'status' => $this->input->post('status'),
        );
        $this->db->insert($this->tabel,$distributor);
        if($this->db->affected_rows()>0)
        {
            return TRUE;
        }
        else
        {
            return FALSE;
        }
    }
    public function edit()
    {
        $distributor = array(
            //'kode_distributor' => $this->input->post('kode_distributor'),
            'nama_distributor' => $this->input->post('nama_distributor'),
            'alamat' => $this->input->post('alamat'),
            'no_kontak_1' => $this->input->post('no_kontak_1'),
            'no_kontak_2' => $this->input->post('no_kontak_2'),
            'email' => $this->input->post('email'),
            'fax' => $this->input->post('fax'),
            'kode_pos' => $this->input->post('kode_pos'),
            'status' => $this->input->post('status'),
        );
        $this->db->where('distributorid',$this->input->post('distribusiid'));
        $this->db->update($this->tabel,$distributor);
        if($this->db->affected_rows()>0)
        {
            return TRUE;
        }
        else
        {
            return FALSE;
        }
    }

    public function delete($distributorid)
    {
        $this->db->where('distributorid',$distributorid);
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