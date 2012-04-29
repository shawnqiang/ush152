<div class="box">
  <div class="box-heading"><?php echo $heading_title; ?></div>
  <div class="box-content">
    <div class="box-category">
      <ul>
        <?php foreach ($prices as $price) { ?>
        <li>
          <a href="<?php echo $price['href']; ?>"><?php echo $price['title']; ?></a>
        </li>
        <?php } ?>
		<li>
			<form action="" method="POST" id="form">
				<label>US$ </label><input type="text" name="min_price" value=""/> to <label>US$ </label><input type="text" name="max_price" value=""/><button type="submit">GO</button>
			</form>
		</li>
      </ul>
    </div>
  </div>
</div>

