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

		<section id="maincontent" class="<?php echo $main; ?>" role="main">
			<div class="mod">
				<div class="mod-hd">
					<h4><?php echo $heading_title; ?></h4>
				</div>
				<div class="mod-bd">
					<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="newsletter" class="form-horizontal">

						<div class="control-group">
							
							<label class="control-label"><?php echo $entry_newsletter; ?></label>
							
							<div class="controls">
								<?php if ($newsletter) { ?>
									<label class="radio inline"><input type="radio" name="newsletter" value="1" checked="checked" /><?php echo $text_yes; ?></label>
									<label class="radio inline"><input type="radio" name="newsletter" value="0" /><?php echo $text_no; ?></label>
								<?php } else { ?>
									<label class="radio inline"><input type="radio" name="newsletter" value="1" /><?php echo $text_yes; ?></label>
									<label class="radio inline"><input type="radio" name="newsletter" value="0" checked="checked" /><?php echo $text_no; ?></label>
								<?php } ?>
							</div>
						</div>
						
						<div class="form-actions">
							<a href="<?php echo $back; ?>" class="btn"><?php echo $button_back; ?></a>
							<input type="submit" value="<?php echo $button_continue; ?>" class="btn btn-inverse" />
						</div>

					</form>
				</div>
			</div>
			

		</section>

		<?php echo $column_right; ?>

	</div> <!-- .row -->
	
	<?php echo $content_bottom; ?>

<?php echo $footer; ?>