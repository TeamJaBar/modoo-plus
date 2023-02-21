<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html lang="en">
<head>
<title>장바구니</title>
<link rel="stylesheet" type="text/css" href="../css/shopping-cart.css">
<%@include file="common/header.jsp"%>
<!-- Title page -->
<section class="bg-img1 txt-center p-lr-15 p-tb-92" style="background-image: url('../images/bg-img-01.png');">
	<h2 class="ltext-105 cl0 txt-center">장바구니</h2>
</section>
<!-- Shoping Cart -->
<section class="bg0 p-t-62 p-b-60">
	<form class="bg0 p-t-75 p-b-85" action="order.do" method="get">
		<div class="container">
			<div class="row">
				<div class="col-lg-10 col-xl-7 m-lr-auto m-b-50">
					<div class="m-l-25 m-r--38 m-lr-0-xl">
						<div class="wrap-table-shopping-cart">
							<table class="table-shopping-cart">
								<tr class="table_head">
									<th class="column-1">선택</th>
									<th class="column-2">상품</th>
									<th class="column-3">상품 / 할인 금액</th>
									<th class="column-4">수량</th>
									<th class="column-5">합계금액</th>
								</tr>
								<c:if test="${fn:length(cart) == 0}">
									<c:set var="deliveryFee" value="0" />
									<tr class="cartTable_row">
										<td colspan="5" class="empty">장바구니에 담긴 상품이 없습니다.</td>
									</tr>
								</c:if>
								<c:if test="${fn:length(cart) != 0 }">
									<c:set var="sumPrice" value="0" />
									<c:set var="totalSale" value="0" />
									<c:set var="deliveryFee" value="2500" />
									<c:forEach var="cart" items="${cart}">
										<c:set var="sumPrice" value="${sumPrice+cart.fixPrice*cart.pCnt}" />
										<c:set var="totalSale" value="${totalSale+((cart.fixPrice-cart.selPrice)*cart.pCnt)}" />
										<tr class="cartTable_row">
											<td class="column-1">
												<input type="checkbox" class="chk${cart.pNum}" id="chk" name="chk" value="${cart.pNum}" checked />
											</td>
											<td class="column-2">
												<img src="${cart.pImg}" alt="${cart.pName}" style="width: 90px; height: 70px;">
											</td>
											<td class="column-3">
												<span id="price${cart.pNum}">
													<fmt:formatNumber value="${cart.fixPrice}" type="number" />
												</span>
												원<br>
												<span style="font-size: 10px;">
													/
													<span id="salePrice${cart.pNum}">
														<fmt:formatNumber value="${cart.fixPrice - cart.selPrice}" type="number" />
													</span>
													원
												</span>
											</td>
											<td class="column-4">
												<div class="wrap-num-product flex-c m-tb-10 m-l-10">
													<div class="btn-num-cart-down cl8 hov-btn3 trans-04 flex-c-m">
														<i class="fs-16 zmdi zmdi-minus"></i>
													</div>
													<input id="pCnt${cart.pNum}" class="mtext-104 cl3 txt-center num-product" type="number" name="num-product" value="${cart.pCnt}" readonly>
													<div class="btn-num-cart-up cl8 hov-btn3 trans-04 flex-c-m ">
														<i class="fs-16 zmdi zmdi-plus"></i>
													</div>
												</div>
											</td>
											<td class="column-5">
												<span id="totalPrice${cart.pNum}">
													<fmt:formatNumber value="${cart.selPrice * cart.pCnt}" type="number" />
												</span>
												원<br>
											</td>
										</tr>
									</c:forEach>
								</c:if>
							</table>
						</div>
						<div class="flex-w flex-c m-t-50 p-lr-15-sm">
							<div class="flex-c-m stext-106 cl2 size-119 bg8 bor13 hov-btn3 p-lr-15 trans-04 pointer" onclick="del()">선택 상품 삭제</div>
						</div>
					</div>
				</div>
				<div class="col-sm-10 col-lg-7 col-xl-5 m-lr-auto m-b-50 receipt">
					<div class="bor10 p-lr-40 p-t-30 p-b-40 m-l-63 m-r-40 m-lr-0-xl p-lr-15-sm">
						<h4 class="mtext-115 cl2 p-b-30 receipt-title">최종 결제 금액</h4>
						<div class="flex-w flex-t bor12 p-b-13 m-lr-10">
							<div class="size-210">
								<span class="stext-121 cl2" style="font-size: 12px;"> 총 상품금액: </span>
							</div>
							<div class="size-210">
								<span class="mtext-114 cl2 price-area">
									<span id="sumPrice">
										<fmt:formatNumber value="${sumPrice}" type="number" />
									</span>
									원
								</span>
							</div>
							<div class="size-210">
								<span class="stext-121 cl2" style="font-size: 12px;"> 할인금액: </span>
							</div>
							<div class="size-210">
								<span class="mtext-114 cl2  price-area">
									-
									<span id="totalSale">
										<fmt:formatNumber value="${totalSale}" type="number" />
									</span>
									원
								</span>
							</div>
							<div class="size-210">
								<span class="stext-121 cl2" style="font-size: 12px;"> 배송비: </span>
							</div>
							<div class="size-210">
								<span class="mtext-114 cl2  price-area">
									<span id="deliveryFee">
										<fmt:formatNumber value="${deliveryFee}" type="number" />
									</span>
									원
								</span>
							</div>
						</div>
						<div class="flex-w flex-t p-t-27 p-b-33 m-lr-10">
							<div class="size-210">
								<span class="mtext-114 cl2">합계</span>
							</div>
							<div class="size-210 p-t-1">
								<span class="mtext-114 cl2  price-area">
									<span id="payment">
										<fmt:formatNumber value="${sumPrice - totalSale + deliveryFee}" type="number" />
									</span>
									원
								</span>
							</div>
						</div>
						<c:if test="${mId == null}">
							<button class="flex-c-m stext-106 cl0 size-116 bg3 bor14 hov-btn3 p-lr-15 trans-04 pointer" onclick="location.href='login.jsp'">선택 상품 주문</button>
							<div>&nbsp;</div>
							<button class="flex-c-m stext-106 cl0 size-116 bg3 bor14 hov-btn3 p-lr-15 trans-04 pointer" id="all" onclick="location.href='login.jsp'">전체 상품 주문</button>
						</c:if>
						<c:if test="${mId != null}">
							<button type="submit" class="flex-c-m stext-106 cl0 size-116 bg3 bor14 hov-btn3 p-lr-15 trans-04 pointer" onclick="return check()">선택 상품 주문</button>
							<div>&nbsp;</div>
							<button type="submit" class="flex-c-m stext-106 cl0 size-116 bg3 bor14 hov-btn3 p-lr-15 trans-04 pointer" id="all" onclick="allselect()">전체 상품 주문</button>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</form>
</section>
<%@include file="common/footer.jsp"%>
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
<script src="../vendor/MagnificPopup/jquery.magnific-popup.min.js"></script>
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
<script>
	/*==========체크 변경=========== */
	$("input[name='chk']").each(function() {
		//var totalPrice = (price - salePrice) * cnt;
		$(this).on('change', function() {
			var chkProduct = new Array();

			$("input[name='chk']:checked").each(function() {
				var items = $(this).val();
				chkProduct.push(items);

			});

			if (chkProduct.length == 0) {
				$('#deliveryFee').text(0);
			} else {
				$('#deliveryFee').text('2,500');
			}

			var current = $(this).val();
			var price = parseInt($('#price' + current).text().replace(',', ''));
			var salePrice = parseInt($('#salePrice' + current).text().replace(',', ''));
			var pCnt = $('#pCnt' + current).val();
			var sumPrice = parseInt($('#sumPrice').text().replace(',', ''));
			var totalSale = parseInt($('#totalSale').text().replace(',', ''));
			var deliveryFee = parseInt($('#deliveryFee').text().replace(',', ''));

			if ($(this).is(":checked")) {
				console.log(current);
				console.log(price);
				console.log(salePrice);
				console.log(pCnt);
				console.log((price * pCnt));
				$('#sumPrice').text((sumPrice + (price * pCnt)).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));
				$('#totalSale').text((totalSale + salePrice * pCnt).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));

				var sumPrice = parseInt($('#sumPrice').text().replace(',', ''));
				var totalSale = parseInt($('#totalSale').text().replace(',', ''));
				$('#payment').text((sumPrice - totalSale + deliveryFee).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));
			} else {
				$('#sumPrice').text((sumPrice - (price * pCnt)).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));
				$('#totalSale').text((totalSale - salePrice * pCnt).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));

				var sumPrice = parseInt($('#sumPrice').text().replace(',', ''));
				var totalSale = parseInt($('#totalSale').text().replace(',', ''));
				var deliveryFee = parseInt($('#totalSale').text().replace(',', ''));
				$('#payment').text((sumPrice - totalSale + deliveryFee).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));
			}
		});
	})

	/* 수량 변경 시 cart에 저장 */
	$('.btn-num-cart-down, .btn-num-cart-up').each(function() {
		$(this).click(function() {
			let input = $(this).parent().find("input"); // 클릭한 요소의 부모 중 input인 요소
			let pNum = input.prop('id').slice(4); // "pCntxxx" > 4번 인덱스부터 끝까지만 남김 > xxx = pNum
			let pCnt = input.val(); // pCnt
			console.log(pNum);
			console.log(pCnt);

			$.ajax({
				type : 'POST', //POST 방식으로 보낼래
				url : 'cartUpdate',
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
		});
	});

	/* 선택한 상품 삭제 */
	function del() {
		console.log('삭제');
		var arProduct = new Array();

		$("input[name='chk']:checked").each(function() {
			var item = $(this).val();
			console.log(item);
			arProduct.push(item);
		})

		console.log('arProduct: ' + arProduct);

		if (arProduct.length < 1) {
			alert("선택한 상품이 없습니다.");
			return;
		} else {
			if (confirm("정말 삭제하시겠습니까?")) {
				$.ajax({
					type : 'POST',
					url : 'cartDelete',
					traditional : true,
					data : {
						arProduct : arProduct
					},
					success : function(result) {
						if (result == 1) {
							// location.href + ' 선택자' : 경로와 선택자 사이에 공백 필수!
							$('.row').load(location.href + ' .row > *');
							alert("삭제되었습니다.");
						}
					}
				});
			} else {
				alert("취소되었습니다.");
			}
		}
	}

	/* 선택 상품 주문 */
	function check() {
		if ($("#chk").is(":checked") == true) {
			console.log($(".chk").is(":checked"));
			return true;
		} else {
			alert("선택된 상품이 없습니다.");
			return false;
		}
	}

	/* 전체 상품 주문 */
	function allselect() {
		// 체크박스의 이름과 prop 메서드를 사용하여 전체 선택
		$('[name=chk]').prop('checked', true);
	}
</script>
</body>
</html>