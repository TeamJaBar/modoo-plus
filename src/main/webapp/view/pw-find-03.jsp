<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>비밀번호 찾기</title>

<link rel="stylesheet" type="text/css" href="../css/login-join.css">

<style>
.btn_center_box {
	margin-top: 30px;
	text-align: center;
}

input[type="text"], input[type="password"] {
	padding: 0 10px;
	outline: none;
	font-size: 12px;
}
</style>


<%@include file="common/header.jsp"%>

<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>

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
						<!-- 나중에 바꿔요 -->
						<form name="formReset" method="post" id="formReset" action="pw-find-04.jsp">
							<div class="member_login_box">
								<h3>인증번호 입력</h3>
								<p class="findPw-info">수신된 이메일의 인증번호를 입력해 주세요.</p>
								<div class="login_input">
									<div class="findpw_box">
										<div class="member_warning prior_wrong">
											<input type="hidden" name="mId" value="${mId}">
											<input type="text" id="certCode" name="certCode" autocomplete="off" placeholder="인증번호 입력" required>
										</div>
										<!-- <p class="info_again">인증메일이 도착하지 않았나요? &ensp;<a onclick="conum()" href="#">인증번호 다시받기</a></p> -->
									</div>
								</div>

								<div class="btn-center-box" style="margin-top: 40px;">
									<button type="button" id="btnCancel" class="btn_member_blue hov-btn4" onclick="back()">이전</button>
									<button type="submit" class="btn_member_white hov-btn4" onclick="return check()">확인</button>
								</div>
							</div>
							<!-- //find_password_reset_box -->
						</form>
						<!-- //btn_login_box -->
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
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script>
	function check() {
		let inputCode = $("#certCode").val();

		if (inputCode == "") {
			alert("인증번호를 입력해 주세요.");
			return false;
		} else if ('${code}' == inputCode) {
			alert("확인되었습니다.");
			return true;
		} else {
			alert("인증번호가 틀렸습니다. 다시 입력해 주세요.");
			return false;
		}
	}
	
	function back() {
		var formReset = $("#formReset");
		formReset.attr("action", "pwFind.do");
		formReset.submit();
	}
</script>

<script>
	function conum() {
		var ans = confirm("인증번호를 재전송하시겠습니까?");

		if (ans) {
			alert("인증번호를 재전송하였습니다.")
		} else {
			alert("취소하셨습니다.")
		}
	}
</script>
</html>