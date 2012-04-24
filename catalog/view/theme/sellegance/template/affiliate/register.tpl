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
		<?php if ($error_warning) { ?>
			<div class="alert warning"><?php echo $error_warning; ?></div>
		<?php } ?>

	</header>

	<?php 
	
	if ($column_left || $column_right) { $main = "span9"; } 
	else { 	$main = "span12"; } 

	?>

	<div class="row">

		<?php echo $column_left ?>

		<section id="maincontent" class="<?php echo $main; ?>" role="main">
		
			<p><?php echo $text_account_already; ?></p>

			<p><?php echo $text_signup; ?></p>

			<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="register-form" class="form-horizontal">

				<fieldset class="subheading">

					<legend><?php echo $text_your_details; ?></legend>
						
					<div class="control-group">
						<label for="firstname" class="control-label">
							<span class="req_mark">*</span> <?php echo $entry_firstname; ?>
						</label>
						<div class="controls">
							<input type="text" name="firstname" id="firstname" value="<?php echo $firstname; ?>" title="<?php echo $this->language->get('error_firstname'); ?>" class="required span3" required />
							<?php if ($error_firstname) { ?>
							<span class="error"><?php echo $error_firstname; ?></span>
							<?php } ?>
						</div>
					</div>

					<div class="control-group">
						<label for="lastname" class="control-label">
							<span class="req_mark">*</span> <?php echo $entry_lastname; ?>
						</label>
						<div class="controls">
							<input type="text" name="lastname" id="lastname" value="<?php echo $lastname; ?>" title="<?php echo $this->language->get('error_lastname'); ?>" class="required span3" required />
							<?php if ($error_lastname) { ?>
							<span class="error"><?php echo $error_lastname; ?></span>
							<?php } ?>
						</div>
					</div>

					<div class="control-group">
							<label for="email" class="control-label">
								<span class="req_mark">*</span> <?php echo $entry_email; ?>
							</label>
							<div class="controls">
								<input type="email" name="email" id="email" value="<?php echo $email; ?>"  title="<?php echo $this->language->get('error_email'); ?>" class="required email span3" required />
										<?php if ($error_email) { ?>
										<span class="error"><?php echo $error_email; ?></span>
										<?php } ?>
							</div>
					</div>

					<div class="control-group">
							<label for="telephone" class="control-label">
								<span class="req_mark">*</span> <?php echo $entry_telephone; ?>
							</label>
							<div class="controls">
								<input type="text" name="telephone" id="telephone" value="<?php echo $telephone; ?>" title="<?php echo $this->language->get('error_telephone'); ?>" class="required span3" required />
									<?php if ($error_telephone) { ?>
									<span class="error"><?php echo $error_telephone; ?></span>
									<?php } ?>
							</div>
					</div>

					<div class="control-group">
							<label for="fax" class="control-label"><?php echo $entry_fax; ?></label>
							<div class="controls">
								<input type="text" name="fax" id="fax" value="<?php echo $fax; ?>" class="span3" />
							</div>
					</div>

				</fieldset>

				<fieldset class="subheading">

					<legend><?php echo $text_your_address; ?></legend>
					
					<div class="control-group">
						<label for="company" class="control-label"><?php echo $entry_company; ?></label>
						<div class="controls">
							<input type="text" name="company" id="company" value="<?php echo $company; ?>" class="span3" />
						</div>
					</div>

					<div class="control-group">
						<label for="website" class="control-label"><?php echo $entry_website; ?></label>
						<div class="controls">
							<input type="text" name="website" id="website" value="<?php echo $website; ?>" class="span3" />
						</div>
					</div>

					<div class="control-group">
						<label for="address_1" class="control-label">
							<span class="req_mark">*</span> <?php echo $entry_address_1; ?>
						</label>
						<div class="controls">
							<input type="text" name="address_1" id="address_1" value="<?php echo $address_1; ?>" title="<?php echo $this->language->get('error_address_1'); ?>" class="required span3" required />
							<?php if ($error_address_1) { ?>
							<span class="error"><?php echo $error_address_1; ?></span>
							<?php } ?>
						</div>
					</div>

					<div class="control-group">
						<label for="address_2" class="control-label"><?php echo $entry_address_2; ?></label>
						<div class="controls">
							<input type="text" name="address_2" id="address_2" value="<?php echo $address_2; ?>" class="span3" />
						</div>
					</div>

					<div class="control-group">
						<label for="city" class="control-label">
							<span class="req_mark">*</span> <?php echo $entry_city; ?>
						</label>
						<div class="controls">
							<input type="text" name="city" id="city" value="<?php echo $city; ?>" title="<?php echo $this->language->get('error_city'); ?>" class="required span3" required />
							<?php if ($error_city) { ?>
							<span class="error"><?php echo $error_city; ?></span>
							<?php } ?>
						</div>
					</div>

					<div class="control-group">
						<label for="postcode" class="control-label">
							<span class="req_mark">*</span> <?php echo $entry_postcode; ?>
						</label>
						<div class="controls">
							<input type="text" name="postcode" id="postcode" value="<?php echo $postcode; ?>" title="<?php echo $this->language->get('error_postcode'); ?>" class="required span3" required />
							<?php if ($error_postcode) { ?>
							<span class="error"><?php echo $error_postcode; ?></span>
							<?php } ?>
						</div>
					</div>

					<div class="control-group">
						<label for="country_id" class="control-label">
							<span class="req_mark">*</span> <?php echo $entry_country; ?>
						</label>
						<div class="controls">
							<select name="country_id" id="country_id" onchange="$('select[name=\'zone_id\']').load('index.php?route=account/register/zone&country_id=' + this.value + '&zone_id=<?php echo $zone_id; ?>');" title="<?php echo $this->language->get('error_country'); ?>" class="required span3" >
								<option value="false"><?php echo $text_select; ?></option>
								<?php foreach ($countries as $country) { ?>
								
									<?php if ($country['country_id'] == $country_id) { ?>
										<option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
									<?php } else { ?>
										<option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
									<?php } ?>

								<?php } ?>
							</select>
							<?php if ($error_country) { ?>
							<span class="error"><?php echo $error_country; ?></span>
							<?php } ?>
						</div>
					</div>

					<div class="control-group">
						<label for="zone_id" class="control-label">
							<span class="req_mark">*</span> <?php echo $entry_zone; ?>
						</label>
						<div class="controls">
							<select name="zone_id" id="zone_id" title="<?php echo $this->language->get('error_zone'); ?>" class="required span3">
							</select>
							<?php if ($error_zone) { ?>
							<span class="error"><?php echo $error_zone; ?></span>
							<?php } ?>
						</div>
					</div>

				</fieldset>

				<fieldset class="subheading">

					<legend><?php echo $text_payment; ?></legend>

					<div class="control-group">
						<label for="tax" class="control-label"><?php echo $entry_tax; ?></label>
						<div class="controls">
							<input type="text" name="tax" id="tax" value="<?php echo $tax; ?>" class="span3" />
						</div>
					</div>

					<div class="control-group">

						<label class="control-label"><?php echo $entry_payment; ?></label>

						<div class="controls">

							<label class="radio inline">
								<?php if ($payment == 'cheque') { ?>
									<input type="radio" name="payment" value="cheque" id="cheque" checked="checked" />
								<?php } else { ?>
									<input type="radio" name="payment" value="cheque" id="cheque" />
								<?php } ?>
								<?php echo $text_cheque; ?>
							</label>

							<label class="radio inline">
								<?php if ($payment == 'paypal') { ?>
									<input type="radio" name="payment" value="paypal" id="paypal" checked="checked" />
								<?php } else { ?>
									<input type="radio" name="payment" value="paypal" id="paypal" />
								<?php } ?>
								<?php echo $text_paypal; ?>
							</label>

							<label class="radio inline">
								<?php if ($payment == 'bank') { ?>
									<input type="radio" name="payment" value="bank" id="bank" checked="checked" />
								<?php } else { ?>
									<input type="radio" name="payment" value="bank" id="bank" />
								<?php } ?>
								<?php echo $text_bank; ?>
							</label>

						</div>
					</div>

					<div class="control-group payment" id="payment-cheque">
						<label for="cheque" class="control-label"><?php echo $entry_cheque; ?></label>
						<div class="controls">
							<input type="text" name="cheque" value="<?php echo $cheque; ?>" class="span3" />
						</div>
					</div>

					<div class="control-group payment" id="payment-paypal">
						<label for="paypal" class="control-label"><?php echo $entry_paypal; ?></label>
						<div class="controls">
							<input type="text" name="paypal" value="<?php echo $paypal; ?>" class="span3" />
						</div>
					</div>

					<div id="payment-bank" class="payment">

						<div class="control-group">
							<label for="bank_name" class="control-label"><?php echo $entry_bank_name; ?></label>
							<div class="controls">
								<input type="text" name="bank_name" id="bank_name" value="<?php echo $bank_name; ?>" class="span3" />
							</div>
						</div>
						<div class="control-group">
							<label for="bank_branch_number" class="control-label"><?php echo $entry_bank_branch_number; ?></label>
							<div class="controls">
								<input type="text" name="bank_branch_number" id="bank_branch_number" value="<?php echo $bank_branch_number; ?>" class="span3" />
							</div>
						</div>
						<div class="control-group">
							<label for="bank_swift_code" class="control-label"><?php echo $entry_bank_swift_code; ?></label>
							<div class="controls">
								<input type="text" name="bank_swift_code" id="bank_swift_code" value="<?php echo $bank_swift_code; ?>" class="span3" />
							</div>
						</div>
						<div class="control-group">
							<label for="bank_account_name" class="control-label"><?php echo $entry_bank_account_name; ?></label>
							<div class="controls">
								<input type="text" name="bank_account_name" id="bank_account_name" value="<?php echo $bank_account_name; ?>" class="span3" />
							</div>
						</div>
						<div class="control-group">
							<label for="bank_account_number" class="control-label"><?php echo $entry_bank_account_number; ?></label>
							<div class="controls">
								<input type="text" name="bank_account_number" id="bank_account_number" value="<?php echo $bank_account_number; ?>" class="span3" />
							</div>
						</div>

					</div>

				</fieldset>

				<fieldset class="subheading">

					<legend><?php echo $text_your_password; ?></legend>

					<div class="control-group">
						<label for="password" class="control-label">
							<span class="req_mark">*</span> <?php echo $entry_password; ?>
						</label>
						<div class="controls">
							<input type="password" name="password" id="password" value="<?php echo $password; ?>" title="<?php echo $this->language->get('error_password'); ?>" class="password span3"  />
							<?php if ($error_password) { ?>
								<span class="error"><?php echo $error_password; ?></span>
							<?php } ?>
						</div>
					</div>

					<div class="control-group">
						<label for="confirm" class="control-label">
							<span class="req_mark">*</span> <?php echo $entry_confirm; ?>
						</label>
						<div class="controls">
							<input type="password" name="confirm" id="confirm" value="<?php echo $confirm; ?>"  title="<?php echo $this->language->get('error_password'); ?>" class="password span3" />
							<?php if ($error_confirm) { ?>
								<span class="error"><?php echo $error_confirm; ?></span>
							<?php } ?>
						</div>
					</div>

				</fieldset>
				
				<div class="form-actions">
					
					<?php if ($text_agree) { ?>
						<p>
							<?php echo $text_agree; ?> <input type="checkbox" name="agree" value="1" <?php if ($agree) { ?>checked="checked"<?php } ?> />
						</p>
					<?php } ?>
					
					<input type="submit" value="<?php echo $button_continue; ?>" class="btn btn-inverse" />
					
				</div>
				
			</form>

		</section> <!-- #maincontent -->

		<?php echo $column_right; ?>

	</div> <!-- .row -->
	
	<?php echo $content_bottom; ?>

	<script type="text/javascript"><!--

		$('select[name=\'zone_id\']').load('index.php?route=account/register/zone&country_id=<?php echo $country_id; ?>&zone_id=<?php echo $zone_id; ?>');

		$('input[name=\'payment\']').bind('change', function() {
			$('.payment').hide();
			
			$('#payment-' + this.value).show();
		});

		$('input[name=\'payment\']:checked').trigger('change');

	//--></script> 

<?php echo $footer; ?>