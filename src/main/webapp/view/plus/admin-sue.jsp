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
<title>보드매칭 &rsaquo; 신고 게시판</title>

<!-- General CSS Files -->
<link rel="stylesheet" href="../assets/modules/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="../assets/modules/fontawesome/css/all.min.css">

<!-- CSS Libraries -->
<link rel="stylesheet" href="../assets/modules/jquery-selectric/selectric.css">
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
.empty {
	padding-top: 30px !important;
}

.empty>p {
	font-size: 15px;
}

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
										<ul class="nav nav-pills" id="navi">
											<li class="nav-item" id="aCnt">
												<a class="nav-link" href="#;">
													<%-- href="admin-sue.do?aCnt=${sueCount.aCnt}" --%>
													전체
													<span class="badge badge-primary" id="a"> ${sueCount.aCnt} </span>
												</a>
											</li>
											<!-- 해야할 것 ajax 사용해서 비동기로 목록 출력 -->
											<li class="nav-item" id="nCnt">
												<a class="nav-link" href="#;">
													<!-- href="admin-sue.do?nCnt=${sueCount.nCnt}" -->
													미처리
													<span class="badge badge-primary" id="n"> ${sueCount.nCnt} </span>
												</a>
											</li>
											<li class="nav-item" id="cCnt">
												<a class="nav-link" href="#;">
													<!-- href="admin-sue.do?cCnt=${sueCount.cCnt}" -->
													처리완료
													<span class="badge badge-primary" id="c"> ${sueCount.cCnt} </span>
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
									<div class="card-body" id="a_box">
										<div class="table-responsive">
											<table class="table table-striped">
												<tr>
													<th>글 번호</th>
													<th>제목</th>
													<th>작성자</th>
													<th>신고날짜</th>
													<th>처리상태</th>
												</tr>
												<!-- 신고 게시글 목록 -->
												<c:if test="${empty sue}">
													<tr class="text-center">
														<td class="empty" colspan="8">
															<p>접수된 신고가 없습니다.</p>
															<button class="btn btn-primary" type="button" onclick="location.href='adPlusMain.do'">글 관리</button>
														</td>
													</tr>
												</c:if>
												<c:if test="${not empty sue}">
													<c:forEach items="${sue}" var="v">
														<tr>
															<td>${v.sNum}</td>
															<td>
																<a href="selectSue.do?sNum=${v.sNum}">${v.bTitle}</a>
															</td>
															<td>
																<img alt="image" src="../assets/img/avatar/${v.mImg}" class="rounded-circle" width="35" data-toggle="title" title="">
																<div class="d-inline-block ml-1">${v.mId}</div>
															</td>
															<td>
																<fmt:formatDate value="${v.sDate}" pattern="yy-MM-dd HH:mm" />
															</td>
															<td>
																<c:choose>
																	<c:when test="${v.sResult == 0}">
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
										<input type="hidden" name="pageNum" id="pageNum" value="${param.pageNum}">
										<c:if test="${fn:length(sue) != 0}">
											<div class="card-footer text-center">
												<nav class="d-inline-block">
													<ul class="pagination mb-0">
														<c:if test="${pageVO.prev}">
															<li class="page-item disabled">
																<a class="page-link" href="adMoveSue.do?pageNum=${pageVO.startPage - 1}" aria-label="Previous">
																	<span aria-hidden="true">&laquo;</span>
																	<span class="sr-only">Previous</span>
																</a>
															</li>
														</c:if>
														<!-- 1. 페이지번호 처리 -->
														<c:forEach var="num" begin="${pageVO.startPage}" end="${pageVO.endPage}">
															<li class="page-item active">
																<a class="page-link" href="adMoveSue.do?pageNum=${num}">${num}</a>
															</li>
														</c:forEach>
														<c:if test="${pageVO.next}">
															<li class="page-item">
																<a class="page-link" href="adMoveSue.do?pageNum=${pageVO.endPage + 1}" aria-label="Next">
																	<span aria-hidden="true">&raquo;</span>
																	<span class="sr-only">Next</span>
																</a>
															</li>
														</c:if>
													</ul>
												</nav>
											</div>
										</c:if>
									</div>
								</div>
							</div>
						</div>
					</div>
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
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
	<script type="text/javascript">
	
	/* 버튼 눌렀을 때, 색상변경 */
	 	$('.nav-item .nav-link').on("click",function(){
	          $(".nav-link.active span").removeClass('badge-white');
	          $(".nav-link.active span").addClass('badge-primary');
	          $(".nav-item .nav-link.active").removeClass('active');
	          $(this).addClass("active");
	          $(this).find('span').removeClass('badge-primary');
	          $(this).find('span').addClass('badge-white');
	   }); 
	
	<!-- 전체글 -->
	$(document).on('click','#aCnt',function(e) {
				e.preventDefault();
					$.ajax({
						type : 'POST',
						url : 'adMoveSue.do',
						success : function(result) {
							if (result == 1) {
								$('#a_box').load(location.href + ' #a_box>*');
							}
						}
					});
				});
	
	<!-- 미처리글 -->
	$(document).on('click','#nCnt',function(e) {
			var sResult = 0;
				e.preventDefault();
				console.log(sResult);
					$.ajax({
						type : 'POST',
						url : 'adMoveSue.do',
						data : {
							sResult : sResult
						},
						success : function(result) {
							if (result == 1) {
								$('#a_box').load(location.href + ' #a_box>*');
							}
						}
					});
			});
	
	<!-- 처리완료 글 -->
	$(document).on('click','#cCnt',function(e) {
			var sResult = 1;
				e.preventDefault();
				console.log(sResult);
					$.ajax({
						type : 'POST',
						url : 'adMoveSue.do',
						data : {
							sResult : sResult
						},
						success : function(result) {
							if (result == 1) {
								$('#a_box').load(location.href + ' #a_box>*');
							}
						}
					});
				});
	</script>

	<!-- JS Libraies -->
	<script src="../assets/modules/jquery-selectric/jquery.selectric.min.js"></script>

	<!-- Page Specific JS File -->
	<script src="../assets/js/page/features-posts.js"></script>

	<!-- Template JS File -->
	<script src="../assets/js/scripts.js"></script>
	<script src="../assets/js/custom.js"></script>
</body>
</html>