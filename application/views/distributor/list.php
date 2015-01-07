<div id="page-wrapper">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Daftar Distributor</h1>


        </div>
        <div class="col-lg-12">
            <p class="text-right">
            <a href="<?php echo site_url('distributor/add');?>" class="btn btn-sm btn-info"><i class="glyphicon glyphicon-plus"></i> Tambah</a>
            </p>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-12">
            <?php $flash_pesan = $this->session->flashdata('pesan')?>
            <?php if(!empty($flash_pesan)):?>
                <div class="alert alert-success">
                	<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                	<strong><?php echo $flash_pesan;?></strong>
                </div>
            <?php endif;?>
        </div><!-- /.col-lg-4 -->
    </div>
    <div class="row">
        <div class="col-lg-12">
            <?php echo !empty($pesan)||isset($pesan)?$pesan:'';?>
            <?php echo $tabel_data;?>
            <div class="text text-right"><?php echo $pagination;?></div>
        </div><!-- /.col-lg-12 -->
    </div>
</div><!-- /#page-wrapper -->