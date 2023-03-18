<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>로그인</title>
<link rel="stylesheet" type="text/css" href="../css/login-join.css">

<%@include file="common/header.jsp"%>

<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<script>
	$(document).ready(function () {
		$('.on').click(function () {
			$(this).toggleClass("on");
		});


		// 아이디 정규식
		const idCheck = /^[a-z][a-z0-9]+$/m

		$('#loginId').focusout(function () {
			let id = $('#loginId').val();
			// 영소문자로 시작되며 영소문자 혹은 숫자만 사용 가능

			// 자리수는 일부러 표현식에 안 적고 따로
			if (id.length < 4 || id.length > 20) {
				alert("아이디는 4~20자리 이내로 입력해주세요.");
				// input에 적은 거 없애기
				$('#loginId').val("");
				return false;
			}

			// 숫자로 시작하거나 영소문자와 숫자 외의 것 입력했을 시
			if (!idCheck.test(id)) {
				alert('아이디는 영어로 시작하며 영소문자 혹은 숫자만 사용할 수 있습니다.');
				$('#loginId').val("");
				return false;
			}
		});
	});
</script>



<!-- Title page -->
<section class="bg-img1 txt-center p-lr-15 p-tb-92" style="background-image: url('/ModooShop/images/bg-img-01.png');">
	<h2 class="ltext-105 cl0 txt-center">로그인</h2>
</section>


<!-- Content page -->
<section class="bg0 p-t-75 p-b-120">
	<div class="container">
		<div class="sub_content">
			<div class="content_box">
				<div class="member_wrap">
					<div class="member_cont">
						<!-- 나중에 바꿔요 -->
						<form action="login.do" id="formLogin" method="post">
							<input type="hidden" id="mode" name="mode" value="login">
							<div class="member_login_box">
								<div class="login_input_sec">
									<div>
										<input type="text" id="loginId" name="mId" placeholder="아이디" value="${cookie.mId.value}" required>
										<input type="password" id="loginPwd" name="mPw" placeholder="비밀번호" required>
									</div>
									<button type="submit" id="btnSubmit" class="btn_submit">로그인</button>
								</div>
								<div class="id_chk">
									<!-- 나중에 쿠키 -->
									<span class="form_element"> <input type="checkbox" id="saveId" name="saveId" value="true" ${empty cookie.mId.value ? "" : "checked" }> <label for="saveId" class="check on">아이디
											저장</label>
									</span>
									<!-- 숨겨져 있다가 실패하면 뿅 -->
									<!-- <p class="dn js_caution_msg1">아이디, 비밀번호가 일치하지 않습니다. 다시 입력해 주세요.</p> -->
								</div>
							</div>
						</form>
						<div class="member_sns_login">
							<!-- <span href="" class="btn_naver_login js_btn_naver_login">
								<img src="/ModooShop/images/icons/pc_naver.png" alt="네이버 아이디 로그인">
							</span> -->
							<a href="" id="btn-kakao-login" class="btn_kakao_login js_btn_kakao_login">
								<img src="/ModooShop/images/icons/pc_kakao.png" alt="카카오 아이디 로그인">
							</a>
						</div>
						<div class="btn_login_box">
							<ul>
								<li>
									<button id="btnJoinMember" class="btn_member_join hov-btn4" onclick="location.href='join.jsp'">회원가입</button>
								</li>
								<li>
									<button id="btnFindId" class="btn_member_white hov-btn4" onclick="location.href='id-find.jsp'">아이디 찾기</button>
								</li>
								<li>
									<button id="btnFindPwd" class="btn_member_white hov-btn4" onclick="location.href='pw-find-01.jsp'">비밀번호 찾기</button>
								</li>
							</ul>
						</div>
						<!-- //btn_login_box -->
					</div>
					<!-- //member_cont -->
				</div>
				<!-- //member_wrap -->
			</div>
			<form id="form-kakao-login" method="post" action="login.do">
				<input type="hidden" name="mEmail" />
			</form>
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
		$(".js-select2").each(function () {
			$(this).select2({
				minimumResultsForSearch: 20,
				dropdownParent: $(this).next('.dropDownSelect2')
			});
		})
	</script>
<!--===============================================================================================-->
<script src="../vendor/MagnificPopup/jquery.magnific-popup.min.js"></script>
<!--===============================================================================================-->
<script src="../vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<script>
		$('.js-pscroll').each(function () {
			$(this).css('position', 'relative');
			$(this).css('overflow', 'hidden');
			var ps = new PerfectScrollbar(this, {
				wheelSpeed: 1,
				scrollingThreshold: 1000,
				wheelPropagation: false,
			});

			$(window).on('resize', function () {
				ps.update();
			})
		});
	</script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript">
//카카오로그인
$(function(){
	$("#btn-kakao-login").click(function(event){
		// a태그 기능 실행멈춤.
		event.preventDefault();
		// 카카오 로그인 실행시 오류메시지를 표시하는 경고창을 화면에 보이지 않게 한다.
		$("alert-kakao-login").addClass("d-none");
		// 사용자 키를 전달, 카카오 로그인 서비스 초기화.
		Kakao.init('5db7ab632ebb477ec7e41729806289c3');
		// 카카오 로그인 서비스 실행하기 및 사용자 정보 가져오기.
		Kakao.Auth.login({
			success:function(auth){
				Kakao.API.request({
					url: '/v2/user/me',
					success: function(response){
						// 사용자 정보를 가져와서 폼에 추가.
						var account = response.kakao_account;
						
						$('#form-kakao-login input[name=mEmail]').val(account.email);
						// console.log(account.email, account.profile.profile_image_url);
						// 사용자 정보가 포함된 폼을 서버로 제출한다.
						document.querySelector('#form-kakao-login').submit();
					},
					fail: function(error){
						// 경고창에 에러메시지 표시
						$('alert-kakao-login').removeClass("d-none").text("카카오 로그인 처리 중 오류가 발생했습니다.")
					}
				}); // api request
			}, // success 결과.
			fail:function(error){
				// 경고창에 에러메시지 표시
				$('alert-kakao-login').removeClass("d-none").text("카카오 로그인 처리 중 오류가 발생했습니다.")
			}
		}); // 로그인 인증.
	}) // 클릭이벤트
})// 카카오로그인 끝. 
</script>
<!--===============================================================================================-->
<script src="../js/main.js"></script>
</body>

</html>