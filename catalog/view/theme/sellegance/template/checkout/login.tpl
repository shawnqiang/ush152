<div class="span5 offset1">

	<div class="contentset center">
		<h4 class="inner">
			<span><?php echo $text_new_customer; ?></span>
		</h4>
	</div>

	<div class="control-group">

		<label class="control-label"><?php echo $text_checkout; ?></label>

		<div class="controls">

			<label class="radio">
				<?php if ($account == 'register') { ?>
				<input type="radio" name="account" value="register" id="register" checked="checked" />
				<?php } else { ?>
				<input type="radio" name="account" value="register" id="register" />
				<?php } ?>
				<b><?php echo $text_register; ?></b>
			</label>

		<?php if ($guest_checkout) { ?>

			<label class="radio">
				<?php if ($account == 'guest') { ?>
				<input type="radio" name="account" value="guest" id="guest" checked="checked" />
				<?php } else { ?>
				<input type="radio" name="account" value="guest" id="guest" />
				<?php } ?>
				<b><?php echo $text_guest; ?></b>
			</label>

		<?php } ?>

		</div>
	</div>

	<p><?php echo $text_register_account; ?></p>

	<div class="buttons">
		<a id="button-account" class="btn btn-inverse"><span><?php echo $button_continue; ?></span></a>
	</div>

</div>

<div id="login" class="span5 form-horizontal">

	<div class="contentset center">
		<h4 class="inner">
			<span><?php echo $text_returning_customer; ?></span>
		</h4>
	</div>
		
	<p><?php echo $text_i_am_returning_customer; ?></p>

	<div class="control-group">
		<label class="control-label" for="email"><b><?php echo $entry_email; ?></b></label>
		<div class="controls">
			<input type="text" class="span3" name="email" id="email" class="span3 required" required />
		</div>
	</div>

	<div class="control-group">
		<label class="control-label" for="password"><b><?php echo $entry_password; ?></b></label>
		<div class="controls">
			<input type="password" class="span3" name="password" id="password" class="span3 required" required />
		</div>
	</div>

	<i class="icon-exclamation-sign"></i> <a href="<?php echo $forgotten; ?>"><?php echo $text_forgotten; ?></a>

	<div class="buttons">
		<a id="button-login" class="btn btn-inverse"><?php echo $button_login; ?></a>
	</div>

</div>

<script type="text/javascript">

	$('#login input').keydown(function(e) {
		if (e.keyCode == 13) {
			$('#button-login').trigger('click');
		}
	});

</script>