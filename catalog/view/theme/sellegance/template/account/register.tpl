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
		
		<!-- <h1><?php echo $heading_title; ?></h1> -->

		<?php if ($error_warning) { ?>
			<div class="alert warning"><?php echo $error_warning; ?></div>
		<?php } ?>

	</header>

	<?php 
	
	if ($column_left || $column_right) { $main = "span9"; } 
	else { 	$main = "span12"; } 

	?>

	<div class="row">

	
		<section id="maincontent" class="span9 signupwrapper" role="main">
			<div class="widgetbox">
			<div class="widgetbox-hd">
				<h4><?php echo $heading_title; ?></h4>
			</div>
			<div class="widgetbox-bd">
			<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="register-form" class="form-horizontal">

				<fieldset class="subheading">

					<legend class="hide"><?php echo $text_your_details; ?></legend>

					<div class="control-group">
						<label class="control-label" for="firstname">
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
						<label class="control-label" for="lastname">
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
						<label class="control-label" for="email">
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
						<label class="control-label" for="telephone">
							<span class="req_mark">*</span> <?php echo $entry_telephone; ?>
						</label>
						<div class="controls">
							<input type="tel" name="telephone" id="telephone" value="<?php echo $telephone; ?>" title="<?php echo $this->language->get('error_telephone'); ?>" class="required span3" required />
							<?php if ($error_telephone) { ?>
							<span class="error"><?php echo $error_telephone; ?></span>
							<?php } ?>
						</div>
					</div>

					<!-- <div class="control-group">
						<label class="control-label" for="fax"><?php echo $entry_fax; ?></label>
						<div class="controls">
							<input type="text" name="fax" id="fax" value="<?php echo $fax; ?>" class="span3" />
						</div>
					</div> -->

					<div class="control-group">
						<label class="control-label" for="password">
							<span class="req_mark">*</span> <?php echo $entry_password; ?>
						</label>
						<div class="controls">
							<input type="password" name="password" id="password" value="<?php echo $password; ?>" title="<?php echo $this->language->get('error_password'); ?>" class="password span3" required />
							<?php if ($error_password) { ?>
								<span class="error"><?php echo $error_password; ?></span>
							<?php } ?>
						</div>
					</div>

					<div class="control-group">
						<label class="control-label" for="confirm">
							<span class="req_mark">*</span> <?php echo $entry_confirm; ?>
						</label>
						<div class="controls">
							<input type="password" name="confirm" id="confirm" value="<?php echo $confirm; ?>"  title="<?php echo $this->language->get('error_password'); ?>" class="password span3" required />
							<?php if ($error_confirm) { ?>
								<span class="error"><?php echo $error_confirm; ?></span>
							<?php } ?>
						</div>
					</div>

				</fieldset>

				<!-- <fieldset class="subheading">

					<legend class="hide"><?php echo $text_your_address; ?></legend>

					<div class="control-group">
						<label class="control-label" for="company"><?php echo $entry_company; ?></label>
						<div class="controls">
							<input type="text" name="company" id="company" value="<?php echo $company; ?>" class="span3" />
						</div>
					</div>

					<div class="control-group">
						<label class="control-label" for="address_1">
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
						<label class="control-label" for="address_2"><?php echo $entry_address_2; ?></label>
						<div class="controls">
							<input type="text" name="address_2" id="address_2" value="<?php echo $address_2; ?>" class="span3" />
						</div>
					</div>

					<div class="control-group">
						<label class="control-label" for="city">
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
						<label class="control-label" for="postcode">
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
						<label class="control-label" for="country_id">
							<span class="req_mark">*</span> <?php echo $entry_country; ?>
						</label>
						<div class="controls">
							<select name="country_id" id="country_id" onchange="$('select[name=\'zone_id\']').load('index.php?route=account/register/zone&country_id=' + this.value + '&zone_id=<?php echo $zone_id; ?>');" title="<?php echo $this->language->get('error_country'); ?>" class="required span3" required >

								<option value="false"><?php echo $text_select; ?></option>

								<?php foreach ($countries as $country) { ?>
									
									<?php if ($country['country_id'] == $country_id) { ?>
								
										<option value="<?php echo $country['country_id']; ?>" selected="selected">
											<?php echo $country['name']; ?>
										</option>
									
									<?php } else { ?>
									
										<option value="<?php echo $country['country_id']; ?>">
											<?php echo $country['name']; ?>
										</option>
									
									<?php } ?>
								
								<?php } ?>

							</select>
							<?php if ($error_country) { ?>
							<span class="error"><?php echo $error_country; ?></span>
							<?php } ?>
						</div>
					</div>

					<div class="control-group">
						<label class="control-label" for="zone_id">
							<span class="req_mark">*</span> <?php echo $entry_zone; ?>
						</label>
						<div class="controls">
							<select name="zone_id" id="zone_id" title="<?php echo $this->language->get('error_zone'); ?>" class="required span3" required>
							</select>
							<?php if ($error_zone) { ?>
							<span class="error"><?php echo $error_zone; ?></span>
							<?php } ?>
						</div>
					</div>

				</fieldset> -->

				<!-- <fieldset class="subheading">

					<legend class="hide"><?php echo $text_your_password; ?></legend>

					<div class="control-group">
						<label class="control-label" for="password">
							<span class="req_mark">*</span> <?php echo $entry_password; ?>
						</label>
						<div class="controls">
							<input type="password" name="password" id="password" value="<?php echo $password; ?>" title="<?php echo $this->language->get('error_password'); ?>" class="password span3" required />
							<?php if ($error_password) { ?>
								<span class="error"><?php echo $error_password; ?></span>
							<?php } ?>
						</div>
					</div>

					<div class="control-group">
						<label class="control-label" for="confirm">
							<span class="req_mark">*</span> <?php echo $entry_confirm; ?>
						</label>
						<div class="controls">
							<input type="password" name="confirm" id="confirm" value="<?php echo $confirm; ?>"  title="<?php echo $this->language->get('error_password'); ?>" class="password span3" required />
							<?php if ($error_confirm) { ?>
								<span class="error"><?php echo $error_confirm; ?></span>
							<?php } ?>
						</div>
					</div>

				</fieldset> -->

				<!-- <fieldset class="subheading">

					<legend><?php echo $text_newsletter; ?></legend>

					<div class="control-group">
						<label class="control-label"><?php echo $entry_newsletter; ?></label>
						<div class="controls">
							<?php if ($newsletter == 1) { ?>
								<label class="radio inline"><input type="radio" name="newsletter" value="1" checked="checked" /><?php echo $text_yes; ?></label>
								<label class="radio inline"><input type="radio" name="newsletter" value="0" /><?php echo $text_no; ?></label>
							<?php } else { ?>
								<label class="radio inline"><input type="radio" name="newsletter" value="1" /><?php echo $text_yes; ?></label>
								<label class="radio inline"><input type="radio" name="newsletter" value="0" checked="checked" /><?php echo $text_no; ?></label>
							<?php } ?>
						</div>
					</div>

				</fieldset> -->

				<div class="form-actions">
						
					<?php if ($text_agree) { ?>
						<p>
							<?php echo $text_agree; ?> <input type="checkbox" name="agree" value="1" <?php if ($agree) { ?> checked="checked" <?php } ?> />
						</p>
					<?php } ?>
					
					<input type="submit" value="<?php echo $button_continue; ?>" class="btn btn-inverse" />
					
				</div>
				
			</form>
				</div>
			</div>	
		</section> <!-- #maincontent -->

		<section class="span3">
			<p><?php echo $text_account_already; ?></p>
		</section>
		<?php echo $column_right; ?>

	</div> <!-- .row -->

	<?php echo $content_bottom; ?>

	<script type="text/javascript"><!--

		$('select[name=\'zone_id\']').load('index.php?route=account/register/zone&country_id=<?php echo $country_id; ?>&zone_id=<?php echo $zone_id; ?>');
	
	//--></script> 

<?php echo $footer; ?>