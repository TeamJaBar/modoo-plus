<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="modoo" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport">
<title>Error</title>

<!-- General CSS Files -->
<link rel="stylesheet" href="../assets/modules/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="../assets/modules/fontawesome/css/all.min.css">


<!-- Template CSS -->
<link rel="stylesheet" href="../assets/css/style.css">
<link rel="stylesheet" href="../assets/css/components.css">

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
<style>
	@font-face {
		font-family: 'GmarketSansMedium';
		src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
		font-weight: normal;
		font-style: normal;
	}
	.error {
		margin:0 auto;
		font-family: 'GmarketSansMedium';
		font-size:20px;
		text-align:center;
		padding:10px 0 30px 0;
	}
	
	.error > .message {
		font-size:18px;
		color:black;
	}
	
	.error > p {
		font-size:15px;
		color:#0188CB;
	}
	
	.error > img {
		width:300px;
	}
	
	.back {
		width:100px;
		padding:10px 20px 10px;
		font-size:15px;
		color:white;
		background-color:#0188CB;
		border-radius:5px;
		border:1px solid #0188CB;
	}
	
	.back:hover {
		background-color: #004669 !important;
		border-color: #004669 !important;
		color: white;
	}
</style>
</head>

<body class="layout-3">
	<div id="app">
		<div class="main-wrapper container">
			<!-- Main Content -->
			<div class="main-content">
				<section class="section">

					<div class="section-body">
						<div class="card">
							<div class="error">
								<img alt="에러 이미지" src="/ModooShop/images/error.png">
								<p class="message">서비스 이용에 불편함을드려 죄송합니다.</p>
								<p>Error : ${exception.getClass().getSimpleName()}</p>
								<c:if test="${exception.getMessage() != null }">
									<p>메세지 : ${exception.getMessage()}</p>
								</c:if>
								<c:if test="${exception.getCause() != null}">
									<p>원인 : ${exception.getCause()}</p>
								</c:if>
								<button class="back" onclick="history.back()">뒤로가기</button>
							</div>
						</div>
					</div>
				</section>
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

	<!-- Page Specific JS File -->

	<!-- Template JS File -->
	<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
	<script src="../assets/js/scripts.js"></script>
	<script src="../assets/js/custom.js"></script>

</body>
</html>