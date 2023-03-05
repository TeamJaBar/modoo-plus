<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="modoo" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport">
<title>Layout &rsaquo; Top Navigation &mdash; Stisla</title>


<style>


@font-face {
	font-family: 'GmarketSansMedium';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

[fg-component=match-filter] {
	position: relative;
	width: 100%
}

[fg-component=match-filter]>.contents-box {
	padding: 0 16px;
	width: 100%;
	height: 42px;
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
	background-color: #0188CB;
}

[fg-component=match-filter]>.contents-box, [fg-component=match-filter]>.contents-box>.left-box
	{
	display: -webkit-box;
	display: -ms-flexbox;
	display: flex;
	-webkit-box-align: center;
	-ms-flex-align: center;
	align-items: center
}

[fg-component=match-filter]>.contents-box>.left-box {
	height: 100%
}

[fg-component=match-filter]>.contents-box>.left-box>.location-box
	{
	display: -webkit-box;
	display: -ms-flexbox;
	display: flex;
	-webkit-box-align: center;
	-ms-flex-align: center;
	align-items: center;
	cursor: pointer;
	height: 100%
}

[fg-component=match-filter]>.contents-box>.left-box>.location-box>.value
	{
	display: block;
	position: relative;
	margin-left: 7px
}

[fg-component=match-filter]>.contents-box>.left-box>.location-box>.value[fg-fix-point-bug=true]
	{
	-webkit-transform: translateY(-1px);
	transform: translateY(-1px)
}

[fg-component=match-filter]>.contents-box>.left-box>.location-box>.value:after
	{
	content: "";
	position: absolute;
	bottom: -2px;
	left: 0;
	width: 100%;
	height: 1px;
}

[fg-component=match-filter]>.contents-box>.left-box>.location-box>.value>.text
	{
	display: block;
	white-space: pre;
	position: relative;
	font-family: 'GmarketSansMedium';
	font-weight: 300;
	font-size: 13px;
	color: #fff;
	line-height: 1em
}

[fg-component=match-filter]>.contents-box>.left-box>.calendar-box
	{
	display: -webkit-box;
	display: -ms-flexbox;
	display: flex;
	-webkit-box-align: center;
	-ms-flex-align: center;
	align-items: center;
	margin-left: 20px;
	cursor: pointer;
	height: 100%
}

[fg-component=match-filter]>.contents-box>.left-box>.calendar-box>.logo
	{
	display: block;
	width: auto;
	height: 14px
}

[fg-component=match-filter]>.contents-box>.left-box>.calendar-box>.value
	{
	display: block;
	position: relative;
	margin-left: 10px
}

[fg-component=match-filter]>.contents-box>.left-box>.calendar-box>.value[fg-fix-point-bug=true]
	{
	-webkit-transform: translateY(-1px);
	transform: translateY(-1px)
}

[fg-component=match-filter]>.contents-box>.left-box>.calendar-box>.value:after
	{
	content: "";
	position: absolute;
	bottom: -2px;
	left: 0;
	width: 100%;
	height: 1px;
}

[fg-component=match-filter]>.contents-box>.left-box>.calendar-box>.value>.text
	{
	display: block;
	white-space: pre;
	position: relative;
	font-family: 'GmarketSansMedium';
	font-weight: 300;
	font-size: 13px;
	color: #fff;
	line-height: 1em
}

[fg-component=match-filter]>.contents-box>.right-box {
	margin-left: auto;
	height: 100%
}

[fg-component=match-filter]>.contents-box>.right-box>.sort-box
	{
	display: -webkit-box;
	display: -ms-flexbox;
	display: flex;
	height: 100%
}

[fg-component=match-filter]>.contents-box>.right-box>.sort-box>.sort-button
	{
	display: -webkit-box;
	display: -ms-flexbox;
	display: flex;
	-webkit-box-align: center;
	-ms-flex-align: center;
	align-items: center;
	cursor: pointer;
	height: 100%;
	padding-left: 6px;
	padding-right: 6px
}

[fg-component=match-filter]>.contents-box>.right-box>.sort-box>.sort-button>.text
	{
	white-space: pre;
	display: block;
	line-height: 1em;
	font-family: 'GmarketSansMedium';
	font-weight: 500;
	font-size: 12px;
	color: #fff
}

[fg-component=match-filter]>.contents-box>.right-box>.sort-box>.sort-button[data-selected="1"]>.text
	{
	font-weight: 500;
	color: #f1c331
}

[fg-component=match-filter]>.contents-box>.right-box>.sort-box>.sort-button:last-child
	{
	margin-right: -6px
}

[fg-component=match-list-item]:hover {
	text-decoration:none;
}

[fg-component=match-list-item] {
	display: block;
	width: 100%;
	clear: both;
	cursor: pointer;
	text-decoration: none;
	border-bottom: 1px solid rgba(0, 0, 0, .2);
	background-color: #fff
}

[fg-component=match-list-item]:last-child {
	border:none;
}

[fg-component=match-list-item]>.contents-box {
	display: -webkit-box;
	display: -ms-flexbox;
	display: flex;
	-webkit-box-align: center;
	-ms-flex-align: center;
	align-items: center;
	width: calc(100% - 32px);
	margin: 15px auto;
	padding: 13.3333333333px 20px 10.6666666667px
}

[fg-component=match-list-item]>.contents-box>.left-section>.head
	{
	display: flex;
	margin-bottom:5px;
}

[fg-component=match-list-item]>.contents-box>.left-section>.head>.tags>.tag
	{
	display: -webkit-inline-box;
	display: -ms-inline-flexbox;
	display: inline-flex;
	-webkit-box-align: center;
	-ms-flex-align: center;
	align-items: center;
	-webkit-box-pack: center;
	-ms-flex-pack: center;
	justify-content: center;
	border: 1px solid rgba(0, 0, 0, .75);
	border-radius: 4px;
	height: 21px;
	padding: 1px 7px;
	margin-right:6px;
}

.rate .tag {
	border: 1px solid blue !important;
}

.rate .tag .text{
	color:blue !important;
}

[fg-component=match-list-item]>.contents-box>.left-section>.head>.tags>.tag>.text
	{
	font-family: 'GmarketSansMedium';
	color: #000;
	font-size: 11px;
	font-weight: 500;
	-webkit-transform: translateY(8%);
	transform: translateY(8%);
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis
}

[fg-component=match-list-item]>.contents-box>.left-section>.body
	{
	display: -webkit-box;
	display: -ms-flexbox;
	display: flex;
	margin-top: 6.4px
}

[fg-component=match-list-item]>.contents-box>.left-section>.body>.left-box>.date
	{
	display: -webkit-box;
	display: -ms-flexbox;
	display: flex;
	-webkit-box-align: center;
	-ms-flex-align: center;
	align-items: center;
	height: 19px
}

[fg-component=match-list-item]>.contents-box>.left-section>.body>.left-box>.date>.text
	{
	font-family: 'GmarketSansMedium';
	color: #000;
	font-size: 15px;
	font-weight: 700;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis
}

@media screen and (max-width:320px) {
	[fg-component=match-list-item]>.contents-box>.left-section>.body>.left-box>.date>.text
		{
		font-size: 13.5px
	}
}

[fg-component=match-list-item]>.contents-box>.left-section>.body>.left-box>.time
	{
	display: -webkit-box;
	display: -ms-flexbox;
	display: flex;
	-webkit-box-align: center;
	-ms-flex-align: center;
	align-items: center;
	height: 19px
}

[fg-component=match-list-item]>.contents-box>.left-section>.body>.left-box>.title
	{
	display: -webkit-box;
	display: -ms-flexbox;
	display: flex;
	-webkit-box-align: center;
	-ms-flex-align: center;
	align-items: center;
	margin-top:4px;
}

[fg-component=match-list-item]>.contents-box>.left-section>.body>.left-box>.title>.text
	{
	font-family: 'GmarketSansMedium';
	color: #000;
	font-size: 15px;
	font-weight: 500;
	overflow: hidden;
	text-overflow: ellipsis
}

@media screen and (max-width:320px) {
	[fg-component=match-list-item]>.contents-box>.left-section>.body>.left-box>.title>.text
		{
		font-size: 12.6px
	}
}

[fg-component=match-list-item]>.contents-box>.left-section>.body>.left-box>.time>.text
	{
	font-family: 'GmarketSansMedium';
	color: #000;
	font-size: 12px;
	font-weight: 500;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis
}

@media screen and (max-width:320px) {
	[fg-component=match-list-item]>.contents-box>.left-section>.body>.left-box>.time>.text
		{
		font-size: 10.8px
	}
}

[fg-component=match-list-item]>.contents-box>.left-section>.body>.left-box>.user
	{
	display: -webkit-box;
	display: -ms-flexbox;
	display: flex;
	-webkit-box-align: center;
	-ms-flex-align: center;
	align-items: center;
	height: 19px
}

[fg-component=match-list-item]>.contents-box>.left-section>.body>.left-box>.user>.text
	{
	font-family: 'GmarketSansMedium';
	color: #000;
	font-size: 12px;
	font-weight: 500;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis
}

@media screen and (max-width:320px) {
	[fg-component=match-list-item]>.contents-box>.left-section>.body>.left-box>.user>.text
		{
		font-size: 10.8px
	}
}

[fg-component=match-list-item]>.contents-box>.left-section>.body>.right-box
	{
	margin-left: 16px
}

[fg-component=match-list-item] .informations
	{
	display: -webkit-box;
	display: -ms-flexbox;
	display: flex;
	-webkit-box-orient: horizontal;
	-webkit-box-direction: normal;
	-ms-flex-direction: row;
	flex-direction: row;
	-webkit-box-align: center;
	-ms-flex-align: center;
	align-items: center;
	height: 19px;
	margin-left:20px;
}

[fg-component=match-list-item] .informations>.information
	{
	position: relative;
	display: -webkit-box;
	display: -ms-flexbox;
	display: flex;
	-webkit-box-align: center;
	-ms-flex-align: center;
	align-items: center;
	padding-left: 9px
}

@media screen and (max-width:320px) {
	[fg-component=match-list-item] .informations>.information
		{
		padding-left: 8.1px
	}
}

[fg-component=match-list-item] .informations>.information:before
	{
	content: "";
	position: absolute;
	left: 0;
	top: 50%;
	-webkit-transform: translateY(-80%);
	transform: translateY(-80%);
	width: 4px;
	height: 4px;
	border-radius: 50%;
	background-color: #0061b3
}

[fg-component=match-list-item] .informations>.information:not(:first-child)
	{
	margin-left: 16px
}

@media screen and (max-width:320px) {
	[fg-component=match-list-item] .informations>.information:not(:first-child)
		{
		margin-left: 14.4px
	}
}

[fg-component=match-list-item] .informations>.information>.text
	{
	font-family: 'GmarketSansMedium';
	color: #000;
	font-size: 12px;
	font-weight: 500;
	line-height: 1em;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis
}

@media screen and (max-width:320px) {
	[fg-component=match-list-item] .informations>.information>.text
		{
		font-size: 10.8px
	}
}

[fg-component=match-list-item]>.contents-box>.right-section
	{
	display: -webkit-box;
	display: -ms-flexbox;
	display: flex;
	margin-left: auto;
	height: 100%;
	-webkit-box-align: center;
	-ms-flex-align: center;
	align-items: center
}

[fg-component=match-list-item]>.contents-box>.right-section>.status
	{
	display: -webkit-box;
	display: -ms-flexbox;
	display: flex;
	-webkit-box-align: center;
	-ms-flex-align: center;
	align-items: center;
	-webkit-box-pack: center;
	-ms-flex-pack: center;
	justify-content: center;
	background-color: #a5a5a5;
	height: 44px;
	padding: 0 12px;
	border-radius: 6px;
	min-width: 74px;
	-webkit-box-sizing: border-box;
	box-sizing: border-box
}

@media screen and (max-width:320px) {
	[fg-component=match-list-item]>.contents-box>.right-section>.status
		{
		height: 39.6px;
		min-width: 66.6px;
		padding: 0 10.8px
	}
}

[fg-component=match-list-item]>.contents-box>.right-section>.status>.text
	{
	font-family: 'GmarketSansMedium';
	color: #fff;
	text-align: center;
	font-size: 12px;
	line-height: 1.4em;
	font-weight: 700;
	-webkit-transform: translateY(4%);
	transform: translateY(4%);
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis
}

@media screen and (max-width:320px) {
	[fg-component=match-list-item]>.contents-box>.right-section>.status>.text
		{
		font-size: 10.8px
	}
}

.custom-icon {
	color: white;
}

.silck-container {
	width: 100%;
	height: 300px;
	margin-bottom: 30px;
	border-radius: 10px;
	height: 300px;
}

/*.banner-item {
	width:100%;
}

.banner-item img {
	height:300px;
	object-fit: cover;
}*/
.slick-slider {
	width: 100%;
	border-radius: 10px;
}

.slick-slide img {
	object-fit: cover;
	width: 100%;
	height: 300px;
}

.slick-list {
	border-radius: 0.25rem;
}

.btn-submit {
	font-family:'GmarketSansMedium';
	font-weight:500;
	font-size:15px;
	background-color:#0188CB;
    border-color: #0188CB;
    box-shadow: 0 2px 6px #80bbd9;
    color:white;
    width:100px;
}

.btn > p {
	margin-top:0;
	margin-bottom:0;
}

.btn-submit:hover {
	background-color:#004669 !important;
    border-color: #004669 !important;
    color: white;
    text-decoration:none;
}

.btn-secondary {
	font-family:'GmarketSansMedium';
	font-weight:500;
	font-size:15px;
	box-shadow: 0 2px 6px #e1e5e8;
    background-color: #cdd3d8;
    border-color: #cdd3d8;
    color: #fff;
    width:100px;
}

.card {
	margin-top:60px !important;
}

@media (min-width: 1200px) {
	.container {
	    max-width: 980px !important;
	}
}

</style>

<!-- General CSS Files -->
<link rel="stylesheet" href="../assets/modules/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="../assets/modules/fontawesome/css/all.min.css">


<!-- Template CSS -->
<link rel="stylesheet" href="../assets/css/style.css">
<link rel="stylesheet" href="../assets/css/components.css">

<!-- CSS Libraries -->
<!-- 슬릭 플러그인을 위한 CDN주소 -->
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" />
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />

<!-- Start GA -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-94034622-3"></script>
<script>
	window.dataLayer = window.dataLayer || [];
	function gtag() {
		dataLayer.push(arguments);
	}
	gtag('js', new Date());

	gtag('config', 'UA-94034622-3');
</script>
<!-- /END GA -->
</head>

<body class="layout-3">
	<div id="app">
		<div class="main-wrapper container">
			<modoo:header />

			<!-- Main Content -->
			<div class="main-content">
				<section class="section">

					<div class="section-body">
						<div class="slider-wrap silck-container">
							<div class="cont banner-item">
								<img alt="배너 이미지1" src="../images/slider-img-01.jpg">
							</div>
							<div class="cont banner-item">
								<img alt="배너 이미지1" src="../images/slider-img-02.jpg">
							</div>
							<div class="cont banner-item">
								<img alt="배너 이미지1" src="../images/slider-img-03.jpg">
							</div>
						</div>
						<div class="card">
							<div fg-component="match-filter">
									<div  class="contents-box">
										<div  class="left-box">
											<div  class="location-box">
												<i class="fas fa-map-marker-alt fa-4x custom-icon"></i>
												<div  class="value">
													<div  class="text" data-toggle="modal" data-target="#exampleModal">지역 선택</div>
												</div>
											</div>
											<div  class="calendar-box">
												<i class="fas fa-calendar-alt custom-icon"></i>
												<div  class="value">
													<div  class="text" id="demo" name="demo">전체 기간</div>
												</div>
											</div>
										</div>
										<div  class="right-box">
											<div  class="sort-box">
												<div  data-selected="1" class="sort-button">
													<div  class="text">시합날짜순</div>
												</div>
												<div  data-selected="0" class="sort-button">
													<div  class="text">등록순</div>
												</div>
											</div>
										</div>
									</div>
								</div>

							<c:forEach var="board" items="${boardList}">
									<a href="/matches/7417" class="" fg-component="match-list-item">
										<div class="contents-box">
											<div  class="left-section">
												<div  class="head">
													<div  class="tags">
														<div  class="tag">
															<span  class="text">${board.bLocal}</span>
														</div>
													</div>
													<!--<div  class="tags rate">
														<div  class="tag">
															<span  class="text">${board.bRate}</span>
														</div>
													</div>-->
												</div>
												<div  class="body">
													<div  class="left-box">
														<div  class="date">
															<span  class="text"><fmt:formatDate value="${board.bDate}" pattern="yy.MM.dd (E) HH:mm" /></span>
														</div>
														<div  class="title">
															<span  class="text">${board.bTitle}</span>
															<div  class="informations">
																<div  class="information">
																	<span  class="text">${board.bCnt}명</span>
																</div>
																<div  class="information">
																	<span  class="text">${board.bRate}</span>
																</div>
														</div>
														</div>
													</div>
												</div>
											</div>
											<div  class="right-section">
												<c:if test="${board.bAction == 0}">
													<div class="btn btn-submit">
														모집중
														<p>${board.aCnt}/${board.bCnt}</p>
													</div>
												</c:if>
												<c:if test="${board.bAction == 1}">
													<div class="btn btn-secondary">
														모집완료
														<p>${board.aCnt}/${board.bCnt}</p>
													</div>
												</c:if>
											</div>
										</div>
									</a>
							</c:forEach>
						</div>
					</div>
				</section>
			</div>
			<footer class="main-footer">
				<div class="footer-left">
					Copyright &copy; 2018
					<div class="bullet"></div>
					Design By
					<a href="https://nauval.in/">Muhamad Nauval Azhar</a>
				</div>
				<div class="footer-right"></div>
			</footer>
		</div>
	</div>
	<!-- Modal screen -->
	<div class="modal fade" tabindex="-1" role="dialog" id="exampleModal">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header"></div>
				<div class="modal-body">
					<div class="form-group">
						<label class="d-block">서울</label>
						<div class="form-check">
							<input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios1" checked="">
							<label class="form-check-label" for="exampleRadios1"> Radio 1 </label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios2" checked="">
							<label class="form-check-label" for="exampleRadios2"> Radio 2 </label>
						</div>
					</div>
					<div class="card-footer text-right">
						<nav class="d-inline-block">
							<ul class="pagination mb-0">
								<li class="page-item disabled">
									<a class="page-link" href="#" tabindex="-1">
										<i class="fas fa-chevron-left"></i>
									</a>
								</li>
								<li class="page-item active">
									<a class="page-link" href="#">
										1
										<span class="sr-only">(current)</span>
									</a>
								</li>
								<li class="page-item">
									<a class="page-link" href="#">2</a>
								</li>
								<li class="page-item">
									<a class="page-link" href="#">3</a>
								</li>
								<li class="page-item">
									<a class="page-link" href="#">
										<i class="fas fa-chevron-right"></i>
									</a>
								</li>
							</ul>
						</nav>
						<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- General JS Scripts -->
	<script src="../assets/modules/jquery.min.js"></script>
	<script src="../assets/modules/popper.js"></script>
	<script src="../assets/modules/tooltip.js"></script>
	<script src="../assets/modules/bootstrap/js/bootstrap.min.js"></script>
	<script src="../assets/modules/nicescroll/jquery.nicescroll.min.js"></script>
	<script src="../assets/modules/moment.min.js"></script>
	<script src="../assets/js/stisla.js"></script>



	<!-- JS Libraies -->
	<!-- 슬릭 플러그인을 위한 CDN주소 -->
	<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>

	<script>
	<!-- 슬릭 플러그인을 위한 script -->
		$(document).ready(function() {
			$('.slider-wrap').slick({
				infinite : true, //무한 반복 옵션     
				slidesToShow : 1, // 한 화면에 보여질 컨텐츠 개수
				slidesToScroll : 1, //스크롤 한번에 움직일 컨텐츠 개수
				speed : 500, // 다음 버튼 누르고 다음 화면 뜨는데까지 걸리는 시간(ms)
				arrows : true, // 옆으로 이동하는 화살표 표시 여부
				dots : true, // 스크롤바 아래 점으로 페이지네이션 여부
				autoplay : true, // 자동 스크롤 사용 여부
				autoplaySpeed : 3000, // 자동 스크롤 시 다음으로 넘어가는데 걸리는 시간 (ms)
				pauseOnHover : true, // 슬라이드 이동    시 마우스 호버하면 슬라이더 멈추게 설정
				vertical : false, // 세로 방향 슬라이드 옵션
				prevArrow : "<button type='button' class='slick-prev'>Previous</button>",
				nextArrow : "<button type='button' class='slick-next'>Next</button>",
				draggable : true, //드래그 가능 여부 
				responsive : [ // 반응형 웹 구현 옵션
				{
					breakpoint : 960, //화면 사이즈 960px
					settings : {
						slidesToShow : 1
					}
				}, {
					breakpoint : 768, //화면 사이즈 768px
					settings : {
						slidesToShow : 1
					}
				} ]

			});

			$('#demo').daterangepicker({
				"locale" : {
					"format" : "YYYY-MM-DD",
					"separator" : " ~ ",
					"applyLabel" : "확인",
					"cancelLabel" : "취소",
					"fromLabel" : "From",
					"toLabel" : "To",
					"customRangeLabel" : "Custom",
					"weekLabel" : "W",
					"daysOfWeek" : [ "월", "화", "수", "목", "금", "토", "일" ],
					"monthNames" : [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월" ],
					"firstDay" : 1
				},
				"drops" : "down"
			}, function(start, end, label) {
				console.log('New date range selected: ' + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD') + ' (predefined range: ' + label + ')');
			});
		})<!-- 슬릭 플러그인을 위한 script -->
	</script>

	<!-- Page Specific JS File -->

	<!-- Template JS File -->
	<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
	<script src="../assets/js/scripts.js"></script>
	<script src="../assets/js/custom.js"></script>

</body>
</html>