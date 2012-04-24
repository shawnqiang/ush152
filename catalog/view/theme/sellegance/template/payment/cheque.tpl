<h2><?php echo $text_instruction; ?></h2>
<p><b><?php echo $text_payable; ?></b></p>
<p><?php echo $payable; ?></p>
<b><?php echo $text_address; ?></b><br />
<p><?php echo $address; ?></p>
<p><?php echo $text_payment; ?></p>

<div class="buttons">
  <input type="button" value="<?php echo $button_confirm; ?>" id="button-confirm" class="btn bnt-cart btn-large" />
</div>

<script type="text/javascript">
	$('#button-confirm').bind('click', function() {
		$.ajax({ 
			type: 'GET',
			url: 'index.php?route=payment/cheque/confirm',
			success: function() {
				location = '<?php echo $continue; ?>';
			}		
		});
	});
</script> 