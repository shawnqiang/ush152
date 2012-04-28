<?php echo $header; ?>

	<?php echo $content_top; ?>

	<!-- <div class="breadcrumb">
		<?php foreach ($breadcrumbs as $breadcrumb) { ?>
			<?php echo $breadcrumb['separator']; ?>
			<a href="<?php echo $breadcrumb['href']; ?>">
				<?php echo $breadcrumb['text']; ?>
			</a>
		<?php } ?>
	</div> -->

	<header>
	
		

		<?php if ($attention) { ?>
			<div class="alert attention"><?php echo $attention; ?><a class="close" data-dismiss="alert" href="#">&times;</a></div>
		<?php } ?>
		<?php if ($success) { ?>
			<div class="alert success"><?php echo $success; ?><a class="close" data-dismiss="alert" href="#">&times;</a></div>
		<?php } ?>
		<?php if ($error_warning) { ?>
			<div class="alert warning"><?php echo $error_warning; ?><a class="close" data-dismiss="alert" href="#">&times;</a></div>
		<?php } ?>

	</header>

	<div class="row">

		<section id="cart-info" class="span12">

			<div class="mod">
				<div class="mod-hd">
					<h3><?php echo $heading_title; ?>
						<?php if ($weight) { ?>
						<span class="weight"> (<?php echo $weight; ?>)</span>
						<?php } ?>
					</h3>
				</div>
				<div class="mod-bd">
					<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="cart-contents">

						<div class="row-fluid headings">
							<div class="span2"><?php echo $column_image; ?></div>
							<div class="span3 align-left"><?php echo $column_name; ?></div>
							<div class="span2 align-left"><?php echo $column_model; ?></div>
							<div class="span2 align-left"><?php echo $column_quantity; ?></div>
							<div class="span1"><?php echo $column_price; ?></div>
							<div class="span2"><?php echo $column_total; ?></div>
						</div>

						
						<?php foreach ($products as $product) { ?>
							
							<div class="row-fluid">

								<div class="span2 image">
									<?php if ($product['thumb']) { ?>
										<a href="<?php echo $product['href']; ?>">
											<img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" />
										</a>
									<?php } else { ?>
										&nbsp;
									<?php  } ?>
								</div>

								<div class="span3 name">
									
									<a href="<?php echo $product['href']; ?>">
										<b><?php echo $product['name']; ?></b>
									</a>
									
									<?php if (!$product['stock']) { ?>
										<span class="stock">***</span>
									<?php } ?>

									<div>
										<?php foreach ($product['option'] as $option) { ?>
										- <small><?php echo $option['name']; ?>: <?php echo $option['value']; ?></small><br />
										<?php } ?>
									</div>

									<?php if ($product['reward']) { ?>

									<small><?php echo $product['reward']; ?></small>

									<?php } ?>
								</div>

								<div class="span2 model">
									<span class="tag"><?php echo $column_model; ?>:</span>
									<?php echo $product['model']; ?>

								</div>

								<div class="span2 quantity">

									<input type="text" name="quantity[<?php echo $product['key']; ?>]" value="<?php echo $product['quantity']; ?>" class="span1" />
									&nbsp;
									<input type="image" src="catalog/view/theme/usweethome/images/update.png" alt="<?php echo $button_update; ?>" title="<?php echo $button_update; ?>" />

									<a href="<?php echo $product['remove']; ?>" title="<?php echo $button_remove; ?>"><img src="catalog/view/theme/usweethome/images/remove.png" alt="<?php echo $button_remove; ?>" title="<?php echo $button_remove; ?>" /></a>

								</div>

								<div class="span1 price">
									<span class="tag"><?php echo $column_price; ?>:</span>
									<?php echo $product['price']; ?>
								</div>

								<div class="span2 total">
									<span class="tag"><?php echo $column_total; ?>:</span>
									<b><?php echo $product['total']; ?></b>
								</div>

							</div>

						<?php } ?>

						<?php foreach ($vouchers as $vouchers) { ?>

							<div class="row-fluid">

								<div class="span2 image">&nbsp;</div>

								<div class="span3 name">
									<b><?php echo $vouchers['description']; ?></b>
								</div>

								<div class="span2 model">&nbsp;</div>

								<div class="span2 quantity">

									<input type="text" name="" value="1" class="span1" />
									&nbsp;
									<a href="<?php echo $vouchers['remove']; ?>" title="<?php echo $button_remove; ?>"><img src="catalog/view/theme/usweethome/images/remove.png" alt="<?php echo $button_remove; ?>" title="<?php echo $button_remove; ?>" /></a>

								</div>

								<div class="span1 price">
									<span class="tag"><?php echo $column_price; ?>:</span>
									<?php echo $vouchers['amount']; ?>
								</div>

								<div class="span2 total">
									<span class="tag"><?php echo $column_total; ?>:</span>
									<b><?php echo $vouchers['amount']; ?></b>
								</div>

							</div>

						<?php } ?>

					</form>
				</div>
			</div>
			

		</section>

	</div>

	<div class="row">
		
		<section id="coupon-rewards" class="span6">

			<?php if ($coupon_status || $voucher_status || $reward_status || $shipping_status) { ?>
			<div class="mod">
				<div class="mod-hd">
					<h4>
						<span><?php echo $text_next; ?></span>
					</h4>

				</div>
				<div class="mod-bd">
					<div class="content">
					<p><?php echo $text_next_choice; ?></p>
					<ul class="radio">
						<?php if ($coupon_status) { ?>
						<li class="highlight">
							<input type="radio" name="next" value="coupon" id="use_coupon" />
							<label for="use_coupon"><?php echo $text_use_coupon; ?></label>
							
						</li>
						<?php } ?>
						<?php if ($voucher_status) { ?>
						<li class="highlight">
							<input type="radio" name="next" value="voucher" id="use_voucher" />
							<label for="use_voucher"><?php echo $text_use_voucher; ?></label>
						</li>
						<?php } ?>
						<?php if ($reward_status) { ?>
						<li class="highlight">
							<input type="radio" name="next" value="reward" id="use_reward" />
							<label for="use_reward"><?php echo $text_use_reward; ?></label>
						</li>
						<?php } ?>
						<?php if ($shipping_status) { ?>
						<li class="highlight">
						<input type="radio" name="next" value="shipping" id="shipping_estimate" />
						<label for="shipping_estimate"><?php echo $text_shipping_estimate; ?></label>
						</li>
						<?php } ?>
					</ul>
				</div>

				<div class="cart-module">

					<div id="coupon" class="content">
						<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
							<?php echo $entry_coupon; ?><br />
							<input type="text" name="coupon" value="<?php echo $coupon; ?>" />
							<input type="hidden" name="next" value="coupon" class="span3" />
							&nbsp;
							<input type="submit" value="<?php echo $button_coupon; ?>" class="btn btn-inverse btn-small" />
						</form>
					</div>
					<div id="voucher" class="content">
						<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
							<?php echo $entry_voucher; ?><br />
							<input type="text" name="voucher" value="<?php echo $voucher; ?>" />
							<input type="hidden" name="next" value="voucher" class="span3" />
							&nbsp;
							<input type="submit" value="<?php echo $button_voucher; ?>" class="btn btn-inverse btn-small" />
						</form>
					</div>
					<div id="reward" class="content">
						<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
							<?php echo $entry_reward; ?><br />
							<input type="text" name="reward" value="<?php echo $reward; ?>" />
							<input type="hidden" name="next" value="reward" class="span3" />
							&nbsp;
							<input type="submit" value="<?php echo $button_reward; ?>" class="btn btn-inverse btn-small" />
						</form>
					</div>
					<div id="shipping" class="content form-vertical">
						
						<p><?php echo $text_shipping_detail; ?></p>

						<div class="group-control">
							<label for="country_id"><span class="req_mark">*</span> <?php echo $entry_country; ?></label>
							<select name="country_id" id="country_id" onchange="$('select[name=\'zone_id\']').load('index.php?route=checkout/cart/zone&country_id=' + this.value + '&zone_id=<?php echo $zone_id; ?>');" class="span4">
								<option value=""><?php echo $text_select; ?></option>
								<?php foreach ($countries as $country) { ?>
								<?php if ($country['country_id'] == $country_id) { ?>
								<option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
								<?php } else { ?>
								<option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
								<?php } ?>
								<?php } ?>
							</select>
						</div>

						<div class="group-control">
							<label for="zone_id"><span class="req_mark">*</span> <?php echo $entry_zone; ?></label>
							<select name="zone_id" id="zone_id" class="span4">
									</select>
						</div>

						<div class="group-control">
							<label for="postcode"><span class="req_mark">*</span> <?php echo $entry_postcode; ?></label>
							<input type="text" name="postcode" id="postcode" value="<?php echo $postcode; ?>"  class="span2"/>
						</div>

						<input type="button" value="<?php echo $button_quote; ?>" id="button-quote" class="btn btn-inverse btn-small" />

					</div>

				</div>	
				</div>
			</div>
				

				

			<?php } else { ?>

				&nbsp;
			
			<?php } ?>

		</section>

		<section id="total-cart" class="span6">

			<table id="total">
				<?php foreach ($totals as $total) { ?>
				<tr>
					<td class="right"><b><?php echo $total['title']; ?>:</b></td>
					<td class="right"><?php echo $total['text']; ?></td>
				</tr>
				<?php } ?>
			</table>
			<div class="buttons">
				<a href="<?php echo $checkout; ?>" id="checkout" class="btn btn-cart btn-large float-right"><?php echo $button_checkout; ?></a>
				<!-- <a href="<?php echo $continue; ?>" id="continue-shopping" class="btn"><i class="icon-arrow-left"></i> <?php echo $button_shopping; ?></a> -->
			</div>

		</section>

	</div>
	
	<?php echo $content_bottom; ?>

	<script type="text/javascript">

		$('input[name=\'next\']').bind('change', function() {

			$('.cart-module > div').hide();
			
			$('#' + this.value).show('fast');

		});

		<?php if ($next == 'coupon') { ?>
		$('#use_coupon').trigger('click');
		<?php } ?>

		<?php if ($next == 'voucher') { ?>
		$('#use_voucher').trigger('click');
		<?php } ?>

		<?php if ($next == 'reward') { ?>
		$('#use_reward').trigger('click');
		<?php } ?>

		<?php if ($next == 'shipping') { ?>
		$('#shipping_estimate').trigger('click');
		<?php } ?>

	</script>

	<?php if ($shipping_status) { ?>

		<script type="text/javascript">

			$('#button-quote').live('click', function() {
				$.ajax({
					url: 'index.php?route=checkout/cart/quote',
					type: 'post',
					data: 'country_id=' + $('select[name=\'country_id\']').val() + '&zone_id=' + $('select[name=\'zone_id\']').val() + '&postcode=' + encodeURIComponent($('input[name=\'postcode\']').val()),
					dataType: 'json',		
					beforeSend: function() {
						$('#button-quote').attr('disabled', true);
						$('#button-quote').after('<span class="wait">&nbsp;<img src="catalog/view/theme/usweethome/images/loading.gif" alt="" /></span>');
					},
					complete: function() {
						$('#button-quote').attr('disabled', false);
						$('.wait').remove();
					},		
					success: function(json) {
						$('.success, .warning, .attention, .error').remove();			
									
						if (json['error']) {
							if (json['error']['warning']) {
								$('#notification').html('<div class="alert warning" style="display: none;">' + json['error']['warning'] + '<a class="close" data-dismiss="alert" href="#">&times;</a></div>');
								
								$('.warning').fadeIn('slow');
								
								$('html, body').animate({ scrollTop: 0 }, 'slow'); 
							}	
										
							if (json['error']['country']) {
								$('select[name=\'country_id\']').after('<span class="error">' + json['error']['country'] + '</span>');
							}	
							
							if (json['error']['zone']) {
								$('select[name=\'zone_id\']').after('<span class="error">' + json['error']['zone'] + '</span>');
							}
							
							if (json['error']['postcode']) {
								$('input[name=\'postcode\']').after('<span class="error">' + json['error']['postcode'] + '</span>');
							}					
						}
						
						if (json['shipping_method']) {
							html = '<div class="quote-shipping">';
							html  += '<h4><?php echo $text_shipping_method; ?></h4>';
							html += '<hr>'
							html += '<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">';
							
							for (i in json['shipping_method']) {
								
								html += '  <p><b>' + json['shipping_method'][i]['title'] + '</b></br>';
							
								if (!json['shipping_method'][i]['error']) {
									
									for (j in json['shipping_method'][i]['quote']) {
										
										html += '<label class="radio">';
										
										if (json['shipping_method'][i]['quote'][j]['code'] == '<?php echo $shipping_method; ?>') {
											html += '<input type="radio" name="shipping_method" value="' + json['shipping_method'][i]['quote'][j]['code'] + '" id="' + json['shipping_method'][i]['quote'][j]['code'] + '" checked="checked" />';
										} else {
											html += '<input type="radio" name="shipping_method" value="' + json['shipping_method'][i]['quote'][j]['code'] + '" id="' + json['shipping_method'][i]['quote'][j]['code'] + '" />';
										}
											
										html += json['shipping_method'][i]['quote'][j]['title'];
										html += ' (<b>' + json['shipping_method'][i]['quote'][j]['text'] + '</b>)';

										html += '</label></p>';
									}		

								} else {
									html += '<div class="empty white">';
									html += '<div class="error">' + json['shipping_method'][i]['error'] + '</div>';
									html += '</div>';
								}
							}

							html += '  <br />';
							html += '  <input type="hidden" name="next" value="shipping" />';
							html += '  <input type="submit" value="<?php echo $button_shipping; ?>" class="btn btn-inverse btn-small" />';

							html += '</form>';

							html += '</div>';
							
							$.colorbox({
								overlayClose: true,
								opacity: 0.5,
								height: 420,
								maxWidth: 560,
								width:'100%',
								href: false,
								html: html
							});
						}
					}
				});
			});

		</script>

		<script type="text/javascript">

			$('select[name=\'zone_id\']').load('index.php?route=checkout/cart/zone&country_id=<?php echo $country_id; ?>&zone_id=<?php echo $zone_id; ?>');
			
		</script>

	<?php } ?>

<?php echo $footer; ?>