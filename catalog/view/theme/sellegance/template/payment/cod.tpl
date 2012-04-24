<div class="buttons">
	<input type="button" value="<?php echo $button_confirm; ?>" id="button-confirm" class="btn btn-cart btn-large" />
</div>

<script type="text/javascript">

	$('#button-confirm').bind('click', function() {
		$.ajax({ 
			type: 'GET',
			url: 'index.php?route=payment/cod/confirm',
			success: function() {
				location = '<?php echo $continue; ?>';
			}		
		});
	});

</script>