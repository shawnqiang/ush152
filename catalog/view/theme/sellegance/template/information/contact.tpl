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

		<?php echo $column_left; ?>

		<section id="maincontent" class="<?php echo $main; ?>" role="main">

			<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="contact-form" class="form-horizontal">

				<fieldset class="subheading">
					
					<legend><?php echo $text_location; ?></legend>

					<br><div class="row">
				
						<address class="span4">
							<b><?php echo $text_address; ?></b><br />
							<?php echo $store; ?><br />
							<?php echo $address; ?>
						</address>
					
						<address class="span4">
							<?php if ($telephone) { ?>
								<b><?php echo $text_telephone; ?></b><br />
								<?php echo $telephone; ?><br />
								<br />
							<?php } ?>
							<?php if ($fax) { ?>
								<b><?php echo $text_fax; ?></b><br />
								<?php echo $fax; ?>
							<?php } ?>
						</address>

					</div>

				</fieldset>

				<fieldset class="subheading">

					<legend><?php echo $text_contact; ?></legend>

					<div class="control-group">
						<label for="name" class="control-label">
							<span class="req_mark">*</span> <?php echo $entry_name; ?>
						</label>
						<div class="controls">
							<input type="text" name="name" id="name" value="<?php echo $name; ?>" title="<?php echo $this->language->get('error_name'); ?>" class="required span3" required />
							<?php if ($error_name) { ?>
							<span class="error"><?php echo $error_name; ?></span>
							<?php } ?>
						</div>
					</div>

					<div class="control-group">
						<label for="email" class="control-label">
							<span class="req_mark">*</span> <?php echo $entry_email; ?>
						</label>
						<div class="controls">
							<input type="email" name="email" id="email" value="<?php echo $email; ?>"  title="<?php echo $this->language->get('error_email'); ?>" class="required email span3" required/>
							<?php if ($error_email) { ?>
							<span class="error"><?php echo $error_email; ?></span>
							<?php } ?>
						</div>
					</div>

					<div class="control-group">
						<label for="enquiry" class="control-label">
							<span class="req_mark">*</span> <?php echo $entry_enquiry; ?>
						</label>
						<div class="controls">
							<textarea name="enquiry" id="enquiry" cols="52" rows="8" title="<?php echo $this->language->get('error_enquiry'); ?>" class="required span5" required><?php echo $enquiry; ?></textarea>
							<?php if ($error_enquiry) { ?>
							<span class="error"><?php echo $error_enquiry; ?></span>
							<?php } ?>
						</div>
					</div>

					<div class="control-group">
						<label for="captcha" class="control-label">
							<span class="req_mark">*</span> <?php echo $entry_captcha; ?>
						</label>
						<div class="controls">
							<input type="text" name="captcha" id="captcha" value="<?php echo $captcha; ?>" class="span2 required" required /><br /><br />
							<img src="index.php?route=information/contact/captcha" alt="" />
							<?php if ($error_captcha) { ?>
							<span class="error"><?php echo $error_captcha; ?></span>
							<?php } ?>
						</div>
					</div>
				
				</fieldset>

				<div class="form-actions">
					<input type="submit" value="<?php echo $button_continue; ?>" class="btn btn-inverse" />
				</div>
	  
			</form>
			
		</section> <!-- #maincontent -->

		<?php echo $column_right; ?>

	</div>

	<?php echo $content_bottom; ?>

<?php echo $footer; ?>