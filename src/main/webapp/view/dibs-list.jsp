<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>찜리스트</title>
<link rel="stylesheet" type="text/css" href="../css/dibs-list.css">
<%@include file="common/header.jsp"%>
<!-- Title page -->
<section class="bg-img1 txt-center p-lr-15 p-tb-92" style="background-image: url('/ModooShop/images/bg-img-01.png');">
	<h2 class="ltext-105 cl0 txt-center">찜 리스트</h2>
</section>
<!-- Content page -->
<section class="bg0 p-t-62 p-b-60">
	<div class="container">
		<div class="row">
			<div class="col-md-8 col-lg-9 p-b-80 p-r-100">
				<!-- 찜 목록 -->
				<div class="bg0 p-b-120 sub-content">
					<div class="mypage_shipping_cont">
						<!-- <h6 class="m-b-30 stext-106 p-l-12">찜하기 총 ${fn:length(dList)}개</h6> -->
						<div class="mypage_table_type">
							<table style="text-align: center;">
								<tbody>
									<tr class="table_head">
										<th class="column-0">선택</th>
										<th class="column-1">상품</th>
										<th class="column-2">상품명</th>
										<th class="column-3">상품금액</th>
									</tr>
									<c:if test="${fn:length(dList) == 0}">
										<tr class="table_row start">
											<td colspan="6" class="empty">찜한 상품이 없습니다.</td>
										</tr>
									</c:if>
									<c:if test="${fn:length(dList) != 0 }">
										<c:forEach var="dibs" items="${dList}">
											<tr class="table_row start" id="${dibs.pNum}">
												<td class="column-0" align="center">
													<input type="checkbox" id="dib" value="${dibs.dibNum}" name="dib" checked>
												</td>
												<td class="column-1">
													<img src="${dibs.pNumPimg}" alt="${dibs.pNumPname}" style="width: 100px; height: 100px;">
												</td>
												<td class="column-2">${dibs.pNumPname}</td>
												<td class="column-3">
													<fmt:formatNumber value="${dibs.pNumSelPrice}" type="number" />
													원
												</td>
											</tr>
										</c:forEach>
									</c:if>
								</tbody>
							</table>
						</div>
						<div class="flex-w flex-c p-t-10 m-t-30">
							<button class="flex-c-m stext-106 cl2 size-118 bg0 bor22  hov-btn4 p-lr-15 trans-04 pointer m-r-8" onclick="del()">삭제</button>
							<button class="flex-c-m stext-106 cl2 size-118 bg0 bor22 hov-btn4 p-lr-15 trans-04 pointer m-l-8" onclick="addCart()">장바구니</button>
						</div>
					</div>
				</div>
			</div>
			<%@include file="common/mypage.jsp"%>
		</div>
	</div>
</section>
<%@include file="common/footer.jsp"%>
<script src="../vendor/sweetalert/sweetalert.min.js"></script>
<script>
	/* 장바구니에 추가 */
	function addCart() {
		var dibProduct = new Array();
		
		$("input[name='dib']:checked").each(function() {
			var item = $(this).parent().parent().prop("id");
			dibProduct.push(item);
		});
		
		if (dibProduct.length < 1) {
			alert("선택한 상품이 없습니다.");
			return;
		} else {
			$.ajax({
				type: 'POST',
				url: 'cartInsertDib.do',
				traditional: true,
				data: {
					dibProduct: dibProduct
				},
				success: function(result) {
					if (result == 1) {
						console.log(dibProduct);
						swal({
							title:'장바구니에 담겼습니다!',
							text:'장바구니로 이동하시겠습니까?',
							icon : 'success',
							buttons : {
								cancle: {
									text : '취소',
									value : 'false',
								},
								confirm : {
									text:'이동',
									value : 'true',
	
								}
							}
						}).then((result) => {
							if(result) {
								location.href='shopping-cart.jsp';
							}
						})
						
					}
				}
			});
		}
	}

	/* 체크한 상품 제거 */
	function del() {
		var dibProduct = new Array();
		
		$("input[name='dib']:checked").each(function() {
			var item = $(this).val();
			dibProduct.push(item);
		})
		
		console.log(dibProduct);
		
		if(dibProduct.length < 1) {
			alert("선택한 상품이 없습니다.");
			return;
		} else {
			if(confirm("정말 삭제하시겠습니까?")) {
				$.ajax({
					type: 'POST',
					url: 'dibDelete.do',
					traditional: true,
					data: {
						dibProduct: dibProduct
					},
					success: function(result) {
						if (result == 1) {
							$('.mypage_table_type').load(location.href + ' .mypage_table_type>*');
							alert("삭제되었습니다.");
						}
					}
				});
			} else {
				alert("취소되었습니다.");
			}
		}
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
</body>
</html>