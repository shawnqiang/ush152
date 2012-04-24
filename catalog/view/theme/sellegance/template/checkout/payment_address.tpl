<div class="span6 offset3">

	<?php if ($addresses) { ?>

		<label class="radio">
			<input type="radio" name="payment_address" value="existing" id="payment-address-existing" checked="checked" class="radio inline" />
			<b><?php echo $text_address_existing; ?></b>
		</label>

		<div id="payment-existing" class="controls">

			<select name="address_id" class="span6" size="5">

				<?php foreach ($addresses as $address) { ?>

					<?php if ($address['address_id'] == $address_id) { ?>
					
						<option value="<?php echo $address['address_id']; ?>" selected="selected">
							<?php echo $address['firstname']; ?> <?php echo $address['lastname']; ?>, <?php echo $address['address_1']; ?>, <?php echo $address['city']; ?>, <?php echo $address['zone']; ?>, <?php echo $address['country']; ?>
						</option>

					<?php } else { ?>

						<option value="<?php echo $address['address_id']; ?>">
							<?php echo $address['firstname']; ?> <?php echo $address['lastname']; ?>, <?php echo $address['address_1']; ?>, <?php echo $address['city']; ?>, <?php echo $address['zone']; ?>, <?php echo $address['country']; ?>
						</option>

					<?php } ?>

				<?php } ?>

			</select>

		</div>

	<?php } ?>
	
	<label class="radio">
		<input type="radio" name="payment_address" value="new" id="payment-address-new" class="radio inline" />
		<b><?php echo $text_address_new; ?></b>
	</label><br>

	<div id="payment-new" style="display: none;" >
		<div class="control-group">
			<label for="firstname" class="control-label">
				<span class="req_mark">*</span> <?php echo $entry_firstname; ?>
			</label>
			<div class="controls">
				<input type="text" name="firstname" value="" class="span6" />
			</div>
		</div>
		<div class="control-group">
			<label for="lastname" class="control-label">
				<span class="req_mark">*</span> <?php echo $entry_lastname; ?>
			</label>
			<div class="controls">
				<input type="text" name="lastname" value="" class="span6" />
			</div>
		</div>
		<div class="control-group">
			<label for="company" class="control-label">
				<?php echo $entry_company; ?>
			</label>
			<div class="controls">
			<input type="text" name="company" value="" class="span6" />
			</div>
		</div>
		<div class="control-group">
			<label for="address_1" class="control-label">
				<span class="req_mark">*</span> <?php echo $entry_address_1; ?>
			</label>
			<div class="controls">
			<input type="text" name="address_1" value="" class="span6" />
			</div>
		</div>
		<div class="control-group">
			<label for="address_2" class="control-label">
				<?php echo $entry_address_2; ?>
			</label>
			<div class="controls">
			<input type="text" name="address_2" value="" class="span6" />
			</div>
		</div>
		<div class="control-group">
			<label for="city" class="control-label">
				<span class="req_mark">*</span> <?php echo $entry_city; ?>
			</label>
			<div class="controls">
			<input type="text" name="city" value="" class="span6" />
			</div>
		</div>
		<div class="control-group">
			<label for="postcode" class="control-label">
				<span class="req_mark">*</span> <?php echo $entry_postcode; ?>
			</label>
			<div class="controls">
			<input type="text" name="postcode" value="" class="span6" />
			</div>
		</div>
		<div class="control-group">
			<label for="country_id" class="control-label">
				<span class="req_mark">*</span> <?php echo $entry_country; ?>
			</label>
			<div class="controls">
			<select name="country_id" onchange="$('#payment-address select[name=\'zone_id\']').load('index.php?route=checkout/payment_address/zone&country_id=' + this.value);" class="span6" >
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
			<label for="postcode" class="control-label">
				<span class="req_mark">*</span> <?php echo $entry_zone; ?>
			</label>
			<div class="controls">
				<select name="zone_id" class="span6"></select>
			</div>
		</div>	
	</div>

	<div class="buttons">
		<input type="button" value="<?php echo $button_continue; ?>" id="button-payment-address" class="btn btn-inverse" />
	</div>

</div>


<script type="text/javascript"><!--

	$('#payment-address select[name=\'zone_id\']').load('index.php?route=checkout/payment_address/zone&country_id=<?php echo $country_id; ?>');

	$('#payment-address input[name=\'payment_address\']').live('change', function() {
		if (this.value == 'new') {
			$('#payment-existing').hide();
			$('#payment-new').show();
		} else {
			$('#payment-existing').show();
			$('#payment-new').hide();
		}
	});
	
//--></script> 