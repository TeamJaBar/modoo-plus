<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="modoo" tagdir="/WEB-INF/tags"%>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->
<link rel="icon" type="image/png" href="../images/icons/favicon.png" />
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="../vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="../fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="../fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="../fonts/linearicons-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="../vendor/animate/animate.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="../vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="../vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="../vendor/select2/select2.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="../vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="../vendor/slick/slick.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="../vendor/MagnificPopup/magnific-popup.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="../vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="../css/util.css">
<link rel="stylesheet" type="text/css" href="../css/main.css">
<!--===============================================================================================-->
</head>
<body class="animsition">
	<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			var cateArray = new Array('', '', '', '');
			var arrayNum = 0;
			var menupage = 0;

			var total_width = $('.menu-desktop').innerWidth();
			var gd_display_cate = function() {
				$('.menu-desktop > ul > li').each(function(index) {
					if (arrayNum > 0) {
						cateArray[arrayNum] += "<li class='active-menu'>" + $(this).html() + "</li>";
					} else {
						cateArray[arrayNum] += "<li>" + $(this).html() + "</li>";
					}
					if (index != 0 && index % 6 == 0) {
						arrayNum++;
					}
				});
				$('.menu-desktop > ul').html(cateArray[0]);
				$('header .header_gnb').css({
					'overflow' : 'visible',
					'height' : '100%',
				});
			};

			gd_display_cate();

			/* 메뉴 우측 버튼 */
			$('.gnb_right').on({
				'click' : function() {
					if (arrayNum > menupage) {
						menupage++;
						if (menupage == arrayNum)
							$(this).find('a').addClass('active');
						$('.gnb_left').find('a').removeClass('active');
						$('.menu-desktop > ul').html(cateArray[menupage]);
						$('.menu-desktop > ul li a').on({
							'click' : function() {
								location.href = $(this).data('href');
							}
						});
					}
				}
			});

			/* 메뉴 좌측 버튼 */
			$('.gnb_left').on({
				'click' : function() {
					if (arrayNum >= menupage && menupage != 0) {
						menupage--;
						if (menupage == 0)
							$(this).find('a').addClass('active');
						$('.gnb_right').find('a').removeClass('active');
						$('.menu-desktop > ul').html(cateArray[menupage]);
						$('.menu-desktop > ul li a').on({
							'click' : function() {
								location.href = $(this).data('href');
							}
						});
					}
				}
			});

		});
	</script>
	<!-- Header -->
	<c:if test="${param.page != 'main'}">
		<header class="header-v4">
	</c:if>
	<c:if test="${param.page eq 'main'}">
		<header>
	</c:if>
	<!-- Header desktop -->
	<div class="container-menu-desktop">
		<!-- Topbar -->
		<div class="top-bar">
			<div class="content-topbar flex-sb-m h-full container">
				<div class="left-top-bar">Modoo+</div>
				<div class="right-top-bar flex-w h-full">
					<modoo:login />
				</div>
			</div>
		</div>
		<c:if test="${param.page != 'main'}">
			<div class="wrap-menu-desktop how-shadow1">
				<nav class="limiter-menu-desktop container">
					<!-- Logo desktop -->
					<a href="main.do" class="logo">
						<img src="/ModooShop/images/logo-06.png" alt="모두의 보드 로고">
					</a>
		</c:if>
		<c:if test="${param.page eq 'main'}">
			<div class="header_gnb">
				<div class="logo-container-desktop">
					<!-- Logo desktop -->
					<a href="main.do" class="logo-main">
						<img src="/ModooShop/images/logo-06.png" alt="모두의 보드 로고">
					</a>
				</div>
				<div class="wrap-main-menu-desktop">
					<nav class="limiter-menu-desktop container">
		</c:if>
		<!-- Menu desktop -->
		<div class="gnb_left">
			<a href="#PREV" class="active">PREV</a>
		</div>
		<div class="menu-desktop">
			<ul class="main-menu">
				<li>
					<a href="product.do?cateNum=1000">NEW</a>
				</li>
				<li>
					<a href="product.do?cateNum=1100">BEST</a>
				</li>
				<li class="active-menu">
					<a href="product.do?cateNum=101">연령별</a>
					<ul class="sub-menu">
						<li>
							<a href="product.do?cateNum=101&mcNum=1">4세 미만</a>
						</li>
						<li>
							<a href="product.do?cateNum=101&mcNum=2">미취학 아동</a>
						</li>
						<li>
							<a href="product.do?cateNum=101&mcNum=3">초등학교 저학년</a>
						</li>
						<li>
							<a href="product.do?cateNum=101&mcNum=4">초등학교 고학년</a>
						</li>
						<li>
							<a href="product.do?cateNum=101&mcNum=5">12세 이상</a>
						</li>
					</ul>
				</li>
				<li>
					<a href="product.do?cateNum=200">1인 추천</a>
				</li>
				<li>
					<a href="product.do?cateNum=300">전략</a>
				</li>
				<li class="active-menu">
					<a href="product.do?cateNum=400">두뇌</a>
					<ul class="sub-menu">
						<li>
							<a href="product.do?cateNum=400&mcNum=401">퍼즐게임</a>
						</li>
						<li>
							<a href="product.do?cateNum=400&mcNum=402">창의수학</a>
						</li>
						<li>
							<a href="product.do?cateNum=400&mcNum=403">코딩게임</a>
						</li>
						<li>
							<a href="product.do?cateNum=400&mcNum=404">방탈출/추리</a>
						</li>
						<li>
							<a href="product.do?cateNum=400&mcNum=405">기억력게임</a>
						</li>
					</ul>
				</li>
				<li class="active-menu">
					<a href="product.do?cateNum=500">파티게임</a>
					<ul class="sub-menu">
						<li>
							<a href="product.do?cateNum=500&mcNum=501">복불복</a>
						</li>
					</ul>
				</li>
				<li>
					<a href="product.do?cateNum=600">카드게임</a>
				</li>
				<li>
					<a href="product.do?cateNum=700">사회/과학</a>
				</li>
				<li class="active-menu">
					<a href="product.do?cateNum=800">언어/정서</a>
					<ul class="sub-menu">
						<li>
							<a href="product.do?cateNum=800&mcNum=801">언어쑥쑥</a>
						</li>
						<li>
							<a href="product.do?cateNum=800&mcNum=802">스토리텔링 (감정/대화)</a>
						</li>
						<li>
							<a href="product.do?cateNum=800&mcNum=803">학지사 상담교구</a>
						</li>
					</ul>
				</li>
				<li>
					<a href="product.do?cateNum=900">악세사리</a>
				</li>
			</ul>
			<div class="gnb_right">
				<a href="#NEXT" class="active">NEXT</a>
			</div>
		</div>
		<!-- Icon header -->
		<div class="wrap-icon-header flex-w flex-r-m">
			<div class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 js-show-search-slide">
				<i class="zmdi zmdi-search"></i>
			</div>
			<div class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11">
				<a href="shopping-cart.jsp">
					<i class="zmdi zmdi-shopping-cart"></i>
				</a>
			</div>
			<c:if test="${mId == null}">
				<a href="login.jsp" class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11">
					<i class="zmdi zmdi-favorite-outline"></i>
				</a>
			</c:if>
			<c:if test="${mId != null}">
				<a href="dibList.do" class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11">
					<i class="zmdi zmdi-favorite-outline"></i>
				</a>
			</c:if>
		</div>
		</nav>
	</div>
	</div>
	<c:if test="${param.page eq 'main'}">
		</div>
	</c:if>
	<!-- Header Mobile -->
	<div class="wrap-header-mobile">
		<!-- Logo moblie -->
		<div class="logo-mobile">
			<a href="main.do">
				<img src="../images/logo-06.png" alt="모두의 보드 로고">
			</a>
		</div>
		<!-- Icon header -->
		<div class="wrap-icon-header flex-w flex-r-m m-r-15">
			<div class="icon-header-item cl2 hov-cl1 trans-04 p-r-11 js-show-search-slide">
				<i class="zmdi zmdi-search"></i>
			</div>
			<div class="icon-header-item cl2 hov-cl1 trans-04 p-r-11 p-l-10">
				<a href="shopping-cart.jsp">
					<i class="zmdi zmdi-shopping-cart"></i>
				</a>
			</div>
			<a href="dibList.do" class="dis-block icon-header-item cl2 hov-cl1 trans-04 p-r-11 p-l-10">
				<i class="zmdi zmdi-favorite-outline"></i>
			</a>
		</div>
		<!-- Button show menu -->
		<div class="btn-show-menu-mobile hamburger hamburger--squeeze">
			<span class="hamburger-box">
				<span class="hamburger-inner"></span>
			</span>
		</div>
	</div>
	<!-- Menu Mobile -->
	<div class="menu-mobile">
		<ul class="topbar-mobile">
			<li>
				<div class="right-top-bar flex-w h-full">
					<c:if test="${mNum == null}">
						<a href="about.jsp" class="flex-c-m p-lr-10 trans-04">ABOUT US</a>
						<a href="login.jsp" class="flex-c-m p-lr-10 trans-04">LOGIN</a>
						<a href="join.jsp" class="flex-c-m p-lr-10 trans-04">JOIN</a>
						<a href="login.jsp" class="flex-c-m p-lr-10 trans-04">MYPAGE</a>
					</c:if>
					<c:if test="${mId == 'admin'}">
						<a href="about.jsp" class="flex-c-m p-lr-10 trans-04">ABOUT US</a>
						<a href="logout.do" class="flex-c-m p-lr-10 trans-04">LOGOUT</a>
						<a href="adMain.do" class="flex-c-m p-lr-10 trans-04">ADMIN</a>
					</c:if>
					<c:if test="${mNum != null && mId != 'admin'}">
						<a href="about.jsp" class="flex-c-m p-lr-10 trans-04">ABOUT US</a>
						<a href="logout.do" class="flex-c-m p-lr-10 trans-04">LOGOUT</a>
						<a href="changeInfo.do" class="flex-c-m p-lr-10 trans-04">MYPAGE</a>
					</c:if>
				</div>
			</li>
		</ul>
		<ul class="main-menu-m">
			<li>
				<a href="product.do?cateNum=1000">NEW</a>
			</li>
			<li>
				<a href="product.do?cateNum=1100">BEST</a>
			</li>
			<li>
				<a href="product.do?cateNum=101">연령별</a>
				<ul class="sub-menu-m">
					<li>
						<a href="product.do?cateNum=101&mcNum=1">4세 미만</a>
					</li>
					<li>
						<a href="product.do?cateNum=101&mcNum=2">미취학 아동</a>
					</li>
					<li>
						<a href="product.do?cateNum=101&mcNum=3">초등학교 저학년</a>
					</li>
					<li>
						<a href="product.do?cateNum=101&mcNum=4">초등학교 고학년</a>
					</li>
					<li>
						<a href="product.do?cateNum=101&mcNum=5">12세 이상</a>
					</li>
				</ul>
				<span class="arrow-main-menu-m">
					<i class="fa fa-angle-right" aria-hidden="true"></i>
				</span>
			</li>
			<li>
				<a href="product.do?cateNum=200">1인 추천</a>
			</li>
			<li>
				<a href="product.do?cateNum=300">전략</a>
			</li>
			<li>
				<a href="product.do?cateNum=400">두뇌</a>
				<ul class="sub-menu-m">
					<li>
						<a href="product.do?cateNum=400&mcNum=401">퍼즐게임</a>
					</li>
					<li>
						<a href="product.do?cateNum=400&mcNum=402">창의수학</a>
					</li>
					<li>
						<a href="product.do?cateNum=400&mcNum=403">코딩게임</a>
					</li>
					<li>
						<a href="product.do?cateNum=400&mcNum=404">방탈출/추리</a>
					</li>
					<li>
						<a href="product.do?cateNum=400&mcNum=405">기억력게임</a>
					</li>
				</ul>
				<span class="arrow-main-menu-m">
					<i class="fa fa-angle-right" aria-hidden="true"></i>
				</span>
			</li>
			<li>
				<a href="product.do?cateNum=500">파티게임</a>
				<ul class="sub-menu-m">
					<li>
						<a href="product.do?cateNum=500&mcNum=501">복불복</a>
					</li>
				</ul>
				<span class="arrow-main-menu-m">
					<i class="fa fa-angle-right" aria-hidden="true"></i>
				</span>
			</li>
			<li>
				<a href="product.do?cateNum=600">카드게임</a>
			</li>
			<li>
				<a href="product.do?cateNum=700">사회/과학</a>
			</li>
			<li>
				<a href="product.do?cateNum=800">언어/정서</a>
				<ul class="sub-menu-m">
					<li>
						<a href="product.do?cateNum=800&mcNum=801">언어쑥쑥</a>
					</li>
					<li>
						<a href="product.do?cateNum=800&mcNum=802">스토리텔링 (감정/대화)</a>
					</li>
					<li>
						<a href="product.do?cateNum=800&mcNum=803">학지사 상담교구</a>
					</li>
				</ul>
				<span class="arrow-main-menu-m">
					<i class="fa fa-angle-right" aria-hidden="true"></i>
				</span>
			</li>
			<li>
				<a href="product.do?cateNum=900">악세사리</a>
			</li>
		</ul>
	</div>
	</header>
	<!-- Search(Right) -->
	<div class="wrap-header-cart js-panel-cart">
		<div class="s-full js-hide-search-slide"></div>
		<div class="header-cart flex-col-l p-l-65 p-r-25">
			<div class="header-cart-title flex-w flex-sb-m p-b-8">
				<span class="mtext-103 cl2">Search</span>
				<div class="fs-35 lh-10 cl2 p-lr-5 pointer hov-cl1 trans-04 js-hide-search-slide">
					<i class="zmdi zmdi-close"></i>
				</div>
			</div>
			<form action="search.do" id="search-form" method="post">
				<div class="p-t-33 w-full">
					<div class="p-b-10 m-b-20">
						<div class="size-203 respon6 m-b-10">Category</div>
						<div class="rs1-select2 bor8 bg0">
							<select form="search-form" class="js-select2" name="cateNum">
								<option value="0">카테고리</option>
								<!--<option value="1000">New</option>-->
								<!--<option value="11000">Best</option>-->
								<!-- <option value="100">연령별</option> -->
								<option value="200">1인 추천</option>
								<option value="300">전략</option>
								<option value="400">두뇌</option>
								<option value="500">파티게임</option>
								<option value="600">카드게임</option>
								<option value="700">사회/과학</option>
								<option value="800">언어/정서</option>
								<option value="900">악세서리</option>
							</select>
							<div class="dropDownSelect2"></div>
						</div>
					</div>
					<div class="p-b-10 m-b-20">
						<div class="size-203 respon6 m-b-10">Brand</div>
						<div class="rs1-select2 bor8 bg0">
							<select form="search-form" class="js-select2" name="brand">
								<option>브랜드</option>
								<option value="보드게임몰">보드게임몰</option>
								<option value="고은문화사">고은문화사</option>
								<option value="게임올로지">게임올로지</option>
								<option value="다고이게임즈">다고이게임즈</option>
								<option value="다즐에듀">다즐에듀</option>
								<option value="라벤스부르거">라벤스부르거</option>
								<option value="럭키식스">럭키식스</option>
							</select>
							<div class="dropDownSelect2"></div>
						</div>
					</div>
					<div class="p-b-10 m-b-20">
						<div class="size-203 respon6 m-b-10">Price</div>
						<div class="rs1-select2 bor8 bg0 m-b-10">
							<select form="search-form" class="js-select2" id="lowNum" name="lowNum">
								<option value="0">최소 가격</option>
								<option value="10000">10000</option>
								<option value="20000">20000</option>
								<option value="30000">30000</option>
								<option value="40000">40000</option>
								<option value="50000">50000</option>
							</select>
							<div class="dropDownSelect2"></div>
						</div>
						<div style="text-align: center">~</div>
						<div class="rs1-select2 bor8 bg0 m-t-10">
							<select form="search-form" class="js-select2" id="highNum" name="highNum">
								<option value="0">최대 가격</option>
								<option value="10000">10000</option>
								<option value="20000">20000</option>
								<option value="30000">30000</option>
								<option value="40000">40000</option>
								<option value="50000">50000</option>
							</select>
							<div class="dropDownSelect2"></div>
						</div>
					</div>
				</div>
				<div class="bor8 dis-flex p-l-10 m-b-20 m-t-20" style="height: 50px;">
					<button class="size-113 flex-c-m fs-16 cl2 hov-cl1 trans-04" style="height: 50px;">
						<i class="zmdi zmdi-search"></i>
					</button>
					<input class="mtext-107 cl2 size-114 plh2 p-r-15 m-t-5" style="height: 40px;" type="text" name="pName" placeholder="Search">
				</div>
				<input class="w-full flex-c-m stext-101 cl0 size-107 bg3 bor2 hov-btn3 p-lr-15 trans-04 m-r-8 m-b-10" type="submit" value="검색">
			</form>
		</div>
	</div>
	<script>
		$(function() {
			/*가격 검색 유회성 검사*/
			$('#lowNum').on('select2:select', function(e) {
				console.log('lowNum 이벤트 발생');
				console.log('lowNum 현재 값: ' + $(this).val());
				console.log('highNum 현재 값: ' + $('#highNum').val());

				if ($('#highNum').val() != 0 && $(this).val() > $('#highNum').val()) {
					alert("최소 가격은 최대 가격보다 커야 합니다.");
					$('#lowNum opiton[value=0]').attr("selected", true);
					$('#lowNum').val('0').trigger('change');
				}
			})

			$('#highNum').on('select2:select', function(e) {
				console.log('highNum 이벤트 발생');
				console.log('highNum 현재 값: ' + $(this).val());
				console.log('lowNum 현재 값: ' + $('#lowNum').val());
				if ($('#highNum').val() != 0 && $(this).val() < $('#lowNum').val()) {
					alert("최대 가격은 최소 가격보다 커야 합니다.");
					$('#highNum opiton[value=0]').attr("selected", true);
					$('#highNum').val('0').trigger('change');
				}
			})

		});
	</script>