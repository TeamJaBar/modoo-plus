<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>회원탈퇴</title>
<style>
body, th, td, input, select, textarea, button {
	font-size: 12px;
	line-height: 1.5;
	font-family: 'SUIT', sans-serif;
	color: #333
}
/* 폰트 컬러 */
.fc_red {
	color: #fa2828 !important;
}

input[type="radio"] {
	width: 13px;
	height: 13px;
	vertical-align: top;
}

input[type="text"], input[type="password"] {
	padding: 0px;
	outline: none;
	font-size: 12px;
}

input[type="checkbox"] {
	width: 13px;
	height: 13px;
	vertical-align: top;
}

input[type="image"] {
	vertical-align: top;
	border: none;
	cursor: pointer;
}

input[type="button"] {
	border: none;
	background: none;
	cursor: pointer;
}

input[type="submit"] {
	cursor: pointer;
	vertical-align: top;
	font-size: 100%;
}

/*common.csss */
input[type="text"], input[type="password"] {
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
	border-radius: 0px;
}

.find_password_box .login_input .member_warning {
	margin: 0px;
}

.find_password_reset_box .login_input {
	padding: 0px;
	width: 100%
}

.member_cont .btn_center_box, .btn_center_box {
	margin: 0px;
	margin-top: 10px;
}

.member_cont .find_password_complete_box {
	text-align: center;
}

.member_cont .find_password_complete_box .btn_center_box {
	margin-top: 35px;
}

/* left type */
.mypage_table_type .table_left {
	border-top: 1px solid #999999;
}

.mypage_table_type .table_left th {
	padding: 15px 10px 14px 20px;
	border-top: none 0;
	background: #f7f7f7;
	text-align: left;
}

.mypage_table_type .table_left td {
	height: 31px;
	padding: 12px 10px 11px 15px;
	text-align: left;
}

.mypage_table_type .table_left textarea {
	width: 95%;
}

.board_search_box input[type="text"], input[type="password"] {
	width: 110px;
}

/* 쇼핑정보 > 취소,확인 */
.btn_claim_cancel {
	min-width: 100px;
	height: 44px;
	display: inline-block;
	padding: 0 10px 0 10px;
	line-height: 40px;
	color: #3e3d3c;
	font-size: 14px;
	border: 1px solid #cccccc;
	background: #ffffff;
	text-align: center;
	margin-right: 7px;
}

.btn_claim_cancel em {
	font-weight: bold;
}

.btn_claim_ok {
	margin-left: 7px;
	min-width: 100px;
	height: 44px;
	padding: 0 10px 0 10px;
	color: #ffffff;
	font-size: 14px;
	font-weight: bold;
	border: 1px solid #181818;
	background: #181818;
	text-align: center;
}

.btn_claim_ok em {
	font-weight: bold;
}

/* ------------- 마이페이지 > 회원탈퇴 ------------- */
.hack_out {
	margin: 0 0 50px 0;
}

.hack_out .mypage_zone_tit {
	margin: 0 0 20px 0;
	padding: 0 0 10px 0;
	font-size: 13px;
	font-family: 'GmarketSansMedium';
	border-bottom: 1px solid #999999;
}

.hack_out .mypage_unregister .mypage_zone_tit {
	margin-top: 70px;
	padding: 0 0 10px 0;
	font-size: 13px;
	border-bottom: none 0;
}

.hack_out .mypage_unregister .unregister_info {
	margin: 0;
	padding: 15px 15px 15px 15px;
	color: #717171;
	border: 1px solid #dadada;
}

.hack_out .mypage_unregister .hack_out_list li {
	display: flex;
	float: left;
	width: 35%;
	padding: 0 0 7px 0;
}

.hack_out .mypage_unregister textarea {
	width: 98%;
	height: 100px;
}

/* CSS Document */

/* reset */
body, div, dl, dt, dd, ul, ol, li, h1, h2, h3, h4, h5, h6, pre, code, form, fieldset, legend, textarea, p, blockquote, th, td, input, select, textarea, button {
	margin: 0;
	padding: 0
}

fieldset, img {
	border: 0 none;
	vertical-align: top;
}

dl, ul, ol, li {
	list-style: none
}

blockquote, q {
	quotes: none
}

blockquote:before, blockquote:after, q:before, q:after {
	content: '';
	content: none
}

input, select, textarea, button {
	vertical-align: middle
}

button {
	border: 0 none;
	background-color: transparent;
	cursor: pointer
}

body {
	background: #fff
}

body, th, td, input, select, textarea, button {
	font-size: 12px;
	line-height: 1.5;
	font-family: 'SUIT', sans-serif;
	color: #333
} /* color값은 디자인가이드에 맞게사용 */
a {
	color: #333;
	text-decoration: none
}

a:active, a:hover {
	text-decoration: none;
}

address, caption, cite, code, dfn, em, var {
	font-style: normal;
	font-weight: normal
}

@font-face {
	font-family: 'SUIT';
	font-weight: 500;
	font-style: normal;
	src: url('https://cdn.jsdelivr.net/gh/webfontworld/sunn/SUIT-Medium.eot');
	src: url('https://cdn.jsdelivr.net/gh/webfontworld/sunn/SUIT-Medium.eot?#iefix') format('embedded-opentype'), url('https://cdn.jsdelivr.net/gh/webfontworld/sunn/SUIT-Medium.woff2') format('woff2'),
		url('https://cdn.jsdelivr.net/gh/webfontworld/sunn/SUIT-Medium.woff') format('woff'), url('https://cdn.jsdelivr.net/gh/webfontworld/sunn/SUIT-Medium.ttf') format("truetype");
	font-display: swap;
}

@font-face {
	font-family: 'NEXON Lv1 Gothic OTF';
	src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/NEXON Lv1 Gothic OTF.woff') format('woff');
	font-weight: normal;
	font-style: normal;
}

@font-face {
	font-family: 'NEXON Lv2 Gothic';
	src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/NEXON Lv2 Gothic.woff') format('woff');
	font-weight: normal;
	font-style: normal;
}

@font-face {
	font-family: 'GmarketSansLight';
	src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansLight.woff') format('woff');
	font-weight: normal;
	font-style: normal;
}

@font-face {
	font-family: 'GmarketSansMedium';
	src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
	font-weight: normal;
	font-style: normal;
}

@font-face {
	font-family: 'GmarketSansBold';
	src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansBold.woff') format('woff');
	font-weight: normal;
	font-style: normal;
}

#mm {
	display: flex;
	align: center !important;
	width: 100%;
	flex-wrap: wrap;
	justify-content: center;
}

.LLi {
	width: 450px;
}

#mm ul {
	width: 450px;
}

@media only screen and (min-width: 600px) and (max-width: 1000px) {
	#mm li img {
		width: 100%;
	}
	.LLi {
		width: 50%;
	}
	#mm ul {
		width: 50%;
	}
}

@media only screen and (max-width: 599px) {
	#mm li img {
		width: 100%;
	}
	.LLi {
		width: 100%;
	}
	#mm ul {
		width: 100%;
	}
}

/* ------------- 테이블 공통(텍스트 센터 기본) ------------- */
.mypage_table_type {
	
}

.mypage_table_type .td_left {
	text-align: left;
}

.mypage_table_type table {
	width: 100%;
	border: 0;
	border-spacing: 0;
	border-collapse: collapse;
	text-align: center;
}

.mypage_table_type th {
	padding: 9px 10px 10px 10px;
	border-top: 1px solid #999999;
	border-bottom: 1px solid #dbdbdb;
	background: #f7f7f7;
}

.mypage_table_type td {
	height: 31px;
	padding: 15px 10px 14px 10px;
	color: #777777;
	border-bottom: 1px solid #dbdbdb; /*border-left:1px dotted #ededed;*/
}

.mypage_table_type td>strong {
	color: #181818;
}

.mypage_table_type .btn_down_box {
	
}

.mypage_table_type th .form_element {
	vertical-align: middle;
}

.mypage_table_type .text_info {
	display: block;
	padding: 2px 0 2px 0;
	color: #999999;
	font-size: 11px;
}

.mypage_table_type .coupon_price {
	color: #333333;
	font-size: 14px;
}

.mypage_table_type .coupon_price b {
	padding: 0 2px 0 0;
	font-size: 16px;
}

.mypage_table_type .row_line td {
	border-bottom: 1px solid #ebebeb;
}

.mypage_table_type table td.order_day_num {
	border-right: 1px dotted #ededed;
	border-bottom: 1px solid #dbdbdb;
} /* 날짜/주문번호 */
.mypage_table_type .btn_claim>span {
	display: inline-block;
	margin: 7px 0 0 0;
}

/* 서브 메뉴가 오른쪽일때 */
#contents .sub_content>.content+.side_cont {
	padding: 0 0 0 40px;
}

#contents .sub_content>.content+.side_cont .sub_menu_box.layer_type .sub_depth1 {
	right: 200px;
}

#contents .sub_content>.content+.side_cont .sub_menu_box.layer_type .sub_depth2 {
	right: 160px;
}

#contents .sub_content>.content+.side_cont .sub_menu_box.layer_type .sub_depth3 {
	right: 160px;
}

#contents .sub_content>.content+.side_cont .sub_menu_box.layer_type .sub_depth4 {
	right: 160px;
}

.sub_menu_box {
	font-family: 'GmarketSansMedium';
}

/* 서브사이드  마이페이지 */
.side_cont .sub_menu_box .sub_menu_mypage {
	margin: 7px 0 0 0;
}

.side_cont .sub_menu_box .sub_menu_mypage>li {
	padding: 8px 0 20px 0;
	font-size: 14px;
	background: url('../img/common/lnb_tit.png') no-repeat top left;
}

.side_cont .sub_menu_box .sub_menu_mypage>li:first-child {
	margin: 30px 0 0 0;
}

.side_cont .sub_menu_box .sub_menu_mypage a {
	display: block;
	padding: 7px 0 6px 0;
	font-size: 14px;
}

.side_cont .sub_menu_box .sub_menu_mypage a:hover, .side_cont .sub_menu_box .sub_menu_mypage .active {
	font-weight: bold;
	background: #f8f8f8;
	color: #212121;
}

.side_cont .sub_menu_box .sub_menu_mypage .sub_depth1 {
	margin: 5px 0 25px 0;
}

.side_cont .sub_menu_box .sub_menu_mypage .sub_depth1 li {
	padding: 1px 0 0 0;
	font-weight: normal;
}

.side_cont .sub_menu_box .sub_menu_mypage .sub_depth1 a {
	text-decoration: none;
	color: #999999;
	font-size: 12px;
	text-indent: 10px;
	color: #999999;
}

/* CSS Document */

/* reset */
body, div, dl, dt, dd, ul, ol, li, h1, h2, h3, h4, h5, h6, pre, code, form, fieldset, legend, textarea, p, blockquote, th, td, input, select, textarea, button {
	margin: 0;
	padding: 0
}

fieldset, img {
	border: 0 none;
	vertical-align: top;
}

dl, ul, ol, li {
	list-style: none
}

blockquote, q {
	quotes: none
}

blockquote:before, blockquote:after, q:before, q:after {
	content: '';
	content: none
}

input, select, textarea, button {
	vertical-align: middle
}

button {
	border: 0 none;
	background-color: transparent;
	cursor: pointer
}

body {
	background: #fff
}

body, th, td, input, select, textarea, button {
	font-size: 12px;
	line-height: 1.5;
	font-family: 'SUIT', sans-serif;
	color: #333
} /* color값은 디자인가이드에 맞게사용 */
a {
	color: #333;
	text-decoration: none
}

a:active, a:hover {
	text-decoration: none;
}

address, caption, cite, code, dfn, em, var {
	font-style: normal;
	font-weight: normal
}

@font-face {
	font-family: 'SUIT';
	font-weight: 500;
	font-style: normal;
	src: url('https://cdn.jsdelivr.net/gh/webfontworld/sunn/SUIT-Medium.eot');
	src: url('https://cdn.jsdelivr.net/gh/webfontworld/sunn/SUIT-Medium.eot?#iefix') format('embedded-opentype'), url('https://cdn.jsdelivr.net/gh/webfontworld/sunn/SUIT-Medium.woff2') format('woff2'),
		url('https://cdn.jsdelivr.net/gh/webfontworld/sunn/SUIT-Medium.woff') format('woff'), url('https://cdn.jsdelivr.net/gh/webfontworld/sunn/SUIT-Medium.ttf') format("truetype");
	font-display: swap;
}

@font-face {
	font-family: 'NEXON Lv1 Gothic OTF';
	src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/NEXON Lv1 Gothic OTF.woff') format('woff');
	font-weight: normal;
	font-style: normal;
}

@font-face {
	font-family: 'NEXON Lv2 Gothic';
	src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/NEXON Lv2 Gothic.woff') format('woff');
	font-weight: normal;
	font-style: normal;
}

@font-face {
	font-family: 'GmarketSansLight';
	src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansLight.woff') format('woff');
	font-weight: normal;
	font-style: normal;
}

@font-face {
	font-family: 'GmarketSansMedium';
	src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
	font-weight: normal;
	font-style: normal;
}

@font-face {
	font-family: 'GmarketSansBold';
	src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansBold.woff') format('woff');
	font-weight: normal;
	font-style: normal;
}

#mm {
	display: flex;
	align: center !important;
	width: 100%;
	flex-wrap: wrap;
	justify-content: center;
}

.LLi {
	width: 450px;
}

#mm ul {
	width: 450px;
}

@media only screen and (min-width: 600px) and (max-width: 1000px) {
	#mm li img {
		width: 100%;
	}
	.LLi {
		width: 50%;
	}
	#mm ul {
		width: 50%;
	}
}

@media only screen and (max-width: 599px) {
	#mm li img {
		width: 100%;
	}
	.LLi {
		width: 100%;
	}
	#mm ul {
		width: 100%;
	}
}
/* 서브 사이드 메뉴 */
.side_cont .sub_menu_box {
	min-height: 250px;
	padding: 0 0 50px 0;
}

.side_cont .sub_menu_box .sub_menu {
	margin: 7px 0 0 0;
}

.side_cont .sub_menu_box .sub_menu li {
	padding: 1px 0 0 0;
}

.side_cont .sub_menu_box .sub_menu a {
	display: block;
	padding: 7px 0 6px 10px;
	font-size: 14px;
}

.side_cont .sub_menu_box .sub_menu a:hover, .side_cont .sub_menu_box .sub_menu .active {
	font-weight: bold;
	background: #f8f8f8;
	color: #212121;
}

.side_cont .sub_menu_box .sub_menu .sub_depth1 {
	margin: 0 0 15px 0;
}

.side_cont .sub_menu_box .sub_menu .sub_depth1 li {
	
}

.side_cont .sub_menu_box .sub_menu .sub_depth1 a {
	padding: 0 0 0 10px;
	font-size: 12px;
}

.sub_menu_box_tit {
	color: #ffffff;
	background-color: #0188CB;
	padding-top: 15px;
	padding-bottom: 15px;
	padding-left: 15px;
}

.sub_menu_box_tit h2 {
	font-size: 18px;
}

.check-s {
	margin-left: 6px;
	position: relative;
	top: -2.5px;
}
</style>
<%@include file="common/header.jsp"%>
<script>
	function check() {
		var result = confirm("정말 탈퇴 하시겠습니까?");

		if (result) {
			return true;
		} else {
			alert("취소 되었습니다.");
			return false;
		}
	}
</script>
<!-- Title page -->
<section class="bg-img1 txt-center p-lr-15 p-tb-92" style="background-image: url('../images/bg-img-01.png');">
	<h2 class="ltext-105 cl0 txt-center">회원탈퇴</h2>
</section>
<!-- Content page -->
<section class="bg0 p-t-62 p-b-60 p-r-50">
	<div class="container">
		<div class="row">
			<div class="col-md-8 col-lg-9 p-b-80">
				<!-- Content page -->
				<section class="bg0 p-t-65 p-b-120">
					<div class="container">
						<div class="sub-content">
							<div class="content-box">
								<div class="join-agreement-wrap">
									<form id="formHackOut" name="formHackOut" action="withdrawal.do" method="post" onsubmit="return check();">
										<div class="hack_out">
											<div class="mypage_zone_tit">
												<h2>회원탈퇴</h2>
											</div>
											<div class="mypage_unregister">
												<div class="mypage_zone_tit">
													<h3>01.회원탈퇴 안내</h3>
												</div>
												<div class="unregister_info">
													모두의보드 탈퇴안내<br> <br> 회원님께서 회원 탈퇴를 원하신다니 저희 쇼핑몰의 서비스가 많이 부족하고 미흡했나 봅니다.<br> 불편하셨던 점이나 불만사항을 알려주시면 적극 반영해서 고객님의 불편함을 해결해 드리도록 노력하겠습니다.<br> <br> ■ 아울러 회원 탈퇴시의 아래 사항을 숙지하시기 바랍니다.<br> 1. 회원 탈퇴 시 회원님의 정보는 상품 반품 및 A/S를 위해 전자상거래 등에서의 소비자 보호에 관한 법률에 의거한 <br> 고객정보 보호정책에따라 관리 됩니다.<br> 2. 탈퇴 시 회원님께서 보유하셨던 마일리지는 삭제 됩니다
												</div>
												<!-- //unregister_info -->
												<div class="mypage_zone_tit m-t-30">
													<h3>02.회원탈퇴 하기</h3>
												</div>
												<div class="mypage_table_type">
													<table class="table_left">
														<colgroup>
															<col style="width: 15%;">
															<col style="width: 85%;">
														</colgroup>
														<tbody>
															<tr>
																<th scope="row">비밀번호</th>
																<td>
																	<input type="password" name="mPw" required/>
																</td>
																<!-- //find_password_box -->
															</tr>
															<tr>
																<th scope="row">탈퇴사유</th>
																<td>
																	<div class="form_element">
																		<ul class="hack_out_list">
																			<li>
																				<input type="checkbox" id="reasonCd01003001" name="reasonCd[]" class="checkbox" value="01003001">
																				<label for="reasonCd01003001" class="check-s">고객서비스(상담,포장 등) 불만</label>
																			</li>
																			<li>
																				<input type="checkbox" id="reasonCd01003002" name="reasonCd[]" class="checkbox" value="01003002">
																				<label for="reasonCd01003002" class="check-s">배송불만</label>
																			</li>
																			<li>
																				<input type="checkbox" id="reasonCd01003003" name="reasonCd[]" class="checkbox" value="01003003">
																				<label for="reasonCd01003003" class="check-s">교환/환불/반품 불만</label>
																			</li>
																			<li>
																				<input type="checkbox" id="reasonCd01003004" name="reasonCd[]" class="checkbox" value="01003004">
																				<label for="reasonCd01003004" class="check-s">방문 빈도가 낮음</label>
																			</li>
																			<li>
																				<input type="checkbox" id="reasonCd01003005" name="reasonCd[]" class="checkbox" value="01003005">
																				<label for="reasonCd01003005" class="check-s">상품가격 불만</label>
																			</li>
																			<li>
																				<input type="checkbox" id="reasonCd01003006" name="reasonCd[]" class="checkbox" value="01003006">
																				<label for="reasonCd01003006" class="check-s">개인 정보유출 우려</label>
																			</li>
																			<li>
																				<input type="checkbox" id="reasonCd01003007" name="reasonCd[]" class="checkbox" value="01003007">
																				<label for="reasonCd01003007" class="check-s">쇼핑몰의 신뢰도 불만</label>
																			</li>
																		</ul>
																	</div>
																</td>
															</tr>
															<tr>
																<th scope="row">남기실 말씀</th>
																<td>
																	<textarea cols="30" rows="5" name="reasonDesc"></textarea>
																</td>
															</tr>
														</tbody>
													</table>
												</div>
											</div>
											<!-- //mypage_unregister -->
										</div>
										<!-- //hack_out -->
										<div class="btn_center_box flex-c">
											<a href="#;" class="btn_claim_cancel btn_prev hov-btn3">
												<em>이전으로</em>
											</a>
											<button type='submit' class="btn_claim_ok hov-btn3">탈퇴</button>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</section>
			</div>
			<%@include file="common/mypage.jsp"%>
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