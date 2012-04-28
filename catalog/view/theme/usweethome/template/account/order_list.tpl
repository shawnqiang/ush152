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
	
	<header>
		
	</header>

	<?php 
	
	if ($column_left || $column_right) { $main = "span9"; } 
	else { 	$main = "span12"; } 

	?>

	<div class="row">

		<?php echo $column_left; ?>
		
		<section id="maincontent" class="<?php echo $main; ?>" role="main">
			<div class="mod">
				<div class="mod-hd">
					<h4><?php echo $heading_title; ?></h4>
				</div>
				<div class="mod-bd">
					<?php if ($orders) { ?>

			<div id="order-list">
				
				<?php foreach ($orders as $order) { ?>

					<div class="contentset">
						<h4 class="inner">
							<span><b><?php echo $text_order_id; ?> <?php echo $order['order_id']; ?></b></span>
						</h4>
					</div>

					<div class="row-fluid">
						
						<div class="span3">
							<?php echo $text_status; ?> <?php echo $order['status']; ?> <br/>
							<small><?php echo $order['date_added']; ?></small>
						</div>

						<div class="order-contents span4">
							<b><?php echo $text_customer; ?></b> <?php echo $order['name']; ?>
						</div>

						<div class="span2">
							<?php echo $text_products; ?> <?php echo $order['products']; ?> <br/>
							<b><?php echo $text_total; ?></b> <?php echo $order['total']; ?>
						</div>
						
						<div class="span3 list-actions">
							<a href="<?php echo $order['href']; ?>" class="btn btn-mini" title="<?php echo $button_view; ?>"><i class="icon-eye-open"></i> <?php echo $button_view; ?></a>
							<a href="<?php echo $order['reorder']; ?>" class="btn btn-mini btn-cart" title="<?php echo $button_reorder; ?>"><?php echo $button_reorder; ?></a>
						</div>

					</div>
			<?php } ?>

			</div>

			<div class="paginate"><?php echo $pagination; ?></div>

			<?php } else { ?>

			<div class="content"><?php echo $text_empty; ?></div>

			<?php } ?>

			<div class="form-actions">
				<a href="<?php echo $continue; ?>" class="btn btn-inverse"><?php echo $button_continue; ?></a>
			</div>

				</div>
			</div>
			

		</section> <!-- #maincontent -->

		<?php echo $column_right; ?>

	</div> <!-- .row -->

	<?php echo $content_bottom; ?>

<?php echo $footer; ?>