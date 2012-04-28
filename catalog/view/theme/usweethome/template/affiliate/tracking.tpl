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

		<?php echo $column_left; ?>

		<section id="maincontent" class="<?php echo $main; ?>" role="main">

			<div class="form-horizontal">

				<p><?php echo $text_description; ?></p>
					
				<div class="control-group">
					<label for="code" class="control-label">
						<?php echo $text_code; ?>
					</label>
					<div class="controls">
						<textarea name="code" id="code" rows="3" class="span3"><?php echo $code; ?></textarea>	
					</div>
				</div>

				<div class="control-group">
					<label for="product" class="control-label">
						<?php echo $text_generator; ?>
					</label>
					<div class="controls">
						<input type="text" name="product" id="product" value="" class="span3" />	
					</div>
				</div>

				<div class="control-group">
					<label for="link" class="control-label">
						<?php echo $text_link; ?>
					</label>
					<div class="controls">
						<textarea name="link" id="link" rows="5" class="span3"></textarea>	
					</div>
				</div>
				
				<div class="form-actions">
					<a href="<?php echo $continue; ?>" class="btn btn-inverse"><?php echo $button_continue; ?></a>
				</div>

			</div>

		</section> <!-- #maincontent -->

		<?php echo $column_right; ?>

	</div> <!-- .row -->
	
	<?php echo $content_bottom; ?>
	
	<script type="text/javascript"><!--

		$('input[name=\'product\']').autocomplete({
			delay: 0,
			source: function(request, response) {
				$.ajax({
					url: 'index.php?route=affiliate/tracking/autocomplete&filter_name=' +  encodeURIComponent(request.term),
					dataType: 'json',
					success: function(json) {		
						response($.map(json, function(item) {
							return {
								label: item.name,
								value: item.link
							}
						}));
					}
				});
				
			},
			select: function(event, ui) {
				$('input[name=\'product\']').attr('value', ui.item.label);
				$('textarea[name=\'link\']').attr('value', ui.item.value);
								
				return false;
			}
		});
	
	//--></script>
	
<?php echo $footer; ?>