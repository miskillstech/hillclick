<!DOCTYPE html>
<html>
<head>
	<?php //echo $this->Html->charset(); ?>
	<title>
		<?php echo "HillClick Admin Page" ?>:
		<?php //echo $this->fetch('title'); ?>
	</title>
	<?php
		
		echo $this->Html->meta('icon');
		echo $this->Html->css('bootstrap/dist/css/bootstrap.min');
		echo $this->Html->css('font-awesome/css/font-awesome.min');
		echo $this->Html->css('nprogress/nprogress');
		echo $this->Html->css('iCheck/skins/flat/green');
		echo $this->Html->css('bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min');
		echo $this->Html->css('jqvmap/dist/jqvmap.min');
		echo $this->Html->css('bootstrap-daterangepicker/daterangepicker');
		echo $this->Html->script('moment/moment.min');
		echo $this->Html->script('datepicker/daterangepicker');
		echo $this->Html->script('jquery.min');
		echo $this->Html->css('custom');
		echo $this->fetch('meta');
		echo $this->fetch('css');
		echo $this->fetch('script');
	?>
</head>
<body>