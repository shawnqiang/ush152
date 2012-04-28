<?php if ($modules) { ?>

<aside id="column-left" class="span3 hidden-phone" role="complementary">
	<div class="inner">
		<?php foreach ($modules as $module) { ?>
			<?php echo $module; ?>
		<?php } ?>
	</div>
</aside>

<?php } ?>