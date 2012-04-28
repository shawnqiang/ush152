<div class="span6 offset3">

	<div class="control-group">
		<label for="firstname" class="control-label">
			<span class="req_mark">*</span> <?php echo $entry_firstname; ?>
		</label>
		<div class="controls">
			<input type="text" name="firstname" value="<?php echo $firstname; ?>" size="50" />
		</div>
	</div>

	<div class="control-group">
		<label for="lastname" class="control-label">
			<span class="req_mark">*</span> <?php echo $entry_lastname; ?>
		</label>
		<div class="controls">
			<input type="text" name="lastname" value="<?php echo $lastname; ?>" size="50" />
		</div>
	</div>

	<div class="control-group">
		<label for="company" class="control-label">
			<?php echo $entry_company; ?>
		</label>
		<div class="controls">
			<input type="text" name="company" value="<?php echo $company; ?>" size="50" />
		</div>
	</div>

	<div class="control-group">
		<label for="address_1" class="control-label">
			<span class="req_mark">*</span> <?php echo $entry_address_1; ?>
		</label>
		<div class="controls">
			<input type="text" name="address_1" value="<?php echo $address_1; ?>" size="50" />
		</div>
	</div>

	<div class="control-group">
		<label for="address_2" class="control-label">
			<?php echo $entry_address_2; ?>
		</label>
		<div class="controls">
			<input type="text" name="address_2" value="<?php echo $address_2; ?>" size="50" />
		</div>
	</div>

	<div class="control-group">
		<label for="city" class="control-label">
			<span class="req_mark">*</span> <?php echo $entry_city; ?>
		</label>
		<div class="controls">
			<input type="text" name="city" value="<?php echo $city; ?>" size="50" />
		</div>
	</div>

	<div class="control-group">
		<label for="postcode" class="control-label">
			<span class="req_mark">*</span> <?php echo $entry_postcode; ?>
		</label>
		<div class="controls">
			<input type="text" name="postcode" value="<?php echo $postcode; ?>" size="50" />
		</div>
	</div>

	<div class="control-group">
		<label for="postcode" class="control-label">
			<span class="req_mark">*</span> <?php echo $entry_country; ?>
		</label>
		<div class="controls">
			<select name="country_id" class="large-field" onchange="$('#shipping-address select[name=\'zone_id\']').load('index.php?route=checkout/address/zone&country_id=' + this.value);">
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
	</div>

	<div class="control-group">
		<label for="zone_id" class="control-label">
			<span class="req_mark">*</span> <?php echo $entry_zone; ?>
		</label>
		<div class="controls"><select name="zone_id" class="large-field"></select></div>
	</div>

</div>

<div class="buttons">
	<input type="button" value="<?php echo $button_continue; ?>" id="button-guest-shipping" class="btn btn-inverse" />
</div>

<script type="text/javascript"><!--

	$('#shipping-address select[name=\'zone_id\']').load('index.php?route=checkout/address/zone&country_id=<?php echo $country_id; ?>&zone_id=<?php echo $zone_id; ?>');
	
//--></script> 