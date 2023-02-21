<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>아이디 찾기</title>
<link rel="stylesheet" type="text/css" href="../css/login-join.css">
<%@include file="common/header.jsp"%>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<script>
	$(document).ready(function() {
		$('.on').click(function() {
			$(this).toggleClass("on");
		});
	});
</script>
<!-- Title page -->
<section class="bg-img1 txt-center p-lr-15 p-tb-92" style="background-image: url('/ModooShop/images/bg-img-01.png');">
	<h2 class="ltext-105 cl0 txt-center">아이디 찾기</h2>
</section>
<!-- Content page -->
<section class="bg0 p-t-75 p-b-120">
	<div class="container">
		<div class="sub_content">
			<div class="content_box">
				<div class="member_wrap">
					<div class="member_cont">
						<form id="formLogin" action="idFind.do" method="post">
							<div class="member_login_box">
								<div class="login_input_sec">
									<div>
										<input type="text" id="findID" name="mName" placeholder="이름" required>
										<input type="email" id="findIDEmail" name="mEmail" placeholder="가입한 메일 주소" required>
									</div>
									<button type="submit" class="btn_submit" type="submit">아이디 찾기</button>
								</div>
							</div>
						</form>
						<div class="btn_login_box" style="display: flex; justify-content: center;">
							<ul>
								<li>
									<button onclick="location.href='pw-find-01.jsp'" id="btnFindPw" class="btn_member_blue hov-btn4">비밀번호 찾기</button>
								</li>
								<li>
									<button onclick="location.href='login.jsp'" id="btnLogin" class="btn_member_white hov-btn4">로그인하기</button>
								</li>
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
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script>
	function check() {
		var checkFlag = false;
		
		var mName = $('#mName').val();
		var mEmail = $('mEmail').val();
		
		$.ajax({
			type : 'POST', //POST 방식으로 보낼래
			url : 'check',
			async : false,
			data : {
				mName : mName,
				mEmail : mEmail,
				mode : "idFind"
			}, //mId라는 이름으로 mId 변수에 있는 값 보냄
			success : function(result) {
				console.log('로그 : 중복체크 성공');
				console.log(result);
				if (result == 1) {
					checkFalg = true;
					return true;
				} else {
					alert("회원정보를 찾을 수 없습니다.")
					return false;
				}
			}
		});

		return checkFlag;
	}
</script>
</body>
</html>