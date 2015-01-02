<div id="page-wrapper">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Tambah Distributor</h1>
        </div>
        <div class="col-lg-6">
            <form action="<?php echo site_url('distributor/edit_process');?>" method="post">
                <div class="form-group">
                	<input type="hidden" name="distribusiid" id="distribusiid" class="form-control" value="<?php echo $distributor->distributorid;?>" title="" required="required" autofocus="true">
                </div>
                <div class="form-group">
                	<label for="kode_distributor"control-label">Kode:</label>
                	<input type="text" name="kode_distributor" id="kode_distributor" class="form-control" value="<?php echo $distributor->kode_distributor;?>" title="" required="required" autofocus="true" readonly>
                    <?php echo form_error('kode_distributor','<p class="alert alert-danger">','</p>');?>
                </div>
                <div class="form-group">
                	<label for="nama_distributor"control-label">Nama Distributor:</label>
                	<input type="text" name="nama_distributor" id="nama_distributor" class="form-control" value="<?php echo $distributor->nama_distributor;?>" title="" required="required" >
                    <?php echo form_error('nama_distributor','<p class="alert alert-danger">','</p>');?>
                </div>
                <div class="form-group">
                	<label for="alamat"control-label">Alamat:</label>
                	<input type="text" name="alamat" id="alamat" class="form-control" value="<?php echo $distributor->alamat;?>" title="" required="required">
                    <?php echo form_error('alamat','<p class="alert alert-danger">','</p>');?>
                </div>
                <div class="form-group">
                	<label for="no_kontak_1"control-label">Nomor kontak 1:</label>
                	<input type="text" name="no_kontak_1" id="no_kontak_1" class="form-control" value="<?php echo $distributor->no_kontak_1;?>" title="" required="required">
                    <?php echo form_error('no_kontak_1','<p class="alert alert-danger">','</p>');?>
                </div>
                <div class="form-group">
                	<label for="no_kontak_2"control-label">Nomor kontak 2(Jika ada):</label>
                	<input type="text" name="no_kontak_2" id="no_kontak_2" class="form-control" value="<?php echo $distributor->no_kontak_2;?>" title="">
                    <?php echo form_error('no_kontak_2','<p class="alert alert-danger">','</p>');?>
                </div>
                <div class="form-group">
                	<label for="email"control-label">E-Mail:</label>
                	<input type="text" name="email" id="email" class="form-control" value="<?php echo $distributor->email;?>" title="">
                    <?php echo form_error('email','<p class="alert alert-danger">','</p>');?>
                </div>
                <div class="form-group">
                	<label for="fax"control-label">Fax:</label>
                	<input type="text" name="fax" id="fax" class="form-control" value="<?php echo $distributor->fax;?>" title="">
                    <?php echo form_error('fax','<p class="alert alert-danger">','</p>');?>
                </div>
                <div class="form-group">
                	<label for="kode_pos"control-label">Kode Pos:</label>
                	<input type="text" name="kode_pos" id="fax" class="form-control" value="<?php echo $distributor->kode_pos;?>" title="">
                    <?php echo form_error('kode_pos','<p class="alert alert-danger">','</p>');?>
                </div>
                <div class="form-group">
                	<label for="status"control-label">Status:</label>
                	<div class="radio">
                		<label>
                			<input type="radio" name="status" id="inputID" value="1" <?php echo $distributor->status==1?"checked='checked'":"";?>>
                			Aktif
                		</label>
                	</div>
                	<div class="radio">
                		<label>
                			<input type="radio" name="status" id="inputID" value="0" <?php echo $distributor->status==0?"checked='checked'":"";?>>
                			Non Aktif
                		</label>
                	</div>
                </div>
                <div class="form-group">
                    <div class="text-right">
                        <button type="submit" name="submit" class="btn btn-primary">Edit</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div><!-- /#page-wrapper -->