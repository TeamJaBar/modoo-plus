<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="modoo" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>검색 결과</title>
<style>
.gutter-sizer {
	width: 12%;
}

.order-wrap {
	width: 593px;
	margin: 20px auto 40px auto;
}

.order-agreement-wrap .order-title {
	overflow: hidden;
	border-bottom: 1px solid #999999;
}

.order-title h2 {
	font-size: 28px;
	margin: 0 0 20px 0;
	font-weight: bold;
}

.order-ok-box .order-ok-title {
	text-align: center;
	background: url(images/img_order_ok.png) no-repeat center 0;
	padding: 50px 0 0 0;
}

.order-ok-box .order-ok-title p {
	padding: 20px 0 20px 0;
	color: #989898;
	letter-spacing: -0.5px;
}

.order-ok-box .order-ok-title p span {
	font-weight: bold;
	color: #222222;
}

.order-ok-box .order-ok-title.complete {
	padding: 20px 0 0 0;
	font-size: 18px;
	color: #222222;
}

.order-ok-box .order-ok-titlep {
	padding: 20px 0 20px 0;
	color: #989898;
	letter-spacing: -0.5px;
}

.order-ok-box .order-ok-title.complete strong {
	font-weight: bold;
}

.order-ok-box .order-ok-titlep span {
	font-weight: bold;
	color: #222222;
}

.order-ok-box .btn-order-section {
	border-top: 1px solid #dbdbdb;
}

.order-ok-box .btn-order-section ul {
	overflow: hidden;
	margin: 20px 0 0 0;
	text-align: center;
	font-size: 0;
}

.order-ok-box .btn-order-section li:first-child {
	margin: 0;
}

.order-ok-box .btn-order-section li {
	display: inline-block;
	margin: 0 0 0 10px;
}

.order-ok-box .btn-order-section li button {
	width: 150px;
	height: 42px;
	border: 1px solid #cccccc;
	background: #fff;
	color: #3e3d3c;
	font-weight: bold;
	font-size: 13px;
	cursor: pointer;
}

.order-ok-box .btn-order-section .btn-login {
	background: #181818;
	border: 1px solid #181818;
	color: #fff;
}

.table-shopping-cart .table_head th {
	font-family: Poppins-Bold;
	font-size: 10px;
	color: #555;
	text-transform: uppercase;
	line-height: 1.6;
	padding-top: 15px;
	padding-bottom: 15px;
}

.order-content .btn-center-box, .order-warning+.btn-center-box {
	margin: 35px 0 0 0;
}

.order-content {
	padding: 70px 60px;
	border: 1px solid #dbdbdb;
}

.order-ok-box .btn-order-section {
	border-top: 1px solid #dbdbdb
}

.search_result {
	width: 100%;
	text-align: center;
	font-size: 25px;
	font-family: 'GmarketSansMedium';
}
</style>
<%@include file="common/header.jsp"%>
<!-- Product -->
<section class="bg0 p-t-23 p-b-140" id="md-product">
	<div class="container">
		<div class="p-b-10 m-tb-30">
			<h3 class="stext-119">
				<c:if test="${param.pName != ''}">
					<span class="mtext-105 cl13">'${param.pName}'</span>
				</c:if>
				검색 결과
			</h3>
		</div>
		<c:if test="${fn:length(rList) == 0}">
			<div class="search_result">검색결과가 없습니다.</div>
		</c:if>
		<c:if test="${fn:length(rList)!=0 }">
			<div class="row isotope-grid flex-sa">
				<div class="gutter-sizer"></div>
				<c:forEach var="product" items="${rList}">
					<div class="col-sm-5 col-md-5 col-lg-3 p-b-35 isotope-item">
						<!-- Block2 -->
						<div class="block2">
							<div class="block2-pic hov-img0">
								<img src="${product.pImg}" width="180" alt="${product.pName}">
								<a href="#" class="block2-btn flex-c-m stext-103 cl2 size-102 bg0 bor2 hov-btn3 p-lr-15 trans-04 js-show-quickview"> Quick View </a>
							</div>
							<div class="block2-txt flex-w flex-t p-t-14">
								<div class="block2-txt-child1 flex-col-l ">
									<a href="productDetail.do?pNum=${product.pNum}" id="${product.pNum}" class="stext-121 cl4 hov-cl1 trans-04 js-name-b2 p-b-6"> ${product.pName} </a>
									<span class="stext-105 cl3">
										<fmt:formatNumber value="${product.selPrice}" type="number" />
										&#8361;
									</span>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</c:if>
	</div>
</section>
<%@include file="common/footer.jsp"%>
<!--QuickView Modal -->
<div class="wrap-modal1 js-quickView p-t-60 p-b-20">
	<div class="overlay-modal1 js-hide-quickView"></div>
	<div class="container">
		<div class="bg0 p-t-60 p-b-30 p-lr-15-lg how-pos3-parent">
			<button class="how-pos3 hov3 trans-04 js-hide-quickView">
				<img src="/ModooShop/images/icons/icon-close.png" alt="CLOSE">
			</button>
			<div class="row">
				<div class="col-md-6 col-lg-7 p-b-30">
					<div class="p-l-25 p-r-30 p-lr-0-lg">
						<div class="wrap-slick3 flex-sb flex-w">
							<div class="gallery-lb">
								<div class="pImg-div">
									<div class="wrap-pic-w pos-relative m-l-30">
										<img src="" class="pImg-img">
										<a class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04 pImg-a" href="">
											<i class="fa fa-expand"></i>
										</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-6 col-lg-5 p-b-30">
					<div class="p-r-50 p-t-5 p-lr-0-lg item_detail_tit">
						<h4 class="mtext-105 cl2 js-name-detail p-b-14 pName"></h4>
						<hr>
						<table class="item_detail_list">
							<tr>
								<td>정가</td>
								<td colspan="2">
									<span class="fixPrice"></span>
									원
								</td>
							</tr>
							<tr>
								<td>판매가</td>
								<td colspan="2" class="item_price">
									<span id="price" class="selPrice"></span>
									원
								</td>
							</tr>
							<tr>
								<td>게임 인원</td>
								<td colspan="2" class="rePerson"></td>
							</tr>
							<tr>
								<td>게임 연령</td>
								<td colspan="2" class="reAge"></td>
							</tr>
							<tr>
								<td>배송비</td>
								<td colspan="2">
									<strong id="deliveryFee">2,500</strong>
								</td>
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
								<td>
									<span id="totalPrice" class="totalPrice"></span>
									원
								</td>
							</tr>
						</table>
						<hr>
						<!--  -->
						<div class="p-t-33">
							<div class="row flex-c">
								<button class="flex-c-m m-r-10 stext-106 cl2 size-126 bg0 bor20 hov-btn3 p-lr-15 trans-04 js-addcart-quickView cart-btn">장바구니</button>
								<button class="flex-c-m m-lr-10 stext-106 cl2 size-126 bg0 bor20 hov-btn3 p-lr-15 trans-04 js-addwish-quickView dib-btn">찜하기</button>
								<button class="flex-c-m m-l-10 stext-106 cl0 size-101 bg1 bor20 hov-btn1 p-lr-15 trans-04 ">결제하기</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
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
</body>
</html>