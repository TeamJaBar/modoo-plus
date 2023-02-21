<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>회원정보변경</title>
<style>
input[type="text"]::-ms-clear {
	display: none;
}

input:-ms-input-placeholder, input::-webkit-input-placeholder, input::-moz-placeholder, textarea:-ms-input-placeholder, textarea::-webkit-input-placeholder, textarea::-moz-placeholder {
	color: #cccccc;
}

textarea {
	padding: 5px;
	color: #a9a9a9;
	border: 1px solid #d6d6d6;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
}

.hidden {
	overflow: hidden;
	position: absolute;
	top: -9999px;
	left: -9999px;
	visibility: hidden;
	width: 0;
	height: 0;
	margin: 0;
	font-size: 0;
	text-indent: -9999px;
	line-height: 0;
	z-index: -9999;
}

.text_notover {
	display: block;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

.dn {
	display: none !important;
}

.db {
	display: block !important;
}

.oh {
	overflow: hidden !important;
}

.btn_left_box {
	text-align: left;
}

.btn_center_box {
	text-align: center;
}

.btn_right_box {
	text-align: right;
}

/* 마이페이지 > 나의 배송지 관리 */
#wrap .ly_wrap.delivery_add_layer {
	top: 0px;
	left: 0;
}

.delivery_add_layer .layer_wrap_cont {
	width: 690px;
}

.delivery_add_layer .layer_wrap_cont h5 {
	padding: 0 0 10px 0;
	font-size: 14px;
}

.delivery_add_layer .layer_wrap_cont .form_element {
	margin: 20px 0 0 0;
	text-align: center;
}

.btn_center_box {
	text-align: center;
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

/* 주소 */
.delivery_add_layer .left_table_type input {
	width: 190px;
}

.left_table_type .address_postcode {
	overflow: hidden;
}

.left_table_type .address_postcode input {
	float: left;
	width: 190px;
}

.left_table_type .address_postcode .btn_post_search {
	float: left;
	margin: 0 0 0 5px;
	padding: 5px 10px 5px 10px;
	border: 1px solid #989898;
}

.left_table_type .address_input {
	float: left;
	width: 100%;
}

.left_table_type .address_input input {
	margin: 7px 0 0 0;
}

.left_table_type .address_input input:first-child {
	width: 290px;
}
/* left 형 */
.left_table_type {
	
}

.left_table_type .td_left {
	text-align: left;
}

.left_table_type table {
	width: 100%;
	border: 0;
	border-spacing: 0;
	border-collapse: collapse;
	text-align: center;
}

.left_table_type th {
	padding: 6px 10px 7px 20px;
	color: #777777;
	border-top: 1px solid #dbdbdb;
	border-bottom: 1px solid #dbdbdb;
	background: #f7f7f7;
	text-align: left;
}

.left_table_type td {
	height: 31px;
	padding: 6px 10px 7px 15px;
	color: #777777;
	border-top: 1px solid #dbdbdb;
	border-bottom: 1px solid #dbdbdb;
	text-align: left;
}

.left_table_type .important {
	padding: 0 0 0 10px;
	margin: 0 0 0 -10px;
	background: url('../../../img/member/icon_dot_03.png') no-repeat 0 center;
}

.join-agreement-content .form-element em {
	font-weight: bold;
	font-style: normal;
}

.sub-content {
	position: relative;
	width: 1200px;
	margin: 0 auto;
	padding: 0 0;
}

.context-box {
	float: left;
	width: 100%;
}

.member-wrap {
	width: 593px;
	margin: 20px auto 40px auto;
}

.join-agreement-wrap .member-title {
	overflow: hidden;
	border-bottom: 1px solid #999999;
}

.member-title h2 {
	font-size: 2rem;
	margin: 0 0 20px 0;
	font-family: 'GmarketSansMedium';
}

.join-agreement-wrap .member-title ol {
	float: right;
	line-height: 62px;
}

.join-agreement-wrap .member-title .page-on {
	color: #181818;
}

.join-agreement-wrap .member-title ol li {
	float: left;
	font-size: 14px;
	color: #d1d1d1;
}

.join-agreement-wrap .member-title li span {
	font-size: 16px;
	font-weight: bold;
}

.join-agreement-wrap .member-title li span>img {
	padding: 0 14px;
	vertical-align: -1px;
}

.join-agreement-wrap .member-content {
	width: 743px;
	margin: 0 auto;
	border: none;
}

.member-content {
	padding: 70px 60px;
	/* border: 1px solid #dbdbdb; */
}

.join-agreement-wrap .join-agreement-content {
	padding: 30px 0 0 0;
	border-top: 1px solid #999999;
}

.join-agreement-content .join-agreement-box {
	margin: 0 0 30px 0;
}

.form-element {
	display: inline-block;
	overflow: hidden;
	position: relative;
}

.form-element input {
	position: absolute;
	top: 3px;
	left: 1px;
	width: 0;
	z-index: -1;
}

.form-element label {
	position: relative;
	top: 0;
	left: 0;
	display: inline-block;
	min-width: 20px;
	min-height: 20px;
	padding: 0 0 0 27px;
	background: url("https://www.boardgamemall.co.kr/data/skin/front/natural_C/img/common/input/check_off.png") no-repeat 1px top;
}

.join-agreement-content .form-element span {
	color: #717171;
	font-size: 11px;
}

.join-agreement-content .form-element span>a {
	padding: 0 10px 0 5px;
	color: #181818;
	font-size: 12px;
	background: url("https://www.boardgamemall.co.kr/data/skin/front/natural-C/img/member/icon-arrow-03.png") no-repeat right center;
	text-decoration: underline;
}

.join-agreement-content .agreement-box {
	overflow-x: hidden;
	overflow-y: auto;
	height: 89px;
	margin: 10px 0 0;
	padding: 20px;
	border: 1px solid #e6e6e6;
	border-top: 1px solid #999999;
	line-height: 18px;
}

.member-content .btn-center-box, .member-warning+.btn-center-box {
	margin: 35px 0 0 0;
}

.base-info-section table th:first-child, .base-info-section table td:first-child {
	border-left: none;
}

.base-info-section table th {
	text-align: left;
	border-bottom: 1px solid #dcdcdc;
	background: #fbfbfb;
}

.join-base-wrap table th {
	padding: 10px 25px;
}

.join-base-wrap table th span {
	padding: 0 0 0 10px;
	margin: 0 0 0 -10px;
}

.base-info-section table td {
	padding: 15px 0 15px 15px;
	border-bottom: 1px solid #dcdcdc;
}

#wrap .member-warning {
	display: inline;
	position: relative;
}

.base-info-section table input[type="text"] {
	width: 380px;
}

input[type="text"], input[type="password"] {
	padding: 0 10px;
	outline: none;
	font-size: 12px;
}

input[type="text"], input[type="password"] {
	height: 31px;
	padding: 0 5px;
	color: #333333;
	border: 1px solid #d6d6d6;
	line-height: 31px;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
}

.join-base-wrap .important {
	background: url("https://www.boardgamemall.co.kr/data/skin/front/natural_C/img/member/icon_dot_03.png") no-repeat 0 center;
}

.base-info-section table .form-element {
	display: block;
	margin-top: 5px;
}

.form-element input {
	position: absolute;
	top: 3px;
	left: 1px;
	width: 0;
	z-index: -1;
}

input[type="checkbox"] {
	width: 13px;
	height: 13px;
	vertical-align: top;
}

#contents .member-address .address-postcode {
	overflow: hidden;
}

#contents .member-address .address-postcode input {
	float: left;
	width: 190px;
}

input[type="button"] {
	border: none;
	background: none;
	cursor: pointer;
}

#contents .member-address .address-input {
	float: left;
	width: 72%;
}

.btn-center-box {
	text-align: center;
}

.btn-member-prev {
	width: 150px;
	height: 45px;
	margin: 35px 0 0 0;
	color: #3e3d3c;
	font-size: 14px;
	border: 1px solid #cccccc;
	background: #ffffff;
	cursor: pointer;
}

.btn-center-box button+button, .btn-left-box button+button, .btn-right-box button+button {
	margin-left: 6px;
}

.btn-member-next {
	width: 150px;
	height: 45px;
	margin: 35px 0 0 0;
	color: #ffffff;
	font-size: 14px;
	border: 1px solid #181818;
	background: #181818;
	cursor: pointer;
	font-weight: bold;
}

/* 서브사이드  마이페이지 */
.side_cont .sub_menu_box .sub_menu_mypage {
	margin: 7px 0 0 0;
}

.side_cont .sub_menu_box .sub_menu_mypage>li {
	padding: 8px 0 20px 0;
	font-size: 14px;
	background: url('../../img/common/lnb_tit.png') no-repeat top left;
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
	border-bottom: 1px solid #dbdbdb;
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

#emailDomain, #find_address {
	width: 20%;
	height: 31px;
	border: 1px solid #0188CB;
	border-image: initial;
	border-radius: 2px;
	margin-left: 10px;
}

#find_address:hover {
	background-color: #0188CB;
	color: white;
}

label[for="defaultFl"] {
	position: relative;
	top: -1.2px;
	margin-left: 10px;
	font-family: "GmarketSansLight";
	font-size: 13px;
}

.text_warning {
	margin-top: 5px;
	color: red;
}

.text_affirm {
	margin-top: 5px;
	color: #0188CB;
}

.hidden {
	display: none;
}
</style>

<%@include file="common/header.jsp"%>

<!-- Title page -->
<section class="bg-img1 txt-center p-lr-15 p-tb-92" style="background-image: url('/ModooShop/images/bg-img-01.png');">
	<h2 class="ltext-105 cl0 txt-center">배송지 관리</h2>
</section>


<!-- Content page -->
<section class="bg0 p-t-62 p-b-60">
	<div class="container">
		<div class="row">
			<div class="col-md-8 col-lg-9 p-b-80 p-r-50">
				<c:if test="${type!='update'}">
					<form action="addrsInsert.do" method="post" onsubmit="return manageSubmit();">
				</c:if>
				<c:if test="${type=='update'}">
					<form action="addrsUpdate.do" method="post" onsubmit="return manageSubmit();">
				</c:if>
				<div class="member-title">
					<c:if test="${type!='update'}">
						<h2>새로운 배송지 추가</h2>
					</c:if>
					<c:if test="${type=='update'}">
						<h2>배송지 수정</h2>
					</c:if>
				</div>
				<div class="ly_cont">
					<div class="scroll_box">
						<div class="left_table_type">
							<input type="hidden" name="aNum" value="${address.aNum}" />
							<table>
								<colgroup>
									<col style="width: 20%;">
									<col style="width: 80%;">
								</colgroup>
								<tbody>
									<tr>
										<th scope="row">
											<span class="important">배송지이름</span>
										</th>
										<td>
											<input type="text" name="destination" value="${address.destination}" required>
										</td>
									</tr>
									<tr>
										<th scope="row">
											<span class="important">받으실 분</span>
										</th>
										<td>
											<input type="text" name="shipName" maxlength="20" value="${address.shipName}" required>
										</td>
									</tr>
									<tr>
										<th scope="row">
											<span class="important">받으실 곳</span>
										</th>
										<td class="member_address">
											<div class="address_postcode find_address">
												<input type="text" name="zipCode" id="sample3_postcode" placeholder="우편번호" value="${address.zipCode}" required>
												<input type="button" id="find_address" onclick="sample3_execDaumPostcode()" value="우편번호 찾기" required>
											</div>
											<div id="wrapPost" style="display: none; border: 1px solid; max-width: 500px; height: 300px; margin: 5px 0; position: relative">
												<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor: pointer; position: absolute; right: 0px; top: -1px; z-index: 1" onclick="foldDaumPostcode()"
													alt="접기 버튼">
											</div>
											<div class="address_input detailed_address">
												<div class="member_warning">
													<input type="text" name="userAddr" id="sample3_address" placeholder="주소" value="${address.userAddr}" required>
												</div>
												<div class="member_warning js_address_sub">
													<input type="text" name="detailAddr" id="sample3_detailAddress" placeholder="상세주소" value="${address.detailAddr}" required>
												</div>
											</div>
										</td>
									</tr>
									<tr>
										<th scope="row">
											<span class="important">전화번호</span>
										</th>
										<td>
											<div class="address_postcode">
												<input type="text" id="cellPhone" name="tel" maxlength="12" placeholder="- 없이 입력하세요." data-pattern="gdNum" value="${address.tel}" required>
												<div data-lastpass-icon-root="true" style="position: relative !important; height: 0px !important; width: 0px !important; float: left !important;"></div>
											</div>
											<div id="memPn-hyphen-error" class="text_warning hidden">-없이 입력해주세요.</div>
											<div id="memPn-error" class="text_warning hidden">핸드폰 번호를 확인해주세요.</div>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<br>
						<div class="form_element" style="display: flex">
							<c:if test="${type=='update' and address.isDefault=='1'}">
								<input type="checkbox" id="defaultFl" name="defaultFl" class="checkbox" checked>
							</c:if>
							<c:if test="${(type=='update' and address.isDefault=='0') or type!='update'}">
								<input type="checkbox" id="defaultFl" name="defaultFl" class="checkbox">
							</c:if>
							<label for="defaultFl">
								<b>기본 배송지로 설정합니다.</b>
							</label>
						</div>
					</div>
					<!-- //scroll_box -->
					<div class="btn_center_box">
						<button type="button" class="btn-member-prev" onclick="location.href='addrsSelect.do'">
							<strong>취소</strong>
						</button>
						<button type="submit" class="btn-member-next">
							<strong>저장</strong>
						</button>
					</div>
				</div>

				<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
				<script>
					// 우편번호 찾기 찾기 화면을 넣을 element
					var element_wrap = document.getElementById('wrapPost');

					function foldDaumPostcode() {
						// iframe을 넣은 element를 안보이게 한다.
						element_wrap.style.display = 'none';
					}

					function sample3_execDaumPostcode() {
						// 현재 scroll 위치를 저장해놓는다.
						var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
						new daum.Postcode({
							oncomplete : function(data) {
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

								// 우편번호와 주소 정보를 해당 필드에 넣는다.
								document.getElementById('sample3_postcode').value = data.zonecode;
								document.getElementById("sample3_address").value = addr;
								// 커서를 상세주소 필드로 이동한다.
								document.getElementById("sample3_detailAddress").value = "";
								document.getElementById("sample3_detailAddress").focus();

								// iframe을 넣은 element를 안보이게 한다.
								// (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
								element_wrap.style.display = 'none';

								// 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
								document.documentElement.scrollTop = currentScroll;
							},
							// 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
							onresize : function(size) {
								element_wrap.style.height = size.height + 'px';
							},
							width : '100%',
							height : '100%'
						}).embed(element_wrap);

						// iframe을 넣은 element를 보이게 한다.
						element_wrap.style.display = 'block';
					}
				</script>
				</form>
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

<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script>
	let phoneCheck = true;

	$(document).ready(function() {
		console.log($('#defaultFl').val());

		/* 체크박스 토글 */
		$('.check_s').click(function() {
			$(this).toggleClass("on");
		});

		/* 휴대폰 정규식 */
		// 01X
		const phoneCheckFst = /^01(?:0|1|[6-9])$/m
		// 십진수 3 혹은 4자
		const phoneCheckSnd = /^(?:\d{3}|\d{4})$/m
		// 십진수 4자
		const phoneCheckTrd = /^\d{4}$/m

		$('#cellPhone').focusout(function() {
			let phone = $('#cellPhone').val();
			// 앞(01X) 중간(3 or 4) 뒤(4)
			let fst, snd, trd;
			// '-' 놉!
			if (/\-/m.test(phone)) {
				$('#memPn-hyphen-error').removeClass('hidden');
				phoneCheck = false;
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
				return;
			} else {
				$('#memPn-error').addClass('hidden');
				phoneCheck = true;
			}
		});

	});

	function manageSubmit() {
		if (phoneCheck) {
			if (confirm("배송지를 추가 혹은 수정하겠습니까?")) {
				alert("저장되었습니다!");
				return true;
			} else {
				alert("취소되었습니다.");
				location.reload();
				return false;
			}
		} else {
			alert("입력 조건을 확인해주세요.");
			console.log("전화번호" + phoneCheck);
			return false;
		}
	}
</script>



</html>