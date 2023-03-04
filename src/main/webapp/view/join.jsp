<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>회원가입</title>
<link rel="stylesheet" type="text/css" href="../css/login-join.css">
<%@include file="common/header.jsp"%>
<!--화면 타이틀-->
<section class="bg-img1 txt-center p-lr-15 p-tb-92" style="background-image: url('/ModooShop/images/bg-img-01.png');">
	<h2 class="ltext-105 cl0 txt-center">회원가입</h2>
</section>
<!-- Content page -->
<section class="bg0 p-t-75 p-b-120">
	<div class="container">
		<div class="sub_content">
			<div class="content_box">
				<div class="member_wrap">
					<div class="member_cont">
						<!-- 나중에 바꿔요 -->
						<form id="formLogin">
							<input type="hidden" id="mode" name="mode" value="join">
							<div class="member_login_box">
								<div class="member_login_shop">
									<a href="agreement.jsp" id="btnJoin" class="shop_mall_join hov-btn3">
										<span>쇼핑몰 회원가입</span>
									</a>
								</div>
							</div>
						</form>
						<!-- 나중에 span 태그 > a 태그
						<div class="member_sns_login">
							<span href="" class="btn_payco_login js_btn_payco_login">
								<img src="/ModooShop/images/icons/pc_payco.png" alt="PAYCO 아이디 로그인">
							</span>
							<span href="" class="btn_facebook_login js_btn_facebook_login">
								<img src="/ModooShop/images/icons/pc_facebook.png" alt="FACEBOOK 아이디 로그인">
							</span>
							<span href="" class="btn_naver_login js_btn_naver_login">
								<img src="/ModooShop/images/icons/pc_naver.png" alt="네이버 아이디 로그인">
							</span>
							<span href="" class="btn_kakao_login js_btn_kakao_login">
								<img src="/ModooShop/images/icons/pc_kakao.png" alt="카카오 아이디 로그인">
							</span>
							SNS계정을 연동하여 빠르고 쉽고 안전하게 회원가입할 수 있습니다. <br> 이 과정에서 고객님의 데이터는 철저하게 보호됩니다.
						</div> -->
						<div class="member_guide_txt">
							<p>
								<strong class="chk_none"> 모두의 보드의 회원이 되어 다양한 혜택을 만나보세요. </strong>
								이미 쇼핑몰 회원이세요?
								<a href="login.do" id="btnLoginMember"> 로그인</a>
							</p>
						</div>
					</div>
					<!-- //member_cont -->
				</div>
				<!-- //member_wrap -->
			</div>
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