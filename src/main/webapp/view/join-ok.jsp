<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>가입완료</title>

<link rel="stylesheet" type="text/css" href="../css/join.css">

<%@include file="common/header.jsp"%>

<!-- Title page -->
<section class="bg-img1 txt-center p-lr-15 p-tb-92" style="background-image: url('/ModooShop/images/bg-img-01.png');">
	<h2 class="ltext-105 cl0 txt-center">회원가입</h2>
</section>


<!-- Content page -->
<section class="bg0 p-t-75 p-b-120">
	<div class="container">
		<div class="sub_content">
			<div class="content_box">
				<div class="member_wrap join_agreement_wrap">
					<div class="member_tit">
						<!-- <h2>회원가입</h2> -->
						<ol>
							<li><span>01</span> 약관동의 <span> <img src="/ModooShop/images/icons/icon_join_step_off.png">
							</span></li>
							<li><span>02</span> 정보입력 <span> <img src="/ModooShop/images/icons/icon_join_step_off.png">
							</span></li>
							<li class="page_on"><span>03</span> 가입완료</li>
						</ol>
					</div>
					<!-- //member_tit -->
					<div class="member_cont" id="join_ok_member_content">
						<div class="join_ok_box">
							<div class="join_ok_tit">
								<p class="complete">
									회원가입이 <strong>완료</strong> 되었습니다.
								</p>
								<!-- 이름은 나중에 회원가입한 거 받아서 슉슉 -->
								<p>
									<span>${mName}</span>님의 회원가입을 축하합니다. <br> 알차고 실속있는 서비스로 찾아뵙겠습니다.
								</p>
							</div>
							<!-- //join_ok_tit -->
							<div class="btn_member_sec">
								<ul>
									<li>
										<button onclick="location.href='main.do'" id="btnHome" class="btnHome hov-btn3">홈으로</button>
									</li>
									<li>
										<button onclick="location.href='login.do'" id="btn_login" class="btn_login hov-btn3">로그인</button>
									</li>
								</ul>
							</div>
							<!-- //btn_member_sec -->
						</div>
						<!-- //join_ok_box -->
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