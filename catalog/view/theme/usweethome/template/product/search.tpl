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
		<div id="notification"></div>
	</header>

	<?php 
	
	if ($column_left || $column_right) { $main = "span9"; } 
	else { 	$main = "span12"; } 

	?>	

	<div class="row">

		<?php echo $column_left; ?>

		<section id="maincontent" class="<?php echo $main; ?>" role="main">

			<div class="search-criteria">
				
				<div class="contentset center">
					<h4 class="inner">
						<span><?php echo $text_critea; ?></span>
					</h4>
				</div>
					
				<div class="controls">
					<input type="search" name="filter_name" id="filter_name" value="<?php echo $filter_name; ?>" class="search-box span6" placeholder="Search" />
				</div>

				<select name="filter_category_id" class="filter-category span4">

					<option value="0"><?php echo $text_category; ?></option>

					<?php foreach ($categories as $category_1) { ?>
						
						<?php if ($category_1['category_id'] == $filter_category_id) { ?>
							<option value="<?php echo $category_1['category_id']; ?>" selected="selected"><?php echo $category_1['name']; ?></option>
						<?php } else { ?>
							<option value="<?php echo $category_1['category_id']; ?>"><?php echo $category_1['name']; ?></option>
						<?php } ?>

						<?php foreach ($category_1['children'] as $category_2) { ?>

							<?php if ($category_2['category_id'] == $filter_category_id) { ?>
								<option value="<?php echo $category_2['category_id']; ?>" selected="selected">&nbsp;-&nbsp;<?php echo $category_2['name']; ?></option>
								<?php } else { ?>
								<option value="<?php echo $category_2['category_id']; ?>">&nbsp;-&nbsp;<?php echo $category_2['name']; ?></option>
							<?php } ?>

							<?php foreach ($category_2['children'] as $category_3) { ?>
								<?php if ($category_3['category_id'] == $filter_category_id) { ?>
									<option value="<?php echo $category_3['category_id']; ?>" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;-&nbsp;<?php echo $category_3['name']; ?></option>
								<?php } else { ?>
									<option value="<?php echo $category_3['category_id']; ?>">&nbsp;&nbsp;&nbsp;&nbsp;-&nbsp;<?php echo $category_3['name']; ?></option>
								<?php } ?>
							<?php } ?>

						<?php } ?>

					<?php } ?>

				</select>

				<div class="controls">
					
					<label class="checkbox inline">

						<?php if ($filter_sub_category) { ?>
							<input type="checkbox" name="filter_sub_category" value="1" id="sub_category" checked="checked" />
						<?php } else { ?>
							<input type="checkbox" name="filter_sub_category" value="1" id="sub_category" />
						<?php } ?>
						<?php echo $text_sub_category; ?>

					</label>

					<label class="checkbox inline">

						<?php if ($filter_description) { ?>
							<input type="checkbox" name="filter_description" value="1" id="description" checked="checked" />
						<?php } else { ?>
							<input type="checkbox" name="filter_description" value="1" id="description" />
						<?php } ?>
						<?php echo $entry_description; ?>

					</label>

				</div>
		
				<div class="buttons">
					<input type="button" value="<?php echo $button_search; ?>" id="button-search" class="btn btn-inverse" />
				</div>

			</div>

			<div class="contentset center">
				<h4 class="inner">
					<span><?php echo $text_search; ?></span>
				</h4>
			</div>

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
							<img src="catalog/view/theme/usweethome/images/stars-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['reviews']; ?>" />
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
			
			<?php } else { ?>

				<div class="content empty white">

					<div class="alert warning"><?php echo $text_empty; ?><a class="close" data-dismiss="alert" href="#">&times;</a></div>

				</div>

			<?php } ?>

		</section><!-- #maincontent -->
		
		<?php echo $column_right; ?>

	</div> <!-- .row -->
	
	<?php echo $content_bottom; ?>

	<script type="text/javascript">

		$('#maincontent input[name=\'filter_name\']').keydown(function(e) {
			if (e.keyCode == 13) {
				$('#button-search').trigger('click');
			}
		});

		$('#button-search').bind('click', function() {
			url = 'index.php?route=product/search';
			
			var filter_name = $('#maincontent input[name=\'filter_name\']').attr('value');
			
			if (filter_name) {
				url += '&filter_name=' + encodeURIComponent(filter_name);
			}

			var filter_category_id = $('#maincontent select[name=\'filter_category_id\']').attr('value');
			
			if (filter_category_id > 0) {
				url += '&filter_category_id=' + encodeURIComponent(filter_category_id);
			}
			
			var filter_sub_category = $('#maincontent input[name=\'filter_sub_category\']:checked').attr('value');
			
			if (filter_sub_category) {
				url += '&filter_sub_category=true';
			}
				
			var filter_description = $('#maincontent input[name=\'filter_description\']:checked').attr('value');
			
			if (filter_description) {
				url += '&filter_description=true';
			}

			location = url;
		});

	</script> 

<?php echo $footer; ?>