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

					<c:choose>
						<c:when test="${sue.sResult == 0}">
							<div class="section-body">
								<h2 class="section-title">${sue.bTitle}</h2>
								<div class="card">
									<div class="card-header">
										<span class="badge badge-info" style="margin-right:10px;">
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
										<fmt:formatDate value="게시 : ${sue.bwDate}" pattern="yy-MM-dd HH:mm" />
										<div class="bullet"></div>
										<fmt:formatDate value="신고 : ${sue.sDate}" pattern="yy-MM-dd HH:mm" />
										<button class="btn btn-danger" style="float: right;" data-confirm="정말 취소하시겠습니까?" data-confirm-yes="alert('취소 되었습니다. :)');">신고취소</button>
										<button name="updateSue" style="float: right;" class="btn btn-icon btn-danger" data-confirm="신고 취소 | 정말로 취소하실껀가요?" data-confirm-yes="location.href='updateSue.do?sNum=${sue.sNum}&sResult=1'">
											신고취소</button>
										<div class="btn-group mb-2" style="float: right;">
											 처리 yes 누르면 data-confirm-yes="delete()로 바꾸기
											<button class="btn btn-info btn-sm dropdown-toggle" id="sue-btn" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">회원 관리</button>
											<div class="dropdown-menu">
												<a class="dropdown-item" href="adSueMem.do?mNum=${sue.mNum}&score=-30">점수감점 (-30)</a>
												<a class="dropdown-item" href="adSueMem.do?mNum=${sue.mNum}&mStatus=1">계정 7일 정지</a>
												<div class="dropdown-divider"></div>
												<a class="dropdown-item" href="updateSue.do?sNum=${sue.sNum}&sResult=1&bStatus=1">게시글 막기</a>
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
										<span class="badge badge-info" style="margin-right:10px;">
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
												<c:otherwise>점수감점</c:otherwise>
											</c:choose>
											처리결과 어떤 처리를 했는지 나타내고 싶음
										</p>
									</div>
									<div class="card-footer bg-whitesmoke">
										<fmt:formatDate value="게시 : ${sue.bwDate}" pattern="yy-MM-dd HH:mm" />
										<div class="bullet"></div> 
										<fmt:formatDate value="신고 : ${sue.sDate}" pattern="yy-MM-dd HH:mm" />
										<button name="updateSue" style="float: right;" class="btn btn-icon btn-danger" data-confirm="신고 취소 | 정말로 취소하실껀가요?" data-confirm-yes="location.href='updateSue.do?sNum=${sue.sNum}'">
											신고취소</button>
										<c:if test="${sue.mStatus == 1}">
											<div class="btn-group mb-2" style="float: right;">
												<button name="updateSue" style="float: right;" class="btn btn-icon btn-primary" data-confirm="정지 취소 | 정말로 취소하실껀가요?"
													data-confirm-yes="location.href='adSueMem.do?mNum=${sue.mNum}&mStatus=0'">정지풀기</button>
											</div>
										</c:if>
									</div>
								</div>
							</div>
						</c:otherwise>
					</c:choose>
				</section>
			</div>
		</div>
	</div>
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
</style>
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