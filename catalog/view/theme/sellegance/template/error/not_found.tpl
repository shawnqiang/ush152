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
	 
	<header>
		
	</header>

	<?php 
	
	if ($column_left || $column_right) { $main = "span9"; } 
	else { 	$main = "span12"; } 

	?>

	<div class="row">

		<?php echo $column_left; ?>

		<section id="maincontent" class="<?php echo $main; ?>" role="main" >
			<h1><?php echo $heading_title; ?></h1>
			<div class="empty">
				
				<p><?php echo $text_error; ?></p>

				<div class="buttons">

					<a href="<?php echo $continue; ?>" class="btn btn-inverse">
						<?php echo $button_continue; ?>
					</a>

				</div>

			</div>

		</section> <!-- #maincontent -->
		
		<?php echo $column_right; ?>

	</div> <!-- .row -->
	
	<?php echo $content_bottom; ?>

<?php echo $footer; ?>