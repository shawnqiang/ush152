<?php echo $header; ?>

	<?php echo $content_top; ?>
	
	<div class="breadcrumb">
		<?php foreach ($breadcrumbs as $breadcrumb) { ?>
		<?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
		<?php } ?>
	</div>
	
	<header>
		
		
		<?php if ($error_warning) { ?>
			<div class="alert warning"><?php echo $error_warning; ?></div>
		<?php } ?>

	</header>

	<?php 
	
	if ($column_left || $column_right) { $main = "span9"; } 
	else { 	$main = "span12"; } 

	?>

	<div class="row">

		<?php echo $column_left; ?>

		<section id="maincontent" class="<?php echo $main; ?>" role="main">
			<h3><?php echo $heading_title; ?></h3>
			<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="forgotten" class="form-horizontal">

				<p><?php echo $text_email; ?></p>

				<div class="contentset">
					<h4 class="inner">
						<span><?php echo $text_your_email; ?></span>
					</h4>
				</div>

				<div class="control-group">
					<label for="email" class="control-label">
						<b><?php echo $entry_email; ?></b>
					</label>
					<div class="controls">
						<input type="email" name="email" id="email" value="" class="required span3" required />
					</div>
				</div>

				<div class="form-actions">
					<a href="<?php echo $back; ?>" class="btn"><span><?php echo $button_back; ?></span></a>
					<input type="submit" value="<?php echo $button_continue; ?>" class="btn btn-inverse" />
				</div>

			</form>

		</section> <!-- #maincontent -->

		<?php echo $column_right; ?>

	</div> <!-- .row -->

	<?php echo $content_bottom; ?>

<?php echo $footer; ?>