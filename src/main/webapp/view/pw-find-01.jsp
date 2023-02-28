<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
						<form action="pwFind.do" id="find-pw-form" method="post" onsubmit="return check()">
							<div class="member_login_box">
								<div>
									<h3>아이디 입력</h3>
									<p class="findPw-info">비밀번호를 찾고자 하는 아이디를 입력해 주세요.</p>
								</div>
								<div class="findpw_box">
									<input type="text" id="memberId" name="mId" placeholder="아이디" required>
									<p class="info_again">
										아이디를 모르시나요?
										<a href="id-find.jsp" class="js_btn_find_id"> 아이디찾기 </a>
									</p>
									<p class="dn" id="errorMessage"></p>
									<div class="btn-center-box">
										<button type="submit" class="btn_member_next btn_submit">다음</button>
									</div>
								</div>
							</div>
							<!-- //find_password_box -->
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
<script>
function check() {
	var checkFlag = false;
	
	var mId = $('#memberId').val();
	$.ajax({
		type : 'POST', //POST 방식으로 보낼래
		url : 'check.do',
		data : {mId : mId
				mode : "findPW"}, //mId라는 이름으로 mId 변수에 있는 값 보냄
		async: false,
		success : function(result) {
			console.log(result);
			if (result == 1) {
				alert("존재하지 않는 아이디입니다.");
				console.log(checkFlag);
				return false;
			} else {
				checkFlag = true;
				console.log(checkFlag);
			}
		}
	});
	
	return checkFlag;
}
</script>
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