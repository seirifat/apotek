<div id="page-wrapper">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Edit Distributor</h1>
        </div>
        <?php if(isset($pesan) || !empty($pesan)):?>
            <div class="col-lg-12">
                <div class="alert alert-danger">
                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                    <strong><?php echo $pesan?></strong>
                </div>
            </div>
        <?php endif;?>
        <div class="col-lg-6">
            <?php echo form_open($form_action)?>
            <fieldset>
<!--                <div class="form-group">-->
<!--                    <label for="kode_distributor"control-label">Kode:</label>-->
<!--                    <input type="text" name="kode_distributor" id="kode_distributor" class="form-control" value="--><?php //echo set_value('kode_distributor',isset($data_distributor['kode_distributor'])?$data_distributor['kode_distributor']:'');?><!--" title="" required="required" readonly>-->
<!--                    --><?php //echo form_error('kode_distributor','<p class="alert alert-danger">','</p>');?>
<!--                </div>-->
                <div class="form-group">
                    <label for="nama_distributor"control-label">Nama Distributor:</label>
                    <input type="text" name="nama_distributor" class="form-control" value="<?php echo set_value('nama_distributor',isset($data_distributor['nama_distributor'])?$data_distributor['nama_distributor']:'');?>" title="" required="required" >
                </div>
                <div class="form-group">
                    <label for="alamat"control-label">Alamat:</label>
                    <input type="text" name="alamat" id="alamat" class="form-control" value="<?php echo set_value('alamat',isset($data_distributor['alamat'])?$data_distributor['alamat']:'');?>" title="" required="required">
                </div>
                <div class="form-group">
                    <label for="no_kontak_1"control-label">Nomor kontak 1:</label>
                    <input type="text" name="no_kontak_1" id="no_kontak_1" class="form-control" value="<?php echo set_value('no_kontak_1',isset($data_distributor['no_kontak_1'])?$data_distributor['no_kontak_1']:'');?>" title="" required="required">
                    <?php echo form_error('no_kontak_1','<p class="alert alert-danger">','</p>');?>
                </div>
                <div class="form-group">
                    <label for="no_kontak_2"control-label">Nomor kontak 2(Jika ada):</label>
                    <input type="text" name="no_kontak_2" id="no_kontak_2" class="form-control" value="<?php echo set_value('no_kontak_2',isset($data_distributor['no_kontak_2'])?$data_distributor['no_kontak_2']:'');?>" title="">
                    <?php echo form_error('no_kontak_2','<p class="alert alert-danger">','</p>');?>
                </div>
                <div class="form-group">
                    <label for="email"control-label">E-Mail:</label>
                    <input type="text" name="email" id="email" class="form-control" value="<?php echo set_value('email',isset($data_distributor['email'])?$data_distributor['email']:'');?>" title="">
                    <?php echo form_error('email','<p class="alert alert-danger">','</p>');?>
                </div>
                <div class="form-group">
                    <label for="fax"control-label">Fax:</label>
                    <input type="text" name="fax" id="fax" class="form-control" value="<?php echo set_value('fax',isset($data_distributor['fax'])?$data_distributor['fax']:'');?>" title="">
                    <?php echo form_error('fax','<p class="alert alert-danger">','</p>');?>
                </div>
                <div class="form-group">
                    <label for="kode_pos"control-label">Kode Pos:</label>
                    <input type="text" name="kode_pos" id="fax" class="form-control" value="<?php echo set_value('kode_pos',isset($data_distributor['kode_pos'])?$data_distributor['kode_pos']:'');?>" title="">
                    <?php echo form_error('kode_pos','<p class="alert alert-danger">','</p>');?>
                </div>
                <div class="form-group">
                    <label for="status"control-label">Status:</label>
                    <div class="radio">
                        <label>
                            <input type="radio" name="status" id="inputID" value="1" <?php echo set_value('status',isset($data_distributor['status'])?$data_distributor['status']:'') == 1?"checked":"";?>>
                            Aktif
                        </label>
                    </div>
                    <div class="radio">
                        <label>
                            <input type="radio" name="status" id="inputID" value="0" <?php echo set_value('status',isset($data_distributor['status'])?$data_distributor['status']:'') == 0?"checked":"";?>>
                            Non Aktif
                        </label>
                    </div>
                </div>
                <div class="form-group">
                    <div class="text-right">
                        <input type="submit" name="submit" class="btn btn-primary" value="Edit">
                    </div>
                </div>
            </fieldset>
            </form>
        </div>
    </div>
</div><!-- /#page-wrapper -->