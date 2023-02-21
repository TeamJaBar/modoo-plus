<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>이용안내</title>
<style>
body, th, td, input, select, textarea, button {
	font-size: 12px;
	line-height: 1.5;
	font-family: GmarketSansMedium;
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
	padding: 0 10px;
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

.member_cont .btn_center_box, .member_warning+.btn_center_box {
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
	display: inline-block;
	min-width: 80px;
	height: 42px;
	padding: 0 10px 0 10px;
	line-height: 40px;
	color: #3e3d3c;
	font-size: 14px;
	border: 1px solid #cccccc;
	background: #ffffff;
	text-align: center;
}

.btn_claim_cancel:hover {
	color: #333333;
	border: 1px solid #bbbbbb;
}

.btn_claim_cancel em {
	font-weight: bold;
}

.btn_claim_ok {
	min-width: 100px;
	height: 44px;
	padding: 0 10px 0 10px;
	color: #ffffff;
	font-size: 14px;
	font-weight: bold;
	border: 1px solid #181818;
	background: #181818;
	text-align: center;
	vertical-align: top;
}

.btn_claim_ok:hover {
	border: 1px solid #181818;
	background: #181818;
}

.btn_claim_ok em {
	font-weight: bold;
}

/* ------------- 마이페이지 > 회원탈퇴 ------------- */
.hack_out {
	margin: 0 0 50px 0;
}

.hack_out .mypage_zone_tit {
	margin: 0 0 50px 0;
	padding: 0 0 10px 0;
	font-size: 14px;
	border-bottom: 1px solid #999999;
}

.hack_out .mypage_unregister .mypage_zone_tit {
	margin: 0;
	padding: 0 0 10px 0;
	font-size: 14px;
	border-bottom: none 0;
}

.hack_out .mypage_unregister .unregister_info {
	margin: 0 0 40px 0;
	padding: 15px 15px 15px 15px;
	color: #717171;
	border: 1px solid #dadada;
}

.hack_out .mypage_unregister .hack_out_list li {
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
body, div, dl, dt, dd, ul, ol, li, h1, h2, h3, h4, h5, h6, pre, code,
	form, fieldset, legend, textarea, p, blockquote, th, td, input, select,
	textarea, button {
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
	font-family: GmarketSansMedium;
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
	src:
		url('https://cdn.jsdelivr.net/gh/webfontworld/sunn/SUIT-Medium.eot');
	src:
		url('https://cdn.jsdelivr.net/gh/webfontworld/sunn/SUIT-Medium.eot?#iefix')
		format('embedded-opentype'),
		url('https://cdn.jsdelivr.net/gh/webfontworld/sunn/SUIT-Medium.woff2')
		format('woff2'),
		url('https://cdn.jsdelivr.net/gh/webfontworld/sunn/SUIT-Medium.woff')
		format('woff'),
		url('https://cdn.jsdelivr.net/gh/webfontworld/sunn/SUIT-Medium.ttf')
		format("truetype");
	font-display: swap;
}

@font-face {
	font-family: 'NEXON Lv1 Gothic OTF';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/NEXON Lv1 Gothic OTF.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

@font-face {
	font-family: 'NEXON Lv2 Gothic';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/NEXON Lv2 Gothic.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

@font-face {
	font-family: 'GmarketSansLight';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansLight.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

@font-face {
	font-family: 'GmarketSansMedium';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

@font-face {
	font-family: 'GmarketSansBold';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansBold.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

#mm {
	display: flex;
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
</style>

<%@include file="common/header.jsp"%>

	<!-- Title page -->
	<section class="bg-img1 txt-center p-lr-15 p-tb-92"
		style="background-image: url('../images/bg-img-01.png');">
		<h2 class="ltext-105 cl0 txt-center">Guidelines</h2>
	</section>

	<!-- Title page -->
	<section class="bg0 p-t-75 p-b-120">
		<div class="container">
			<div class="sub-content">
				<div class="content-box">
					<div class="join-agreement-wrap">

						<form id="formHackOut" name="formHackOut"
							action="../mypage/my_page_ps.php" method="post"
							novalidate="novalidate">
							<input type="hidden" name="mode" value="hackOut"> <input
								type="hidden" name="snsType" value="">
							<div class="hack_out">

								<div class="mypage_zone_tit ltext-104">
									<h2>이용안내</h2>
								</div>

								<div class="mypage_unregister">
									<div class="unregister_info" style="font-size: 10px;">
										모두의 보드 이용안내 <br> <br> ■ 회원가입안내<br> ① 저희 모두의 보드는
										기본적으로는 회원제로 운영하고 있습니다.<br> ② 회원가입비나 월회비, 연회비등 어떠한 비용도
										청구하지 않는 100% 무료 입니다.<br> ③ 회원 가입시 기본 가입 축하금으로 1,000원 의
										마일리지가 지급됩니다.<br> ④ 구매시 상품별로 적용된 마일리지는는 0원 이상이면 사용하실 수가
										있습니다.<br> <br> <br> ■ 마일리지 제도<br> ①
										저희모두의 보드는 마일리지를 사용할 수 있습니다.<br> ② 마일리지 100점은 현금 100원과
										같습니다.<br> ③ 마일리지는 1,000,000원 이 넘는 금액의 적립금은 사용하실 수가 없습니다.<br>
										<br> <br> ■ 상품주문방법<br> 저희모두의 보드에서 상품을 주문하는 방법은
										크게 6단계입니다.<br> ① 상품검색<br> ② 쇼핑백에 담기<br> ③ 회원ID
										로그인 또는 비회원 주문<br> ④ 주문서 작성<br> ⑤ 결제방법 선택 및 결제<br>
										⑥ 주문 성공 화면 (주문번호)<br> ⑦ 비회원 주문인 경우 6단계에서 주문번호와
										승인번호(카드결제시)를 꼭 메모해 두시기 바랍니다.<br> ※ 단, 회원인 경우 자동 저장되므로 따로
										관리하실 필요가 없습니다.<br> <br> <br> ■ 주문확인 및 실시간
										배송조회시스템<br> 모두의 보드에서 주문을 하셨을 경우 주문/배송 확인을 통해서 실제 주문이 어떻게
										처리되고 있는지 확인 하실 수 있습니다. 회원페이지에서 주문/배송 확인을 클릭해 보세요.<br> 회원일
										경우 ID와 비밀번호를 입력하시면 되고 비회원으로 주문하셨을 경우, 주문하셨을때 입력했던 메일을 입력하시면
										됩니다. (주문시 입력했던 이름을 정확하게 입력하셔야 합니다. 주문자의 이름을 입력하는 것은 본인 확인을 위해서
										입니다.)<br> 현재 배송은 CJ대한통운택배 서비스를 이용하고 있습니다. 본 서비스는 상품 추적을
										통해 상품이 어디쯤 도착해 있는지 실시간으로 추적하실 수 있습니다.<br> <br> <br>
										■ 안전한 대금 결제 시스템<br> 저희 모두의 보드는 무통장 입금과 신용카드의 두 가지 결제방법을
										제공하여 드립니다.<br> 무통장 입금은 상품 구매 대금은 PC뱅킹, 인터넷뱅킹, 텔레뱅킹 혹은 가까운
										은행에서 직접 입금하시면 되고, 신용카드 결제는 이니시스사의 전자결제를 이용하므로 보안문제는 걱정하지 않으셔도
										되며, 고객님의 이용내역서에는 ㈜이니시스로 기록됩니다.<br> 이용 가능한 국내 발행 신용카드<br>
										- 국내발행 모든 신용카드<br> 이용 가능한 해외 발생 신용카드<br> - VISA
										Card, MASTER Card, AMEX Card<br> 무통장 입금 가능 은행<br> -
										국민은행<br> 무통장 입금시의 송금자 이름은 주문시 입력하신 주문자의 실명이어야 합니다.<br>
										<br> <br> ■ 배송기간 및 배송방법<br> 고객님이 무통장 입금으로 주문하신
										경우에는 입금하신 날로부터, 신용카드로 구매하신 경우에는 구매하신 날로부터 2-3일 이내에(최장 7일이내)
										입력하신 배송처로 주문상품이 도착하게 됩니다. 주문하신 상품에 따라 배송기간이 조금 상이할 수 있습니다.<br>
										주문하실 때 희망 배송일자를 넉넉히 잡아주시면(3일이상) 원하시는 날짜에 배송할 수 있도록 최선을 다하겠습니다.<br>
										저희 모두의 보드에서는 구입하신 상품의 배송 방법을 CJ대한통운택배 서비스를 원칙으로 하고 있습니다. (배송방법은
										상품 종류에 따라 상이할 수 있습니다.)<br> <br> <br> ■ 주문취소, 교환
										및 환불<br> 모두의 보드는 소비자의보호를 위해서 규정한 제반 법규를 준수합니다.<br> 주문
										취소는 미결재인 상태에서는 고객님이 직접 취소하실 수가 있습니다. 결제후 취소는 저희 고객센터로 문의해 주시기
										바랍니다.<br> 무통장 입금의 경우 일정기간동안 송금을 하지 않으면 자동 주문 취소가 되고, 구매자가
										원하는 경우 인터넷에서 바로 취소 하실 수도 있으며, 송금을 하신 경우에는 환불조치 해드립니다.<br>
										카드로 결제하신 경우, 승인 취소가 가능하면 취소을 해드리지만 승인 취소가 불가능한 경우 해당 금액을 모두
										송금해 드립니다.<br> 상품이 원하는 상품이 아닌 경우는 상품을 받으신 날부터 7일 이내에
										고객센터(전화 or 게시판)을 이용하여 의사를 밝혀 주시기바랍니다.<br> 반품의 사유가<br>
										- 구매자에게 있는 경우, 왕복 배송비는(반송료) 고객 부담 입니다.<br> - 판매자에게 있는 경우,
										왕복 배송비는(반송료) 판매자 부담입니다.<br> 반송을 하실 때에는 주문번호, 회원번호를 메모하여
										보내주시면 보다 신속한 처리에 도움이 됩니다.
									</div>


								</div>
								<!-- //mypage_unregister -->

							</div>
							<!-- //hack_out -->


						</form>
					</div>

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
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAKFWBqlKAGCeS1rMVoaNlwyayu0e0YRes"></script>
	<script src="../js/map-custom.js"></script>
	<!--===============================================================================================-->
	<script src="../js/main.js"></script>

</body>
</html>