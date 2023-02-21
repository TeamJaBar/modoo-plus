<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="modoo" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Home</title>
<style>
.gutter-sizer {
	width: 12%;
}

/*------모바일---------------------------------*/
.main-menu-m {
	padding-top: 10px;
	padding-bottom: 10px;
	background-color: #0188CB;
}

.sub-menu-m li a {
	font-family: GmarketSansMedium;
}

.sub-menu-m li a:hover {
	color: #0188CB;
}

.logo-mobile {
	display: block;
	position: relative;
	height: 80%;
	margin-left: 20px;
	padding-right: 25px;
	-webkit-flex-grow: 1;
	-moz-flex-grow: 1;
	flex-grow: 1;
	-webkit-flex-grow: 1;
	height: 80%;
}

.topbar-mobile li {
	padding: 8px 20px;
	border-top: 1px solid rgba(255, 255, 255, 0.5);
	background-color: #ffffff;
}

.main-menu-m>li>a {
	font-family: GmarketSansMedium /*Poppins-Medium*/;
	font-size: 14px;
	color: white;
	line-height: 2.8;
	padding: 8px 20px 8px 20px;
}

/*-----------------------------------------*/
.hov-cl1:hover {
	color: #0188CB;
}

.hov-bg1:hover {
	background-color: #0188CB;
}

.hov-btn3:hover {
	border-color: #0188CB;
	background-color: #0188CB;
	color: #fff;
}

/* 상품 갤러리형을 기본으로 */
.item_cont {
	display: inline-block;
	position: relative;
	width: 100%;
	padding: 0;
	text-align: left;
	color: #1c1c1c;
	vertical-align: middle;
}

.stext-106 {
	font-family: GmarketSansMedium;
	font-size: 15px;
	line-height: 1.2;
}

.ltext-103 {
	font-family: GmarketSansMedium;
	font-weight: bold;
	font-size: 36px;
	line-height: 1.1;
	text-transform: uppercase;
}

.main_content {
	width: 80%;
	margin: 0 auto;
	padding: 0 50px 50px 50px;
}

.goods_list {
	padding-bottom: 60px;
}

.goods_list_tit {
	padding: 60px 0 20px 0;
	line-height: 1;
	position: relative;
}

.goods_list_tit h3 {
	font-family: 'GmarketSansMedium';
	font-size: 20px;
	text-align: center;
	font-weight: normal
}

.goods_list_tit em {
	display: block;
	height: 20px;
	font-size: 12px;
	font-family: 'GmarketSansMedium';
	color: #999
}

.goods_list_cont {
	position: relative;
	width: 100%;
}

.goods_list_cont:after {
	display: block;
	clear: both;
	content: "";
}

.goods_list_cont ul {
	float: left;
	width: 100%;
	font-size: 0;
}

.goods_list_cont ul li {
	display: inline-block;
	position: relative; /*min-height:50px;*/
	margin: 40px 0 0 0;
	text-align: center;
	vertical-align: top;
	font-size: 12px;
}

.item_cont {
	padding: 0 10px; /*text-align:left;*/
	color: #1c1c1c;
}

.icon_time_sale {
	position: absolute;
	top: 0;
	left: 0;
	text-align: left;
}

.item_photo_box {
	display: inline-block !important;
	overflow: hidden;
	position: relative;
	text-align: center;
	vertical-align: middle;
}

.item_photo_box a {
	display: block;
	color: #000;
	height: 100%;
}

.item_photo_box .item_soldout_bg {
	display: none;
	position: absolute;
	top: 0px;
	left: 0px;
	width: 100%;
	height: 100%;
	text-align: center;
	background-color: #ffffff;
	filter: alpha(opacity = 60);
	background-color: rgba(255, 255, 255, 0.6);
	background-repeat: no-repeat;
	background-position: center center;
	font-size: 0;
}

.item_photo_box a {
	border: 1px solid #ebebeb;
}

.item_photo_box a:hover {
	border: 1px solid #555;
	left: -1px;
	top: -1px;
}

.item_info_cont { /*display:table-cell;*/
	padding: 20px 0 0 0; /*text-align:left;*/
	vertical-align: middle;
	font-size: 12px;
}

.item_tit_box {
	padding: 0;
}

.item_tit_box .item_brand {
	display: block;
	color: #888888;
}

.item_tit_box .item_name {
	display: block;
	padding: 5px 0 0 0;
	font-family: 'GmarketSansMedium';
	font-size: 13px;
	color: #212121;
}

.item_tit_box .item_name_explain {
	display: block;
	padding: 0 10px 0 0px;
	color: #a8a8a8;
}

.item_icon_box {
	margin: 0;
	padding: 0;
}

.item_icon_box img {
	display: inline-block;
	padding: 5px 0 0 0;
}

.item_money_box {
	padding: 10px 0 0 0;
	line-height: 1;
}

.item_money_box del {
	color: #888888;
}

.item_money_box .item_price {
	display: block;
	padding: 7px 0 5px 0;
	font-size: 14px;
	font-family: 'GmarketSansMedium';
	color: #212121;
}

.item_money_box .item_price .time_sale_cost {
	display: inline-block;
	padding: 7px 0 5px 20px;
	font-size: 16px;
	background: url('../../img/icon/goods_icon/icon_time_sale_cost.png') no-repeat left 7px;
}

.item_money_box .item_sale {
	display: block;
	padding: 3px 0 3px 0;
	font-size: 16px;
	font-family: 'GmarketSansMedium';
	color: #212121;
}

.item_number_box {
	font-size: 11px;
	font-family: 'GmarketSansMedium';
	color: #a8a8a8;
}

.item_number_box .num_model {
	display: block;
}

.item_number_box .num_code {
	display: block;
}

/* 갤러리형 기본 */
.item_gallery_type {
	
}

/**
 * 갤러리형 가격 디자인 수정
 * 190830 Kmong 윤서준
 */
.item_gallery_type .item_money_box .item_price span {
	font-weight: normal;
}

.item_gallery_type .item_money_box .item_price strong {
	font-size: 16px;
}

.item_gallery_type .item_money_box .item_price .discount_rate {
	color: #d13947;
	font-family: 'GmarketSansMedium';
	font-size: 16px;
}

.item_gallery_type .item_money_box .item_sale {
	display: block;
	padding: 0 0 3px 0;
	font-size: 12px;
	font-family: 'GmarketSansMedium';
	color: #46479a;
	font-weight: normal;
}

.item_gallery_type .item_money_box .item_sale strong {
	font-size: 14px;
}

/* 리스트형 */
.item_list_type {
	overflow: hidden;
	width: 100%;
}

.item_list_type:after {
	display: block;
	clear: both;
	content: "";
}

.goods_list_cont .item_list_type li {
	width: 100%;
	padding: 40px 0 0 0;
	border-top: 1px solid #ebebeb;
	text-align: left;
}

.item_list_type li:first-child {
	padding: 0 0 0 0;
	border: 0 none;
}

.item_list_type .item_cont {
	display: inline-block;
	position: relative;
	width: 100%;
	padding: 0;
	text-align: left;
	color: #1c1c1c;
	vertical-align: middle;
}

.item_list_type .item_photo_box {
	display: inline-block !important;
	position: relative;
	text-align: center;
	vertical-align: middle;
}

.item_list_type .item_info_cont {
	display: inline-block;
	width: 70%;
	padding: 0;
}

.item_list_type .item_info_list {
	display: inline-block;
	width: 46%;
	min-width: 100px;
	padding: 0 10px 0 20px;
	vertical-align: middle;
}

.item_list_type .item_info_list .item_tit_box .item_name_explain {
	display: inline-block;
}

.item_list_type .item_money_box {
	display: inline-block;
	padding: 0 20px 0 20px;
	vertical-align: middle;
}

.item_list_type .item_number_box {
	padding: 10px 0 0 0;
}

.item_list_type .item_btn_box {
	position: absolute;
	top: 50%;
	right: 10px;
	height: 76px;
	margin-top: -55px;
}

.item_btn_box button {
	display: block;
	margin: 10px 10px 10px 20px;
	font-weight: bold;
}

.btn_list_get {
	width: 200px;
	padding: 10px 20px;
	color: #ffffff;
	background: #979797;
} /* 찜하기 */
.btn_list_get:hover {
	background: #626262;
}

.btn_list_cart {
	width: 200px;
	padding: 10px 20px;
	color: #ffffff;
	background: #212121;
} /* 장바구니 */
.btn_list_cart:hover {
	background: #181818;
}

/* 리스트그룹형 */
.item_group_type li {
	display: table;
	width: 50%;
}

.item_group_type .item_cont {
	display: table-cell;
	padding: 0;
	text-align: left;
	color: #1c1c1c;
	box-sizing: border-box;
}

.item_group_type .item_photo_box {
	display: table-cell !important;
	position: relative;
	text-align: center;
}

.item_group_type .item_info_cont {
	display: table-cell !important;
	padding: 30px 10px 0 20px;
	border: 1px solid #ebebeb;
	border-left: none;
	vertical-align: top;
	box-sizing: border-box
}

.item_group_type .item_cont:hover {
	border: 1px solid #181818;
	left: -1px;
	top: -1px;
}

.item_group_type .item_cont:hover .item_photo_box a {
	border: none;
	border-right: 1px solid #ebebeb
}

.item_group_type .item_cont:hover .item_info_cont {
	border: none
}

.item_group_type .item_info_cont .item_money_box .item_price {
	display: block;
	margin-left: 0px;
}

.item_group_type .item_tit_box .item_name {
	padding-bottom: 10px;
	font-size: 14px;
}

.item_group_type .item_tit_box .item_name:after {
	content: "";
	display: block;
	width: 30px;
	background: #181818;
	height: 2px;
	margin-top: 10px;
}

.item_group_type .item_tit_box .item_name_explain {
	max-width: 295px;
}

/* 상품이동형 : 가로 */
.item_slide_horizontal .slick-prev, .item_slide_horizontal .slick-next {
	display: block;
	position: absolute;
	top: 40%;
	width: 30px;
	height: 50px;
}

.item_slide_horizontal .slick-prev {
	left: 0px;
	background: url(../../img/common/btn/btn_horizontal_prev.png) no-repeat left top;
}

.item_slide_horizontal .slick-prev:hover {
	background: url(../../img/common/btn/btn_horizontal_prev_over.png) no-repeat left top;
}

.item_slide_horizontal .slick-next {
	right: 0px;
	background: url(../../img/common/btn/btn_horizontal_next.png) no-repeat left top;
}

.item_slide_horizontal .slick-next:hover {
	background: url(../../img/common/btn/btn_horizontal_next_over.png) no-repeat left top;
}

.item_slide_horizontal .item_money_box del {
	display: block;
}

.item_slide_horizontal .item_money_box .item_price {
	display: block;
}

/**
 * 상품이동형 : 가로 가격 디자인 수정
 */
.item_slide_horizontal .item_money_box .item_price strong {
	font-size: 16px;
}

.item_slide_horizontal .item_money_box .item_price .discount_rate {
	color: #d13947;
	font-size: 16px;
}

.item_slide_horizontal .item_money_box .item_sale {
	display: block;
	padding: 0 0 3px 0;
	font-size: 12px;
	color: #46479a;
	font-weight: normal;
}

.item_slide_horizontal .item_money_box .item_sale strong {
	font-size: 14px;
}

/* 스크롤형 */
.item_scroll_type {
	overflow-x: auto;
	overflow-y: hidden;
}

.item_scroll_type ul {
	padding: 0 0 10px 0;
}

/* 선택강조형 */
.item_hover_type {
	overflow: hidden;
}

.item_hover_type .icon_time_sale {
	z-index: 20;
}

.item_hover_type .item_photo_box:hover .icon_time_sale img, .item_hover_type .item_photo_box:hover .item_soldout_bg img {
	opacity: 1;
	filter: alpha(opacity = 100);
}

.item_hover_type .item_soldout .item_photo_box:hover .icon_time_sale img, .item_hover_type .item_photo_box:hover img {
	opacity: 0.6;
	filter: alpha(opacity = 60);
}

/* 심플이미지형 */
.item_simple_type {
	overflow: hidden;
}

.item_simple_type .item_cont {
	text-align: center;
	font-size: 0;
}

.item_simple_type .item_photo_box {
	overflow: hidden;
}

.item_simple_type .item_simple_over {
	display: none;
}

.item_simple_type li a:hover .item_simple_over {
	display: block;
	vertical-align: middle;
}

.item_simple_type .item_simple_over {
	display: none;
	position: absolute;
	top: 0px;
	left: 0px;
	width: 100%;
	height: 100%; /* z-index:10;*/
	background: transparent;
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr=#90000000, endColorstr=#90000000);
	/*
    IE8이하는 rgba가 동작하지 않기 때문에 배경 투명도 적용을 위해 filter의 gradient을 대체 이용한다.
    컬러값 60000000의 8자리 숫자의 의미: 앞 60 불투명도, 나머지 6자리 컬러값.
    startColorstr와 endColorstr의 색을 같게 하여 배경 투명도 처리를 하는것.
    하지만 원래는 그라데이션 처리하는 기법이기 때문에 같은 60% 투명도라고 해도 약간의 차이는 있다.
	*/
	background-color: rgba(0, 0, 0, 0.7);
	font-size: 12px;
}

.item_simple_type .item_simple_info {
	display: table;
	width: 100%;
	height: 100%;
	vertical-align: middle;
}

.item_simple_type .item_info_cont {
	display: table-cell;
	padding: 0;
	text-align: center;
	vertical-align: middle;
}

.item_simple_type .item_cont a {
	display: inline-block;
	color: #ffffff;
}

.item_simple_type .item_cont span, .item_simple_type .item_cont del {
	display: block;
	color: #ffffff;
}

.item_simple_type .item_cont .icon_item_coupon {
	display: inline;
}

.item_simple_type .item_cont .item_tit_box .item_name_explain {
	padding: 0 10px 0 10px;
}

.item_simple_type .icon_time_sale {
	z-index: 20;
}

.item_simple_type .item_soldout .icon_time_sale {
	z-index: inherit;
}

.item_hl_tab_type .goods_tab_tit ul {
	float: none;
	width: 70%;
	margin: 0 auto;
	font-size: 0;
}

.item_hl_tab_type .goods_tab_tit li {
	display: inline-block;
	font-size: 12px;
	text-align: center;
}

.item_hl_tab_type .goods_tab_tit li a {
	display: block;
	margin-left: -1px;
	padding: 15px 0 15px 0;
	color: #999999;
	font-size: 13px;
	border: 1px solid #dadada;
}

.item_hl_tab_type .goods_tab_tit li.on a {
	color: #333333;
	font-weight: bold;
	border: 1px solid #181818; /*border-bottom:none 0;*/
	background: #ffffff;
}

.item_hl_tab_type .goods_tab_tit li:first-child a {
	margin-left: 0;
}

.item_hl_tab_type .goods_tab_cont {
	min-height: 150px;
}

.item_hl_tab_type .goods_tab_cont .goods_tab_box {
	display: none;
}

.item_hl_tab_type .goods_tab_cont .goods_tab_box.on {
	display: block
}

/**
 * 탭진열형 - 가로형 가격 디자인 수정
 */
.item_hl_tab_type .item_money_box .item_price span {
	font-weight: normal;
}

.item_hl_tab_type .item_money_box .item_price strong {
	font-size: 16px;
}

.item_hl_tab_type .item_money_box .item_price .discount_rate {
	color: #d13947;
	font-size: 16px;
}

.item_hl_tab_type .item_money_box .item_sale {
	display: block;
	padding: 0 0 3px 0;
	font-size: 12px;
	color: #46479a;
	font-weight: normal;
}

.item_hl_tab_type .item_money_box .item_sale strong {
	font-size: 14px;
}

/* 신상품 */
.main_goods_slider {
	background: #f5f5f5;
	margin-top: 30px;
	margin-bottom: 60px;
}

.main_goods_slider .main_content {
	background: #f5f5f5;
	margin-bottom: 60px;
}

.main-slider-banner-01  .slick-dots {
	position: absolute;
	bottom: 15px;
	display: block;
	width: 100%;
	padding: 0;
	margin: 0;
	text-align: center;
}

.main-slider-banner-01  .slick-dots li {
	position: relative;
	display: inline-block;
	margin: 0 5px;
	padding: 0;
	cursor: pointer;
}

.main-slider-banner-01 .slick-dots li button {
	font-size: 0;
	line-height: 0;
	display: block;
	width: 30px;
	height: 5px;
	padding: 1px 5px;
	cursor: pointer;
	border: 0;
	outline: none;
	background: #ffffff;
	opacity: 0.75;
}

.main-slider-banner-01 .slick-dots li.slick-active button {
	background: #000000;
	opacity: 1;
}

.main-slider-banner-01 .slick-prev {
	left: 53%;
	margin-left: -600px;
	background: url('../../img/etc/main-banner-prev.png');
	height: 94px;
	width: 35px;
	top: 65%
}

.main-slider-banner-01 .slick-next {
	left: 47%;
	margin-left: 565px;
	background: url('../../img/etc/main-banner-next.png');
	height: 94px;
	width: 35px;
	top: 65%
}

.main-slider-banner-mo {
	max-width: 100%;
}

.main-slider-banner-mo img {
	width: 600px;
}

.main-slider-banner-mo .slider-img {
	height: 800px;
	max-width: 100%;
	background-position: center top;
	background-size: cover;
}

.main-slider-banner-mo .slick-prev {
	background-image:
		url("data:image/svg+xml;charset=utf-8,%3Csvg%20xmlns%3D'http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg'%20viewBox%3D'0%200%2027%2044'%3E%3Cpath%20d%3D'M0%2C22L22%2C0l2.1%2C2.1L4.2%2C22l19.9%2C19.9L22%2C44L0%2C22L0%2C22L0%2C22z'%20fill%3D'%23ffffff'%2F%3E%3C%2Fsvg%3E");
	background: #ffffff\0/IE8;
}

.main-slider-banner-mo .slick-next {
	background-image:
		url("data:image/svg+xml;charset=utf-8,%3Csvg%20xmlns%3D'http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg'%20viewBox%3D'0%200%2027%2044'%3E%3Cpath%20d%3D'M27%2C22L27%2C22L5%2C44l-2.1-2.1L22.8%2C22L2.9%2C2.1L5%2C0L27%2C22L27%2C22z'%20fill%3D'%23ffffff'%2F%3E%3C%2Fsvg%3E");
	background: #ffffff\0/IE8;
}

.main-slider-banner-mo  .slick-dots li button {
	width: 8px;
	height: 8px;
	border-radius: 0%;
	background: #ffffff;
}

.main-slider-banner-mo .slick-dots li.slick-active button {
	background: #ffffff;
}

.main-slider-banner-mo  .slick-dots {
	position: absolute;
	bottom: 15px;
	display: block;
	width: 100%;
	padding: 0;
	margin: 0;
	text-align: center;
}

.main-slider-banner-mo  .slick-dots li {
	position: relative;
	display: inline-block;
	margin: 0 5px;
	padding: 0;
	cursor: pointer;
}

.main-slider-banner-mo .slick-dots li button {
	font-size: 0;
	line-height: 0;
	display: block;
	width: 30px;
	height: 5px;
	padding: 1px 5px;
	cursor: pointer;
	border: 0;
	outline: none;
	background: #ffffff;
	opacity: 0.75;
}

.goods_list_tit em {
	display: block;
	height: 20px;
	font-size: 12px;
	color: #999;
}

.main-slider-banner-mo .slick-prev {
	left: 50%;
	margin-left: -100px;
	background: url('../../img/etc/main-banner-prev.png');
	height: 94px;
	width: 35px;
	top: 65%
}

.main-slider-banner-mo .slick-next {
	left: 50%;
	margin-left: 100px;
	background: url('../../img/etc/main-banner-next.png')
}

.item-slick1 {
	position: relative;
	background-size: cover;
}

.item-slick1::before {
	content: "";
	opacity: 0.5;
	position: absolute;
	top: 0px;
	left: 0px;
	right: 0px;
	bottom: 0px;
	background-color: #c8c8c8;
}

.gutter-sizer {
	width: 12%;
}
</style>
<jsp:include page="common/header.jsp" flush="false">
	<jsp:param name="page" value="main" />
</jsp:include>
<!-- Slider -->
<section class="section-slide">
	<div class="wrap-slick1">
		<div class="slick1">
			<div class="item-slick1" style="background-image: url(../images/slider-img-01.jpg);">
				<div class="container h-full">
					<div class="flex-col-l-m h-full p-t-100 p-b-30 respon5">
						<div class="layer-slick1 animated visible-false" data-appear="fadeInDown" data-delay="0">
							<span class="ltext-101 cl2 respon2"> 와디즈 사전 오픈!</span>
						</div>
						<div class="layer-slick1 animated visible-false" data-appear="fadeInUp" data-delay="800">
							<h2 class="ltext-201 cl2 p-t-19 p-b-43 respon1">캐터펄트 킹덤 풀세트 펀딩</h2>
						</div>
						<div class="layer-slick1 animated visible-false" data-appear="zoomIn" data-delay="1600">
							<a href="https://www.wadiz.kr/web/campaign/detail/163388" class="flex-c-m stext-101 cl0 size-101 bg1 bor1 hov-btn1 p-lr-15 trans-04"> 펀딩하러 가기 </a>
						</div>
					</div>
				</div>
			</div>
			<div class="item-slick1" style="background-image: url(../images/slider-img-02.jpg);">
				<div class="container h-full">
					<div class="flex-col-l-m h-full p-t-100 p-b-30 respon5">
						<div class="layer-slick1 animated visible-false" data-appear="rollIn" data-delay="0">
							<span class="ltext-101 cl2 respon2"> 박스 안에 고양이는 무슨색일까요? </span>
						</div>
						<div class="layer-slick1 animated visible-false" data-appear="lightSpeedIn" data-delay="800">
							<h2 class="ltext-201 cl2 p-t-19 p-b-43 respon1">슈뢰딩거의 고양이</h2>
						</div>
						<div class="layer-slick1 animated visible-false" data-appear="slideInUp" data-delay="1600">
							<div class="flex-c-m stext-101 cl0 size-101 bg1 bor1 hov-btn1 p-lr-15 trans-04">슬리브 + 밴드 증정</div>
						</div>
					</div>
				</div>
			</div>
			<div class="item-slick1" style="background-image: url(../images/slider-img-03.jpg);">
				<div class="container h-full">
					<div class="flex-col-l-m h-full p-t-100 p-b-30 respon5">
						<div class="layer-slick1 animated visible-false" data-appear="rotateInDownLeft" data-delay="0">
							<span class="ltext-101 cl2 respon2"> #매일 부담없이 #누구와 해도 즐거운 </span>
						</div>
						<div class="layer-slick1 animated visible-false" data-appear="rotateInUpRight" data-delay="800">
							<h2 class="ltext-201 cl2 p-t-19 p-b-43 respon1">캐스캐디아</h2>
						</div>
						<div class="layer-slick1 animated visible-false" data-appear="rotateIn" data-delay="1600">
							<div class="flex-c-m stext-101 cl0 size-101 bg1 bor1 hov-btn1 p-lr-15 trans-04">Shop Now</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Banner -->
<div class="sec-banner bg0 p-t-80 p-b-50">
	<div class="container">
		<div class="row">
			<div class="col-md-6 col-xl-4 p-b-30 m-lr-auto">
				<!-- Block1 -->
				<div class="block1 wrap-pic-w">
					<img src="/ModooShop/images/banner-img-01.png" alt="베스트 상품">
					<a href="product.do?cateNum=1100" class="block1-txt ab-t-l s-full flex-col-l-sb p-lr-38 p-tb-34 trans-03 respon3">
						<div class="block1-txt-child1 flex-col-l">
							<span class="block1-name ltext-102 trans-04 p-b-8"> Best </span>
							<span class="block1-info stext-102 trans-04"> 모두의 보드's PICK </span>
						</div>
						<div class="block1-txt-child2 p-b-4 trans-05">
							<div class="block1-link stext-101 cl0 trans-09">바로 보러가기</div>
						</div>
					</a>
				</div>
			</div>
			<div class="col-md-6 col-xl-4 p-b-30 m-lr-auto">
				<!-- Block1 -->
				<div class="block1 wrap-pic-w">
					<img src="/ModooShop/images/banner-img-02.png" alt="혼자서 즐기는 게임">
					<a href="product.do?cateNum=200" class="block1-txt ab-t-l s-full flex-col-l-sb p-lr-38 p-tb-34 trans-03 respon3">
						<div class="block1-txt-child1 flex-col-l">
							<span class="block1-name ltext-102 trans-04 p-b-8"> 1 Player </span>
							<span class="block1-info stext-102 trans-04"> 혼자서 즐겨요! </span>
						</div>
						<div class="block1-txt-child2 p-b-4 trans-05">
							<div class="block1-link stext-101 cl0 trans-09">바로보러가기</div>
						</div>
					</a>
				</div>
			</div>
			<div class="col-md-6 col-xl-4 p-b-30 m-lr-auto">
				<!-- Block1 -->
				<div class="block1 wrap-pic-w">
					<img src="/ModooShop/images/banner-img-04.png" alt="악세사리">
					<a href="product.do?cateNum=900" class="block1-txt ab-t-l s-full flex-col-l-sb p-lr-38 p-tb-34 trans-03 respon3">
						<div class="block1-txt-child1 flex-col-l">
							<span class="block1-name ltext-102 trans-04 p-b-8"> Accessories </span>
							<span class="block1-info stext-102 trans-04"> 게임을 더 재밌게! </span>
						</div>
						<div class="block1-txt-child2 p-b-4 trans-05">
							<div class="block1-link stext-101 cl0 trans-09">바로 보러가기</div>
						</div>
					</a>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="main_goods_slider">
	<div class="main_content">
		<!-- 메인 상품 노출 -->
		<div class="goods_list main_wrap_1">
			<div class="goods_list_tit">
				<h3>
					<em>뜨근뜨근 새로 데려왔어요</em>
					신상품
				</h3>
			</div>
			<div class="goods_list_cont goods_content_1">
				<div class="item_slide_horizontal">
					<ul class="slide_horizontal_1">
						<c:forEach var="product" items="${newList}">
							<li>
								<div class="item_cont" style="text-align: center;">
									<div class="item_photo_box">
										<a href="productDetail.do?pNum=${product.pNum}">
											<img src="${product.pImg}" width="180" alt="${product.pName}" title="${product.pName}" class="middle" />
										</a>
									</div>
									<!-- //item_photo_box -->
									<div class="item_info_cont" style="display: block; text-align: center;">
										<div class="item_tit_box">
											<a href="productDetail.do?pNum=${product.pNum}">
												<strong class="item_name" style="direction: ltr;">${product.pName}</strong>
											</a>
										</div>
										<!-- //item_tit_box -->
										<div class="item_money_box">
											<strong class="item_price">
												<strong class="discount_rate">
													<fmt:parseNumber value="${product.selPrice div product.fixPrice * 100}" integerOnly="true" />
													%
												</strong>
												<span>
													<strong>
														<fmt:formatNumber value="${product.selPrice}" type="number" />
													</strong>
													원
												</span>
											</strong>
										</div>
										<!-- //item_money_box -->
										<!-- //item_number_box -->
										<div class="item_icon_box"></div>
										<!-- //item_icon_box -->
									</div>
									<!-- //item_info_cont -->
								</div>
								<!-- //item_cont -->
							</li>
						</c:forEach>
					</ul>
				</div>
				<!-- //item_slide_horizontal -->
				<script type="text/javascript">
					$(document).ready(function() {

						$('.item_slide_horizontal .slide_horizontal_1').slick({
							draggable : false,
							autoplay : true,
							infinite : true,
							slidesToShow : 4,
							slidesToScroll : 1,
							speed : 1000,
							arrows : true,
							prevArrow : '<button class="arrow-slick1 prev-slick1"><i class="zmdi zmdi-caret-left"></i></button>',
							nextArrow : '<button class="arrow-slick1 next-slick1"><i class="zmdi zmdi-caret-right"></i></button>',
							responsive : [ {
								breakpoint : 1366,
								settings : {
									slidesToShow : 3
								}
							}, {
								breakpoint : 1024,
								settings : {
									slidesToShow : 2
								}
							}, {
								breakpoint : 768,
								settings : {
									slidesToShow : 1
								}
							}, {
								breakpoint : 480,
								settings : {
									slidesToShow : 1
								}
							} ]
						});

					});
				</script>
			</div>
		</div>
	</div>
</div>
<!-- Product -->
<section class="bg0 p-t-23 p-b-140" id="md-product">
	<div class="container">
		<div class="p-b-10">
			<h3 class="ltext-103 cl5">MD 추천</h3>
		</div>
		<div class="flex-w flex-sb-m p-b-52">
			<div class="flex-w flex-l-m filter-tope-group m-tb-10">
				<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5 how-active1" data-filter="*">전체목록</button>
				<c:forEach var="category" items="${cList}">
					<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5" data-filter=".${category.cateNum}">${category.cateL}</button>
				</c:forEach>
			</div>
		</div>
		<div class="row isotope-grid flex-sa">
			<div class="gutter-sizer"></div>
			<c:forEach var="product" items="${pList}">
				<fmt:parseNumber var="cNum" value="${(product.cateNum div 100)}" integerOnly="true" />
				<div class="col-sm-5 col-md-5 col-lg-3 p-b-35 isotope-item ${cNum*100}">
					<!-- Block2 -->
					<div class="block2">
						<div class="block2-pic hov-img0">
							<img src="${product.pImg}" width="180" alt="${product.pName}">
							<a href="#" class="block2-btn flex-c-m stext-103 cl2 size-102 bg0 bor2 hov-btn3 p-lr-15 trans-04 js-show-quickview"> Quick View </a>
						</div>
						<div class="block2-txt flex-w flex-t p-t-14">
							<div class="block2-txt-child1 flex-col-l ">
								<a href="productDetail.do?pNum=${product.pNum}" id="${product.pNum}" class="stext-121 cl4 hov-cl1 trans-04 js-name-b2 p-b-6"> ${product.pName} </a>
								<span class="stext-105 cl3">
									<fmt:formatNumber value="${product.selPrice}" type="number" />
									&#8361;
								</span>
							</div>
							<modoo:dib dib="${product.dib}" />
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<!-- 
		<div class="flex-c-m flex-w w-full p-t-45">
			<a id="more" href="#" class="flex-c-m stext-101 cl5 size-103 bg2 bor1 hov-btn3 p-lr-15 trans-04"> Load More </a>
		</div> -->
	</div>
</section>
<jsp:include page="common/footer.jsp" flush="false">
	<jsp:param name="page" value="main" />
</jsp:include>
<!--QuickView Modal -->
<div class="wrap-modal1 js-quickView p-t-60 p-b-20">
	<div class="overlay-modal1 js-hide-quickView"></div>
	<div class="container">
		<div class="bg0 p-t-60 p-b-30 p-lr-15-lg how-pos3-parent">
			<button class="how-pos3 hov3 trans-04 js-hide-quickView">
				<img src="/ModooShop/images/icons/icon-close.png" alt="CLOSE">
			</button>
			<div class="row">
				<div class="col-md-6 col-lg-7 p-b-30">
					<div class="p-l-25 p-r-30 p-lr-0-lg">
						<div class="wrap-slick3 flex-sb flex-w">
							<div class="gallery-lb">
								<div class="pImg-div">
									<div class="wrap-pic-w pos-relative m-l-30">
										<img src="" class="pImg-img">
										<a class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04 pImg-a" href="">
											<i class="fa fa-expand"></i>
										</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-6 col-lg-5 p-b-30">
					<div class="p-r-50 p-t-5 p-lr-0-lg item_detail_tit">
						<h4 class="mtext-105 cl2 js-name-detail p-b-14 pName"></h4>
						<hr>
						<table class="item_detail_list">
							<tr>
								<td>정가</td>
								<td colspan="2">
									<span class="fixPrice"></span>
									원
								</td>
							</tr>
							<tr>
								<td>판매가</td>
								<td colspan="2" class="item_price">
									<span id="price" class="selPrice"></span>
									원
								</td>
							</tr>
							<tr>
								<td>게임 인원</td>
								<td colspan="2" class="rePerson"></td>
							</tr>
							<tr>
								<td>게임 연령</td>
								<td colspan="2" class="reAge"></td>
							</tr>
							<tr>
								<td>배송비</td>
								<td colspan="2">
									<strong id="deliveryFee">2,500</strong>
								</td>
							</tr>
							<tr>
								<td>
									<div class="wrap-num-product flex-w m-tb-10 m-l-30">
										<div class="btn-num-product-down cl8 hov-btn3 trans-04 flex-c-m">
											<i class="fs-16 zmdi zmdi-minus"></i>
										</div>
										<input class="mtext-104 cl3 txt-center num-product" type="number" name="pCnt" value="1" readonly>
										<div class="btn-num-product-up cl8 hov-btn3 trans-04 flex-c-m ">
											<i class="fs-16 zmdi zmdi-plus"></i>
										</div>
									</div>
								</td>
								<td>결제 예정금액</td>
								<td>
									<span id="totalPrice" class="totalPrice"></span>
									원
								</td>
							</tr>
						</table>
						<hr>
						<!--  -->
						<div class="p-t-33">
							<div class="row flex-c">
								<button class="flex-c-m m-r-10 stext-106 cl2 size-126 bg0 bor20 hov-btn3 p-lr-15 trans-04 js-addcart-quickView cart-btn">장바구니</button>
								<button class="flex-c-m m-lr-10 stext-106 cl2 size-126 bg0 bor20 hov-btn3 p-lr-15 trans-04 js-addwish-quickView dib-btn">찜하기</button>
								<button class="flex-c-m m-l-10 stext-106 cl0 size-101 bg1 bor20 hov-btn1 p-lr-15 trans-04 ">결제하기</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
	
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
<script src="../vendor/daterangepicker/moment.min.js"></script>
<script src="../vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
<script src="../vendor/slick/slick.min.js"></script>
<script src="../js/slick-custom.js"></script>
<!--===============================================================================================-->
<script src="../vendor/parallax100/parallax100.js"></script>
<script>
	$('.parallax100').parallax100();
</script>
<!--===============================================================================================-->
<script src="../vendor/MagnificPopup/jquery.magnific-popup.min.js"></script>
<script>
	$('.gallery-lb').each(function() { // the containers for all your galleries
		$(this).magnificPopup({
			delegate : 'a', // the selector for gallery item
			type : 'image',
			gallery : {
				enabled : true
			},
			mainClass : 'mfp-fade'
		});
	});
</script>
<!--===============================================================================================-->
<script src="../vendor/isotope/isotope.pkgd.min.js"></script>
<!--===============================================================================================-->
<script src="../vendor/sweetalert/sweetalert.min.js"></script>
<script>
	/*---------------------------------------------*/
</script>
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