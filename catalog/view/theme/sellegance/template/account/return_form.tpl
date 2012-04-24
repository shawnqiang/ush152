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

		<?php if ($error_warning) { ?>
			<div class="alert warning"><?php echo $error_warning; ?></div>
		<?php } ?>

	</header>

	<?php 
	
	if ($column_left || $column_right) { $main = "span9"; } 
	else { 	$main = "span12"; } 

	?>

	<div class="row">

		<?php echo $column_left; ?>

		<section id="maincontent" class="<?php echo $main; ?>" role="main">

			<?php echo $text_description; ?>

			<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="return" class="form-horizontal">

				<fieldset class="subheading">
					
					<legend><?php echo $text_order; ?></legend>

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
						<label for="email" class="control-label">
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
						<label for="telephone" class="control-label">
							<span class="req_mark">*</span> <?php echo $entry_telephone; ?>
						</label>
						<div class="controls">
						<input type="text" name="telephone" id="telephone" value="<?php echo $telephone; ?>" title="<?php echo $this->language->get('error_telephone'); ?>" class="required span3" required />
						<?php if ($error_telephone) { ?>
						<span class="error"><?php echo $error_telephone; ?></span>
						<?php } ?>
						</div>
					</div>

					<div class="control-group">
						<label for="order_id" class="control-label">
							<span class="req_mark">*</span> <?php echo $entry_order_id; ?>
						</label>
						<div class="controls">
						<input type="text" name="order_id" id="order_id" value="<?php echo $order_id; ?>" title="<?php echo $this->language->get('error_order_id'); ?>" class="required span3" required />
						<?php if ($error_order_id) { ?>
						<span class="error"><?php echo $error_order_id; ?></span>
						<?php } ?>
						</div>
					</div>

					<div class="control-group">
						<label for="date_ordered" class="control-label"><?php echo $entry_date_ordered; ?></label>
						<div class="controls">
						<input type="text" name="date_ordered" id="date_ordered" value="<?php echo $date_ordered; ?>" class="date span2" />
						</div>
					</div>

				</fieldset>

				<fieldset class="subheading">
					
					<legend><?php echo $text_product; ?></legend>
							
						<div class="control-group">

							<label for="product" class="control-label">
								<span class="req_mark">*</span> <?php echo $entry_product; ?>
							</label>
							<div class="controls">
								<input type="text" name="product" id="product" value="<?php echo $product; ?>" class="required span4" required />
								<?php if ($error_product) { ?>
									<span class="error"><?php echo $error_product; ?></span>
								<?php } ?>
							</div>

						</div>

						<div class="control-group">

							<label for="model" class="control-label">
								<span class="req_mark">*</span> <?php echo $entry_model; ?>
							</label>
							<div class="controls">
								<input type="text" name="model" id="model" value="<?php echo $model; ?>" class="required span3" required />
								<?php if ($error_model) { ?>
								<span class="error"><?php echo $error_model; ?></span>
								<?php } ?>
							</div>

						</div>

						<div class="control-group">

							<label for="quantity" class="control-label">
								<?php echo $entry_quantity; ?>
							</label>
							<div class="controls">
								<input type="text" name="quantity" id="quantity" value="<?php echo $quantity; ?>" class="span1" />
							</div>

						</div>
					  	
					  	<div class="control-group">

					  		<label class="control-label">
					  			<span class="req_mark">*</span> <?php echo $entry_reason; ?>
					  		</label>

					  		<div class="controls">

					  			<?php foreach ($return_reasons as $return_reason) { ?>

					  				<label class="radio">
					  			
										<?php if ($return_reason['return_reason_id'] == $return_reason_id) { ?>

											<input type="radio" name="return_reason_id" value="<?php echo $return_reason['return_reason_id']; ?>" id="return-reason-id<?php echo $return_reason['return_reason_id']; ?>" checked="checked" />
											<?php echo $return_reason['name']; ?>
		
										<?php } else { ?>
		
											<input type="radio" name="return_reason_id" value="<?php echo $return_reason['return_reason_id']; ?>" id="return-reason-id<?php echo $return_reason['return_reason_id']; ?>" />
											<?php echo $return_reason['name']; ?>

										<?php  } ?>

									</label>
	
								<?php  } ?>
	
								<?php if ($error_reason) { ?>
									<span class="error">
										<?php echo $error_reason; ?>
									</span>
								<?php } ?>
					  		
					  		</div>

					  	</div>

					  	<div class="control-group">

					  		<label class="control-label">
					  			<?php echo $entry_opened; ?>
					  		</label>

					  		<div class="controls">
					  			<label class="radio inline">
									<?php if ($opened) { ?>
										<input type="radio" name="opened" value="1" checked="checked" />
									<?php } else { ?>
										<input type="radio" name="opened" value="1" />
									<?php } ?>
									<?php echo $text_yes; ?>
								</label>
								<label class="radio inline">
									<?php if (!$opened) { ?>
										<input type="radio" name="opened" value="0" checked="checked" />
									<?php } else { ?>
										<input type="radio" name="opened" value="0" />
									<?php } ?>
									<?php echo $text_no; ?>
								</label>
					  		</div>

					  	</div>

					  	<div class="control-group">

					  		<label for="comment" class="control-label">
					  			<?php echo $entry_fault_detail; ?>
					  		</label>
					  		<div class="controls">
					  			<textarea name="comment" id="comment" cols="150" rows="6" class="span4"><?php echo $comment; ?></textarea>	
					  		</div>

					  	</div>

						<div class="control-group">

							<label for="captcha" class="control-label">
								<span class="req_mark">*</span> <?php echo $entry_captcha; ?>
							</label>
							<div class="controls">
								<input type="text" name="captcha" id="captcha" value="<?php echo $captcha; ?>" class="required span2" required />
								<br /><br />
								<img src="index.php?route=account/return/captcha" alt="" />
								<?php if ($error_captcha) { ?>
								<span class="error"><?php echo $error_captcha; ?></span>
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

	</div> <!-- .row -->

	<?php echo $content_bottom; ?>
	

	<script type="text/javascript"><!--

		$(document).ready(function() {
			$('.date').datepicker({dateFormat: 'yy-mm-dd'});
		});
	
	//--></script>

	<?php echo $footer; ?>