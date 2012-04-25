$(document).ready(function(){

	/* ---------------------------------------------------------------------- */
	/*	Forms Validation
	/* ---------------------------------------------------------------------- */

		jQuery.validator.setDefaults({
			errorClass: "error",  
			validClass: "success",  
			errorElement: "span",  
			highlight: function(element, errorClass, validClass) {	
				if (element.type === 'radio') { 
					this.findByName(element.name).parent("div").parent("div").removeClass(validClass).addClass(errorClass);	
				} else { $(element).parent("div").parent("div").removeClass(validClass).addClass(errorClass);	}  
			},  
			unhighlight: function(element, errorClass, validClass) { 
				if (element.type === 'radio') { this.findByName(element.name).parent("div").parent("div").removeClass(errorClass).addClass(validClass);	
				} else { $(element).parent("div").parent("div").removeClass(errorClass).addClass(validClass);	}  
			},
			errorPlacement: function(error, element) {
				error.insertAfter(element);
			}
		});

		$("#contact-form").validate({
		  rules: {
			enquiry: {
				required: true,
				minlength: 10
			}
		  }
		});

		$("#register-form, #password-form").validate({
		  rules: {
			password: {
				required: true, minlength: 3
			},
			confirm: {
				required: function(element) {
					var str = $("#password").val();

					return str.length > 0;
				},
				equalTo: "#password",
				minlength: 3
			}
		  }
		});

		$("#edit-account, #voucher, #address, #return, #login, #forgotten").validate();
	

	/* ---------------------------------------------------------------------- */
	/*	Flexslider - responsive slider
	/* ---------------------------------------------------------------------- */

		$(window).load(function() {

		    $('.flexslider').flexslider({

		    	animation: "fade",            //String: Select your animation type, "fade" or "slide"
				slideDirection: "horizontal", //String: Select the sliding direction, "horizontal" or "vertical"
				slideshow: true,              //Boolean: Animate slider automatically
				slideshowSpeed: 7000,         //Integer: Set the speed of the slideshow cycling, in milliseconds
				animationDuration: 600,       //Integer: Set the speed of animations, in milliseconds
				directionNav: true,           //Boolean: Create navigation for previous/next navigation? (true/false)
				controlNav: true,             //Boolean: Create navigation for paging control of each clide? Note: Leave true for manualControls usage
				keyboardNav: true,            //Boolean: Allow slider navigating via keyboard left/right keys
				mousewheel: false,            //Boolean: Allow slider navigating via mousewheel
				prevText: "Previous",         //String: Set the text for the "previous" directionNav item
				nextText: "Next",             //String: Set the text for the "next" directionNav item
				randomize: false,             //Boolean: Randomize slide order
				slideToStart: 0,              //Integer: The slide that the slider should start on. Array notation (0 = first slide)
				animationLoop: true,          //Boolean: Should the animation loop? If false, directionNav will received "disable" classes at either end
				pauseOnAction: true,          //Boolean: Pause the slideshow when interacting with control elements, highly recommended.
				pauseOnHover: false          //Boolean: Pause the slideshow when hovering over slider, then resume when no longer hovering
		    });

		  });


	/* ---------------------------------------------------------------------- */
	/*	Elastislide - responsive carousel
	/* ---------------------------------------------------------------------- */

		// Because of dynamic options, moved to carousel.tpl


	/* ---------------------------------------------------------------------- */
	/*	Search
	/* ---------------------------------------------------------------------- */

		$('.button-search').bind('click', function() {
			url = 'index.php?route=product/search';
					 
			var filter_name = $('input[name=\'filter_name\']').attr('value');
			
			if (filter_name) {
				url += '&filter_name=' + encodeURIComponent(filter_name);
			}
			
			location = url;
		});
		
		$('#header input[name=\'filter_name\']').bind('keydown', function(e) {
			if (e.keyCode == 13) {
				url = 'index.php?route=product/search';
				 
				var filter_name = $('input[name=\'filter_name\']').attr('value');
				
				if (filter_name) {
					url += '&filter_name=' + encodeURIComponent(filter_name);
				}
				
				location = url;
			}
		});

	/* ---------------------------------------------------------------------- */
	/*	Ajax Minicart
	/* ---------------------------------------------------------------------- */

		$("#cart > .heading a").live('click', function () {

			$('#cart').load('index.php?route=module/cart #cart > *');

			$('#cart > .content').slideToggle('fast');

			$('#cart').toggleClass("active");

			

			
		});


	/* ---------------------------------------------------------------------- */
	/*	Language/Currency dropdowns
	/* ---------------------------------------------------------------------- */

		$('.dropd').click(function() {

			$(this).find('.options').slideDown('fast');
			$(this).addClass('active');

			$(this).bind('mouseleave', function() {
				$(this).find('.options').slideUp('fast');
				$(this).removeClass('active');
			});

		});

	/* ---------------------------------------------------------------------- */
	/*	Footer menu
	/* ---------------------------------------------------------------------- */

		$(".column .header").click(function () {

			$(this).toggleClass("active");  
			$(this).parent().find(".content").slideToggle('medium');

		});

	/* ---------------------------------------------------------------------- */
	/*	Scroll to top
	/* ---------------------------------------------------------------------- */
	
		$().UItoTop({ 
			easingType: 'easeOutQuart',
			scrollSpeed: 1200
		});

	
	/* ---------------------------------------------------------------------- */
	/*	Colorbox
	/* ---------------------------------------------------------------------- */

	$('.colorbox').colorbox({
		overlayClose: true,
		opacity: 0.5,
		maxHeight: 560,
		maxWidth: 560,
		width:'100%'
	});

	/* ---------------------------------------------------------------------- */
	/*	Mainnav - show submenu
	/* ---------------------------------------------------------------------- */

	$('#mainnav .dropdown').each(function(){
		var ush_targetlink = $(this).children('a:first-child');
		$(this).hover(function(){
			ush_targetlink.addClass('active');
		},function(){
			ush_targetlink.removeClass('active');
		});
	});

});

	/* ---------------------------------------------------------------------- */
	/*	Grid/List view
	/* ---------------------------------------------------------------------- */

		function display(view) {

			if (view == 'list') {

				$('#list').addClass('active');

				$('.product-grid').attr('class', 'product-list');
				
				$('.product-list > div').each(function(index, element) {

					$(this).removeClass('alpha omega odd span3 grid-box');

					$(this).addClass('row-fluid');
				
					var image = $(element).find('.image').html();

					if (image != null) { 
						html = '<div class="image span3">' + image + '</div>';
					} else {
						html = '<div class="image span3">&nbsp;</div>';
					}
					
					html += '<div class="name-desc span5">';

					html += '<div class="name">' + $(element).find('.name').html() + '</div>';
					var rating = $(element).find('.rating').html();
					
					if (rating != null) {
						html += '<div class="rating">' + rating + '</div>';
					}
					html += '<div class="description">' + $(element).find('.description').html() + '</div>';

					html += '</div>';
					
					var price = $(element).find('.price').html();
					
					if (price != null) {
						html += '<div class="price span2">' + price  + '</div>';
					} else {
						html += '<div class="price span2">&nbsp;</div>';
					}

					html += '<div class="actions span2">';
					html += '  <div class="cart">' + $(element).find('.cart').html() + '</div>';
					html += '  <div class="wishlist">' + $(element).find('.wishlist').html() + '</div>';
					html += '  <div class="compare">' + $(element).find('.compare').html() + '</div>';
					html += '</div>';

								
					$(element).html(html);
				});
				
				$.cookie('display', 'list'); 

			} else {

				$('#grid').addClass('active');
				
				$('.product-list').attr('class', 'product-grid row');
				
				$('.product-grid > div').each(function(index, element) {

					$(this).removeClass('row-fluid');
					
					$(this).addClass('grid-box span3');

					if ($('#maincontent').hasClass('span9')) {

						if ((index+3) % 3 == 0 ) {	$(this).addClass('alpha');	}

					} else {

						if ((index+4) % 4 == 0 ) {	$(this).addClass('alpha');	}
					}

					if ((index+2) % 2 == 0 ) {
						$(this).addClass('odd');
					}

					html = '';
					
					var image = $(element).find('.image').html();

					html += '<div class="inner">';
					
					if (image != null) {
						html += '<div class="image">' + image + '</div>';
					}
					
					html += '<div class="name">' + $(element).find('.name').html() + '</div>';

					var rating = $(element).find('.rating').html();
					
					if (rating != null) {
						html += '<div class="rating">' + rating + '</div>';
					}

					html += '<div class="description">' + $(element).find('.description').html() + '</div>';
					
					var price = $(element).find('.price').html();
					
					if (price != null) {
						html += '<div class="price">' + price  + '</div>';
					}
								
					html += '<div class="cart">' + $(element).find('.cart').html() + '</div>';
					html += '<div class="wishlist">' + $(element).find('.wishlist').html() + '</div>';
					html += '<div class="compare">' + $(element).find('.compare').html() + '</div>';

					html += '</div>';
					
					$(element).html(html);

				});
										
				$.cookie('display', 'grid');

			}

		}

		view = $.cookie('display');

		if (view) {	display(view);	} 
		else { display('grid'); }


	/* ---------------------------------------------------------------------- */
	/*	Add to Cart
	/* ---------------------------------------------------------------------- */

		function addToCart(product_id, quantity) {
			quantity = typeof(quantity) != 'undefined' ? quantity : 1;

			$.ajax({
				url: 'index.php?route=checkout/cart/add',
				type: 'post',
				data: 'product_id=' + product_id + '&quantity=' + quantity,
				dataType: 'json',
				success: function(json) {
					$('.alert-success, .alert-warning, .alert-attention, .alert-information, .alert-error').remove();
					
					if (json['redirect']) {
						location = json['redirect'];
					}
					
					if (json['success']) {
						$('#notification').html('<div class="alert alert-success" style="display: none;">' + json['success'] + '<a class="close" data-dismiss="alert" href="#">&times;</a></div>');
						
						$('.alert-success').fadeIn('slow');
						
						$('#cart-total').html(json['total']);
						
						$('html, body').animate({ scrollTop: 0 }, 'slow'); 
					}	
				}
			});
		}

	/* ---------------------------------------------------------------------- */
	/*	Add to Wishlist
	/* ---------------------------------------------------------------------- */

		function addToWishList(product_id) {
			$.ajax({
				url: 'index.php?route=account/wishlist/add',
				type: 'post',
				data: 'product_id=' + product_id,
				dataType: 'json',
				success: function(json) {
					$('.alert-success, .alert-warning, .alert-attention, .alert-information').remove();
								
					if (json['success']) {
						$('#notification').after('<div class="alert alert-success" style="display: none;">' + json['success'] + '<a class="close" data-dismiss="alert" href="#">&times;</a></div>');
						
						$('.alert-success').fadeIn('slow');
						
						$('#wishlist-total').html(json['total']);
						
						$('html, body').animate({ scrollTop: 0 }, 'slow');
					}	
				}
			});
		}

	/* ---------------------------------------------------------------------- */
	/*	Add to Compare
	/* ---------------------------------------------------------------------- */

		function addToCompare(product_id) { 
			$.ajax({
				url: 'index.php?route=product/compare/add',
				type: 'post',
				data: 'product_id=' + product_id,
				dataType: 'json',
				success: function(json) {
					$('.alert-success, .alert-warning, .alert-attention, .alert-information').remove();
								
					if (json['success']) {
						$('#notification').html('<div class="alert alert-success fade in">' + json['success'] + '<a class="close" data-dismiss="alert" href="#">&times;</a></div>');
						
						$('.alert-success').fadeIn('slow');
						
						$('#compare-total').html(json['total']);
						
						$('html, body').animate({ scrollTop: 0 }, 'slow'); 
					}	
				}
			});
		}

	