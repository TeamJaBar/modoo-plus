<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="modoo" tagdir="/WEB-INF/tags"%>
<!DOCTYPE HTML>
<!--
	Editorial by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<head>
<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport">
  <!-- 파비콘 삽입 -->
<link rel="icon" href="../../assets/img/favicon.png">
<title>보드매칭 &rsaquo; 마이페이지</title>

<!-- General CSS Files -->
<link rel="stylesheet" href="../../assets/modules/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="../../assets/modules/fontawesome/css/all.min.css">

<!-- CSS Libraries -->
<link rel="stylesheet" href="../../assets/modules/fullcalendar/fullcalendar.min.css">

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
		<modoo:header id="${member.memberId}" name="${member.memberName}" />

			<!-- Main Content -->
			<div class="main-content">
				<section class="section">
					<div class="section-header">
						<h1>나의 보드</h1>
					</div>

					<div class="section-body">
						<h2 class="section-title">나의 작성 글 목록</h2>
						<p class="section-lead">내가 작성한 매칭글 목록을 출력합니다.</p>

						<div class="row">
							<div class="col-12 col-sm-6 col-lg-4">
								<div class="card">
									<div class="card-header">
										<h4>Calendar</h4>
									</div>
									<div class="card-body">
										<div class="fc-overflow">
											<div id="myEvent"></div>
										</div>
									</div>
								</div>
							</div>

							<div class="col-12 col-sm-6 col-lg-8">
								<div class="card">
									<div class="card-header">
										<h4>나의 작성 글</h4>
									</div>
									<div class="card-body p-0">
										<div class="table-responsive">
											<table class="table table-striped" id="sortable-table">
												<thead>
													<tr class="text-center">
														<th class="text-center">
															<i class="fas fa-th"></i>
														</th>
														<th>제목</th>
														<th>장소</th>
														<th>날짜</th>
														<th>시간</th>
														<th>인원</th>
														<th>상태</th>
														<th>실행</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td>
															<div class="sort-handler">
																<i class="fas fa-th"></i>
															</div>
														</td>
														<td>
															<a href="#">아발론 잘하시는분들 구합니다!</a>
														</td>
														<td>강남역 레드버튼</td>
														<td>2018-01-20 (월)</td>
														<td>20:00 ~ 22:00</td>
														<td>
															<a href="#">3 / 10</a>
														</td>
														<td>
															<div class="dropdown d-inline mr-2">
																<button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">모집 중</button>
																<div class="dropdown-menu">
																	<a class="dropdown-item" href="#">모집 중</a>
																	<a class="dropdown-item" href="#">모집완료</a>
																</div>
															</div>
														</td>
														<td>
															<a href="#" class="btn btn-icon btn-primary" id="modal-5">
																<i class="far fa-edit" id="modal-5"></i>
															</a>
															<a href="#" class="btn btn-icon btn-danger" data-confirm="삭제?|정말로 삭제하실껀가요?" data-confirm-yes="alert('삭제완료되었습니다 :)');">
																<i class="fas fa-times"></i>
															</a>
														</td>
													</tr>
													<tr>
														<td>
															<div class="sort-handler">
																<i class="fas fa-th"></i>
															</div>
														</td>
														<td>
															<a href="#">텔레스트레이션 ㄱ</a>
														</td>
														<td>홈즈앤 루팡 범계점</td>
														<td>2022-01-20 (월)</td>
														<td>19:00 ~ 22:00</td>
														<td>5 / 5</td>
														<td>
															<div class="dropdown d-inline mr-2">
																<button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">모집완료</button>
															</div>
														</td>
														<td>
															<a href="#" class="btn btn-success" id="modal-1" data-toggle="modal" data-target="#exampleModal">평가하기</a>
													</tr>
												</tbody>
											</table>
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
										</div>
									</div>
								</div>
							</div>

						</div>
					</div>
				</section>
			</div>
			<form class="modal-part" id="modal-login-part">
				<p>
					This login form is taken from elements with
					<code>#modal-login-part</code>
					id.
				</p>
				<div class="form-group">
					<label>게임 지역</label>
					<div class="input-group">

						<input type="text" class="form-control" placeholder="Email" name="email">
					</div>
				</div>
				<div class="form-group">
					<label>모집 인원</label>
					<div class="input-group">

						<input type="text" class="form-control" placeholder="Email" name="email">
					</div>
				</div>
				<div class="form-group">
					<label>게임 시간</label>
					<div class="input-group">

						<input type="text" class="form-control" placeholder="Email" name="email">
					</div>
				</div>
				<div class="form-group">
					<label>게임 위치</label>
					<div class="form-group">
						<select class="form-control">
							<option>Option 1</option>
							<option>Option 2</option>
							<option>Option 3</option>
						</select>
					</div>
				</div>
				<div class="form-group">
					<label>참가비</label>
					<div class="input-group">
						<input type="text" class="form-control" placeholder="Email" name="email">
					</div>
				</div>
				<div class="form-group">
					<label>실력</label>
					<div class="input-group">

						<input type="text" class="form-control" placeholder="Email" name="email">
					</div>
				</div>
				<div class="form-group">
					<label>내용</label>
					<div class="input-group">

						<input type="text" class="form-control" placeholder="Email" name="email">
					</div>
				</div>

			</form>
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
				<div class="modal-header">
					<h5 class="modal-title">MVP를 뽑아주세요!</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<table class="table table-striped">
						<tbody>
							<tr>
								<th>check</th>
								<th>Profile</th>
								<th>Name</th>
							</tr>
							<tr>
								<td>
									<input type="radio" name="mvp" checked />
								</td>
								<td>
									<img alt="image" src="../../assets/img/avatar/avatar-5.png" class="rounded-circle" width="35" data-toggle="tooltip" title="" data-original-title="Wildan Ahdian">
								</td>
								<td>서석지</td>
							</tr>
							<tr>
								<td>
									<input type="radio" name="mvp" />
								</td>
								<td>
									<img alt="image" src="../../assets/img/avatar/avatar-5.png" class="rounded-circle" width="35" data-toggle="tooltip" title="" data-original-title="Wildan Ahdian">
								</td>
								<td>박가연</td>
							</tr>
							<tr>
								<td>
									<input type="radio" name="mvp" />
								</td>
								<td>
									<img alt="image" src="../../assets/img/avatar/avatar-5.png" class="rounded-circle" width="35" data-toggle="tooltip" title="" data-original-title="Wildan Ahdian">
								</td>
								<td>김시하</td>
							</tr>
							<tr>
								<td>
									<input type="radio" name="mvp" />
								</td>
								<td>
									<img alt="image" src="../../assets/img/avatar/avatar-5.png" class="rounded-circle" width="35" data-toggle="tooltip" title="" data-original-title="Wildan Ahdian">
								</td>
								<td>윤석환</td>
							</tr>
							<tr>
								<td>
									<input type="radio" name="mvp" />
								</td>
								<td>
									<img alt="image" src="../../assets/img/avatar/avatar-5.png" class="rounded-circle" width="35" data-toggle="tooltip" title="" data-original-title="Wildan Ahdian">
								</td>
								<td>조수빈</td>
							</tr>
							<tr>
								<td>
									<input type="radio" name="mvp" />
								</td>
								<td>
									<img alt="image" src="../../assets/img/avatar/avatar-5.png" class="rounded-circle" width="35" data-toggle="tooltip" title="" data-original-title="Wildan Ahdian">
								</td>
								<td>이성훈</td>
							</tr>
							<tr>
								<td>
									<input type="radio" name="mvp" />
								</td>
								<td>
									<img alt="image" src="../../assets/img/avatar/avatar-5.png" class="rounded-circle" width="35" data-toggle="tooltip" title="" data-original-title="Wildan Ahdian">
								</td>
								<td>김민수</td>
							</tr>

						</tbody>
					</table>
				</div>
				<div class="modal-footer bg-whitesmoke br">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
					<button type="button" class="btn btn-primary">평가 완료</button>
				</div>
			</div>
		</div>
	</div>
	
	
<style>
.main-content {
  padding-left: 15%;
  padding-right: 15%;
  min-width:40%;
}
@font-face {
   font-family: 'GmarketSansMedium';
   src:
      url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff')
      format('woff');
   font-weight: normal;
   font-style: normal;
}
body{
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
	<script src="../../assets/modules/fullcalendar/fullcalendar.min.js"></script>
	<script src="../../assets/modules/prism/prism.js"></script>

	<!-- Page Specific JS File -->
	<script src="../../assets/js/page/modules-calendar.js"></script>
	<script src="../../assets/js/page/bootstrap-modal.js"></script>

	<!-- Template JS File -->
	<script src="../../assets/js/scripts.js"></script>
	<script src="../../assets/js/custom.js"></script>
</body>
</html>