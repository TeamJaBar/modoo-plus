<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>아이디 찾기</title>

<link rel="stylesheet" type="text/css" href="../css/login-join.css">

<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<script>
	$(document).ready(function() {
		/* 체크박스 토글 */
		// $('.on').click(function () {
		//    if (this.className == 'on') {
		//       this.className = '';
		//    } else {
		//       this.className = 'on';
		//    }
		// });
		$('.on').click(function() {
			$(this).toggleClass("on");
		});
	});
</script>

<%@include file="common/header.jsp"%>

<!-- Title page -->
<section class="bg-img1 txt-center p-lr-15 p-tb-92" style="background-image: url('/ModooShop/images/bg-img-01.png');">
	<h2 class="ltext-105 cl0 txt-center">아이디 찾기</h2>
</section>


<!-- Content page -->
<section class="bg0 p-t-75 p-b-120">
	<div>
		<div class="sub_content">
			<div class="content_box">
				<div class="member_wrap">
					<div class="member_cont">
						<div class="result-container">
							<span id="name">${mName}</span>
							회원님의 아이디는
							<div class="result">
								<span id="findId">${mId}</span>
								입니다.
							</div>
						</div>
						<div class="btn_login_box" style="display: flex; justify-content: center;">
							<ul>
								<li><button id="btnJoinMember" class="btn_member_blue hov-btn4" onclick="location.href='pw-find-01.jsp'">비밀번호 찾기</button></li>
								<li><button id="btnFindId" class="btn_member_white hov-btn4" onclick="location.href='login.do'">로그인하기</button></li>
							</ul>
						</div>
						<!-- //btn_login_box -->
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