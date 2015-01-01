<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="icon" href="<?php echo base_url();?>/asset/images/favicon.png">
	
    <title><?php echo $title;?></title>

    <!-- Bootstrap Core CSS -->
    <link href="<?php base_url();?>asset/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="<?php base_url();?>asset/css/plugins/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="<?php base_url();?>asset/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="<?php base_url();?>asset/font-awesome-4.1.0/css/font-awesome.min.css')" rel="stylesheet" type="text/css">

</head>

<body>

    <div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">Sign In</h3>
                    </div>
                    <div class="panel-body">
                        <?php echo form_open('login')?>
                            <fieldset>
                                <div class="form-group">
                                    <input type="text" value="<?php echo set_value('username')?>" class="form-control" placeholder="Username" name="username"  autofocus >
                                </div>
                                    <?php echo form_error('username','<p class="text-danger">','</p>');?>
                                <div class="form-group">
                                    <input class="form-control" placeholder="Password" name="password" type="password" value="<?php echo set_value('password')?>">
                                </div>
                                    <?php echo form_error('password','<p class="text-danger">','</p>');?>
                                <div class="form-group">
                                    <input type="submit" class="btn btn-block btn-lg btn-success" value="Login">
                                </div>
                            </fieldset>
                        </form>
                    </div>
                </div>
                <?php if(isset($pesan)):?>
                    <div class="alert alert-danger">
                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                        <strong><?php echo $pesan?></strong>
                    </div>
                <?php endif;?>
            </div>
        </div>
    </div>

    <!-- jQuery -->
    <script src="<?php base_url();?>asset/js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="<?php base_url();?>asset/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="<?php base_url();?>asset/js/plugins/metisMenu/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="<?php base_url();?>asset/js/sb-admin-2.js"></script>

</body>

</html>
