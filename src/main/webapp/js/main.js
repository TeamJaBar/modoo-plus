

(function($) {
	"use strict";

	function initIsotope() {
		$('.isotope-grid').isotope({
			itemSelector: '.isotope-item',
			layoutMode: 'fitRows',
			percentPosition: true,
			animationEngine: 'best-available',
			fitRows: {
				gutter: '.gutter-sizer'
			},
			masonry: {
				columnWidth: '.isotope-item'
			}
		});
		return;
	}



	/*[ Load page ]
	===========================================================*/
	$(".animsition").animsition({
		inClass: 'fade-in',
		outClass: 'fade-out',
		inDuration: 1500,
		outDuration: 800,
		linkElement: '.animsition-link',
		loading: true,
		loadingParentElement: 'html',
		loadingClass: 'animsition-loading-1',
		//loadingInner: '<div class="loader05"></div>',
		timeout: false,
		timeoutCountdown: 5000,
		onLoadEvent: true,
		browser: ['animation-duration', '-webkit-animation-duration'],
		overlay: false,
		overlayClass: 'animsition-overlay-slide',
		overlayParentElement: 'html',
		transition: function(url) { window.location.href = url; }
	});

	/*[ Back to top ]
	===========================================================*/
	var windowH = $(window).height() / 2;

	$(window).on('scroll', function() {
		if ($(this).scrollTop() > windowH) {
			$("#myBtn").css('display', 'flex');
		} else {
			$("#myBtn").css('display', 'none');
		}
	});

	$('#myBtn').on("click", function() {
		$('html, body').animate({ scrollTop: 0 }, 300);
	});

	/*==================================================================
	[ Fixed Header ]*/
	var headerDesktop = $('.container-menu-desktop');
	var wrapMenu = $('.wrap-menu-desktop');
	var wrapMainMenu = $('.wrap-main-menu-desktop');

	if ($('.top-bar').length > 0) {
		var posMainWrapHeader = $('.top-bar').height() + $('.logo-container-desktop').height();
		var posWrapHeader = $('.top-bar').height();
		//메뉴바 이동 수정
	}
	else {
		var posWrapHeader = 0;
		var posMainWrapHeader = 0;
	}


	if ($(window).scrollTop() > posWrapHeader) {
		$(headerDesktop).addClass('fix-menu-desktop');
		$(wrapMenu).css('top', 0);
	}
	else {
		$(headerDesktop).removeClass('fix-menu-desktop');
		$(wrapMainMenu).css('top', posMainWrapHeader - $(this).scrollTop());
		$(wrapMenu).css('top', posWrapHeader - $(this).scrollTop());
	}

	$(window).on('scroll', function() {
		if ($(this).scrollTop() > posWrapHeader) {
			$(headerDesktop).addClass('fix-menu-desktop');
			$(wrapMenu).css('top', 0);
			$(wrapMainMenu).css('top', 0);
		}
		else {
			$(headerDesktop).removeClass('fix-menu-desktop');
			$(wrapMenu).css('top', posWrapHeader - $(this).scrollTop());
			$(wrapMainMenu).css('top', posMainWrapHeader - $(this).scrollTop());
		}
	});


	/*==================================================================
	[ Menu mobile ]*/
	$('.btn-show-menu-mobile').on('click', function() {
		$(this).toggleClass('is-active');
		$('.menu-mobile').slideToggle();
	});

	var arrowMainMenu = $('.arrow-main-menu-m');

	for (var i = 0; i < arrowMainMenu.length; i++) {
		$(arrowMainMenu[i]).on('click', function() {
			$(this).parent().find('.sub-menu-m').slideToggle();
			$(this).toggleClass('turn-arrow-main-menu-m');
		})
	}

	$(window).resize(function() {
		if ($(window).width() >= 992) {
			if ($('.menu-mobile').css('display') == 'block') {
				$('.menu-mobile').css('display', 'none');
				$('.btn-show-menu-mobile').toggleClass('is-active');
			}

			$('.sub-menu-m').each(function() {
				if ($(this).css('display') == 'block') {
					console.log('hello');
					$(this).css('display', 'none');
					$(arrowMainMenu).removeClass('turn-arrow-main-menu-m');
				}
			});

		}
	});


	/*==================================================================
	[ Show / hide modal search ]*/
	$('.js-show-modal-search').on('click', function() {
		$('.modal-search-header').addClass('show-modal-search');
		$(this).css('opacity', '0');
	});

	$('.js-hide-modal-search').on('click', function() {
		$('.modal-search-header').removeClass('show-modal-search');
		$('.js-show-modal-search').css('opacity', '1');
	});

	$('.container-search-header').on('click', function(e) {
		e.stopPropagation();
	});


	/*==================================================================
	[ Isotope ]*/
	var $topeContainer = $('.isotope-grid');
	var $filter = $('.filter-tope-group');

	// filter items on button click
	$filter.each(function() {
		$filter.on('click', 'button', function() {
			var filterValue = $(this).attr('data-filter');
			$topeContainer.isotope({ filter: filterValue });
		});
	});

	// init Isotope
	$(window).on('load', function() {
		var $grid = $topeContainer.each(function() {
			$(this).isotope({
				itemSelector: '.isotope-item',
				layoutMode: 'fitRows',
				percentPosition: true,
				animationEngine: 'best-available',
				fitRows: {
					gutter: '.gutter-sizer'
				},
				masonry: {
					columnWidth: '.isotope-item'
				}
			});
		});
	});

	var isotopeButton = $('.filter-tope-group button');

	$(isotopeButton).each(function() {
		$(this).on('click', function() {
			for (var i = 0; i < isotopeButton.length; i++) {
				$(isotopeButton[i]).removeClass('how-active1');
			}

			$(this).addClass('how-active1');
		});
	});

	/*==================================================================
	[ Filter / Search product ]*/
	$('.js-show-filter').on('click', function() {
		$(this).toggleClass('show-filter');
		$('.panel-filter').slideToggle(400);

		if ($('.js-show-search').hasClass('show-search')) {
			$('.js-show-search').removeClass('show-search');
			$('.panel-search').slideUp(400);
		}
	});

	$('.js-show-search').on('click', function() {
		$(this).toggleClass('show-search');
		$('.panel-search').slideToggle(400);

		if ($('.js-show-filter').hasClass('show-filter')) {
			$('.js-show-filter').removeClass('show-filter');
			$('.panel-filter').slideUp(400);
		}
	});




	/*==================================================================
	[ Cart ]*/
	$('.js-show-search-slide').on('click', function() {
		$('.js-panel-cart').addClass('show-header-cart');
	});

	$('.js-hide-search-slide').on('click', function() {
		$('.js-panel-cart').removeClass('show-header-cart');
	});

	/*==================================================================
	[ Cart ]*/
	$('.js-show-sidebar').on('click', function() {
		$('.js-sidebar').addClass('show-sidebar');
	});

	$('.js-hide-sidebar').on('click', function() {
		$('.js-sidebar').removeClass('show-sidebar');
	});

	/*==================================================================
	[ +/- num product ]*/
	$('.btn-num-product-down').on('click', function(e) {
		e.preventDefault();
		var numProduct = Number($(this).next().val());
		if (numProduct == 1) {
			alert('1개 이상만 구매할 수 있습니다');
			return;
		}
		if (numProduct > 1) $(this).next().val(numProduct - 1);
		var deliveryFee = parseInt($('#deliveryFee').text().replace(',', ''));
		var price = parseInt($('#price').text().replace(',', ''));
		var totalPrice = Number($(this).next().val()) * price + deliveryFee;
		totalPrice = totalPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
		//console.log(Number(totalPrice));
		$('#totalPrice').text(totalPrice);

	});

	$('.btn-num-product-up').on('click', function(e) {
		e.preventDefault();
		var numProduct = Number($(this).prev().val());
		if (numProduct == 10) {
			alert('최대 10개까지만 주문가능합니다.');
			return;
		}
		$(this).prev().val(numProduct + 1);
		var deliveryFee = parseInt($('#deliveryFee').text().replace(',', ''));
		var price = parseInt($('#price').text().replace(',', ''));
		var totalPrice = Number($(this).prev().val()) * price + deliveryFee;
		totalPrice = totalPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
		$('#totalPrice').text(totalPrice);
	});

	function updateCart(pNum, pCnt) {
		$.ajax({
				type : 'POST', //POST 방식으로 보낼래
				url : 'cartUpdate.do',
				data : {
					pNum : pNum,
					pCnt : pCnt
				},
				success : function(result) {
					if (result == 1) {
						console.log('적용 성공');
					}
				}
		});
	}

	$('.btn-num-cart-up').each(function() {
		$(this).click(function() {
			var current = $(this).attr('id');
			var numProduct = Number($(this).prev().val());
			if (numProduct == 10) {
				alert('최대 10개까지만 주문가능합니다.');
				return;
			}
			$(this).prev().val(numProduct + 1);

			var price = parseInt($('#price' + current).text().replace(',', ''));
			var salePrice = parseInt($('#salePrice' + current).text().replace(',', ''));
			var totalPrice = (price - salePrice) * Number($(this).prev().val());
			totalPrice = totalPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
			$('#totalPrice' + current).text(totalPrice);

			if ($("input[class='chk" + current + "']").is(":checked")) {
				var sumPrice = parseInt($('#sumPrice').text().replace(',', ''));
				var totalSale = parseInt($('#totalSale').text().replace(',', ''));
				$('#sumPrice').text((sumPrice - (price * numProduct) + (price * Number($(this).prev().val()))).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));
				sumPrice = parseInt($('#sumPrice').text().replace(',', ''));
				totalSale = parseInt($('#totalSale').text().replace(',', ''));
				$('#totalSale').text((totalSale - (salePrice * numProduct) + (salePrice * Number($(this).prev().val()))).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));
				$('#payment').text((sumPrice - totalSale + 2500).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));
			}
			
			
			updateCart(current, Number($(this).prev().val()));
		});
	});

	$('.btn-num-cart-down').each(function() {
		$(this).click(function() {
			var current = $(this).attr('id');
			var numProduct = Number($(this).next().val());

			console.log('현재 : ' + $(this).next().val());

			if (numProduct == 1) {
				alert('1개 이상만 구매할 수 있습니다');
				return;
			}

			$(this).next().val(numProduct - 1);
			console.log('바뀐 후 : ' + $(this).next().val());

			var price = parseInt($('#price' + current).text().replace(',', ''));
			var salePrice = parseInt($('#salePrice' + current).text().replace(',', ''));
			var totalPrice = (price - salePrice) * Number($(this).next().val());
			totalPrice = totalPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
			$('#totalPrice' + current).text(totalPrice);

			if ($("input[class='chk" + current + "']").is(":checked")) {
				var sumPrice = parseInt($('#sumPrice').text().replace(',', ''));
				var totalSale = parseInt($('#totalSale').text().replace(',', ''));
				$('#sumPrice').text((sumPrice - (price * numProduct) + (price * Number($(this).next().val()))).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));
				$('#totalSale').text((totalSale - (salePrice * numProduct) + (salePrice * Number($(this).next().val()))).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));
				var sumPrice = parseInt($('#sumPrice').text().replace(',', ''));
				var totalSale = parseInt($('#totalSale').text().replace(',', ''));
				$('#payment').text((sumPrice - totalSale + 2500).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));
			}
			
			updateCart(current, Number($(this).next().val()));
		});
	});



	/*==================================================================
	[ Rating ]*/
	$('.wrap-rating').each(function() {
		var item = $(this).find('.item-rating');
		var rated = -1;
		var input = $(this).find('input');
		$(input).val(0);

		$(item).on('mouseenter', function() {
			var index = item.index(this);
			var i = 0;
			for (i = 0; i <= index; i++) {
				$(item[i]).removeClass('zmdi-star-outline');
				$(item[i]).addClass('zmdi-star');
			}

			for (var j = i; j < item.length; j++) {
				$(item[j]).addClass('zmdi-star-outline');
				$(item[j]).removeClass('zmdi-star');
			}
		});

		$(item).on('click', function() {
			var index = item.index(this);
			rated = index;
			$(input).val(index + 1);
		});

		$(this).on('mouseleave', function() {
			var i = 0;
			for (i = 0; i <= rated; i++) {
				$(item[i]).removeClass('zmdi-star-outline');
				$(item[i]).addClass('zmdi-star');
			}

			for (var j = i; j < item.length; j++) {
				$(item[j]).addClass('zmdi-star-outline');
				$(item[j]).removeClass('zmdi-star');
			}
		});
	});


	/*==================================================================
	[ QuickView ]*/
	$('.js-show-quickview').on('click', function(e) {
		e.preventDefault();
		$('.js-quickView').addClass('show-modal1');
	});

	$('.js-hide-quickView').on('click', function() {
		$('.num-product').val(1);
		$('.js-quickView').removeClass('show-modal1');
	});

	$('.js-show-quickview').each(function() {
		var pNum = $(this).parent().parent().find('.js-name-b2').prop("id");
		$(this).on('click', function() {
			$.ajax({
				type: 'POST',
				url: 'quickView.do',
				async: false,
				dataType: 'json',
				data: {
					pNum: pNum,
				},
				success: function(data) {
					$('.pName').html(data.pName);
					$(".pImg-img").attr("src", data.pImg);
					$(".pImg-a").attr("href", data.pImg);
					$('.fixPrice').html(data.fixPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));
					$('.selPrice').html(data.selPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));
					$('.totalPrice').html((data.selPrice + 2500).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));
					$('.rePerson').html(data.rePerson);
					$('.reAge').html(data.reAge);
					$('.pName').html(data.pName);
					$('.dib-btn').val(data.dib);
					$('.cart-btn').attr("id", data.pNum);
					$('.dib-btn').attr("id", data.pNum);
					console.log("isDib? : " + $('.dib-btn').val());
				}
			});
		});
	});


	/*========================= [ 찜 ] ==============================*/
	$('.js-addwish-b2').on('click', function(e) {
		e.preventDefault();
	});

	$('.js-addwish-b2').each(function() {
		var nameProduct = $(this).parent().parent().find('.js-name-b2').html();
		var pNum = $(this).parent().parent().find('.js-name-b2').prop("id");
		$(this).on('click', function() {
			console.log(pNum);
			if ($(this).hasClass('js-addedwish-b2')) {
				$.ajax({
					type: 'POST',
					url: 'dibDelete',
					data: {
						pNum: pNum
					},
					context: this,
					success: function(result) {
						if (result == 1) {
							$(this).removeClass('js-addedwish-b2');
						}
					}
				});
			} else {
				$.ajax({
					type: 'POST', //POST 방식으로 보낼래
					url: 'dibInsert',
					data: {
						pNum: pNum
					},
					context: this,
					success: function(result) {
						if (result == 1) {
							swal(nameProduct, "찜 목록에 추가되었습니다!", "success");
							$(this).addClass('js-addedwish-b2');
						} else {
							alert("찜 추가 실패. 관리자에게 문의하세요.");
						}
					}
				})
			}
		});
	});

	/*========================= [ QuickView 찜 ] ==============================*/
	$('.js-addcart-quickView').off('click').on('click', function() {
		var nameProduct = $(this).parent().parent().parent().parent().find('.js-name-detail').html();
		var pNum = $(this).prop("id");
		var pCnt = $(this).parent().parent().parent().find('.num-product').val();
		console.log(pNum);
		console.log($('.num-product').val());

		$.ajax({
			type: 'POST', //POST 방식으로 보낼래
			url: 'cartInsertOne.do',
			data: {
				pNum: pNum,
				pCnt: pCnt
			},
			success: function(result) {
				if (result == 1) {
					swal(nameProduct, "장바구니에 추가되었습니다!", "success");
				}
				else {
					alert("장바구니 추가 실패. 관리자에게 문의하세요.");
				}
			}
		});
	});


	$('.js-addwish-quickView').off('click').on('click', function() {
		var nameProduct = $(this).parent().parent().parent().parent().find('.js-name-detail').html();
		var pNum = $(this).prop("id");
		var isDib = $(this).val();

		console.log("pNum : " + pNum);
		if (isDib == 1) {
			swal(nameProduct, "이미 찜한 상품입니다.", "warning");
		} else {
			$.ajax({
				type: 'POST', //POST 방식으로 보낼래
				url: 'dibInsert',
				async: false,
				data: {
					pNum: pNum
				},
				context: this,
				success: function(result) {
					if (result == 1) {
						//현재 페이지에서 상품목록 부분만 새로고침
						$(this).val(1);
						$('#md-product').load(location.href + ' #md-product>*', function() {
							$.getScript("../js/main.js", function() {
								initIsotope();
							});
						});
						swal(nameProduct, "찜 목록에 추가되었습니다!", "success");
					}
					else if (result == -1) {
						alert("로그인이 필요한 서비스입니다.");
					}
					else {
						alert("찜 추가 실패. 관리자에게 문의하세요.");
					}
				}
			})
		}

	})

	$('.js-addwish-detail').off('click').on('click', function() {
		//var nameProduct = $(this).parent().parent().parent().parent().find('.js-name-detail').html();
		//var pNum = $(this).prop("id");
		var isDib = $(this).val();

		console.log("pNum : " + pNum);
		if (isDib == 1) {
			swal(pName, "이미 찜한 상품입니다.", "warning");
		} else {
			$.ajax({
				type: 'POST', //POST 방식으로 보낼래
				url: 'dibInsert',
				async: false,
				data: {
					pNum: pNum
				},
				context: this,
				success: function(result) {
					if (result == 1) {
						swal(pName, "찜 목록에 추가되었습니다!", "success");
						$(this).val(1);
					}
					else if (result == -1) {
						alert("로그인이 필요한 서비스입니다.");
					}
					else {
						alert("찜 추가 실패. 관리자에게 문의하세요.");
					}
				}
			})
		}

	})


	/*========================= [ cart Detail ] ==============================*/
	$('.js-addcart-detail').off('click').on('click', function() {
		var pCnt = $(this).parent().parent().parent().find('.num-product').val();
		console.log("pNum : " + pNum);
		console.log(pCnt);

		$.ajax({
			type: 'POST', //POST 방식으로 보낼래
			url: 'cartInsertOne.do',
			data: {
				pNum: pNum,
				pCnt: pCnt
			},
			success: function(result) {
				if (result == 1) {
					swal(pName, "장바구니에 추가되었습니다!", "success");
				}
				else {
					alert("장바구니 추가 실패. 관리자에게 문의하세요.");
				}
			}
		});
	});


})(jQuery);