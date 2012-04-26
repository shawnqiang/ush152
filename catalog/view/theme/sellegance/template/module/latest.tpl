<section id="latest-products" class="box">

	<div class="box-heading">
		<h4>
			<?php echo $heading_title; ?>
		</h4>
	</div>
	<div class="box-content">
		
		<div class="box-product row-fluid">

			<?php 
			
			$counter = 0;
			
			foreach ($products as $product) { 
				
				if (($counter+2) % 4 == 0) $xclass="odd";
				else if (($counter+4) % 4 == 0 ) $xclass="alpha";
				else $xclass="";

			?>

			<div class="span3 grid-box <?php echo $xclass; ?>">

				<div class="inner">

					<?php if ($product['thumb']) { ?>
					<div class="image">
						<a href="<?php echo $product['href']; ?>">
							<img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" />
						</a>
					</div>
					<?php } ?>

					<div class="name">
						<a href="<?php echo $product['href']; ?>">
							<?php echo $product['name']; ?>
						</a>
					</div>

					<?php if ($product['price']) { ?>
					<div class="price">
						<?php if (!$product['special']) { ?>
							<?php echo $product['price']; ?>
						<?php } else { ?>
							<span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
						<?php } ?>
					</div>
					<?php } ?>

					<?php if ($product['rating']) { ?>
					<div class="rating">
						<img src="catalog/view/theme/sellegance/images/stars-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['reviews']; ?>" />
					</div>
					<?php } ?>

					<!-- <div class="cart">
						<a onclick="addToCart('<?php echo $product['product_id']; ?>');" class="btn btn-cart btn-small">
							<?php echo $button_cart; ?>
						</a>
					</div> -->

				</div>

			</div> <!-- .span3 -->

			<?php $counter++; } ?>

		</div> <!-- .box-product -->

	</div> <!-- .box-content -->

</section>