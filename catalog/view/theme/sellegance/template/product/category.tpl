<?php echo $header; ?>

	<?php echo $content_top; ?>

	

	<div id="notification"></div>

	

	<?php 
	
	if ($column_left || $column_right) { $main = "span9"; } 
	else { 	$main = "span12"; } 

	?>

	<div class="row categorywrapper">

		<?php echo $column_left; ?>

		<section id="maincontent" class="<?php echo $main; ?>" role="main">

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

			<?php if ($thumb || $description) { ?>

				<div class="category-info">
					<?php if ($thumb) { ?>
					<div class="image"><img src="<?php echo $thumb; ?>" alt="<?php echo $heading_title; ?>" /></div>
					<?php } ?>
					<?php if ($description) { ?>
					<?php echo $description; ?>
					<?php } ?>
				</div>

			<?php } ?>

			<!-- Subcategories 
			============================== -->

			<?php if ($categories) { ?>

				<div class="contentset">
					<h4 class="inner">
						<span><?php echo $text_refine; ?></span>
					</h4>
				</div>

				<div class="category-list">

					<?php if (count($categories) <= 5) { ?>

					<ul>
						<?php foreach ($categories as $category) { ?>
						<li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>	
						<?php } ?>
					</ul>

					<?php } else { ?>

						<?php for ($i = 0; $i < count($categories);) { ?>
						<ul>
							<?php $j = $i + ceil(count($categories) / 4); ?>
							<?php for (; $i < $j; $i++) { ?>
								<?php if (isset($categories[$i])) { ?>
									<li><a href="<?php echo $categories[$i]['href']; ?>"><?php echo $categories[$i]['name']; ?></a></li>
								<?php } ?>
							<?php } ?>
						</ul>
						<?php } ?>

					<?php } ?>

				</div>

			<?php } ?> <!-- subcategories END -->


			<!-- Products 
			============================== -->

			<?php if ($products) { ?>

				<!-- Grid/Lis view, filters 
				============================== -->

				<div class="product-filter">

					<div class="btn-group display" data-toggle="buttons-radio">

						<button id="grid" class="btn btn-mini" title="<?php echo $text_grid; ?>" onclick="display('grid');">
							<i class="icon-th"></i>
						</button>

						<button id="list" class="btn btn-mini" title="<?php echo $text_list; ?>" onclick="display('list');">
							<i class="icon-list"></i>
						</button>

					</div>

					<span class="product-compare">
					
						<a href="<?php echo $compare; ?>" id="compare-total">
							<?php echo $text_compare; ?>
						</a>

					</span>
					
					<div class="list-options"> 

						<div class="sort">

							<?php echo $text_sort; ?>

							<select onchange="location = this.value;">
								<?php foreach ($sorts as $sorts) { ?>
								<?php if ($sorts['value'] == $sort . '-' . $order) { ?>
								<option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
								<?php } else { ?>
								<option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
								<?php } ?>
								<?php } ?>
							</select>

						</div>

						<div class="limit">

							<?php echo $text_limit; ?>

							<select onchange="location = this.value;">
								
								<?php foreach ($limits as $limits) { ?>

									<?php if ($limits['value'] == $limit) { ?>

										<option value="<?php echo $limits['href']; ?>" selected="selected">
											<?php echo $limits['text']; ?>
										</option>

									<?php } else { ?>

										<option value="<?php echo $limits['href']; ?>">
											<?php echo $limits['text']; ?>
										</option>

									<?php } ?>

								<?php } ?>

							</select>

						</div>

					</div>

				</div>
			
				<!-- Product list (Default to Grid) 
				============================== -->

				<div class="product-grid row">

					<?php foreach ($products as $product) { ?>

					<div class="grid-box span3">

						<?php if ($product['thumb']) { ?>
						<div class="image">
							<a href="<?php echo $product['href']; ?>">
								<img src="<?php echo $product['thumb']; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" />
							</a>
						</div>
						<?php } ?>

						<div class="name">
							<a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
						</div>

						<?php if ($product['rating']) { ?>
						<div class="rating">
							<img src="catalog/view/theme/sellegance/images/stars-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['reviews']; ?>" />
						</div>
						<?php } ?>

						<div class="description"><?php echo $product['description']; ?></div>

						<?php if ($product['price']) { ?>

						<div class="price">
							
							<?php if (!$product['special']) { ?>
								<?php echo $product['price']; ?>
							<?php } else { ?>
								<span class="price-old"><?php echo $product['price']; ?></span>
								<span class="price-new"><?php echo $product['special']; ?></span>
							<?php } ?>

							<?php if ($product['tax']) { ?>
								<br />
								<span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
							<?php } ?>

						</div>

						<?php } ?>

						<div class="actions">

							<div class="cart">
								<a onclick="addToCart('<?php echo $product['product_id']; ?>');" class="btn btn-small btn-cart" ><?php echo $button_cart; ?></a>
							</div>
							<div class="wishlist">
								<a onclick="addToWishList('<?php echo $product['product_id']; ?>');"><?php echo $button_wishlist; ?></a>
							</div>
							<div class="compare">
								<a onclick="addToCompare('<?php echo $product['product_id']; ?>');"><?php echo $button_compare; ?></a>
							</div>

						</div>

					</div>

					<?php } ?>

				</div> <!-- .produc-grid -->

				<div class="paginate"><?php echo $pagination; ?></div>
			
			<?php } ?> <!-- products END -->


			<!-- If Category is empty 
			============================== -->

			<?php if (!$categories && !$products) { ?>

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