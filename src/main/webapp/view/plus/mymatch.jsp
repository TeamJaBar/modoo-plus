<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="modoo" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport">
<!-- 파비콘 삽입 -->
<link rel="icon" href="../../assets/img/favicon.png">
<title>보드매칭 &rsaquo; 매칭 목록</title>

<!-- General CSS Files -->
<link rel="stylesheet" href="../../assets/modules/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="../../assets/modules/fontawesome/css/all.min.css">

<!-- CSS Libraries -->

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
			<modoo:header id="${member.mId}" name="${member.mName}" />

			<!-- Main Content -->
			<div class="main-content">
				<section class="section">
					<div class="section-header">
						<h1>마이페이지</h1>
					</div>

					<div class="section-body">
						<h2 class="section-title">매칭 목록</h2>
						<div class="row">
							<div class="col-12">
								<div class="card">
									<div class="card-header">
										<h4>내가 매칭 신청한 게시글 목록</h4>
									</div>

									<!-- el식 적용 -->
									<div class="card-body p-0">
										<div class="table-responsive">
											<table class="table table-striped">
												<tbody>
													<tr>
														<th>No.</th>
														<th>제목</th>
														<th>장소</th>
														<th>인원</th>
														<th>날짜</th>
														<th>신청취소</th>
														<th>평가하기</th>
													</tr>
													<c:forEach items="${aDatas}" var="v">
														<tr>
															<td class="p-0 text-center">${v.bNum}</td>
															<td>${v.bTitle}</td>
															<td class="align-middle">${v.bAddress}</td>
															<td>${fn:length(aDatas)}/ ${v.bCnt}</td>
															<td>${v.bDate}</td>
															<td>
																<a href="myEntryDelete.do?aNum=${v.aNum}" class="btn btn-secondary">취소하기</a>
															</td>
															<td>
																<button class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">평가하기</button>
															</td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
									</div>
									<!--el 적용 -->
								</div>
							</div>
						</div>
					</div>
				</section>
			</div>
		</div>
	</div>
	<!-- Modal screen -->
	<div class="modal fade" tabindex="-1" role="dialog" id="exampleModal">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">MVP를 뽑아주세요!</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<form action="userRating.do">
					<div class="modal-body">
						<table class="table table-striped">
							<tbody>
								<tr>
									<th>check</th>
									<th>Profile</th>
									<th>Name</th>
								</tr>

								<!-- 모달창 el식 적용 -->
								<c:forEach items="${aDatas}" var="v">
									<tr>
										<td>
											<input type="radio" name="mvp" value="${v.mNum}" />
										</td>
										<td>
											<img alt="image" src="../../assets/img/avatar/${v.mImg}" class="rounded-circle" width="35" data-toggle="tooltip" title="" data-original-title="${v.mId}">
										</td>
										<td>${v.mName}</td>
									</tr>
								</c:forEach>
								<!-- 모달창 el식 적용 끝 -->

							</tbody>
						</table>
					</div>

					<div class="modal-footer bg-whitesmoke br">
						<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
						<button type="button" class="btn btn-primary" onclick="submit()">평가 완료</button>
					</div>

				</form>
			</div>
		</div>
	</div>

	<!-- General JS Scripts -->
	<script src="../../assets/modules/jquery.min.js"></script>
	<script src="../../assets/modules/popper.js"></script>
	<script src="../../assets/modules/tooltip.js"></script>
	<script src="../../assets/modules/bootstrap/js/bootstrap.min.js"></script>
	<script src="../../assets/modules/nicescroll/jquery.nicescroll.min.js"></script>
	<script src="../../assets/modules/moment.min.js"></script>
	<script src="../../assets/js/stisla.js"></script>

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
	<!-- JS Libraies -->

	<!-- Page Specific JS File -->

	<!-- Template JS File -->
	<script src="../../assets/js/scripts.js"></script>
	<script src="../../assets/js/custom.js"></script>
</body>
</html>