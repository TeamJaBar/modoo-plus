<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html lang="en">
<head>
<title>제품상세</title>
<style>

/* 판매가 */
.item_detail_list .item_price {
	margin: -2px 0 0 0;
	font-size: 15px !important;
	font-weight: bold !important;
}

/* 상품 총 가격 */
.item_price_cont {
	text-align: right;
}

.item_tatal_box {
	float: right;
	width: 225px;
	padding: 20px 0 0 0;
}

.item_tatal_box dl {
	width: 100%;
	padding: 0 0 5px 0;
	font-size: 0;
}

.item_tatal_box dt {
	display: inline-block;
	width: 100px;
	font-size: 12px;
}

.item_tatal_box dd {
	display: inline-block;
	width: 125px;
	font-size: 14px;
}
/* 총 상품금액 */
.item_tatal_box .total_goods {
	
}
/* 총 할인금액 */
.item_tatal_box .total_discount dd {
	color: #999999;
}
/* 총 합계급액 */
.item_tatal_box .total_amount {
	margin: 15px 0 0 0;
	padding-top: 10px;
	border-top: 1px solid #dbdbdb;
}

.item_tatal_box .total_amount dt {
	font-size: 16px;
	font-weight: bold;
}

.item_tatal_box .total_amount dd {
	color: #212121;
	font-weight: bold;
}

.item_tatal_box .total_amount dd strong {
	font-size: 20px;
}

/* 상품상세정보, 배송안내, 교환 및 반품안내, 상품후기, 상품문의 */
.item_goods_sec {
	position: relative;
	margin: 100px 0 0 0;
}

.item_goods_sec .detail_cont, .item_goods_sec .delivery_cont, .item_goods_sec .exchange_cont, .item_goods_sec .reviews_cont, .item_goods_sec .qna_cont {
	position: relative;
	min-height: 200px;
}

.item_goods_sec h3 {
	padding: 45px 0 10px 0;
	font-size: 18px;
}

.item_goods_sec .admin_msg {
	min-height: 100px;
	line-height: 1.5;
}

.item_goods_sec .admin_msg>p {
	margin-bottom: 3px;
}

/* 상품 정보내용 탭 */
.item_goods_tab {
	padding: 80px 0 0 0;
	border-bottom: 1px solid #bbbbbb;
}

.item_goods_tab ul {
	float: none;
	width: 870px;
	height: 42px;
	margin: 0 auto;
	padding: 16px 0 0 0;
	font-size: 0;
}

.item_goods_tab li {
	float: left;
	position: relative;
	width: 174px;
	font-size: 12px;
	text-align: center;
	z-index: 10;
}

.item_goods_tab li.on {
	margin-top: -16px;
	z-index: 20;
}

.item_goods_tab li a {
	display: block;
	margin: 0 0 0 -1px;
	padding: 10px 0 12px 0;
	color: #999999;
	font-size: 13px;
	border: 1px solid #dadada;
	border-bottom: 1px solid #bbbbbb;
	background: #ffffff;
}

.item_goods_tab li.on a {
	padding-top: 18px;
	margin-top: 8px;
	color: #333333;
	font-weight: bold;
	border: 1px solid #bbbbbb;
	border-bottom: 1px solid #ffffff;
	border-top: 2px solid #181818
}

.item_goods_tab li.on a span {
	display: inline-block;
	position: relative;
	top: -3px;
}

.item_goods_tab li:first-child a {
	margin-left: 0;
}

.item_goods_tab li a strong {
	color: #212121;
}

/* 상품상세보기 */
.item_goods_sec .detail_explain_box {
	min-height: 100px;
	text-align: center;
}

/* 상품필수 정보 */
.datail_table {
	
}

.left_table_type {
	width: 100%;
	border: 0;
	border-spacing: 0;
	border-collapse: collapse;
}

.left_table_type th {
	padding: 10px 10px 10px 14px;
	color: #555555;
	border: 1px solid #dbdbdb;
	background: #f9f9f9;
	text-align: left;
}

.left_table_type td {
	padding: 10px 10px 10px 18px;
	border: 1px solid #dbdbdb;
	text-align: left;
}

/* 관련상품 */
.item_goods_sec .detail_explain_box {
	min-height: 100px;
}

.item_goods_sec .detail_explain_box .goods_list_cont {
	margin-top: -40px;
}
</style>
<%@include file="common//header.jsp"%>
<!-- breadcrumb -->
<div class="container">
	<div class="bread-crumb flex-w p-l-25 p-r-15 p-t-30 p-lr-0-lg">
		<a href="main.do" class="stext-109 cl8 hov-cl1 trans-04"> Home <!-- <i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i> -->
		</a>
		<!-- 대분류 게임 눌렀을 때 넘어가는 페이지 -->
		<c:if test="${category.cateL!=null}">
			<a href="product.do?cateNum=${category.cateNum}" class="stext-109 cl8 hov-cl1 trans-04"> <i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i> ${category.cateL}
			</a>
		</c:if>
		<c:if test="${category.cateM!=null}">
			<a href="product.do?cateNum=${category.cateNum}" class="stext-109 cl8 hov-cl1 trans-04"> <i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i> ${category.cateM}
			</a>
		</c:if>
		<%-- <span class="stext-109 cl4">
			${category.cateM}
		</span> --%>
	</div>
</div>
<!-- Product Detail -->
<section class="sec-product-detail bg0 p-t-65 p-b-60">
	<div class="container">
		<div class="row">
			<div class="col-md-6 col-lg-7 p-b-30">
				<div class="p-l-25 p-r-30 p-lr-0-lg">
					<div class="wrap-slick3 flex-sb flex-w">
						<div class="wrap-slick3-dots"></div>
						<div class="wrap-slick3-arrows flex-sb-m flex-w"></div>
						<div class="slick3 gallery-lb">
							<div class="item-slick3" data-thumb="${product.pImg}">
								<div class="wrap-pic-w pos-relative">
									<img src="${product.pImg}" alt="${product.pName}"> <a class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04" href="${product.pImg}"> <i class="fa fa-expand"></i>
									</a>
								</div>
							</div>

							<div class="item-slick3" data-thumb="${product.pImg}">
								<div class="wrap-pic-w pos-relative">
									<img src="${product.pImg}" alt="${product.pName}"> <a class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04" href="${product.pImg}"> <i class="fa fa-expand"></i>
									</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-6 col-lg-5 p-b-30">
				<div class="p-r-50 p-t-5 p-lr-0-lg item_detail_tit">
					<h4 class="mtext-105 cl2 js-name-detail p-b-14">${product.pName}</h4>
					<hr>
					<table class="item_detail_list">
						<tr>
							<td>정가</td>
							<td colspan="2"><del>
									<span id="fixPrice"> <fmt:formatNumber value="${product.fixPrice}" type="number" />
									</span> 원
								</del></td>
						</tr>
						<tr>
							<td>판매가</td>
							<td colspan="2" class="item_price"><span id="price" class="selPrice"> <fmt:formatNumber value="${product.selPrice}" type="number" />
							</span> 원</td>
						</tr>
						<tr>
							<td>게임 인원</td>
							<td colspan="2">${product.rePerson}</td>
						</tr>
						<tr>
							<td>게임 연령</td>
							<td colspan="2">${product.reAge}세이상</td>
						</tr>
						<tr>
							<td>배송비</td>
							<td colspan="2"><strong id="deliveryFee">2,500원</strong></td>
						</tr>
						<tr>
							<td>
								<div class="wrap-num-product flex-w m-tb-10 m-l-30">
									<div class="btn-num-product-down cl8 hov-btn3 trans-04 flex-c-m">
										<i class="fs-16 zmdi zmdi-minus"></i>
									</div>
									<input class="mtext-104 cl3 txt-center num-product" type="number" name="pCnt" value="1" readonly>
									<div class="btn-num-product-up cl8 hov-btn3 trans-04 flex-c-m ">
										<i class="fs-16 zmdi zmdi-plus"></i>
									</div>
								</div>
							</td>
							<td>결제 예정금액</td>
							<td><span id="totalPrice" class="totalPrice"> <fmt:formatNumber value="${product.selPrice+2500}" type="number" />
							</span> 원</td>
						</tr>
					</table>
					<hr>
					<div class="p-t-33">
						<div class="row flex-c">
							<button class="flex-c-m m-r-10 stext-120 cl14 size-126 bg0 bor21 hov-btn4 p-lr-15 trans-04 js-addcart-detail cart-btn">장바구니</button>
							<button class="flex-c-m m-lr-10 stext-120 cl14 size-126 bg0 bor21 hov-btn4 p-lr-15 trans-04 js-addwish-detail dib-btn" value="${product.dib}">찜하기</button>
							<button class="flex-c-m m-l-10 stext-120 cl0 size-101 bg1 bor20 hov-btn1 p-lr-15 trans-04 ">결제하기</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="bor18 m-t-50 p-t-43 p-b-40">
		<!-- Tab01 -->
		<div class="tab01">
			<!-- Nav tabs -->
			<ul class="nav nav-tabs" role="tablist">
				<li class="nav-item p-b-10"><a class="nav-link active" data-toggle="tab" href="#description" role="tab">제품소개</a></li>
				<li class="nav-item p-b-10"><a class="nav-link" data-toggle="tab" href="#delivery" role="tab">배송정보</a></li>
			</ul>
			<!-- Tab panes -->
			<div class="tab-content p-t-43">
				<!-- - -->
				<div class="tab-pane fade show active" id="description" role="tabpanel">
					<div class="how-pos2 flex-c  p-lr-15-md">
						<p class="stext-102 cl6">
							<img src="${product.infoImg}" alt="${product.pName} 상세정보 이미지">
						</p>
					</div>
				</div>
				<div class="tab-pane fade" id="delivery" role="tabpanel">
					<div class="row">
						<div class="col-sm-10 col-md-8 col-lg-6 m-lr-auto flex-c ">
							<div class="p-b-30 m-lr-15-sm">
								<!-- Delivery -->
								<div class="delivery_cont">
									<h3 class="ltext-102 m-t-40">배송안내</h3>
									<div class="admin_msg">
										<p>
											<img title="f635a4941f370667.jpg" class="js-smart-img" src="https://cdn-pro-web-251-104.cdn-nhncommerce.com/boardgtr9139_godomall_com/data/editor/policy/f635a4941f370667.jpg"> &nbsp;
										</p>
									</div>
									<!-- 
										<h3 class="ltext-102 m-t-40">교환/반품안내</h3>
										<div class="admin_msg">
											<p>
												<img title="c0cea98465607ade.jpg" class="js-smart-img"
													src="https://cdn-pro-web-251-104.cdn-nhncommerce.com/boardgtr9139_godomall_com/data/editor/policy/c0cea98465607ade.jpg">&nbsp;
											</p>
										</div>
										<h3 class="ltext-102 m-t-40">환불안내</h3>
										<div class="admin_msg">
											<p>
												<img
													src="https://cdn-pro-web-251-104.cdn-nhncommerce.com/boardgtr9139_godomall_com/data/editor/policy/200706/delivery3_112721.jpg"
													title="delivery3_112721.jpg" class="js-smart-img"><br
													style="clear: both;">&nbsp;
											</p>
										</div>
										-->
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<%@include file="common//footer.jsp"%>
<script>
	var pName = '${product.pName}';
	var pNum = '${product.pNum}';
	
	function order(pNum, pCnt) {
		location.href = "shOrder.do?pNum=${product.pNum}&pcnt=${pCnt}"
	}

	function addDib(pNum) {
		location.href = "dib.do?pNum=${product.pNum}"
	}

	function addCart(pNum) {
		location.href = "shopping.do?pNum=${product.pNum}&pcnt=${product.pNum}"
	}
</script>
<!--===============================================================================================-->
<script src="../vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
<script src="../vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
<script src="../vendor/bootstrap/js/popper.js"></script>
<script src="../vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
<script src="../vendor/select2/select2.min.js"></script>
<script>
	$(".js-select2").each(function() {
		$(this).select2({
			minimumResultsForSearch : 20,
			dropdownParent : $(this).next('.dropDownSelect2')
		});
	})
</script>
<!--===============================================================================================-->
<script src="../vendor/daterangepicker/moment.min.js"></script>
<script src="../vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
<script src="../vendor/slick/slick.min.js"></script>
<script src="../js/slick-custom.js"></script>
<!--===============================================================================================-->
<script src="../vendor/parallax100/parallax100.js"></script>
<script>
	$('.parallax100').parallax100();
</script>
<!--===============================================================================================-->
<script src="../vendor/MagnificPopup/jquery.magnific-popup.min.js"></script>
<script>
	$('.gallery-lb').each(function() { // the containers for all your galleries
		$(this).magnificPopup({
			delegate : 'a', // the selector for gallery item
			type : 'image',
			gallery : {
				enabled : true
			},
			mainClass : 'mfp-fade'
		});
	});
</script>
<!--===============================================================================================-->
<script src="../vendor/isotope/isotope.pkgd.min.js"></script>
<!--===============================================================================================-->
<script src="../vendor/sweetalert/sweetalert.min.js"></script>
<script>
	$('.js-addwish-b2, .js-addwish-detail').on('click', function(e) {
		e.preventDefault();
	});

	$('.js-addwish-b2').each(function() {
		var nameProduct = $(this).parent().parent().find('.js-name-b2').html();
		$(this).on('click', function() {
			swal(nameProduct, "is added to wishlist !", "success");

			$(this).addClass('js-addedwish-b2');
			$(this).off('click');
		});
	});

	$('.js-addwish-detail').each(function() {
		var nameProduct = $(this).parent().parent().parent().find('.js-name-detail').html();

		$(this).on('click', function() {
			swal(nameProduct, "is added to wishlist !", "success");

			$(this).addClass('js-addedwish-detail');
			$(this).off('click');
		});
	});

	/*---------------------------------------------*/

	$('.js-addcart-detail').each(function() {
		var nameProduct = $(this).parent().parent().parent().parent().find('.js-name-detail').html();
		$(this).on('click', function() {
			swal(nameProduct, "is added to cart !", "success");
		});
	});
</script>
<!--===============================================================================================-->
<script src="../vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<script>
	$('.js-pscroll').each(function() {
		$(this).css('position', 'relative');
		$(this).css('overflow', 'hidden');
		var ps = new PerfectScrollbar(this, {
			wheelSpeed : 1,
			scrollingThreshold : 1000,
			wheelPropagation : false,
		});

		$(window).on('resize', function() {
			ps.update();
		})
	});
</script>
<!--===============================================================================================-->
<script src="../js/main.js"></script>
<!-- ============================================================================================== -->
<script>
	$(function() {
		$("div").slice(0, 10).show(); // 최초 10개 선택
		$("#load").click(function(e) { // Load More를 위한 클릭 이벤트e
			e.preventDefault();
			$("div:hidden").slice(0, 10).show(); // 숨김 설정된 다음 10개를 선택하여 표시
			if ($("div:hidden").length == 0) { // 숨겨진 DIV가 있는지 체크
				alert("더 이상 항목이 없습니다"); // 더 이상 로드할 항목이 없는 경우 경고
			}
		});

		var price = parseInt($('#price' + current).text().replace(',', ''));
		var totalPrice = (price + 2500)
		totalPrice = totalPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
		$('#totalPrice').text(totalPrice);
	});
</script>
</body>
</html>