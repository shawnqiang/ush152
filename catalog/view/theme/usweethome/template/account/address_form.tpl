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

		<?php echo $column_left ?>

		<section id="maincontent" class="<?php echo $main; ?>" role="main">

			<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="address" class="form-horizontal">

				<fieldset class="subheading">
						
					<legend><?php echo $text_edit_address; ?></legend>

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
						<label for="company" class="control-label">
							<?php echo $entry_company; ?>
						</label>
						<div class="controls">
							<input type="text" name="company" id="company" value="<?php echo $company; ?>" class="span3" />
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
						<label for="address_2" class="control-label">
							<?php echo $entry_address_2; ?>
						</label>
						<div class="controls">
							<input type="text" name="address_2" id="address_2" value="<?php echo $address_2; ?>" class="span3"  />
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
							<select name="country_id" id="country_id" onchange="$('select[name=\'zone_id\']').load('index.php?route=account/address/zone&country_id=' + this.value + '&zone_id=<?php echo $zone_id; ?>');" title="<?php echo $this->language->get('error_country'); ?>" class="required span3" required >
								<option value=""><?php echo $text_select; ?></option>
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
							<select name="zone_id" id="zone_id" title="<?php echo $this->language->get('error_zone'); ?>" class="required span3" required >
							</select>
							<?php if ($error_zone) { ?>
							<span class="error"><?php echo $error_zone; ?></span>
							<?php } ?>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label"><?php echo $entry_default; ?></label>
						<div class="controls">
						<?php if ($default) { ?>
							<label class="radio inline"><input type="radio" name="default" value="1" checked="checked" /><?php echo $text_yes; ?></label>
							<label class="radio inline"><input type="radio" name="default" value="0" /><?php echo $text_no; ?></label>
						<?php } else { ?>
							<label class="radio inline"><input type="radio" name="default" value="1" /><?php echo $text_yes; ?></label>
							<label class="radio inline"><input type="radio" name="default" value="0" checked="checked" /><?php echo $text_no; ?></label>
						<?php } ?>
						</div>
					</div>
						
				</fieldset>
		
				<div class="form-actions">
					<a href="<?php echo $back; ?>" class="btn"><?php echo $button_back; ?></a>
					<input type="submit" value="<?php echo $button_continue; ?>" class="btn btn-inverse" />
				</div>

			</form>

		</section> <!-- #maincontent -->

		<?php echo $column_right; ?>

	</div>

	<?php echo $content_bottom; ?>

	<script type="text/javascript">

	$('select[name=\'zone_id\']').load('index.php?route=account/address/zone&country_id=<?php echo $country_id; ?>&zone_id=<?php echo $zone_id; ?>');
	
	</script>

<?php echo $footer; ?>