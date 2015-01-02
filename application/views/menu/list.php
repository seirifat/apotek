<div id="page-wrapper">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Menu List</h1>


        </div>
        <div class="col-lg-12">
            <p class="text-right">
            <a href="#" class="btn btn-sm btn-info"><i class="glyphicon glyphicon-plus"></i> Tambah</a>
            </p>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-12">
            <?php echo $tabel_data;?>
            <?php echo !empty($pesan)||isset($pesan)?$pesan:'';?>
        </div><!-- /.col-lg-12 -->
    </div>
</div><!-- /#page-wrapper -->