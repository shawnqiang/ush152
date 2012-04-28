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

			<h3><?php echo $text_index; ?></h3>

			<?php if ($categories) { ?>
				
				<div class="pagination">
					<ul>
						<?php foreach ($categories as $category) { ?>
							<li>
								<a href="index.php?route=product/manufacturer#<?php echo $category['name']; ?>"><?php echo $category['name']; ?></a>
							</li>
						<?php } ?>
					</ul>
				</div>

				<div id="manufacturer-list">

				<?php foreach ($categories as $category) { ?>
					
					<div class="contentset">
						<h4 class="inner">
							<span><?php echo $category['name']; ?><a id="<?php echo $category['name']; ?>"></a></span>
						</h4>
					</div>

					<div class="manufacturer-content row-fluid">
						
						<?php if ($category['manufacturer']) { ?>
						
							<?php for ($i = 0; $i < count($category['manufacturer']);) { ?>

								<ul class="span3 unstyled">

									<?php $j = $i + ceil(count($category['manufacturer']) / 4); ?>

									<?php for (; $i < $j; $i++) { ?>
										
										<?php if (isset($category['manufacturer'][$i])) { ?>
										
										<li>
											<a href="<?php echo $category['manufacturer'][$i]['href']; ?>">
												<b><?php echo $category['manufacturer'][$i]['name']; ?></b>
											</a>
										</li>

										<?php } ?>

									<?php } ?>

								</ul>

							<?php } ?>

						<?php } ?>
				
					</div>
				
				<?php } ?>

				</div>

			<?php } else { ?>

				<div class="content empty">

					<p><?php echo $text_empty; ?></p>

					<div class="buttons">
						<a href="<?php echo $continue; ?>" class="btn btn-inverse">
							<?php echo $button_continue; ?>
						</a>
					</div>

				</div>

			<?php } ?>

		</section> <!-- #maincontent -->
		
		<?php echo $column_right; ?>

	</div> <!-- .row -->

	<?php echo $content_bottom; ?>

<?php echo $footer; ?>