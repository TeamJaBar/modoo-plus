<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>취소내역</title>
<script src="https://kit.fontawesome.com/2a349c84d6.js" crossorigin="anonymous"></script>
<style>
/* 서브 메뉴가 오른쪽일때 */
#contents .sub_content>.content+.side_cont {
	padding: 0 0 0 40px;
}

#contents .sub_content>.content+.side_cont .sub_menu_box.layer_type .sub_depth1
	{
	right: 200px;
}

#contents .sub_content>.content+.side_cont .sub_menu_box.layer_type .sub_depth2
	{
	right: 160px;
}

#contents .sub_content>.content+.side_cont .sub_menu_box.layer_type .sub_depth3
	{
	right: 160px;
}

#contents .sub_content>.content+.side_cont .sub_menu_box.layer_type .sub_depth4
	{
	right: 160px;
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
	font-family: 'SUIT', sans-serif;
	color: #333
}

/* color값은 디자인가이드에 맞게사용 */
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

/* 계정 연결 정보 */
.site_info_box {
	margin: 40px 0 0 0;
}

.site_sns_info {
	padding: 30px 20px 30px 20px;
	border: 1px solid #dadada;
}

.site_sns_info .site_sns_list {
	
}

.site_sns_info .site_sns_list h4 {
	display: inline-block;
	margin: 0 14px 0 0;
	color: #777777;
}

.site_sns_info .site_sns_list em {
	display: block;
	padding: 0 0 15px 0;
}

.site_sns_info .site_sns_list span {
	display: inline-block;
	margin: 0 0 0 0;
	vertical-align: middle;
}

.site_sns_info .site_sns_list a {
	display: inline-block;
	margin: 0 6px 10px 0;
	vertical-align: top;
	line-height: 1;
}

.site_sns_info .site_sns_list a>span {
	display: block;
	margin: 0 0 0 0;
	font-size: 13px;
}

.site_sns_info .site_sns_list img {
	margin: 0 0 0 0;
}

.site_sns_info .site_sns_list .my_facebook {
	color: #3b5998;
}

.site_sns_info .site_sns_list .my_payco {
	color: #fa4a4a;
}

.site_sns_info .site_sns_list .my_naver {
	color: #2db400;
}

.site_sns_info .site_sns_list .my_kakao {
	color: #381e1f;
}

.site_sns_info .site_sns_list_disconnect span {
	display: inline-block;
	margin: 0 6px 0 0;
	vertical-align: middle;
}

.site_sns_info .site_sns_list_disconnect a {
	display: inline-block;
	width: 225px;
	height: 42px;
	margin: 0 6px 0 0;
	border: 1px solid #cfcfcf;
	background: #fafafa;
	text-align: center;
	vertical-align: middle;
	line-height: 1;
}

.site_sns_info .site_sns_list_disconnect a>span {
	display: block;
	margin: 14px 0 0 0;
	font-size: 13px;
}

.site_sns_info .site_sns_list_disconnect img {
	margin: 0 8px 0 0;
}

/* 약관동의현황 */
.my_page .join_agreement_cont {
	margin: 40px 0 0 0;
}

.my_page .join_agreement_cont h3 {
	margin: 0 0 10px 0;
}

.mypage_zone_tit {
	margin: 0 0 0 0;
	padding: 0 0 10px 0;
	font-size: 16px;
}

.mypage_zone_tit h3 {
	display: inline-block;
	font-size: 16px;
}

.mypage_zone_tit h4 {
	font-size: 16px;
}

.mypage_zone_tit span {
	padding: 0 0 0 5px;
	color: #777777;
	font-size: 12px;
	font-weight: normal;
}

.mypage_shipping .mypage_zone_tit h3 {
	display: inline-block;
}

.mypage_shipping .mypage_zone_tit .pick_list_num {
	display: inline-block;
}

.pick_list_num {
	display: block;
	padding: 20px 0 10px 0;
	font-size: 14px;
}

.pick_list_num strong {
	color: #181818;
}

.pick_list_day {
	display: block;
	padding: 20px 0 10px 0;
	font-size: 14px;
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
}

.mypage_table_type th {
	padding: 9px 10px 10px 10px;
	border-top: 1px solid #999999;
	border-bottom: 1px solid #dbdbdb;
	background: #f7f7f7;
	text-align: center;
}

.mypage_table_type td {
	height: 31px;
	padding: 15px 10px 14px 10px;
	color: #777777;
	border-bottom: 1px solid #dbdbdb;
	text-align: center;
	/*border-left:1px dotted #ededed;*/
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
}

/* 날짜/주문번호 */
.mypage_table_type .btn_claim>span {
	display: inline-block;
	margin: 7px 0 0 0;
}

/* ------------- 마이페이지 > 배송지 관리 ------------- */
.mypage_shipping {
	position: relative;
}

.mypage_shipping_cont {
	position: relative;
}

.mypage_shipping_cont .pick_list_num {
	position: absolute;
	top: -50px;
	left: 92px;
	font-size: 13px;
}

.mypage_shipping_cont .mypage_table_type span {
	display: block;
}

.mypage_shipping_cont .mypage_table_type .btn_gray_list {
	margin: 5px 0 5px 0;
}

.mypage_table_type .td_phone span {
	width: 150px;
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

.side_cont .sub_menu_box .sub_menu_mypage a:hover, .side_cont .sub_menu_box .sub_menu_mypage .active
	{
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

/* 서브 사이드 메뉴 */
.sub_menu_box {
	font-family: 'GmarketSansMedium';
}

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

.side_cont .sub_menu_box .sub_menu a:hover, .side_cont .sub_menu_box .sub_menu .active
	{
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

input[class="search_duration"] {
	display: none;
}

input[class="search_duration"]+label {
	display: inline-block;
	width: 80px;
	height: 42px;
	border: 1px solid #999999;
	border-right: none;
	cursor: pointer;
	text-align: center;
	line-height: 42px;
	font-family: 'GmarketSansMedium';
	margin: 0;
	font-size: 12px;
}

input[class="search_duration"]+label:hover {
	background-color: #999999;
	color: white;
}

input[class="search_duration"]:checked+label {
	background-color: #999999;
	color: white;
}

label[for="year"] {
	margin-right: 50px !important;
}

label[for="today"] {
	border-left:none !important;
}

.lookup {
	width: 110px;
	height: 42px;
	text-align: center;
	background-color: #222;
	border: 1px solid #222;
	padding: 0 10px 0 10px;
	color: white;
	font-family: 'GmarketSansMedium';
	font-size: 12px;
}

.lookup:hover{
	background-color: #0188CB;
	border-color:#0188CB;
	color: white;
}

.icon {
	margin-left: 10px;
	margin-top: 2px;
}
</style>

<%@include file="common/header.jsp"%>

<!-- Title page -->
<section class="bg-img1 txt-center p-lr-15 p-tb-92"
	style="background-image: url('/ModooShop/images/bg-img-01.png');">
	<h2 class="ltext-105 cl0 txt-center">취소내역</h2>
</section>

<!-- Content page -->
<section class="bg0 p-t-62 p-b-60">
	<div class="container">
		<div class="row">
			<div class="col-md-8 col-lg-9 p-b-80 p-r-50">

				<!-- 취소/반품 조회 -->
				<div class="bg0 p-b-120">
					<div class="sub-content">
						<div class="mypage_shipping">
							<div class="m-b-110">
								<h6 class="p-l-12 stext-106">조회기간</h6>

								<div class="bor12 p-t-15 p-b-50">

									<form class="select-container flex-c m-t-20" action="canList.do">
										<input type="radio" class="search_duration" name="search_duration" id="today" value="0"> 
										<label for="today">오늘</label> 
										<input type="radio" class="search_duration" name="search_duration" id="week" value="7"> 
										<label for="week">7일</label> 
										<input type="radio" class="search_duration" name="search_duration" id="fortnight" value="15"> 
										<label for="fortnight">15일</label>
										<input type="radio" class="search_duration" name="search_duration" id="month" value="30"> 
										<label for="month">1개월</label> 
										<input type="radio" class="search_duration" name="search_duration" id="3months" value="90"> 
										<label for="3months">3개월</label> 
										<input type="radio" class="search_duration" name="search_duration" id="year" value="365"> 
										<label for="year">1년</label>
										<!-- <button class="lookup">
											조회 <i class="fa-solid fa-magnifying-glass icon"></i>
										</button> -->
										<input type="submit" class="lookup" value="조회">
									</form>
								</div>
							</div>

							<div>
								<h6 class="m-b-20 stext-106 p-l-12">취소 내역</h6>
								<div class="mypage_table_type">

									<table>
										<tbody>
											<tr class="table_head">
												<th class="column-1">주문번호</th>
												<th class="column-2">상품명</th>
												<th class="column-3">수량</th>
												<th class="column-4">상품금액</th>
												<th class="column-5">합계</th>
											</tr>
											<tr class="table_row">
												<td class="column-1">${order.pNum}</td>
												<td class="column-2">${order.pNumPname}</td>
												<td class="column-3">${order.pNumcnt}개</td>
												<td class="column-4">${order.pNumSelPrice}원</td>
												<td class="column-5">${order.totalPrice}원</td>
											</tr>
										</tbody>
									</table>
								</div>
								<!-- //mypage_shipping_cont  -->
								<div class="pagination">
									<ul></ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- 메뉴 -->
			<div class="col-md-4 col-lg-3 p-b-80">
				<div class="side-menu">
					<div class="sub_content">
						<div class="side_cont">
							<span class="btn_side_mobile"></span>
							<div class="sub_menu_box">
								<div class="sub_menu_box_tit">
									<h2>
										<i class="fa fa-bars m-r-10"></i>마이페이지
									</h2>

								</div>
								<ul class="sub_menu_mypage">
									<li>쇼핑정보
										<ul class="sub_depth1">
											<li><a href="order-list.html">- 주문목록/배송조회</a></li>
											<li><a href="cancel-list.html">- 취소 내역</a></li>
											<li><a href="dibs-list.html">- 찜리스트</a></li>
										</ul>
									</li>
									<li>회원정보
										<ul class="sub_depth1">
											<li><a href="change-inform.html">- 회원정보 변경</a></li>
											<li><a href="withdrawal.html">- 회원 탈퇴</a></li>
											<li><a href="manage-address.html">- 배송지 관리</a></li>
										</ul>
									</li>
								</ul>
							</div>
						</div>
					</div>
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
<script src="../js/main.js"></script>
</body>

</html>