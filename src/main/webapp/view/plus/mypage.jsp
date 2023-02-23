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
<div class="col-12">
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
															<a href="#">보드게임에 진심이신분들 구합니다!</a>
														</td>
														<td>레드버튼 강남역</td>
														<td>2018-01-10 (월)</td>
														<td>20:00</td>
														<td>
															<a href="#" data-toggle="modal" data-target="#exampleModal">3 / 5</a>
														</td>
														<td>
															<div class="dropdown d-inline mr-2">
																<button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">모집 완료</button>
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
															<a href="#">아발론 잘하시는분들 구합니다!</a>
														</td>
														<td>강남역 레드버튼</td>
														<td>2018-01-20 (월)</td>
														<td>20:00</td>
														<td>
															<a href="#" data-toggle="modal" data-target="#exampleModal">3 / 10</a>
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
														<td>19:00</td>
														<td>
															<a href="#" data-toggle="modal" data-target="#exampleModal">5 / 5</a>
														</td>
														<td>
															<div class="dropdown d-inline mr-2">
																<button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">모집완료</button>
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
				<div class="form-group">
					<label>게임 지역</label>
					<div class="input-group">
						<select class="form-control">
										<option disabled selected>경기 지역을 선택해 주세요</option>
										<option>서울 - 도봉/노원/강북/중랑</option>
										<option>서울 - 성북/동대문/종로</option>
										<option>서울 - 용산/중구</option>
										<option>서울 - 성동/광진/강동</option>
										<option>서울 - 송파/서초/강남</option>
										<option>서울 - 양천/구로/영등포/강서</option>
										<option>서울 - 금천/관악/동작</option>
										<option>경기 - 수원/용인/화성/오산</option>
										<option>경기 - 의정부/양주/그 외</option>
										<option>경기 - 과천/안양/군포/의왕</option>
										<option>경기 - 구리/남양주/하남</option>
										<option>경기 - 인천/부천/김포</option>
										<option>경기 - 고양/파주</option>
										<option>경기 - 성남/광주/이천</option>
										<option>경기 - 시흥/안산/광명</option>
										<option>경기 - 평택/안성</option>
									</select>
					</div>
				</div>
				<div class="form-group">
					<label>모집 인원</label>
					<div class="input-group">
						<select class="form-control">
										<option disabled selected>매치 방식을 선택해 주세요</option>
										<option>2명</option>
										<option>3명</option>
										<option>4명</option>
										<option>5명</option>
										<option>6명</option>
										<option>7명</option>
										<option>8명</option>
									</select>
					</div>
				</div>
				<div class="form-group">
					<label>게임 시간</label>
					<div class="input-group">
						<input type="datetime-local" class="form-control">
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
					<label>실력</label>
					<div class="input-group">
<div class="selectgroup w-100">
										<label class="selectgroup-item">
											<input type="radio" name="value" value="50" class="selectgroup-input"></input>
											<span class="selectgroup-button">빡고수</span>
										</label>
										<label class="selectgroup-item">
											<input type="radio" name="value" value="100" class="selectgroup-input">
											<span class="selectgroup-button">고수</span>
										</label>
										<label class="selectgroup-item">
											<input type="radio" name="value" value="150" class="selectgroup-input">
											<span class="selectgroup-button">초보</span>
										</label>
										<label class="selectgroup-item">
											<input type="radio" name="value" value="200" class="selectgroup-input">
											<span class="selectgroup-button">왕초보</span>
										</label>
									</div>
					</div>
				</div>
				<div class="form-group">
					<label>내용</label>
					<div class="input-group">
						<textarea class="form-control" id="editor"></textarea>
					</div>
					<script src="https://cdn.ckeditor.com/ckeditor5/29.1.0/classic/ckeditor.js"></script>
					<script>
      					ClassicEditor.create( document.querySelector( '#editor' ) );
					</script>
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
					<h5 class="modal-title">현재 참여한 회원</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<ul
												class="tab-applicant list-unstyled user-progress list-unstyled-border list-unstyled-noborder">
												
												<!--일반 참여자-->
												<li class="media"><img alt="image"
													class="mr-3 rounded-circle" width="50"
													src="assets/img/avatar/avatar-1.png">
													<div class="media-body">
														<div class="media-title">윤석환</div>
														<div class="text-job text-muted">고수</div>
													</div>
													<div class="media-progressbar">
														<div class="progress-text">120점</div>
														<div class="progress" data-height="6" style="height: 6px;">
															<div class="progress-bar bg-primary" data-width="24%"
																style="width: 24%;"></div>
														</div>
													</div> <!--퇴출하기 버튼은 글 작성자에게만 보임-->
													<div class="media-cta">
														<a href="#" class="btn btn-outline-primary">퇴출하기</a>
													</div></li>
												<li class="media"><img alt="image"
													class="mr-3 rounded-circle" width="50"
													src="assets/img/avatar/avatar-4.png">
													<div class="media-body">
														<div class="media-title">박가연</div>
														<div class="text-job text-muted">초고수</div>
													</div>
													<div class="media-progressbar">
														<div class="progress-text">450점</div>
														<div class="progress" data-height="6" style="height: 6px;">
															<div class="progress-bar bg-primary" data-width="90%"
																style="width: 90%;"></div>
														</div>
													</div>
													<div class="media-cta">
														<a href="#" class="btn btn-outline-primary">퇴출하기</a>
													</div></li>
													<li class="media"><img alt="image"
													class="mr-3 rounded-circle" width="50"
													src="assets/img/avatar/avatar-2.png">
													<div class="media-body">
														<div class="media-title">김민수</div>
														<div class="text-job text-muted">초고수</div>
													</div>
													<div class="media-progressbar">
														<div class="progress-text">3000점</div>
														<div class="progress" data-height="6" style="height: 6px;">
															<div class="progress-bar bg-primary" data-width="90%"
																style="width: 90%;"></div>
														</div>
													</div>
													<div class="media-cta">
														<a href="#" class="btn btn-outline-primary">퇴출하기</a>
													</div></li>
													<li class="media"><img alt="image"
													class="mr-3 rounded-circle" width="50"
													src="assets/img/avatar/avatar-3.png">
													<div class="media-body">
														<div class="media-title">김효경</div>
														<div class="text-job text-muted">초고수</div>
													</div>
													<div class="media-progressbar">
														<div class="progress-text">450점</div>
														<div class="progress" data-height="6" style="height: 6px;">
															<div class="progress-bar bg-primary" data-width="90%"
																style="width: 90%;"></div>
														</div>
													</div>
													<div class="media-cta">
														<a href="#" class="btn btn-outline-primary">퇴출하기</a>
													</div></li>
											</ul>
				</div>
			</div>
		</div>
	</div>



	<!-- General JS Scripts -->
	<script src="assets/modules/jquery.min.js"></script>
	<script src="assets/modules/popper.js"></script>
	<script src="assets/modules/tooltip.js"></script>
	<script src="assets/modules/bootstrap/js/bootstrap.min.js"></script>
	<script src="assets/modules/nicescroll/jquery.nicescroll.min.js"></script>
	<script src="assets/modules/moment.min.js"></script>
	<script src="assets/js/stisla.js"></script>

	<!-- JS Libraies -->
	<script src="assets/modules/fullcalendar/fullcalendar.min.js"></script>
	<script src="assets/modules/prism/prism.js"></script>
	<script src="assets/modules/cleave-js/dist/cleave.min.js"></script>
	<script src="assets/modules/cleave-js/dist/addons/cleave-phone.us.js"></script>
	<script src="assets/modules/jquery-pwstrength/jquery.pwstrength.min.js"></script>
	<script src="assets/modules/bootstrap-daterangepicker/daterangepicker.js"></script>
	<script src="assets/modules/bootstrap-colorpicker/dist/js/bootstrap-colorpicker.min.js"></script>
	<script src="assets/modules/bootstrap-timepicker/js/bootstrap-timepicker.min.js"></script>
	<script src="assets/modules/bootstrap-tagsinput/dist/bootstrap-tagsinput.min.js"></script>
	<script src="assets/modules/select2/dist/js/select2.full.min.js"></script>
	<script src="assets/modules/jquery-selectric/jquery.selectric.min.js"></script>
	

	<!-- Page Specific JS File -->
	<script src="assets/js/page/modules-calendar.js"></script>
	<script src="assets/js/page/bootstrap-modal.js"></script>
	<script src="assets/js/page/forms-advanced-forms.js"></script>

	<!-- Template JS File -->
	<script src="assets/js/scripts.js"></script>
	<script src="assets/js/custom.js"></script>
</body>
</html>