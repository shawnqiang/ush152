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

			<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="payment" class="form-horizontal">

				<fieldset class="subheading">

					<legend><?php echo $text_your_payment; ?></legend>

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
						<label for="cheque_account" class="control-label"><?php echo $entry_cheque; ?></label>
						<div class="controls">
							<input type="text" name="cheque" id="cheque_account" value="<?php echo $cheque; ?>" class="span3" />
						</div>
					</div>

					<div class="control-group payment" id="payment-paypal">
						<label for="paypal_account" class="control-label"><?php echo $entry_paypal; ?></label>
						<div class="controls">
							<input type="text" name="paypal" id="paypal_account" value="<?php echo $paypal; ?>" class="span3" />
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

				<div class="form-actions">
					<a href="<?php echo $back; ?>" class="btn"><?php echo $button_back; ?></a>
					<input type="submit" value="<?php echo $button_continue; ?>" class="btn btn-inverse" />
				</div>

			</form>

		</section> <!-- #maincontent -->

		<?php echo $column_right; ?>

	</div> <!-- .row -->

	<?php echo $content_bottom; ?>
	
	<script type="text/javascript"><!--

		$('input[name=\'payment\']').bind('change', function() {
			$('.payment').hide();
			
			$('#payment-' + this.value).show();
		});

		$('input[name=\'payment\']:checked').trigger('change');

	//--></script>

<?php echo $footer; ?> 