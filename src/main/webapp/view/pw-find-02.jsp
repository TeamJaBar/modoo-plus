<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>비밀번호 찾기</title>
<link rel="stylesheet" type="text/css" href="../css/login-join.css">
<%@include file="common/header.jsp"%>
<!-- Title page -->
<section class="bg-img1 txt-center p-lr-15 p-tb-92" style="background-image: url('/ModooShop/images/bg-img-01.png');">
	<h2 class="ltext-105 cl0 txt-center">비밀번호 찾기</h2>
</section>
<!-- Content page -->
<section class="bg0 p-t-75 p-b-120">
	<div class="container">
		<div class="sub_content">
			<div class="content_box">
				<div class="member_wrap">
					<div class="member_cont">
						<form action="sendEmail.do" name="formAuth" id="formAuth" method="post">
							<div class="member_findPW_box">
								<div class="user_certify_tit">
									<h3>인증수단 선택</h3>
									<p class="findPw-info">본인인증 방법을 선택해 주세요.</p>
								</div>
								<!-- //user_certify_tit -->
								<div class="user_certify_check">
									<input type="checkbox" id="authEmail" name="authEmail" required>
									<label for='authEmail' class="label-for-checkbox">
										이메일 인증
										<span class="email">${findPw}</span>
									</label>
									<input type="hidden" name="mEmail" value="${mEmail}">
									<input type="hidden" name="mId" value="${mId}">
									<p>가입 시 등록한 이메일로 인증번호가 발송됩니다.</p>
								</div>
								<!-- //user_certify_list -->
								<div class="btn-center-box">
									<button type="submit" class="btn_member_next btn_submit">다음</button>
								</div>
							</div>
							<!-- //member_findPW_box -->
						</form>
					</div>
					<!-- //member_cont -->
				</div>
				<!-- //member_wrap -->
			</div>
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