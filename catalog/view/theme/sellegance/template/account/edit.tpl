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

			<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="edit-account" class="form-horizontal">
		
				<fieldset class="subheading">

					<legend><?php echo $text_your_details; ?></legend>

					<div class="control-group">
						<label for="firstname" class="control-label"><span class="req_mark">*</span> <?php echo $entry_firstname; ?></label>
						<div class="controls">
							<input type="text" name="firstname" id="firstname" value="<?php echo $firstname; ?>" title="<?php echo $this->language->get('error_firstname'); ?>" class="required span3" required />
							<?php if ($error_firstname) { ?>
							<span class="error"><?php echo $error_firstname; ?></span>
							<?php } ?>
						</div>
					</div>
	 	
					<div class="control-group">
						<label for="lastname" class="control-label"><span class="req_mark">*</span> <?php echo $entry_lastname; ?>
						</label>
						<div class="controls">
							<input type="text" name="lastname" id="lastname" value="<?php echo $lastname; ?>" title="<?php echo $this->language->get('error_lastname'); ?>" class="required span3" required />
							<?php if ($error_lastname) { ?>
							<span class="error"><?php echo $error_lastname; ?></span>
							<?php } ?>
						</div>
					</div>

					<div class="control-group">
						<label for="email" class="control-label"><span class="req_mark">*</span> <?php echo $entry_email; ?></label>
						<div class="controls">
							<input type="email" name="email" id="email" value="<?php echo $email; ?>"  title="<?php echo $this->language->get('error_email'); ?>" class="required email span3" required />
							<?php if ($error_email) { ?>
							<span class="error"><?php echo $error_email; ?></span>
							<?php } ?>
						</div>
					</div>

					<div class="control-group">
						<label for="telephone" class="control-label"><span class="req_mark">*</span> <?php echo $entry_telephone; ?></label>
						<div class="controls">
							<input type="text" name="telephone" id="telephone" value="<?php echo $telephone; ?>" title="<?php echo $this->language->get('error_telephone'); ?>" class="required span3" />
							<?php if ($error_telephone) { ?>
							<span class="error"><?php echo $error_telephone; ?></span>
							<?php } ?>
						</div>
					</div>

					<div class="control-group">
						<label for="fax" class="control-label"><?php echo $entry_fax; ?></label>
						<div class="controls">
							<input type="text" name="fax" id="fax" value="<?php echo $fax; ?>" class="span3"/>
						</div>
					</div>
				
				</fieldset>

				<div class="form-actions">
					<a href="<?php echo $back; ?>" class="btn"><span><?php echo $button_back; ?></span></a>
					<input type="submit" value="<?php echo $button_continue; ?>" class="btn btn-inverse" />
				</div>
	  
			</form>

		</section> <!-- #maincontent -->

		<?php echo $column_right; ?>

	</div>
  
	<?php echo $content_bottom; ?>
  
<?php echo $footer; ?>