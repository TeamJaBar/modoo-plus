<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>장바구니</title>

<link rel="stylesheet" type="text/css" href="../css/order-ok.css">

<%@include file="common/header.jsp"%>

<!-- Title page -->
<section class="bg-img1 txt-center p-lr-15 p-tb-92" style="background-image: url('/ModooShop/images/bg-img-01.png');">
	<h2 class="ltext-105 cl0 txt-center">주문완료</h2>
</section>


<!-- Content page -->
<section class="bg0 p-t-75 p-b-120">
	<div class="container">
		<div class="sub_content">
			<div class="content_box">
				<div class="member_wrap order_agreement_wrap">
					<div class="member_tit">
						<!-- <h2>장바구니</h2> -->
						<ol>
							<li>
								<span>01</span>
								장바구니
								<span>
									<img src="/ModooShop/images/icons/icon_join_step_off.png">
								</span>
							</li>
							<li>
								<span>02</span>
								주문서 작성/결제
								<span>
									<img src="/ModooShop/images/icons/icon_join_step_off.png">
								</span>
							</li>
							<li class="page_on">
								<span>03</span>
								주문완료
							</li>
						</ol>
					</div>
					<!-- //member_tit -->
					<div class="member_cont" id="order_ok_member_content">
						<div class="order_ok_box">
							<div class="order_ok_tit">
								<p class="complete">
									주문이
									<strong>완료</strong>
									되었습니다.
								</p>

								<p>감사합니다.</p>
							</div>
							<!-- //order_ok_tit -->
							<div class="btn_member_sec">
								<ul>
									<li>
										<button id="btnHome" onclick="location.href='orderSelect.do'">내역 보기</button>
									</li>
									<li>
										<button class="btn_login" onclick="location.href='main.do'" style="color: #fff">홈으로</button>
									</li>
								</ul>
							</div>
							<!-- //btn_member_sec -->
						</div>
						<!-- //order_ok_box -->
					</div>
					<!-- //member_cont -->
				</div>
				<!-- //member_wrap -->
			</div>
			<!-- //content_box -->
		</div>
		<!-- //sub_content -->
	</div>
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
</body>

</html>