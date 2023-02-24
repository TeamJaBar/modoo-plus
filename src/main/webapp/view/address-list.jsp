<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>배송지관리</title>
<style>

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
	text-decoration: none;
	font-family: 'SUIT', sans-serif;
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

/* 배송지 관리 > 새 배송지 추가 */
.btn_add_shipping {
	position: absolute;
	top: -42px;
	right: 0;
	height: 30px;
	padding: 0 10px;
	line-height: 28px;
	color: #fff;
	border: 1px solid #979797;
	background: #979797;
	text-align: center;
}

.btn_add_shipping:hover {
	border: 1px solid #626262;
	background: #626262;
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

.mypage_zone_tit {
	margin: 0 0 20px 0;
	padding: 0 0 10px 0;
	font-size: 13px;
	font-family: 'GmarketSansMedium';
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
	text-align: center;
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
	/*border-left:1px dotted #ededed;*/
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

.btn-correct {
	width: 35px;
	border-radius: 2px;
	background-color: #0188CB;
	border: 1px solid #0188CB;
	color: white;
	text-align: center;
	padding: 0 2px 0 2px;
}

.btn-delete {
	width: 35px;
	border-radius: 2px;
	background-color: #222;
	border: 1px solid #222;
	color: white;
	text-align: center;
	padding: 0 2px 0 2px;
}
</style>

<%@include file="common/header.jsp"%>

<!-- Title page -->
<section class="bg-img1 txt-center p-lr-15 p-tb-92" style="background-image: url('../images/bg-img-01.png');">
	<h2 class="ltext-105 cl0 txt-center">배송지 관리</h2>
</section>

<!-- Content page -->
<section class="bg0 p-t-62 p-b-60">
	<div class="container">
		<div class="row">
			<div class="col-md-8 col-lg-9 p-b-80 p-r-50">
				<!-- Content page -->
				<section class="bg0 p-t-75 p-b-120">
					<div class="container">
						<div class="sub-content">
							<div class="content-box">
								<div class="join-agreement-wrap">
									<div class="mypage_shipping js_delivery_layer">
										<div class="mypage_zone_tit">
											<h2>배송지 관리</h2>
											<span class="pick_list_num m-t-10">
												배송지 관리 내역 총
												<strong>${fn:length(address)}</strong>
												건
											</span>
										</div>
										<div class="mypage_shipping_cont">
											<div class="mypage_table_type">
												<table>
													<colgroup>
														<col style="width: 20%">
														<!-- 배송지이름 -->
														<col style="width: 12%">
														<!-- 받으실 분 -->
														<col>
														<!-- 주소 -->
														<col style="width: 20%">
														<!-- 연락처 -->
														<col style="width: 12%">
														<!-- 수정/삭제 -->
													</colgroup>
													<thead>
														<tr>
															<th>배송지이름</th>
															<th>받으실 분</th>
															<th>주소</th>
															<th>연락처</th>
															<th>수정/삭제</th>
														</tr>
													</thead>
													<tbody>
														<c:forEach var="v" items="${address}">
															<tr id="${v.aNum}">
																<td>
																	<c:if test="${v.isDefault == '1'}">
																		<span>(기본배송지)</span>
																	</c:if>
																	<strong>${v.destination}</strong>
																</td>
																<td id="shipName">${v.shipName}</td>
																<td>${v.userAddr}&nbsp;${v.detailAddr}&nbsp;(${v.zipCode})</td>
																<td class="td_phone">
																	<span>${v.tel}</span>
																</td>
																<td>
																	<button class="btn-correct hov-btn4" onclick="">수정</button>
																	<button class="btn-delete hov-btn4" onclick="">삭제</button>
																</td>
															</tr>
														</c:forEach>
													</tbody>
												</table>
											</div>
											<a href="address-manage.jsp" class="btn_add_shipping btn_open_layer hov-btn3 m-b-10">+ 새 배송지 추가</a>
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
				</section>
			</div>
			<%@include file="common/mypage.jsp"%>
		</div>
	</div>
</section>

<%@include file="common/footer.jsp"%>
<!--===============================================================================================-->
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<!--===============================================================================================-->
<script>
	$('.btn-correct').each(function() {
		let aNum = $(this).parent().parent().prop("id");
		$(this).on('click', function(e) {
			e.preventDefault();
			location.href='addrsSelectOne.do?type=update&aNum='+aNum;
		});
	});
	
	$('.btn-delete').each(function() {
		let aNum = $(this).parent().parent().prop("id");
		$(this).on('click', function(e) {
			e.preventDefault();
			if (confirm('정말 삭제하시겠습니까?')) {
				alert('삭제되었습니다.');
				location.href='addrsDelete.do?aNum='+aNum;
			} else {
				alert('취소되었습니다.');
			}
		});
	});
</script>
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