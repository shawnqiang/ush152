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
			<div class="alert warning">
				<?php echo $error_warning; ?><a class="close" data-dismiss="alert" href="#">&times;</a>
			</div>
		<?php } ?>

	</header>

	<?php 
	
	if ($column_left || $column_right) { $main = "span9"; } 
	else { 	$main = "span12"; } 

	?>

	<div class="row">

		<?php echo $column_left; ?>

		<section id="maincontent" class="<?php echo $main; ?>" role="main">

			<br><p><?php echo $text_description; ?></p><br>

			<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="voucher" class="form-horizontal">

				<div class="content">

					<div class="control-group">
						<label for="to_name" class="control-label">
							<span class="req_mark">*</span> <?php echo $entry_to_name; ?>
						</label>
						<div class="controls">
							<input type="text" name="to_name" id="to_name" value="<?php echo $to_name; ?>" title="<?php echo $this->language->get('error_to_name'); ?>" class="required span3" required />
							<?php if ($error_to_name) { ?>
							<span class="error"><?php echo $error_to_name; ?></span>
							<?php } ?>
						</div>
					</div>
					<div class="control-group">
						<label for="to_email" class="control-label">
							<span class="req_mark">*</span> <?php echo $entry_to_email; ?>
						</label>
						<div class="controls">
							<input type="email" name="to_email" id="to_email" value="<?php echo $to_email; ?>"  title="<?php echo $this->language->get('error_to_email'); ?>" class="required email span3" required />
							<?php if ($error_to_email) { ?>
							<span class="error"><?php echo $error_to_email; ?></span>
							<?php } ?>
						</div>
					</div>

					<div class="control-group">
						<label for="from_name" class="control-label">
							<span class="req_mark">*</span> <?php echo $entry_from_name; ?>
						</label>
						<div class="controls">
							<input type="text" name="from_name" id="from_name" value="<?php echo $from_name; ?>" title="<?php echo $this->language->get('error_from_name'); ?>" class="required span3" required />
							<?php if ($error_from_name) { ?>
							<span class="error"><?php echo $error_from_name; ?></span>
							<?php } ?>
						</div>
					</div>
					<div class="control-group">
						<label for="from_email" class="control-label">
							<span class="req_mark">*</span> <?php echo $entry_from_email; ?>
						</label>
						<div class="controls">
							<input type="email" name="from_email" id="from_email" value="<?php echo $from_email; ?>"  title="<?php echo $this->language->get('error_from_email'); ?>" class="required email span3" required />
							<?php if ($error_from_email) { ?>
							<span class="error"><?php echo $error_from_email; ?></span>
							<?php } ?>
						</div>
					</div>

					<div class="control-group">

						<label class="control-label">
							<span class="req_mark">*</span> <?php echo $entry_theme; ?>
						</label>

						<div class="controls">

							<?php foreach ($voucher_themes as $voucher_theme) { ?>

								<label class="radio">

									<?php if ($voucher_theme['voucher_theme_id'] == $voucher_theme_id) { ?>
									
										<input type="radio" name="voucher_theme_id" value="<?php echo $voucher_theme['voucher_theme_id']; ?>" id="voucher-<?php echo $voucher_theme['voucher_theme_id']; ?>" checked="checked" class="radio inline"/>
										<?php echo $voucher_theme['name']; ?>
									
									<?php } else { ?>
									
										<input type="radio" name="voucher_theme_id" value="<?php echo $voucher_theme['voucher_theme_id']; ?>" id="voucher-<?php echo $voucher_theme['voucher_theme_id']; ?>" class="radio inline" />
										<?php echo $voucher_theme['name']; ?>
									
									<?php } ?>

								</label>

							<?php } ?>

							<?php if ($error_theme) { ?>
								<span class="error"><?php echo $error_theme; ?></span>
							<?php } ?>

						</div>
					</div>

					<div class="control-group">
						<label for="message" class="control-label"><?php echo $entry_message; ?></label>
						<div class="controls">
							<textarea name="message" id="message" cols="34" rows="5" class="span4"><?php echo $message; ?></textarea>
						</div>
					</div>

					<div class="control-group">
						<label for="amount" class="control-label">
							<span class="req_mark">*</span> <?php echo $entry_amount; ?>
						</label>
						<div class="controls">
							<input type="text" name="amount" id="amount" value="<?php echo $amount; ?>"  title="<?php echo $this->language->get('error_amount'); ?>" class="required span2" required />
							<?php if ($error_amount) { ?>
							<span class="error"><?php echo $error_amount; ?></span>
							<?php } ?>
						</div>
					</div>


				</div>

				<div class="form-actions">
					<?php echo $text_agree; ?>
						<?php if ($agree) { ?>
						<input type="checkbox" name="agree" value="1" checked="checked" />
						<?php } else { ?>
						<input type="checkbox" name="agree" value="1" />
						<?php } ?>
						<br /><br />
						<input type="submit" value="<?php echo $button_continue; ?>" class="btn btn-inverse" />
				</div>
				
			</form>

		</section> <!-- #maincontent -->

		<?php echo $column_right; ?>

	</div> <!-- .row -->

	<?php echo $content_bottom; ?>

<?php echo $footer; ?>