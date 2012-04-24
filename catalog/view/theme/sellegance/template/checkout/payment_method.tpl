<div class="span6 offset3">

	<?php if ($error_warning) { ?>
		<div class="alert warning"><?php echo $error_warning; ?></div>
	<?php } ?>

	<?php if ($payment_methods) { ?>

		<p><?php echo $text_payment_method; ?></p>

		<div class="control-group">

			<?php foreach ($payment_methods as $payment_method) { ?>
			
			<label class="radio">
				<?php if ($payment_method['code'] == $code || !$code) { ?>
					<?php $code = $payment_method['code']; ?>
						<input type="radio" name="payment_method" value="<?php echo $payment_method['code']; ?>" id="<?php echo $payment_method['code']; ?>" checked="checked" class="radio inline" />
					<?php } else { ?>
						<input type="radio" name="payment_method" value="<?php echo $payment_method['code']; ?>" id="<?php echo $payment_method['code']; ?>" class="radio inline" />
					<?php } ?>
					<?php echo $payment_method['title']; ?>
			</label>
			
			<?php } ?>
		
		</div><br />

	<?php } ?>

	<label for="comment" class="label-group"><b><?php echo $text_comments; ?></b></label>
	<div class="controls">
		<textarea name="comment" rows="8" class="span6"><?php echo $comment; ?></textarea>
	</div>

	<?php if ($text_agree) { ?>
	<div class="buttons">
		<?php echo $text_agree; ?>
			<?php if ($agree) { ?>
			<input type="checkbox" name="agree" value="1" checked="checked" />
			<?php } else { ?>
			<input type="checkbox" name="agree" value="1" />
			<?php } ?><br /><br />
			<input type="button" value="<?php echo $button_continue; ?>" id="button-payment-method" class="btn btn-inverse" />
	</div>
	<?php } else { ?>
	<div class="buttons">
			<input type="button" value="<?php echo $button_continue; ?>" id="button-payment-method" class="btn btn-inverse" />
	</div>
	<?php } ?>

</div>

<script type="text/javascript"><!--

	$('.colorbox').colorbox({
		overlayClose: true,
		opacity: 0.5,
		maxHeight: 560,
		maxWidth: 560,
		width:'100%'
	});
	
//--></script> 