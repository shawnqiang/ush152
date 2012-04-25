<!DOCTYPE html>

<!--[if IE 7]>                  <html class="ie7 no-js" lang="en">     <![endif]-->
<!--[if lte IE 8]>              <html class="ie8 no-js" lang="en">     <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--> <html class="not-ie no-js" lang="en">  <!--<![endif]-->

<head>

	<base href="<?php echo $base; ?>" />

	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

	<title><?php echo $title; ?></title>

	<?php if ($description) { ?>
	<meta name="description" content="<?php echo $description; ?>" />
	<?php } ?>
	
	<?php if ($keywords) { ?>
	<meta name="keywords" content="<?php echo $keywords; ?>" />
	<?php } ?>

	<?php if ($icon) { ?>
	<link rel="shortcut icon" href="<?php echo $icon; ?>" />
	<?php } else { ?>
	<link rel="shortcut icon" href="catalog/view/theme/sellegance/favicon.ico">
	<?php } ?>
	
	<!--[if !lte IE 6]><!-->

	<link rel="stylesheet" type="text/css" href="catalog/view/theme/sellegance/stylesheet/bootstrap.min.css"/>

	<link rel="stylesheet" type="text/css" href="catalog/view/theme/sellegance/stylesheet/stylesheet.css" media="screen"/>

	<link rel="stylesheet" type="text/css" href="catalog/view/javascript/jquery/colorbox/colorbox.css" media="screen" />

	<!--<![endif]-->

	<!--[if lte IE 6]>
	<link rel="stylesheet" href="//universal-ie6-css.googlecode.com/files/ie6.1.1.css" media="screen, projection">
	<![endif]-->

	<!-- Grab Google CDN's jQuery, with a protocol relative URL; fall back to local if necessary -->
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
	<script>window.jQuery || document.write(unescape('%3Cscript src="catalog/view/theme/sellegance/js/jquery-1.7.1.min.js"%3E%3C/script%3E'))</script>

	<script src="catalog/view/theme/sellegance/js/modernizr.full.min.js"></script>
		
	<script type="text/javascript" src="catalog/view/javascript/jquery/ui/jquery-ui-1.8.16.custom.min.js"></script>
	<link rel="stylesheet" type="text/css" href="catalog/view/javascript/jquery/ui/themes/ui-lightness/jquery-ui-1.8.16.custom.css" />

	<script type="text/javascript" src="catalog/view/javascript/jquery/colorbox/jquery.colorbox.js"></script>

	<script type="text/javascript" src="catalog/view/theme/sellegance/js/jquery.elastislide.js"></script>

	<script type="text/javascript" src="catalog/view/theme/sellegance/js/jquery.cycle.js"></script>

	<?php


	// If Sellegance module is enabled

	if($this->config->get('sellegance_status')== 1) {

		if($this->config->get('sellegance_title_font')!='' || $this->config->get('sellegance_body_font')!='' || $this->config->get('sellegance_small_font') != '' ) {
			
			$regfonts = array('Arial', 'Verdana', 'Helvetica', 'Lucida Grande', 'Trebuchet MS', 'Times New Roman', 'Tahoma', 'Georgia' );
			
			// Titles font
			if (in_array($this->config->get('sellegance_title_font'), $regfonts)==false) { 
				?><link href='//fonts.googleapis.com/css?family=<?php echo $this->config->get('sellegance_title_font') ?>&amp;v1' rel='stylesheet' type='text/css'><?php 
			} // Body font
			if (in_array($this->config->get('sellegance_body_font'), $regfonts)==false) { 
				?><link href='//fonts.googleapis.com/css?family=<?php echo $this->config->get('sellegance_body_font') ?>&amp;v1' rel='stylesheet' type='text/css'><?php 
			} // Small text font
			if (in_array($this->config->get('sellegance_small_font'), $regfonts)==false) { 
				?><link href='//fonts.googleapis.com/css?family=<?php echo $this->config->get('sellegance_small_font') ?>&amp;v1' rel='stylesheet' type='text/css'>
		<?php 

			} 
		} ?>

		<style type="text/css">

			body {
				
			<?php if($this->config->get('sellegance_background_color')!='') { ?>
				background-color: <?php echo $this->config->get('sellegance_background_color'); ?>;
			<?php } 

			if (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] != 'off') $path_image = HTTPS_IMAGE;
			else $path_image = HTTP_IMAGE;

			if($this->config->get('sellegance_custom_image')!='') { ?>
				background-image: url("<?php echo $path_image . $this->config->get('sellegance_custom_image') ?>"); ?>;
				background-position: top center;
				background-repeat: no-repeat;
			<?php } else if($this->config->get('sellegance_custom_pattern')!='') { ?>
				background-image: url("<?php echo $path_image . $this->config->get('sellegance_custom_pattern') ?>"); ?>;
			<?php } else if($this->config->get('sellegance_pattern_overlay')!='none') { ?>
				background-image: url("catalog/view/theme/sellegance/images/patterns/<?php echo $this->config->get('sellegance_pattern_overlay'); ?>.png");
			<?php } else { ?>
				background-image: none;
			<?php } ?>

			}

			<?php if($this->config->get('sellegance_thickbar_color')!='') { ?>
				#topdivider {
					background: <?php echo $this->config->get('sellegance_thickbar_color'); ?>;
					border-color: <?php echo $this->config->get('sellegance_thickbar_color'); ?>;
				}
			<?php }

			if($this->config->get('sellegance_display_shadows')!='') { ?>
				#content-wrapper { 
					webkit-box-shadow: 0 0 5px rgba(0,0,0,.2); 
					-moz-box-shadow: 0 0 5px rgba(0,0,0,.2); 
					box-shadow: 0 0 5px rgba(0,0,0,.2);
				}
			<?php }

			if($this->config->get('sellegance_bodytext_color')!='') { ?>
				body, .box-category > ul > li> a, .box-category > ul > li> ul > li > a, #maincontent a, #maincontent a:visited, #cart .content a, .contentset {
					color: <?php echo $this->config->get('sellegance_bodytext_color'); ?>;
				}
			<?php } 

			if($this->config->get('sellegance_lighttext_color')!='') { ?>
				#welcome, #footer .info, #footer .info p, .dropd span.selected, .dropd.active span.selected, .compare a, .wishlist a, .remove a, .breadcrumb a, #copy, #copy p, #product-info .price-tax, #product-info .price .reward, .html_note, .paginate .results, small, .review-date {
					color: <?php echo $this->config->get('sellegance_lighttext_color'); ?>;
				}
			<?php } 

			if($this->config->get('sellegance_links_color')!='') { ?>
				#links a, #links a:visited, #footer a, #footer a:visited, .checkout-heading a {
					color: <?php echo $this->config->get('sellegance_links_color'); ?>;
				}
			<?php } 

			if($this->config->get('sellegance_title_color')!='') { ?>
				.heading h1, .product-grid .name a, .product-list .name a, .box-product .name a, #cart h4 a, #footer h3, .checkout-heading {
					color: <?php echo $this->config->get('sellegance_title_color'); ?> !important;
				}
			<?php } 

			if($this->config->get('sellegance_menu_color')!='') { ?>
				#menu > ul > li > a {
					color: <?php echo $this->config->get('sellegance_menu_color'); ?>;
				}
			<?php } 

			if (($this->config->get('sellegance_button_border_color')!='') || ($this->config->get('sellegance_button_text_color')!='')) { ?>
				.btn-cart, .btn-cart:link, .btn-cart:visited {
					<?php if ($this->config->get('sellegance_button_border_color')!='') {  ?>
						border-color: <?php echo $this->config->get('sellegance_button_border_color'); ?> !important;
					<?php }
					
					if ($this->config->get('sellegance_button_text_color')!='') {  ?>
						color: <?php echo $this->config->get('sellegance_button_text_color'); ?> !important;
					<?php } ?>
				}
			<?php } 

			if(($this->config->get('sellegance_button_top_color')!='') || ($this->config->get('sellegance_button_bottom_color')!=''))  {

				$btncarttop = $this->config->get('sellegance_button_top_color');
				$btncartbot = $this->config->get('sellegance_button_bottom_color');

				?>
				.btn-cart, .btn-cart:link, .btn-cart:visited {
					background-color: <?php echo $btncartbot; ?>;
					background-image: -moz-linear-gradient(top, <?php echo $btncarttop; ?>, <?php echo $btncartbot; ?>);
					background-image: -ms-linear-gradient(top, <?php echo $btncarttop; ?>, <?php echo $btncartbot; ?>);
					background-image: -webkit-gradient(linear, 0 0, 0 100%, from(<?php echo $btncarttop; ?>), to(<?php echo $btncartbot; ?>));
					background-image: -webkit-linear-gradient(top, <?php echo $btncarttop; ?>, <?php echo $btncartbot; ?>);
					background-image: -o-linear-gradient(top, <?php echo $btncarttop; ?>, <?php echo $btncartbot; ?>);
					background-image: linear-gradient(top, <?php echo $btncarttop; ?>, <?php echo $btncartbot; ?>);
					background-repeat: repeat-x;
					filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='<?php echo $btncarttop; ?>', endColorstr='<?php echo $btncartbot; ?>', GradientType=0);
				}

				.btn-cart:hover, .btn-cart:active {

					background-color: <?php echo $btncartbot; ?>;
					background-image: -moz-linear-gradient(top, <?php echo $btncartbot; ?>, <?php echo $btncartbot; ?>);
					background-image: -ms-linear-gradient(top, <?php echo $btncartbot; ?>, <?php echo $btncartbot; ?>);
					background-image: -webkit-gradient(linear, 0 0, 0 100%, from(<?php echo $btncartbot; ?>), to(<?php echo $btncartbot; ?>));
					background-image: -webkit-linear-gradient(top, <?php echo $btncartbot; ?>, <?php echo $btncartbot; ?>);
					background-image: -o-linear-gradient(top, <?php echo $btncartbot; ?>, <?php echo $btncartbot; ?>);
					background-image: linear-gradient(top, <?php echo $btncartbot; ?>, <?php echo $btncartbot; ?>);
					background-repeat: repeat-x;
					filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='<?php echo $btncartbot; ?>', endColorstr='<?php echo $btncartbot; ?>', GradientType=0);
				}

			<?php }

			if (($this->config->get('sellegance_2button_border_color')!='') || ($this->config->get('sellegance_2button_text_color')!='')) { ?>
				.btn-inverse, .btn-inverse:link, .btn-inverse:visited {
					<?php if ($this->config->get('sellegance_2button_border_color')!='') {  ?>
						border-color: <?php echo $this->config->get('sellegance_2button_border_color'); ?> !important;
					<?php }
					
					if ($this->config->get('sellegance_2button_text_color')!='') {  ?>
						color: <?php echo $this->config->get('sellegance_2button_text_color'); ?> !important;
					<?php } ?>
				}
			<?php } 

			if(($this->config->get('sellegance_2button_top_color')!='') || ($this->config->get('sellegance_2button_bottom_color')!=''))  { ?>
				.btn-inverse, .btn-inverse:link, .btn-inverse:visited {
					background: <?php echo $this->config->get('sellegance_2button_bottom_color'); ?>;
					background: -webkit-gradient(linear, left top, left bottom, from(<?php echo $this->config->get('sellegance_2button_top_color'); ?>), to(<?php echo $this->config->get('sellegance_2button_bottom_color'); ?>));
					background: -moz-linear-gradient(top, <?php echo $this->config->get('sellegance_2button_top_color'); ?>, <?php echo $this->config->get('sellegance_2button_bottom_color'); ?>);
					background: linear-gradient(<?php echo $this->config->get('sellegance_2button_top_color'); ?>, <?php echo $this->config->get('sellegance_2button_bottom_color'); ?>);
				}

				.btn-inverse:hover, .btn-inverse:active {
					background: <?php echo $this->config->get('sellegance_2button_top_color'); ?>;
					background: -webkit-gradient(linear, left top, left bottom, from(<?php echo $this->config->get('sellegance_2button_top_color'); ?>), to(<?php echo $this->config->get('sellegance_2button_top_color'); ?>));
					background: -moz-linear-gradient(top, <?php echo $this->config->get('sellegance_2button_top_color'); ?>, <?php echo $this->config->get('sellegance_2button_top_color'); ?>);
					background: linear-gradient(<?php echo $this->config->get('sellegance_2button_top_color'); ?>, <?php echo $this->config->get('sellegance_2button_top_color'); ?>);
				}
			
			<?php

			} 

			if ($this->config->get('sellegance_body_font') != '' ) {
				$fontpre =  $this->config->get('sellegance_body_font');
				$font = str_replace("+", " ", $fontpre);
			?>

			body, p { font-family:<?php echo $font ?>; }

			<?php } 
				if($this->config->get('sellegance_title_font')!='') {
				$fontpre =  $this->config->get('sellegance_title_font');
				$font = str_replace("+", " ", $fontpre);
			?>

			h1, h2, h3, .contentset, legend, .checkout-heading {
				font-family:<?php echo $font ?>;
			}
			
			<?php }

			if ($this->config->get('sellegance_small_font') != '') {
				$fontpre =  $this->config->get('sellegance_small_font');
				$font = str_replace("+", " ", $fontpre);
			?>
			small, .wishlist a, .compare a, .remove a, .product-compare, .dropd, .product-filter .display li, .product-list .price-tax, #product-info .price-tax, #product-info .price .reward, span.error, #copy, #footer .info, .breadcrumb a, .paginate .results, #welcome, .help {
				font-family:<?php echo $font ?>;
			}
			<?php } ?>

		</style>

	<?php } 

	// Load custom.css

	$filename = 'catalog/view/theme/sellegance/stylesheet/custom.css'; 

	if (file_exists($filename)) { ?>

		<link rel="stylesheet" type="text/css" href="catalog/view/theme/sellegance/stylesheet/custom.css" />

	<?php } ?>

	<?php echo $google_analytics; ?>


</head>

<body>

	<header id="header"> 
		<div class="container">
		<!-- <div class="row sudheader"> -->
			
			<!-- <div id="wrapselector">
					<?php echo $language; ?>
	  				<?php echo $currency; ?>
			</div> -->

			
			<!-- <div id="links" class="hidden-phone" style="display:inline;">
				<a href="<?php echo $shopping_cart; ?>"><?php echo $text_shopping_cart; ?></a>
				<a href="<?php echo $checkout; ?>"><?php echo $text_checkout; ?></a>
				<a href="<?php echo $account; ?>"><?php echo $text_account; ?></a>
			</div> -->	
				
		<!-- </div> -->
		<div class="row">

			<div id="logo" class="span3">
				<?php if ($logo) { ?>
					<a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" /></a>
				<?php } ?>
			</div> <!-- #logo -->

			<div class="span3 searchwrapper">

				<div id="search">
					<div class="searchbox input-append">
						<input type="search" name="filter_name" value="<?php echo $filter_name; ?>" placeholder="<?php echo $text_search; ?>" />
						<button class="btn button-search" type="button"><i class="icon-search"></i></button>
					</div>
				</div>

				

			</div> <!-- .leftbox -->


			<div class="span6 accountwrapper">
				<div id="accontinfo">
					<div id="welcome">
						<?php if (!$logged) { ?>
						<?php echo $text_welcome; ?>
						<?php } else { ?>
						<?php echo $text_logged; ?>
						<?php } ?>

						
					</div>
				</div>
				<?php echo $cart; ?>
				

				

				

				

			</div> <!-- .rightbox -->

		</div> <!-- .row -->

	<?php if ($categories) { ?>
		
		<nav id="mainnav" class="navbar" role="navigation">
			<div class="navbar-inner">
				<div class="container">

					<a class="btn btn-navbar btn-large" data-toggle="collapse" data-target=".nav-collapse">
						<span>Menu</span><i class="icon-navbtn"></i>
					</a>

					<div class="nav-collapse">
						<ul class="nav">
							<li><a href="<?php echo $home; ?>" title="<?php echo $text_home; ?>"><i class="icon-home"></i></a></li>
							<?php foreach ($categories as $category) { ?>
							<li <?php if ($category['children']) { ?> class="dropdown"<?php } ?>><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
								<?php if ($category['children']) { ?>
								<ul class="dropdown-menu">
									<?php for ($i = 0; $i < count($category['children']);) { ?>
									
										<?php $j = $i + ceil(count($category['children']) / $category['column']); ?>
										<?php for (; $i < $j; $i++) { ?>
										<?php if (isset($category['children'][$i])) { ?>
										<li><a href="<?php echo $category['children'][$i]['href']; ?>"><?php echo $category['children'][$i]['name']; ?></a></li>
										<?php } ?>
										<?php } ?>
									
									<?php } ?>
									</ul>
								<?php } ?>
							</li>
							<?php } ?>
						</ul>
					</div>
				</div>
			</div>
		</nav><!-- #navbar -->

	<?php } ?>
	</div>
</header> <!-- #header -->

<div id="topdivider" class="container"></div>
<section id="content-wrapper" class="container">
	