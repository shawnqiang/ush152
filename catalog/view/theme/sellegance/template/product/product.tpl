<?php echo $header; ?>

<?php echo $content_top; ?>
	<div class="breadcrumb">
		<?php foreach ($breadcrumbs as $breadcrumb) { ?>
		<?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
		<?php } ?>
	</div>

	<header class="heading">
		<h1><?php echo $heading_title; ?></h1>
		<div id="notification"></div>
	</header>

	<?php 
		
		if ($column_left || $column_right) {
			$main = "9"; 
			$image = "4"; 
			$desc = "5";
			$revs = "";
			$revform = "";
		} else { 
			$main = "12"; 
			$image = "6"; 
			$desc = "6";
			$revs = "span6";
			$revform = "span6";
			 } 
		?>

	<div class="row">

	<?php echo $column_left; ?>

	<section id="product-info" class="span<?php echo $main; ?>" role="main">

		<div class="row-fluid">

			<?php if ($thumb || $images) { ?>
			
			<div class="span6">
				
				<?php if ($thumb) { ?>

					<div class="image">

					<!-- Cloud Zoom script BEGIN -->

					<?php if($this->config->get('sellegance_status')== 1 && $this->config->get('sellegance_cloud_zoom')!='') { ?>

						<a href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>" class="cloud-zoom" id='zoom1' rel="adjustX: 10, adjustY:-4, tint:'#000000',tintOpacity:0.2, zoomWidth:360, position:'inside', showTitle:false">
							<img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" id="image" />
						</a>

					<!-- Cloud Zoom script END -->

					<?php } else { ?>

						<a href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>" class="colorbox" rel="colorbox">
							<img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" />
						</a>

					<?php } ?>

					</div>

				<?php } ?>

				<?php if ($images) { ?>

				<div class="image-additional">

					<?php if($this->config->get('sellegance_status')== 1 && $this->config->get('sellegance_cloud_zoom')!='') { ?>

						<a href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>" class="cloud-zoom-gallery" rel="useZoom: 'zoom1', smallImage: '<?php echo $thumb; ?>' ">
							<img src="<?php echo $thumb; ?>" width="76" height="76" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" />
						</a>

					<?php } ?>

					<?php foreach ($images as $image) { ?>

						<!-- Cloud Zoom script BEGIN -->

						<?php if($this->config->get('sellegance_status')== 1 && $this->config->get('sellegance_cloud_zoom')!='') { ?>

							<a href="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>" class="cloud-zoom-gallery" rel="useZoom: 'zoom1', smallImage: '<?php echo $image['thumb']; ?>' ">
								<img src="<?php echo $image['thumb']; ?>" width="76" height="76" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" />
							</a>

						<!-- Cloud Zoom script END -->

						<?php } else { ?>
						
							<a href="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>" class="colorbox" rel="colorbox">
								<img src="<?php echo $image['thumb']; ?>" width="76" height="76" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" />
							</a>

						<?php } ?>

					<?php } ?>

				</div>

				<?php } ?>

			</div> <!-- .span6 LEFT BOX-->

			<?php } ?> 

			<div class="span6">
				
				<?php if ($price) { ?>

				<div class="price">
					
					<?php echo $text_price; ?>

					<?php if (!$special) { ?>
						<span class="price-normal"><?php echo $price; ?></span>
					<?php } else { ?>
						<span class="price-old"><?php echo $price; ?></span> <span class="price-new"><?php echo $special; ?></span>
					<?php } ?>

					<?php if ($tax) { ?>
						<div class="price-tax"><?php echo $text_tax; ?> <?php echo $tax; ?></div>
					<?php } ?>

					<?php if ($points) { ?>
						<div class="reward"><small><?php echo $text_points; ?> <?php echo $points; ?></small></div>
					<?php } ?>

					<?php if ($discounts) { ?>
					<div class="discount">
						<ul>
						<?php foreach ($discounts as $discount) { ?>
							<li><?php echo sprintf($text_discount, $discount['quantity'], "<span>".$discount['price']."</span>"); ?></li>
						<?php } ?>
						</ul>
					</div>
					<?php } ?>

				</div> <!-- .price -->

				<?php } ?>

				<div class="description">

					<?php if ($manufacturer) { ?>
						<span><?php echo $text_manufacturer; ?></span> <a href="<?php echo $manufacturers; ?>"><?php echo $manufacturer; ?></a><br />
					<?php } ?>
						
						<span><?php echo $text_model; ?></span> <?php echo $model; ?><br />
						<span><?php echo $text_reward; ?></span> <?php echo $reward; ?><br />
						<span><?php echo $text_stock; ?></span> <?php echo $stock; ?>

				</div> <!-- .description -->

				<?php if ($options) { ?>
				
					<div class="options">
						
						<h4><?php echo $text_option; ?></h4><br>

						<?php foreach ($options as $option) { ?>

							<!-- Select -->
						
							<?php if ($option['type'] == 'select') { ?>

								<div id="option-<?php echo $option['product_option_id']; ?>" class="control-group">
									
									<label for="option[<?php echo $option['product_option_id']; ?>]">
										
										<?php if ($option['required']) { ?>
											<span class="req_mark">*</span>
										<?php } ?>

										<b><?php echo $option['name']; ?>:</b>

									</label>

									<div class="controls">
										<select name="option[<?php echo $option['product_option_id']; ?>]" class="span4">
											<option value=""><?php echo $text_select; ?></option>
											
											<?php foreach ($option['option_value'] as $option_value) { ?>
												
												<option value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
												
												<?php if ($option_value['price']) { ?>
													(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
												<?php } ?>

												</option>

											<?php } ?>
										</select>
									</div>

								</div>

							<?php } ?>

							<!-- Radio -->

							<?php if ($option['type'] == 'radio') { ?>

								<div id="option-<?php echo $option['product_option_id']; ?>" class="control-group">

									<label class="control-label">

										<?php if ($option['required']) { ?>
											<span class="req_mark">*</span>
										<?php } ?>

										<b><?php echo $option['name']; ?>:</b>

									</label>

									<?php foreach ($option['option_value'] as $option_value) { ?>						
										
										<label for="option-value-<?php echo $option_value['product_option_value_id']; ?>" class="radio">
											
											<input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" />

											<?php echo $option_value['name']; ?>

											<?php if ($option_value['price']) { ?>
												(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
											<?php } ?>

										</label>

									<?php } ?>

								</div>

							<?php } ?>

							<!-- Checkbox -->

							<?php if ($option['type'] == 'checkbox') { ?>

								<div id="option-<?php echo $option['product_option_id']; ?>" class="control-group">

									<label class="control-label">
										
										<?php if ($option['required']) { ?>
											<span class="req_mark">*</span>
										<?php } ?>

										<b><?php echo $option['name']; ?>:</b>

									</label>

									<?php foreach ($option['option_value'] as $option_value) { ?>
									
										<label for="option-value-<?php echo $option_value['product_option_value_id']; ?>" class="checkbox">
											<input type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" />
									
											<?php echo $option_value['name']; ?>
									
											<?php if ($option_value['price']) { ?>
												(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
											<?php } ?>
									
										</label>
									
									<?php } ?>
								
								</div>

							<?php } ?>

							<!-- Image -->

							<?php if ($option['type'] == 'image') { ?>

								<div id="option-<?php echo $option['product_option_id']; ?>" class="control-group">

									<label class="control-label">

										<?php if ($option['required']) { ?>
											<span class="req_mark">*</span>
										<?php } ?>

										<b><?php echo $option['name']; ?>:</b>

									</label>

									<?php foreach ($option['option_value'] as $option_value) { ?>						
										
										<label for="option-value-<?php echo $option_value['product_option_value_id']; ?>" class="radio option-image">
											
											<input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" />

											<img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" />

											<?php if ($option_value['price']) { ?>
												(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
											<?php } ?>

										</label>

									<?php } ?>

								</div>

							<?php } ?>

							<!-- Text field -->

							<?php if ($option['type'] == 'text') { ?>

								<div id="option-<?php echo $option['product_option_id']; ?>" class="control-group">

									<label for="option[<?php echo $option['product_option_id']; ?>]" class="control-label">
										
										<?php if ($option['required']) { ?>
											<span class="req_mark">*</span>
										<?php } ?>

										<b><?php echo $option['name']; ?>:</b>

									</label>

									<div class="controls">
										<input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>"  class="span4" />
									</div>

								</div>

							<?php } ?>

							<!-- Textarea -->

							<?php if ($option['type'] == 'textarea') { ?>

								<div id="option-<?php echo $option['product_option_id']; ?>" class="control-group">

									<label for="option[<?php echo $option['product_option_id']; ?>]" class="control-label">
										
										<?php if ($option['required']) { ?>
											<span class="req_mark">*</span>
										<?php } ?>

										<b><?php echo $option['name']; ?>:</b>

									</label>

									<div class="controls">
										<textarea name="option[<?php echo $option['product_option_id']; ?>]" cols="40" rows="5"  class="span4"><?php echo $option['option_value']; ?></textarea>
									</div>

								</div>

							<?php } ?>

							<!-- File -->

							<?php if ($option['type'] == 'file') { ?>

								<div id="option-<?php echo $option['product_option_id']; ?>" class="control-group">

									<label for="option[<?php echo $option['product_option_id']; ?>]" class="control-label">

										<?php if ($option['required']) { ?>
											<span class="req_mark">*</span>
										<?php } ?>

										<b><?php echo $option['name']; ?>:</b>

									</label>

									<div class="controls">
										<a id="button-option-<?php echo $option['product_option_id']; ?>" class="btn btn-success btn-small"><i class="icon-upload icon-white"></i> <?php echo $button_upload; ?></a>
										<input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value="" />
									</div>

								</div>

							<?php } ?>

							<!-- Date -->

							<?php if ($option['type'] == 'date') { ?>

								<div id="option-<?php echo $option['product_option_id']; ?>" class="control-group">

									<label for="option[<?php echo $option['product_option_id']; ?>]" class="contro-label">

										<?php if ($option['required']) { ?>
											<span class="req_mark">*</span>
										<?php } ?>

										<b><?php echo $option['name']; ?>:</b>

									</label>

									<div class="controls">
										<input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" class="date span2" />
									</div>

								</div>

							<?php } ?>

							<!-- Date time -->

							<?php if ($option['type'] == 'datetime') { ?>

								<div id="option-<?php echo $option['product_option_id']; ?>" class="control-group">

									<label for="option[<?php echo $option['product_option_id']; ?>]" class="control-label">

										<?php if ($option['required']) { ?>
											<span class="req_mark">*</span>
										<?php } ?>

										<b><?php echo $option['name']; ?>:</b>

									</label>

									<div class="controls">
										<input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" class="datetime span2" />
									</div>

								</div>

							<?php } ?>

							<!-- Time -->

							<?php if ($option['type'] == 'time') { ?>

								<div id="option-<?php echo $option['product_option_id']; ?>" class="control-group">

									<label for="option[<?php echo $option['product_option_id']; ?>]" class="control-label">
										
										<?php if ($option['required']) { ?>
											<span class="req_mark">*</span>
										<?php } ?>

										<b><?php echo $option['name']; ?>:</b>

									</label>

									<div class="controls">
										<input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" class="time span2" />
									</div>

								</div>

							<?php } ?>

						<?php } ?>

					</div> <!-- .options -->

				<?php } ?>

				<div class="cart">

					<div class="add-cart">

						<?php echo $text_qty; ?>
						<input type="text" name="quantity" value="<?php echo $minimum; ?>" class="input-mini" />
						<input type="hidden" name="product_id" value="<?php echo $product_id; ?>" />

						<input type="button" value="<?php echo $button_cart; ?>" id="button-cart" class="btn btn-large btn-cart" />

						<?php if ($minimum > 1) { ?>
							<small class="minimum"><?php echo $text_minimum; ?></small>
						<?php } ?>

					</div> <!-- .add_cart -->

					<div class="more-actions">

						<div class="wishlist">
							<a onclick="addToWishList('<?php echo $product_id; ?>');"><?php echo $button_wishlist; ?></a>
						</div>

						<div class="compare">
							<a onclick="addToCompare('<?php echo $product_id; ?>');"><?php echo $button_compare; ?></a>
						</div>
						
					</div>

				</div> <!-- .cart -->
						
				<?php if ($review_status) { ?>

					<div class="review">
						
						<img src="catalog/view/theme/sellegance/images/stars-<?php echo $rating; ?>.png" alt="<?php echo $reviews; ?>" />

						<a onclick="$('a[href=\'#tab-review\']').trigger('click'); $('html, body').animate({scrollTop: $('#tabs').offset().top}, 800);" class="view-revs"><?php echo $reviews; ?></a>

						<a onclick="$('a[href=\'#tab-review\']').trigger('click'); $('html, body').animate({scrollTop: $('#add-review').offset().top}, 800);" class="btn btn-mini"><i class="icon-comment"></i> <?php echo $text_write; ?></a>

					</div>

				<?php } ?>

				<div class="share">

					<!-- AddThis button BEGIN -->

					<div class="addthis_default_style">
						<a class="addthis_button_compact"><?php echo $text_share; ?></a> 
						<a class="addthis_button_email"></a>
						<a class="addthis_button_twitter"></a>
						<a class="addthis_button_facebook_like"></a> 
						<a class="addthis_button_google_plusone"></a>
					</div>
					<script type="text/javascript" src="https://s7.addthis.com/js/250/addthis_widget.js"></script> 
					
					<!-- AddThis button END --> 

				</div>

				<?php if ($tags) { ?>

					<div class="tags">
						<b><?php echo $text_tags; ?></b>
						
						<?php foreach ($tags as $tag) { ?>
							<a href="<?php echo $tag['href']; ?>"><?php echo $tag['tag']; ?></a>
						<?php } ?>
					
					</div>

				<?php } ?>

			</div> <!-- .span6 RIGHT BOX-->

		</div>
		
		<section id="full-info">

			<div class="tabbable">

				<ul id="tabs" class="nav nav-tabs">

					<li class="active"><a href="#tab-description" data-toggle="tab"><?php echo $tab_description; ?></a></li>

					<?php if ($attribute_groups) { ?>
					<li><a href="#tab-attribute" data-toggle="tab"><?php echo $tab_attribute; ?></a></li>
					<?php } ?>

					<?php if ($review_status) { ?>
					<li><a href="#tab-review" data-toggle="tab"><?php echo $tab_review; ?></a></li>
					<?php } ?>

				</ul> <!-- .nav-tabs -->

				<div class="tab-content">

					<div id="tab-description" class="tab-pane active">

						<?php echo $description; ?>

					</div> <!-- #tab-description -->
				
					<?php if ($attribute_groups) { ?>
					
					<div id="tab-attribute" class="tab-pane">

						<section class="product-atrributes">
						
							<table class="table table-striped attribute">

								<?php foreach ($attribute_groups as $attribute_group) { ?>

								<thead>
									<tr>
										<td colspan="2"><?php echo $attribute_group['name']; ?></td>
									</tr>
								</thead>

								<tbody>
									<?php foreach ($attribute_group['attribute'] as $attribute) { ?>
									<tr>
										<th><?php echo $attribute['name']; ?></th>
										<td><?php echo $attribute['text']; ?></td>
									</tr>
									<?php } ?>
								</tbody>

								<?php } ?>

							</table>

						</section>

					</div> <!-- #tab-attribute -->

					<?php } ?>

					<?php if ($review_status) { ?>

					<div id="tab-review" class="tab-pane">

						<div class="row-fluid">
						
							<section id="review" class="<?php echo $revs; ?>"></section>
							
							<section id="add-review" class="<?php echo $revform; ?>">

								<div class="contentset center" id="review-title">
									<h4 class="inner">
										<span><?php echo $text_write; ?></span>
									</h4>
								</div>

								<div id="review-form">

									<div class="control-group">
										
										<label class="label-group"><span class="req_mark">*</span> <b><?php echo $entry_name; ?></b></label>

										<div class="controls">
											<input type="text" name="name" value="" class="span5" required />
										</div>

									</div>

									<div class="control-group">

										<label class="label-group"><span class="req_mark">*</span> <b><?php echo $entry_review; ?></b></label>

										<div class="controls"><textarea name="text" cols="60" rows="8" class="span5" required ></textarea>
										</div>

										<small><?php echo $text_note; ?></small>

									</div>

									<div class="control-group">

										<label class="label-group"><span class="req_mark">*</span> <b><?php echo $entry_rating; ?></b></label> 
											
										<div class="controls">
											
											<span><?php echo $entry_bad; ?></span>
											
											<input type="radio" name="rating" value="1" />
											<input type="radio" name="rating" value="2" />
											<input type="radio" name="rating" value="3" />
											<input type="radio" name="rating" value="4" />
											<input type="radio" name="rating" value="5" />
											
											<span><?php echo $entry_good; ?></span>
										
										</div>

									</div>

									<div class="control-group">

										<label for="captcha" class="control-label"><b><?php echo $entry_captcha; ?></b></label>

										<div class="controls">
											<input type="text" name="captcha" id="captcha" value="" class="input-medium" />
										</div>

									</div>

									<img src="index.php?route=product/product/captcha" alt="" />
									
									<div class="form-actions">
										<a id="button-review" class="btn btn-inverse"><span><?php echo $button_continue; ?></span></a>
									</div>

								</div> <!-- #review-form -->

							</section> <!-- #add-review -->

						</div>

					</div> <!-- #tab-review -->

					<?php } ?>

				</div> <!-- .tab-content -->

			</div>

		</section> <!-- #full-info -->

	</section>

	<?php echo $column_right; ?>

	</div>



	<?php if ($products) { ?>

	<section id="related-products">

		<div class="contentset center">
			<h4 class="inner">
				<span><?php echo $tab_related; ?></span>
			</h4>
		</div>

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

						<a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>

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

					<div class="cart">

						<a onclick="addToCart('<?php echo $product['product_id']; ?>');" class="btn btn-cart btn-small" >
							<?php echo $button_cart; ?>
						</a>

					</div>

				</div>

			</div> <!-- .span3 -->

			<?php $counter++; } ?>

		</div>

	</section> <!-- #related-products -->

	<?php } ?>


	<?php echo $content_bottom; ?>

	<script type="text/javascript">

		$('#button-cart').bind('click', function() {

			$.ajax({
				url: 'index.php?route=checkout/cart/add',
				type: 'post',
				data: $('#product-info input[type=\'text\'], #product-info input[type=\'hidden\'], #product-info input[type=\'radio\']:checked, #product-info input[type=\'checkbox\']:checked, #product-info select, #product-info textarea'),
				dataType: 'json',
				success: function(json) {
					$('.alert, .success, .warning, .attention, .information, .error').remove();
					
					if (json['error']) {
						if (json['error']['option']) {
							for (i in json['error']['option']) {
								$('#option-' + i).after('<span class="error">' + json['error']['option'][i] + '</span>');
							}
						}
					} 	 
								
					if (json['success']) {
						$('#notification').html('<div class="alert success">' + json['success'] + '<a class="close" data-dismiss="alert" href="#">&times;</a></div>');
							
						$('.success').fadeIn('slow');
							
						$('#cart-total').html(json['total']);
						
						$('html, body').animate({ scrollTop: 0 }, 'slow'); 
					}	
				}
			});

		});

	</script>


	<?php if ($options) { ?>

		<script type="text/javascript" src="catalog/view/javascript/jquery/ajaxupload.js"></script>

		<?php foreach ($options as $option) { ?>

			<?php if ($option['type'] == 'file') { ?>

				<script type="text/javascript">

					new AjaxUpload('#button-option-<?php echo $option['product_option_id']; ?>', {
						action: 'index.php?route=product/product/upload',
						name: 'file',
						autoSubmit: true,
						responseType: 'json',
						onSubmit: function(file, extension) {
							$('#button-option-<?php echo $option['product_option_id']; ?>').after('<img src="catalog/view/theme/sellegance/images/loading.gif" class="loading" style="padding-left: 5px;" />');
						},
						onComplete: function(file, json) {
							$('.error').remove();
							
							if (json.success) {
								alert(json.success);
								
								$('input[name=\'option[<?php echo $option['product_option_id']; ?>]\']').attr('value', json.file);
							}
							
							if (json.error) {
								$('#option-<?php echo $option['product_option_id']; ?>').after('<span class="error">' + json.error + '</span>');
							}
							
							$('.loading').remove();	
						}
					});

				</script>

			<?php } ?>

		<?php } ?>

	<?php } ?>


	<script type="text/javascript">

		$('#review .paginate a').live('click', function() {

			$('#review').slideUp('slow');
				
			$('#review').load(this.href);
			
			$('#review').slideDown('slow');
			
			return false;
		});			

		$('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');

		$('#button-review').bind('click', function() {

			$.ajax({
				type: 'POST',
				url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
				dataType: 'json',
				data: 'name=' + encodeURIComponent($('input[name=\'name\']').val()) + '&text=' + encodeURIComponent($('textarea[name=\'text\']').val()) + '&rating=' + encodeURIComponent($('input[name=\'rating\']:checked').val() ? $('input[name=\'rating\']:checked').val() : '') + '&captcha=' + encodeURIComponent($('input[name=\'captcha\']').val()),
				beforeSend: function() {
					$('.success, .warning').remove();
					$('#button-review').attr('disabled', true);
					$('#review-title').after('<div class="alert attention"><img src="catalog/view/theme/sellegance/images/loading.gif" alt="" /> <?php echo $text_wait; ?></div>');
				},
				complete: function() {
					$('#button-review').attr('disabled', false);
					$('.attention').remove();
				},
				success: function(data) {
					if (data.error) {
						$('#review-title').after('<div class="alert warning">' + data.error + '</div>');
					}
					
					if (data.success) {
						$('#review-title').after('<div class="alert success">' + data.success + '</div>');
										
						$('input[name=\'name\']').val('');
						$('textarea[name=\'text\']').val('');
						$('input[name=\'rating\']:checked').attr('checked', '');
						$('input[name=\'captcha\']').val('');
					}
				}
			});
		});

	</script> 

	<script type="text/javascript" src="catalog/view/javascript/jquery/ui/jquery-ui-timepicker-addon.js"></script>

	<script type="text/javascript">
		
		if ($.browser.msie && $.browser.version == 6) {
			$('.date, .datetime, .time').bgIframe();
		}

		$('.date').datepicker({dateFormat: 'yy-mm-dd'});
		$('.datetime').datetimepicker({
			dateFormat: 'yy-mm-dd',
			timeFormat: 'h:m'
		});
		$('.time').timepicker({timeFormat: 'h:m'});
	
	</script> 


<?php echo $footer; ?>