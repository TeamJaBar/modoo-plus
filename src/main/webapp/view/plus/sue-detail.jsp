<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="modoo" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport">
<!-- 파비콘 삽입 -->
<link rel="icon" href="../assets/img/favicon.png">
<title>보드매칭 &rsaquo; 신고 게시판 &rsaquo; 상세페이지</title>

<!-- General CSS Files -->
<link rel="stylesheet" href="../assets/modules/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="../assets/modules/fontawesome/css/all.min.css">

<!-- CSS Libraries -->

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
.main-content {
	padding-left: 15%;
	padding-right: 15%;
	min-width: 40%;
}

@font-face {
	font-family: 'GmarketSansMedium';
	src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
	font-weight: normal;
	font-style: normal;
}

#sue-btn {
	margin-right: 10px;
	height: 36px;
}

body {
	font-family: 'GmarketSansMedium';
}
.match-content img {
	max-width: 100%;
	object-fit: cover;
}
</style>
</head>

<body>
	<div id="app">
		<div class="main-wrapper main-wrapper-1">

			<!--  header -->
			<modoo:header />

			<!-- Main Content -->
			<div class="main-content">
				<section class="section">
					<div class="section-header">
						<h1>신고 상세 페이지</h1>
					</div>
					<!-- 처리되지 않은 신고일 경우 -->
					<c:choose>
						<c:when test="${sue.sResult == 0}">
							<div class="section-body">
								<h2 class="section-title">${sue.bTitle}</h2>
								<div class="card">
									<div class="card-header">
										<span class="badge badge-info" style="margin-right: 10px;">
											<modoo:exp score="${sue.score}" />
										</span>
										<h4>${sue.mId}</h4>
									</div>
									<div class="card-body">
										<p>${sue.bContent}</p>
									</div>
									<div class="card-body">
										<p>신고 사유 : ${sue.scName}</p>
									</div>
									<div class="card-footer bg-whitesmoke">
										게시일 : <fmt:formatDate value="${sue.bWdate}" pattern="yy-MM-dd HH:mm" />
										<div class="bullet"></div>
										신고일 : <fmt:formatDate value="${sue.sDate}" pattern="yy-MM-dd HH:mm" />
										<div class="bullet"></div>
										신고처리일 : <fmt:formatDate value="${sue.srDate}" pattern="yy-MM-dd HH:mm" />
										<button name="updateSue" style="float: right;" class="btn btn-icon btn-danger" data-confirm="신고 취소 | 정말로 취소하실껀가요?"
											data-confirm-yes="location.href='adSueMem.do?sNum=${sue.sNum}&mNum=${sue.mNum}'">신고취소</button>
										<div class="btn-group mb-2" style="float: right;">
											<button class="btn btn-info btn-sm dropdown-toggle" id="sue-btn" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">회원 관리</button>
											<div class="dropdown-menu">
												<a class="dropdown-item" href="adSueMem.do?mNum=${sue.mNum}&smNum=${sue.smNum}">점수감점 (-30)</a>
												<a class="dropdown-item" href="adSueMem.do?mNum=${sue.mNum}&smNum=${smNum}&sNum=${sue.sNum}&bNum=${sue.bNum}&mStatus=1">계정 3일 정지</a>
												<div class="dropdown-divider"></div>
												<a class="dropdown-item" href="adSueMem.do?mNum=${sue.mNum}&smNum=${smNum}&bNum=${sue.bNum}">게시글 막기</a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</c:when>
						<c:otherwise>
							<div class="section-body">
								<h2 class="section-title">${sue.bTitle}</h2>
								<div class="card">
									<div class="card-header">
										<span class="badge badge-info" style="margin-right: 10px;">
											<modoo:exp score="${sue.score}" />
										</span>
										<h4>${sue.mId}</h4>
									</div>
									<div class="card-body">
										<p>${sue.bContent}</p>
									</div>
									<div class="card-body">
										<p>신고 사유 : ${sue.scName}</p>
										<p>
											처리 결과 :
											<c:choose>
												<c:when test="${sue.mStatus == 1}">계정 정지상태</c:when>
												<c:when test="${sue.bStatus == 1}">게시글 블락 상태</c:when>
												<c:otherwise>점수감점</c:otherwise>
											</c:choose>
										</p>
									</div>
									<div class="card-footer bg-whitesmoke">
										게시일 : <fmt:formatDate value="${sue.bWdate}" pattern="yy-MM-dd HH:mm" />
										<div class="bullet"></div>
										신고일 : <fmt:formatDate value="${sue.sDate}" pattern="yy-MM-dd HH:mm" />
										<div class="bullet"></div>
										신고처리일 : <fmt:formatDate value="${sue.srDate}" pattern="yy-MM-dd HH:mm" />
									</div>
								</div>
							</div>
						</c:otherwise>
					</c:choose>
				</section>
			</div>
			<footer class="main-footer">
				<div class="footer-left">
					<%-- ${fn:length(bDatas)} --%>
					<div class="bullet"></div>
					Design By
					<a href="https://nauval.in/">Muhamad Nauval Azhar</a>
				</div>
				<div class="footer-right"></div>
			</footer>
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

	<!-- Page Specific JS File -->

	<!-- Template JS File -->
	<script src="../assets/js/scripts.js"></script>
	<script src="../assets/js/custom.js"></script>
</body>
</html>