<div id="carousel<?php echo $module; ?>" class="es-carousel-wrapper">

	<div class="es-carousel">

		<ul>

		<?php foreach ($banners as $banner) { ?>
			
			<li>
				<a href="<?php echo $banner['link']; ?>">
					<img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" title="<?php echo $banner['title']; ?>" />
				</a>
			</li>

		<?php } ?>

		</ul>

  </div>

</div> <!-- .es-carousel-wrapper -->

<script type="text/javascript">

	$('#carousel<?php echo $module; ?>').elastislide({

		speed       : 450,	// animation speed
		easing      : '',	// animation easing effect
		imageW		: 290, 	// the images width

		// the minimum number of items to show. When we resize the window, this will make sure minItems are always shown (unless of course minItems is higher than the total number of elements)
		<?php if ($limit > 3): ?>
		minItems	: <?php echo $scroll; ?>
		<?php else: ?>
		minItems	: 1
		<?php endif ?>
	});

	//Fix to adjust on windows resize
	$(window).triggerHandler('resize.elastislide');

</script>