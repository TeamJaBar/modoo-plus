<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>정보입력</title>
<link rel="stylesheet" type="text/css" href="/ModooShop/css/join.css">
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
				<div class="join_base_wrap">
					<div class="member_tit">
						<!-- <h2>회원가입</h2> -->
						<ol>
							<li>
								<span>01</span>
								&nbsp;약관동의
								<span>
									<img src="/ModooShop/images/icons/icon_join_step_off.png">
								</span>
							</li>
							<li class="page_on">
								<span>02</span>
								정보입력
								<span>
									<img src="/ModooShop/images/icons/icon_join_step_on.png">
								</span>
							</li>
							<li>
								<span>03</span>
								&nbsp;가입완료
							</li>
						</ol>
					</div>
					<!-- //member_tit -->
					<div class="member_cont">
						<!-- action="join.do" -->
						<form action="join.do" method="post" id="formJoin" name="formJoin" onsubmit="return joinSubmit();">
							<!-- 회원가입/정보 기본정보 -->
							<div class="base_info_box">
								<h3>기본정보</h3>
								<span class="important">표시는 반드시 입력하셔야 하는 항목입니다.</span>
								<div class="base_info_sec">
									<table border="0" cellpadding="0" cellspacing="0">
										<colgroup>
											<col width="25%">
											<col width="75%">
										</colgroup>
										<tbody>
											<tr>
												<th>
													<span class="important">아이디</span>
												</th>
												<td>
													<div class="member_warning">
														<input type="text" id="memId" name="mId" data-pattern="gdMemberId" required>
													</div>
													<div id="memId-length-error" class="text_warning hidden">아이디는 4~20자리 이내로 입력해주세요.</div>
													<div id="memId-error" class="text_warning hidden">아이디는 영어로 시작하며 영소문자 혹은 숫자만 사용할 수 있습니다.</div>
													<div id="memId-existing-error" class="text_warning hidden">이미 사용 중인 아이디입니다.</div>
													<div id="memId-good" class="text_affirm hidden">사용 가능합니다.</div>
												</td>
											</tr>
											<tr class="">
												<th>
													<span class="important">비밀번호</span>
												</th>
												<td class="member_password">
													<div class="member_warning">
														<input type="password" id="newPassword" name="mPw" autocomplete="off" placeholder="" required>
													</div>
													<div id="memPw-error" class="text_warning hidden">비밀번호는 영문, 숫자, 특수문자 중 2가지 이상이 조합된 10~20자여야 합니다.</div>
													<div id="memPw-good" class="text_affirm hidden">사용 가능합니다.</div>
												</td>
											</tr>
											<tr class="">
												<th>
													<span class="important">비밀번호 확인</span>
												</th>
												<td>
													<div class="member_warning">
														<input type="password" id="chkPassword" class="check-id" name="memPwRe" autocomplete="off" required>
													</div>
													<div id="memPwRe-error" class="text_warning hidden">비밀번호가 서로 다릅니다.</div>
													<div id="memPwRe-good" class="text_affirm hidden">비밀번호가 일치합니다.</div>
												</td>
											</tr>
											<tr>
												<th>
													<span class="important">이름</span>
												</th>
												<td>
													<div class="member_warning">
														<input type="text" name="mName" id="memNm" data-pattern="gdEngKor" value="" maxlength="30" required>
													</div>
													<div id="memNm-error" class="text_warning hidden">이름은 한글만 사용할 수 있으며 2글자 이상이어야 합니다.</div>
												</td>
											</tr>
											<tr>
												<th>
													<span class="important">이메일</span>
												</th>
												<td class="member_email">
													<div class="member_warning">
														<input type="text" name="email" id="email" value="" required>
														<select id="emailDomain" name="emailDomain" class="chosen_select" required>
															<option value="self">직접입력</option>
															<option value="naver.com" selected>naver.com</option>
															<option value="hanmail.net">hanmail.net</option>
															<option value="daum.net">daum.net</option>
															<option value="nate.com">nate.com</option>
															<option value="hotmail.com">hotmail.com</option>
															<option value="gmail.com">gmail.com</option>
															<option value="icloud.com">icloud.com</option>
														</select>
														<input type="hidden" name="mEmail" id="mEmail" value="">
													</div>
													<div id="memEm-error" class="text_warning hidden">이메일을 다시 한 번 확인해주세요.</div>
													<div id="memEm-existing-error" class="text_warning hidden">이미 사용 중인 아이디입니다.</div>
													<div id="memEm-good" class="text_affirm hidden">사용 가능합니다.</div>
													<div class="form_element">
														<input type="checkbox" id="maillingFl" name="maillingFl" value="y">
														<label for="maillingFl" class="check_s">메일 수신에 동의합니다.</label>
													</div>
												</td>
											</tr>
											<tr>
												<th>
													<span class="important">휴대폰번호</span>
												</th>
												<td class="member_address">
													<div class="address_postcode">
														<input type="text" id="cellPhone" name="mTel" maxlength="12" placeholder="- 없이 입력하세요." data-pattern="gdNum" value="" required>
														<div data-lastpass-icon-root="true" style="position: relative !important; height: 0px !important; width: 0px !important; float: left !important;"></div>
													</div>
													<div id="memPn-hyphen-error" class="text_warning hidden">-없이 입력해주세요.</div>
													<div id="memPn-error" class="text_warning hidden">핸드폰 번호를 확인해주세요.</div>
												</td>
											</tr>
											<!-- 
												<tr>
													<th><span>전화번호</span></th>
													<td>
														<div class="member_warning">
															<input type="text" id="phone" name="phone" maxlength="12"
																placeholder="- 없이 입력하세요." data-pattern="gdNum" value="">
														</div>
													</td>
												</tr>
												-->
											<tr>
												<th>
													<span class="important">주소</span>
												</th>
												<td class="member_address">
													<div class="address_postcode find_address">
														<input type="text" name="zipCode" id="sample3_postcode" placeholder="우편번호" value="" required>
														<input type="button" id="find_address" onclick="sample3_execDaumPostcode()" value="우편번호 찾기" required>
													</div>
													<!-- //base_info_box -->
													<div id="wrapPost" style="display: none; border: 1px solid; max-width: 500px; height: 300px; margin: 5px 0; position: relative">
														<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor: pointer; position: absolute; right: 0px; top: -1px; z-index: 1" onclick="foldDaumPostcode()" alt="접기 버튼">
													</div>
													<div class="address_input detailed_address">
														<div class="member_warning">
															<input type="text" name="userAddr" id="sample3_address" placeholder="주소" value="" required>
														</div>
														<div class="member_warning js_address_sub">
															<input type="text" name="detailAddr" id="sample3_detailAddress" placeholder="상세주소" value="" required>
														</div>
													</div>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
							<script>
									// 우편번호 찾기 찾기 화면을 넣을 element
									var element_wrap = document
										.getElementById('wrapPost');

									function foldDaumPostcode() {
										// iframe을 넣은 element를 안보이게 한다.
										element_wrap.style.display = 'none';
									}

									function sample3_execDaumPostcode() {
										// 현재 scroll 위치를 저장해놓는다.
										var currentScroll = Math
											.max(
												document.body.scrollTop,
												document.documentElement.scrollTop);
										new daum.Postcode(
											{
												oncomplete: function (data) {
													// 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

													// 각 주소의 노출 규칙에 따라 주소를 조합한다.
													// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
													var addr = ''; // 주소 변수
											

													//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
													if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
														addr = data.roadAddress;
													} else { // 사용자가 지번 주소를 선택했을 경우(J)
														addr = data.jibunAddress;
													}

													// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
													/*
													if (data.userSelectedType === 'R') {
														// 법정동명이 있을 경우 추가한다. (법정리는 제외)
														// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
														if (data.bname !== ''
															&& /[동|로|가]$/g
																.test(data.bname)) {
															extraAddr += data.bname;
														}
														// 건물명이 있고, 공동주택일 경우 추가한다.
														if (data.buildingName !== ''
															&& data.apartment === 'Y') {
															extraAddr += (extraAddr !== '' ? ', '
																+ data.buildingName
																: data.buildingName);
														}
														// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
														if (extraAddr !== '') {
															extraAddr = ' ('
																+ extraAddr
																+ ')';
														}
														// 조합된 참고항목을 해당 필드에 넣는다.
														document
															.getElementById("sample3_extraAddress").value = extraAddr;

													} else {
														document
															.getElementById("sample3_extraAddress").value = '';
													}*/

													// 우편번호와 주소 정보를 해당 필드에 넣는다.
													document
														.getElementById('sample3_postcode').value = data.zonecode;
													document
														.getElementById("sample3_address").value = addr;
													// 커서를 상세주소 필드로 이동한다.
													document
														.getElementById("sample3_detailAddress").value="";
													document
														.getElementById("sample3_detailAddress")
														.focus();

													// iframe을 넣은 element를 안보이게 한다.
													// (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
													element_wrap.style.display = 'none';

													// 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
													document.documentElement.scrollTop = currentScroll;
												},
												// 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
												onresize: function (size) {
													element_wrap.style.height = size.height
														+ 'px';
												},
												width: '100%',
												height: '100%'
											}).embed(element_wrap);

										// iframe을 넣은 element를 보이게 한다.
										element_wrap.style.display = 'block';
									}
								</script>
							<!-- //base_info_sec -->
							<div class="btn_center_box">
								<button type="button" id="btnCancel" class="btn_member_cancel" onclick="location.href='main.jsp'">취소</button>
								<button type="submit" class="btn_comfirm js_btn_join">회원가입</button>
							</div>
						</form>
						<!-- //btn_center_box -->
					</div>
					<!-- //member_cont -->
				</div>
				<!-- //join_base_wrap -->
			</div>
			<!-- //content_box -->
		</div>
		<!-- //sub_content -->
	</div>
</section>
<%@include file="common/footer.jsp"%>
<!--===============================================================================================-->
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<!--===============================================================================================-->
<script>
var idCheck = false;
var pwCheck = false;
var nameCheck = false;
var emailCheck = false;
var phoneCheck = false;

	$(document).ready(function () {
		/* 체크박스 토글 */
		$('.check_s').click(function () {
			$(this).toggleClass("on");
		});

		/* 아이디 정규식 */
		// 영소문자로 시작되며 영소문자 혹은 숫자만 사용 가능
		const idRegEx = /^[a-z][a-z0-9]+$/m

		$('#memId').focusout(function () {
			let mId = $('#memId').val();
			
			$('#memId-good').addClass('hidden');
			$('#memId-length-error').addClass('hidden');
			$('#memId-error').addClass('hidden');
			$('#memId-existing-error').addClass('hidden');

			// 자리수는 일부러 표현식에 안 적고 따로
			if (mId.length < 4 || mId.length > 20) {
				$('#memId-length-error').removeClass('hidden');
				//$('#memId').focus();
				idCheck = false;
				return;
			} else {
				$('#memId-length-error').addClass('hidden');
			}

			// 숫자로 시작하거나 영소문자와 숫자 외의 것 입력했을 시
			if (!idRegEx.test(mId)) {
				$('#memId-error').removeClass('hidden');
				//$('#memId').focus();
				idCheck = false;
				return;
			} else {
				$('#memId-error').addClass('hidden');
			}
			
			//아이디 중복검사
			$.ajax({
				type:'POST', //POST 방식으로 보낼래
				url:'check.do', 
				data:{mId:mId,
					  mode:"idCHK"}, //mId라는 이름으로 mId 변수에 있는 값 보냄
				success: function(result) {
					console.log('로그 : 중복체크 성공');
					console.log(result);
					if(result==1) {
						//사용가능한 아이디
						$('#memId-existing-error').addClass('hidden');
						$('#memId-good').removeClass('hidden');
						idCheck = true;
					} else {
						$('#memId-existing-error').removeClass('hidden');
						//$('#memId').focus();
						idCheck = false;
						return;
					}
				}
			})	
		});

		/* 비밀번호 정규식 */
		// 영문(대/소문자), 숫자, 특수문자 하나씩은 포함한 10~20자

		// 특수문자 / 문자 / 숫자 포함 형태의 8~15자리 이내의 암호 정규식 ( 3 가지 조합)
		// const pwCheck = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{10,20}$/m

		// 영문, 숫자, 특수문자 중 2가지 이상 조합하여 10자리 이내의 암호 정규식 ( 2 가지 조합)
		const pwRegEx = /^(?!((?:[A-Za-z]+)|(?:[~!@#$%^&*()_+=]+)|(?:[0-9]+))$)[A-Za-z\d~!@#$%^&*()_+=]{10,20}$/m

		$('#newPassword').focusout(function () {
			let nPw = $('#newPassword').val();
			let cPw = $('#chkPassword').val();
			
			$('#memPw-error').addClass('hidden'); // 틀림 숨김
			$('#memPw-good').addClass('hidden'); // 통과 숨김
			$('#memPwRe-good').addClass('hidden'); // 같음 숨김
			$('#memPwRe-error').addClass('hidden'); // 다름 숨김

			if (!pwRegEx.test(nPw)) { // 정규식 통과 X
				$('#memPw-error').removeClass('hidden'); // 틀림 표시
				if (cPw.length !== 0) { // 비밀번호 확인 길이가 0이 아닐 때 == 입력이 되어 있을 때
					$('#memPwRe-error').removeClass('hidden'); // 다름 표시
					$('#chkPassword').val(""); // 비밀번호 확인 내용 삭제
					//$('#newPassword').focus();
					pwCheck=false;
				}
			} else { // 정규식 통과 O
				$('#memPw-good').removeClass('hidden'); // 통과 표시
				if (cPw.length !== 0 && cPw !== nPw) { // 비밀번호 다를 때
					$('#memPwRe-error').removeClass('hidden'); // 다름 표시
					$('#chkPassword').val(""); // 비밀번호 확인 내용 삭제
					//$('#chkPassword').focus();
					pwCheck=false;
				} else if (cPw.length !== 0 && cPw === nPw) { // 비밀번호 같을 때
					$('#memPwRe-good').removeClass('hidden'); // 같음 표시
					pwCheck=true;
				}
			}
			
		});

		// 비밀번호 확인
		$('#chkPassword').focusout(function () {
			let nPw = $('#newPassword').val();
			let cPw = $('#chkPassword').val();

			if (pwRegEx.test(nPw)) {
				if (cPw !== nPw) {
					$('#memPwRe-error').removeClass('hidden');
					$('#memPwRe-good').addClass('hidden');
					$('#chkPassword').val("");
					//$('#chkPassword').focus();
					pwCheck=false;
				} else {
					$('#memPwRe-good').removeClass('hidden');
					$('#memPwRe-error').addClass('hidden');
					pwCheck=true;
				}
			} else {
				$('#chkPassword').val("");
				//$('#newPassword').focus();
				pwCheck=false;
			}
			
		});

		/* 이름 정규식 */
		// 한글로만 이루어진 2자 이상
		const nameRegEx = /^[ㄱ-힇]{2,}$/m

		$('#memNm').focusout(function () {
			let name = $('#memNm').val();

			// 숫자로 시작하거나 영소문자와 숫자 외의 것 입력했을 시
			if (!nameRegEx.test(name)) {
				$('#memNm-error').removeClass('hidden');
				$('#memNm').val("");
				nameCheck=false;
				//$('#memNm').focus();
			} else {
				$('#memNm-error').addClass('hidden');
				nameCheck=true;
			}
		});

		/* 이메일 정규식 */
		const emailRegEx = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/m
		
		$('#email, #emailDomain').focusout(function () {
			let emailFront = $('#email').val();
			let domain = $('#emailDomain option:selected').val();
			mEmail = emailFront;
					
			$('#memEm-error').addClass('hidden');
			$('#memEm-existing-error').addClass('hidden');
			$('#memEm-good').addClass('hidden');
			
			// self = 직접입력
			if (domain !== 'self') {
				mEmail = emailFront + '@' + domain;
			}
			if (!emailRegEx.test(mEmail)) {
				$('#memEm-error').removeClass('hidden');
				emailCheck = false;
				return;
			}
			$('#memEm-error').addClass('hidden');
			//$('#memEm-good').removeClass('hidden');
			//emailCheck = true;
			
			//이메일 중복검사		
			$.ajax({
				type:'POST', //POST 방식으로 보낼래
				url:'check.do', 
				data:{mEmail:mEmail,
					mode: "emailCHK"},
				success: function(result) {
					console.log('로그 : 중복체크 성공');
					console.log(result);
					if(result==1) {
						//사용가능한 아이디
						$('#memEm-existing-error').addClass('hidden');
						$('#memEm-good').removeClass('hidden');
						emailCheck = true;
					} else {
						$('#memEm-existing-error').removeClass('hidden');
						emailCheck = false;
						return;
					}
				}
			})		
		});


		
		/* 휴대폰 정규식 */
		// 01X
		const phoneCheckFst = /^01(?:0|1|[6-9])$/m
		// 십진수 3 혹은 4자
		const phoneCheckSnd = /^(?:\d{3}|\d{4})$/m
		// 십진수 4자
		const phoneCheckTrd = /^\d{4}$/m

		$('#cellPhone').focusout(function () {
			let phone = $('#cellPhone').val();
			// 앞(01X) 중간(3 or 4) 뒤(4)
			let fst, snd, trd;
			// '-' 놉!
			if (/\-/m.test(phone)) {
				$('#memPn-hyphen-error').removeClass('hidden');
				phoneCheck = false;
				//$('#cellPhone').focus();
				return;
			} else if (phone.length == 11) { // 11자면
				$('#memPn-hyphen-error').addClass('hidden');
				fst = phone.slice(0, 3);
				snd = phone.slice(3, 7); // snd 4자리
				trd = phone.slice(7, 11);
			} else if (phone.length == 10) { // 10자면
				$('#memPn-hyphen-error').addClass('hidden');
				fst = phone.slice(0, 3);
				snd = phone.slice(3, 6); // snd 3자리
				trd = phone.slice(6, 10);
			}

			if (!phoneCheckFst.test(fst) || !phoneCheckSnd.test(snd) || !phoneCheckTrd.test(trd)) {
				$('#memPn-error').removeClass('hidden');
				phoneCheck = false;
				//$('#cellPhone').focus();
				return;
			} else {
				$('#memPn-error').addClass('hidden');
				phoneCheck = true;
			}
		});
	});
	
	function joinSubmit() {
		var checked =  $('#maillingFl').is(':checked');
		if(!checked) {
			alert("이메일 수신동의를 해주세요. 추후 비밀번호찾기에 사용됩니다.");
			return false;
		}
		if(idCheck && pwCheck && nameCheck && emailCheck && phoneCheck) {
			console.log("정규식 모두 통과");
			$('#mEmail').val(mEmail);
			return true;
		} else {
			alert("입력 조건을 확인해주세요.");
			console.log("아이디" + idCheck);
			console.log("비밀번호" + pwCheck);
			console.log("이름" + nameCheck);
			console.log("이메일" + emailCheck);
			console.log("전화번호" + phoneCheck);
			return false;	
		}
	}
</script>
<!--===============================================================================================-->
<script src="..//vendor/animsition/js/animsition.min.js"></script>
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
<!--===============================================================================================-->
<script src="../js/main.js"></script>
</body>
</html>