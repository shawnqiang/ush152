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

		

		<div id="notification"></div>

	</header>

	<?php 
	
	if ($column_left || $column_right) { $main = "span9"; } 
	else { 	$main = "span12"; } 

	?>

	<div class="row">

		<?php echo $column_left;?>

		<section id="maincontent" class="<?php echo $main; ?>" role="main">
			<div class="mod">
				<div class="mod-hd">
					<h4><?php echo $heading_title; ?></h4>
				</div>
				<div class="mod-bd">
								<?php if ($products) { ?>

				<div id="wish-list">

					<?php foreach ($products as $product) { ?>

						<div id="wishlist-row<?php echo $product['product_id']; ?>" class="row-fluid">
					
							<div class="span2 image">
								<?php if ($product['thumb']) { ?>
								<a href="<?php echo $product['href']; ?>">
									<img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" />
								</a>
								<?php } ?>
							</div>
							
							<div class="span3 name">
								<b><a href="<?php echo $product['href']; ?>">
										<?php echo $product['name']; ?>
									</a></b><br>
								<small><?php echo $column_model; ?>:</small> <?php echo $product['model']; ?>
							</div>
							
							<div class="span2 stock"><?php echo $product['stock']; ?></div>
							
							<div class="span2 price">
								<?php if ($product['price']) { ?>
									<?php if (!$product['special']) { ?>
										<?php echo $product['price']; ?>
									<?php } else { ?>
										<span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
									<?php } ?>
								<?php } ?>
							</div>
							
							<div class="span3 list-actions">
								<a onclick="addToCart('<?php echo $product['product_id']; ?>');" class="btn btn-mini btn-cart" title="<?php echo $button_cart; ?>" >
									<?php echo $button_cart; ?>
								</a>
								<a href="<?php echo $product['remove']; ?>" class="btn btn-mini" title="<?php echo $button_remove; ?>">
									<i class="icon-trash"></i>
								</a>
							</div>

						</div>

					<?php } ?>

				</div> <!-- #wish-list -->
			
				<div class="form-actions">
					<a href="<?php echo $continue; ?>" class="btn btn-inverse"><?php echo $button_continue; ?></a>
				</div>

			<?php } else { ?>

				<div class="content empty">
					<p><?php echo $text_empty; ?></p>
					<div class="">
						<a href="<?php echo $continue; ?>" class="btn btn-inverse"><?php echo $button_continue; ?></a>
					</div>
				</div>

			<?php } ?>

				</div>
			</div>


		</section> <!-- #maincontent -->

		<?php echo $column_right; ?>

	</div> <!-- .row -->
	
	<?php echo $content_bottom; ?>

<?php echo $footer; ?>