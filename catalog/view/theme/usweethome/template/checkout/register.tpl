<div class="span5 offset1">
  
	<fieldset class="subheading">
		<legend><?php echo $text_your_details; ?></legend>

		<div class="control-group">
			<label for="firstname" class="control-label">
				<span class="req_mark">*</span> <?php echo $entry_firstname; ?>
			</label>
			<div class="controls">
				<input type="text" name="firstname" value="" class="span4" />
			</div>
		</div>
		<div class="control-group">
			<label for="lastname" class="control-label">
				<span class="req_mark">*</span> <?php echo $entry_lastname; ?>
			</label>
			<div class="controls">
				<input type="text" name="lastname" value="" class="span4" />
			</div>
		</div>
		<div class="control-group">
			<label for="email" class="control-label">
				<span class="req_mark">*</span> <?php echo $entry_email; ?>
			</label>
			<div class="controls">
				<input type="text" name="email" value="" class="span4" />
			</div>
		</div>
		<div class="control-group">
			<label for="telephone" class="control-label">
				<span class="req_mark">*</span> <?php echo $entry_telephone; ?>
			</label>
			<div class="controls">
				<input type="text" name="telephone" value="" class="span4" />
			</div>
		</div>
		<div class="control-group">
			<label for="fax" class="control-label">
				<?php echo $entry_fax; ?>
			</label>
			<div class="controls">
				<input type="text" name="fax" value="" class="span4" />
			</div>
		</div>
	</fieldset>

	<fieldset class="subheading">
		<legend><?php echo $text_your_password; ?></legend>

		<div class="control-group">
			<label for="password" class="control-label">
				<span class="req_mark">*</span> <?php echo $entry_password; ?>
			</label>
			<input type="password" name="password" value="" class="span4"/>
		</div>
		<div class="control-group">
			<label for="confirm" class="control-label">
				<span class="req_mark">*</span> <?php echo $entry_confirm; ?>
			</label>
			<input type="password" name="confirm" value="" class="span4"/>
		</div>
	
	</fieldset>

</div>

<div class="span5">

	<fieldset class="subheading">
		<legend><?php echo $text_your_address; ?></legend>

		<div class="control-group">
			<label for="company" class="control-label">
				<?php echo $entry_company; ?>
			</label>
			<div class="controls">
				<input type="text" name="company" value="" class="span4" />
			</div>
		</div>
		<div class="control-group">
			<label for="address_1" class="control-label">
				<span class="req_mark">*</span> <?php echo $entry_address_1; ?>
			</label>
			<div class="controls">
				<input type="text" name="address_1" value="" class="span4" />
			</div>
		</div>
		<div class="control-group">
			<label for="address_2" class="control-label">
				<?php echo $entry_address_2; ?>
			</label>
			<div class="controls">
				<input type="text" name="address_2" value="" class="span4" />
			</div>
		</div>
		<div class="control-group">
			<label for="city" class="control-label">
				<span class="req_mark">*</span> <?php echo $entry_city; ?>
			</label>
			<div class="controls">
				<input type="text" name="city" value="" class="span4" />
			</div>
		</div>
		<div class="control-group">
			<label for="postcode" class="control-label">
				<span class="req_mark">*</span> <?php echo $entry_postcode; ?>
			</label>
			<div class="controls">
				<input type="text" name="postcode" value="" class="span4" />
			</div>
		</div>
		<div class="control-group">
			<label for="country_id" class="control-label">
				<span class="req_mark">*</span> <?php echo $entry_country; ?>
			</label>
			<div class="controls">
				<select name="country_id" onchange="$('#payment-address select[name=\'zone_id\']').load('index.php?route=checkout/register/zone&country_id=' + this.value);" class="span4">
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
			<div class="controls">
				<select name="zone_id" class="span4"></select>
			</div>
		</div>
	</fieldset>
	
</div>

<div class="row">
	<div class="span10 offset1">
		<label for="newsletter" class="label-group">
			<input type="checkbox" name="newsletter" value="1" id="newsletter" class="checkbox inline" />
			<?php echo $entry_newsletter; ?>
		</label>
	  <?php if ($shipping_required) { ?>
		<label for="shipping" class="label-group">
			<input type="checkbox" name="shipping_address" value="1" id="shipping" checked="checked" class="checkbox inline" />
			<?php echo $entry_shipping; ?>
		</label>
	  <?php } ?>
	</div>
</div>

<div class="buttons">
	<?php if ($text_agree) { ?>
		<p><?php echo $text_agree; ?> <input type="checkbox" name="agree" value="1" /></p>
	<?php } ?>
	<input type="button" value="<?php echo $button_continue; ?>" id="button-register" class="btn btn-inverse" />
</div>

<script type="text/javascript"><!--
	
	$('#payment-address select[name=\'zone_id\']').load('index.php?route=checkout/register/zone&country_id=<?php echo $country_id; ?>');

	$('.colorbox').colorbox({
		overlayClose: true,
		opacity: 0.5,
		maxHeight: 560,
		maxWidth: 560,
		width:'100%'
	});

//-></script>  