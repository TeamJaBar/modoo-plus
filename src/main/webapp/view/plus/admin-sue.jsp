<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="modoo" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport">
<!-- 파비콘 삽입 -->
<link rel="icon" href="../../assets/img/favicon.png">
<title>보드매칭 &rsaquo; 신고 게시판</title>

<!-- General CSS Files -->
<link rel="stylesheet" href="../../assets/modules/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="../../assets/modules/fontawesome/css/all.min.css">

<!-- CSS Libraries -->
<link rel="stylesheet" href="../../assets/modules/jquery-selectric/selectric.css">
<!-- Template CSS -->
<link rel="stylesheet" href="../../assets/css/style.css">
<link rel="stylesheet" href="../../assets/css/components.css">
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
						<h1>신고 게시글</h1>
					</div>
					<div class="section-body">
						<h2 class="section-title">신고 게시글 처리 현황</h2>

						<div class="row">
							<div class="col-12">
								<div class="card mb-0">
									<div class="card-body">
										<ul class="nav nav-pills">
											<li class="nav-item">
												<a class="nav-link active" href="admin-sue.do?aCnt=${sueCount.aCnt}">
													전체
													<c:if test="${fn:length(sueCount.aCnt) == 0 }">
														<span class="badge badge-white"> 0 </span>
													</c:if>
													<c:if test="${fn:length(sueCount.aCnt) =! 0 }">
														<span class="badge badge-white"> ${sueCount.aCnt} </span>
													</c:if>
												</a>
											</li>
											<!-- 해야할 것 ajax 사용해서 비동기로 목록 출력 -->
											<li class="nav-item">
												<a class="nav-link" href="admin-sue.do?nCnt=${sueCount.nCnt}">
													미처리
													<c:if test="${fn:length(sueCount.nCnt) == 0 }">
														<span class="badge badge-primary"> 0 </span>
													</c:if>
													<c:if test="${fn:length(sueCount.nCnt) =! 0 }">
														<span class="badge badge-primary"> ${sueCount.nCnt} </span>
													</c:if>
												</a>
											</li>
											<li class="nav-item">
												<a class="nav-link" href="admin-sue.do?cCnt=${sueCount.cCnt}">
													처리완료
													<c:if test="${fn:length(sueCount.cCnt) == 0 }">
														<span class="badge badge-primary"> 0 </span>
													</c:if>
													<c:if test="${fn:length(sueCount.cCnt) =! 0 }">
														<span class="badge badge-primary"> ${sueCount.cCnt} </span>
													</c:if>
												</a>
											</li>
										</ul>
									</div>
								</div>
							</div>
						</div>
						<div class="row mt-4">
							<div class="col-12">
								<div class="card">
									<div class="card-header">
										<h4>신고 게시글 목록</h4>
									</div>
									<div class="card-body">

										<div class="table-responsive">
											<table class="table table-striped">
												<tr>
													<th>글 번호</th>
													<th>제목</th>
													<th>작성자</th>
													<th>작성날짜</th>
													<th>처리상태</th>
												</tr>
												<!-- 신고 게시글 목록 -->
												<c:if test="${fn:length(sue) == 0}">
													<tr>
														<td></td>
														<td>접수된 신고가 없습니다.</td>
														<td></td>
														<td></td>
														<td></td>
													</tr>
												</c:if>
												<c:if test="${fn:length(sue) =! 0}">
													<c:forEach items="${sue}" var="v">
														<tr>
															<td>${v.bNum}</td>
															<td>
																<a href="sue-detail.do?bNum=${v.bNum}">${v.bTitle}</a>
															</td>
															<td>
																<img alt="image" src="../../assets/img/avatar/${v.mImg}" class="rounded-circle" width="35" data-toggle="title" title="">
																<div class="d-inline-block ml-1">${v.mId}</div>
															</td>
															<td>${v.bWdate}</td>
															<td>
																<c:choose>
																	<c:when test="${v.bStatus == 0}">
																		<div class="badge badge-danger">미처리</div>
																	</c:when>
																	<c:otherwise>
																		<div class="badge badge-primary">처리완료</div>
																	</c:otherwise>
																</c:choose>
															</td>
														</tr>
													</c:forEach>
												</c:if>
												<!-- 신고 게시글 목록 끝-->
											</table>
										</div>
										<div class="card-footer text-center">
											<nav class="d-inline-block">
												<ul class="pagination mb-0">
													<c:if test="${pageVO.prev}">
														<li class="page-item disabled">
															<a class="page-link" href="list.board?pageNum=${pageVO.startPage - 1}&amount=${pageVO.amount}" aria-label="Previous">
																<span aria-hidden="true">&laquo;</span>
																<span class="sr-only">Previous</span>
															</a>
														</li>
													</c:if>
													<!-- 1. 페이지번호 처리 -->
													<c:forEach var="num" begin="${pageVO.startPage}" end="${pageVO.endPage}">
														<li class="page-item active">
															<a class="page-link" href="list.board?pageNum=${num}&amount=${pageVO.amount}">${num}</a>
														</li>
													</c:forEach>
													<!-- <li class="page-item">
														<a class="page-link" href="#">2</a>
													</li> -->
													<c:if test="${pageVO.next}">
														<li class="page-item">
															<a class="page-link" href="list.board?pageNum=${pageVO.endPage + 1}&amount=${pageVO.amount}" aria-label="Next">
																<span aria-hidden="true">&raquo;</span>
																<span class="sr-only">Next</span>
															</a>
														</li>
													</c:if>

												</ul>
											</nav>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
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

body {
	font-family: 'GmarketSansMedium';
}
</style>
	<!-- General JS Scripts -->
	<script src="../../assets/modules/jquery.min.js"></script>
	<script src="../../assets/modules/popper.js"></script>
	<script src="../../assets/modules/tooltip.js"></script>
	<script src="../../assets/modules/bootstrap/js/bootstrap.min.js"></script>
	<script src="../../assets/modules/nicescroll/jquery.nicescroll.min.js"></script>
	<script src="../../assets/modules/moment.min.js"></script>
	<script src="../../assets/js/stisla.js"></script>

	<!-- JS Libraies -->
	<script src="../../assets/modules/jquery-selectric/jquery.selectric.min.js"></script>

	<!-- Page Specific JS File -->
	<script src="../../assets/js/page/features-posts.js"></script>

	<!-- Template JS File -->
	<script src="../../assets/js/scripts.js"></script>
	<script src="../../assets/js/custom.js"></script>
</body>
</html>