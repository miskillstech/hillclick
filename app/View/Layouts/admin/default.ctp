<!DOCTYPE html>
<html lang="en">
<head>
    <?php echo $this->element('admin/head') ?>
</head>
<body class="nav-md">
    <div class="container body">
      <div class="main_container">
      	<div class="col-md-3 left_col">
      		<?php echo $this->element('admin/left-nav');?>
      	</div>	
      	
      	<div class="top_nav">
      		<?php echo $this->element('admin/header');?>
      	</div>	
      	
      	<div class="right_col" role="main">
      		<?php echo $this->fetch('content');?>
      	</div>
      </div>
    </div>	
    <?php $this->element('admin/footer') ?>
</body>
</html>		