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
	</header>

	<?php 
	
	if ($column_left || $column_right) { $main = "span9"; } 
	else { 	$main = "span12"; } 

	?>

	<div class="row">

		<?php echo $column_left ?>
		
		<section id="maincontent" class="<?php echo $main; ?>" role="main">

			<div id="download-list">

			<?php foreach ($downloads as $download) { ?>

				<div class="contentset">
					<h4 class="inner">
						<span><b><?php echo $text_order; ?> <?php echo $download['order_id']; ?></b></span>
					</h4>
				</div>

				<div class="row-fluid">

					<div class="span4">
						<b><?php echo $text_name; ?></b> <?php echo $download['name']; ?><br />
						<b><?php echo $text_size; ?></b> <?php echo $download['size']; ?>
					</div>
									
					<div class="span3">						
						<b><?php echo $text_date_added; ?></b> <?php echo $download['date_added']; ?>
					</div>

					<div class="span3">
						<b><?php echo $text_remaining; ?></b> <?php echo $download['remaining']; ?>
					</div>

					<div class="span2 list-actions">
						<?php if ($download['remaining'] > 0) { ?>
							<a href="<?php echo $download['href']; ?>" class="btn btn-cart btn-small">
								<i class="icon-download icon-white"></i> <?php echo $button_download; ?>
							</a>
						<?php } ?>
					</div>

				</div>

			<?php } ?>

			</div>
		
			<div class="paginate"><?php echo $pagination; ?></div>
			
			<div class="form-actions">

				<a href="<?php echo $continue; ?>" class="btn btn-inverse">
					<?php echo $button_continue; ?>
				</a>

			</div>

		</section> <!-- #maincontent -->

		<?php echo $column_right; ?>

	</div> <!-- .row -->
	
	<?php echo $content_bottom; ?>

<?php echo $footer; ?>