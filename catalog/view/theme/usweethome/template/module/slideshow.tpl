<section class="flexslider">

	<ul class="slides">

	<?php foreach ($banners as $banner) { ?>
		
		<li>

			<?php if ($banner['link']) { ?>

				<a href="<?php echo $banner['link']; ?>">
					<img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" />
				</a>
				<div class="flex-caption">
					<a href="<?php echo $banner['link']; ?>">
						<?php echo $banner['title']; ?>
					</a>
				</div>

			<?php } else { ?>

				<img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" />

				<div class="flex-caption">
					<?php echo $banner['title']; ?>
				</div>

			<?php } ?>

		</li>

	<?php } ?>

	</ul>

</section>