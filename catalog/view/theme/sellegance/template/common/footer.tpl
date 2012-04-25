		</section> <!-- #content_wrapper -->

		<footer id="footer">
			<div class="container">
			<div class="row">

				<div class="column span2">
					<h3 class="header"><?php echo $text_information; ?></h3>
					<ul class="content">
						<?php 
						$i=1;
						foreach ($informations as $information) { ?>
						<li id="inf<?php echo $i;?>"><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
						<?php 
						$i++;
					} ?>
					</ul>
				</div>

				<div class="column span2">
					<h3 class="header"><?php echo $text_service; ?></h3>
					<ul class="content">
						<li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
						<li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
						<li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
					</ul>
				</div>

				<div class="column span2">
					<h3 class="header"><?php echo $text_extra; ?></h3>
						<ul class="content">
							<li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
							<li><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
							<li><a href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li>
							<li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
						</ul>
				</div>

				<div class="column span2">
					<h3 class="header"><?php echo $text_account; ?></h3>
						<ul class="content">
							<li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
							<li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
							<li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
							<li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
						</ul>
				</div>

				<div class="span4 contact">

					<?php if($this->config->get('sellegance_status')== 1) { ?>
					
					<div class="social">

						<?php if($this->config->get('sellegance_facebook_id') != '' || $this->config->get('sellegance_twitter_username') != '' || $this->config->get('sellegance_gplus_id') != '') { ?>
						<?php } ?>
						<?php if($this->config->get('sellegance_facebook_id') != '') { ?>
							<a href="https://facebook.com/<?php echo $this->config->get('sellegance_facebook_id'); ?>" target="_blank">
							<img src="catalog/view/theme/sellegance/images/facebook.png" alt="Facebook" title="Facebook"></a>
						<?php } ?>
						<?php if($this->config->get('sellegance_twitter_username') != '') { ?>
							<a href="https://twitter.com/#!/<?php echo $this->config->get('sellegance_twitter_username'); ?>" target="_blank">
							<img src="catalog/view/theme/sellegance/images/twitter.png" alt="Twitter" title="Twitter">
						</a>
						<?php } ?>
						<?php if($this->config->get('sellegance_gplus_id') != '') { ?>
							<a href="https://plus.google.com/u/0/<?php echo $this->config->get('sellegance_gplus_id'); ?>" target="_blank">
							<img src="catalog/view/theme/sellegance/images/gplus.png" alt="Google+" title="Google+">
						</a>
						<?php } ?>
						<?php if($this->config->get('sellegance_pinterest_id') != '') { ?>
							<a href="https://pinterest.com/<?php echo $this->config->get('sellegance_pinterest_id'); ?>" target="_blank">
							<img src="catalog/view/theme/sellegance/images/pinterest.png" alt="Pinterest" title="Pinterest">
						</a>
						<?php } ?>
						
					</div>

					<?php if($this->config->get('sellegance_footer_info_text') != '') { ?>
						<div class="info">
							<?php echo html_entity_decode($this->config->get('sellegance_footer_info_text'), ENT_QUOTES, 'UTF-8');?>
						</div>
					<?php } ?>

				<?php } ?>

				</div>

			</div> <!-- .row -->
			</div>
		</footer> <!-- #footer -->

		<footer id="footend">
			<div class="container">
			<div class="row">

			<?php if($this->config->get('sellegance_status')== 1) { ?>
				<?php if($this->config->get('sellegance_copyright') != '') { ?>
					<div id="copy"><?php echo html_entity_decode($this->config->get('sellegance_copyright'), ENT_QUOTES, 'UTF-8'); ?></div>
				<?php } else { ?>
					
					<div id="copy"><?php echo $this->config->get('config_name'); ?> &copy;2012. Powered by <a class="blue" href="http://www.opencart.com">OpenCart</a>.</div>
				<?php } ?>
			<?php } else { ?>
				<div id="copy"><?php echo $this->config->get('config_name'); ?> &copy;2012. Powered by <a class="blue" href="http://www.opencart.com">OpenCart</a><br /><a href="http://www.everthemes.com">SELLEGANCE</a> by <a href="http://www.everthemes.com">EVERTHEMES.COM</a>.</div>
			<?php } ?>

			</div>
			</div>
		</footer> <!-- #footend -->


		<script type="text/javascript" src="catalog/view/theme/sellegance/js/bootstrap.min.js"></script>
		<!--[if lt IE 9]> <script type="text/javascript" src="catalog/view/theme/sellegance/js/selectivizr.min.js"></script> <![endif]-->
		<script type="text/javascript" src="catalog/view/theme/sellegance/js/respond.min.js"></script>
		<script type="text/javascript" src="catalog/view/theme/sellegance/js/jquery.validate.min.js"></script>
		<script type="text/javascript" src="catalog/view/theme/sellegance/js/jquery.easing-1.3.min.js"></script>
		<script type="text/javascript" src="catalog/view/theme/sellegance/js/jquery.flexslider.min.js"></script>
		<script type="text/javascript" src="catalog/view/javascript/jquery/ui/external/jquery.cookie.js"></script>
		<script type="text/javascript" src="catalog/view/theme/sellegance/js/jquery.ui.totop.js"></script>
		<script type="text/JavaScript" src="catalog/view/theme/sellegance/js/cloud-zoom.1.0.2.min.js"></script>
		<script type="text/javascript" src="catalog/view/theme/sellegance/js/custom.js"></script>
		
	</body>

</html>