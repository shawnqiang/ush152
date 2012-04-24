<?php echo $header; ?>

	<?php echo $content_top; ?>
	
	<div class="breadcrumb">
		<?php foreach ($breadcrumbs as $breadcrumb) { ?>
			<?php echo $breadcrumb['separator']; ?>
			<a href="<?php echo $breadcrumb['href']; ?>">
				<?php echo $breadcrumb['text']; ?>
			</a>
		<?php } ?>
	</div>
	
	<header class="heading">

		<h1><?php echo $heading_title; ?></h1>

		<?php if ($success) { ?>
			<div class="alert success"><?php echo $success; ?><a class="close" data-dismiss="alert" href="#">&times;</a></div>
		<?php } ?>

		<?php if ($error_warning) { ?>
			<div class="alert warning"><?php echo $error_warning; ?><a class="close" data-dismiss="alert" href="#">&times;</a></div>
		<?php } ?>

	</header>

	<?php 
	
	if ($column_left || $column_right) { $main = "span9"; } 
	else { 	$main = "span12"; } 

	?>

	<div class="row">

		<?php echo $column_left; ?>

		<section id="maincontent" class="<?php echo $main; ?>" role="main">

			<div class="contentset">
				<h4 class="inner">
					<span><?php echo $text_address_book; ?></span>
				</h4>
			</div>

			<div id="address-list">

				<?php foreach ($addresses as $result) { ?>

					<div class="row-fluid">

						<div class="span6">
							<address>
								<?php echo $result['address']; ?>
							</address>
						</div>

						<div class="span6 list-actions">
							<a href="<?php echo $result['update']; ?>" class="btn btn-mini" title="<?php echo $button_edit; ?>">
								<i class="icon-pencil"></i> <?php echo $button_edit; ?>
							</a>
							<a href="<?php echo $result['delete']; ?>" class="btn btn-mini" title="<?php echo $button_delete; ?>">
								<i class="icon-trash"></i>
							</a>
						</div>
						
					</div>

				<?php } ?>

			</div>

			<div class="form-actions">
				<a href="<?php echo $back; ?>" class="btn"><?php echo $button_back; ?></a>
				<a href="<?php echo $insert; ?>" class="btn btn-inverse"><?php echo $button_new_address; ?></a>
			</div>
		
		</section> <!-- #maincontent -->

		<?php echo $column_right; ?>

	</div> <!-- .row -->

	<?php echo $content_bottom; ?>
	
<?php echo $footer; ?>