<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="modoo" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<link rel="icon" href="../assets/img/favicon.png">
<title>보드매칭 &rsaquo; 마이페이지</title>

<!-- General CSS Files -->
<link rel="stylesheet" href="../assets/modules/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="../assets/modules/fontawesome/css/all.min.css">

<!-- CSS Libraries -->
<link rel="stylesheet" href="../assets/modules/fullcalendar/fullcalendar.min.css">

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
						<h1>마이페이지</h1>
					</div>

					<div class="section-body">
						<h2 class="section-title">나의 보드</h2>

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
														<th>모임일자</th>
														<th>인원</th>
														<th>상태</th>
														<th>수정/삭제</th>
													</tr>
												</thead>
												<tbody>
													<!-- 작성글 없을때 -->
													<c:if test="${fn:length(bDatas) == 0 }">
														<tr class="text-center">
															<td>
																<div class="sort-handler">
																	<i class="fas fa-th"></i>
																</div>
															</td>
															<td></td>
															<td>게시글이 없습니다.</td>
															<td></td>
															<td></td>
															<td>
																<button class="btn btn-primary" type="button" onclick="location.href='createBoard.do'">글쓰러 가기</button>
															</td>
															<td>
																<div class="dropdown d-inline mr-2" id="b_box">
																	<button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
																		<c:if test="${v.bAction==0}">
																		모집중
																		</c:if>
																		<c:if test="${v.bAction==1}">
																		모집완료
																		</c:if>
																		<c:if test="${v.bAction==2}">
																		지난 모임
																		</c:if>
																	</button>
																	<div class="dropdown-menu">
																		<!--<a class="dropdown-item" id="matchIng" href="updateBoardAction.do?bNum=${v.bNum}&bAction=0">모집 중</a>-->
																		<!--<a class="dropdown-item" id="matchEnd" href="updateBoardAction.do?bNum=${v.bNum}&bAction=1">모집완료</a> -->

																		<button class="dropdown-item" id="matchIng">모집 중</button>
																		<button class="dropdown-item" id="matchEnd">모집완료</button>
																	</div>
																	<!-- ajax로 구현하기 -->
																</div>
															</td>
														</tr>
													</c:if>
													<!-- 작성글 없을때 -->

													<!-- 나의 작성 글 el식 적용 -->
													<c:if test="${fn:length(bDatas) != 0 }">
														<c:forEach items="${bDatas}" var="v">
															<input type="hidden" name="bNum" id="bNum" value="${v.bNum}" />
															<tr class="text-center">
																<td>
																	<div class="sort-handler">
																		<i class="fas fa-th"></i>
																	</div>
																</td>
																<td>
																	<a href="boardDetail.do?bNum=${v.bNum}">${v.bTitle}</a>
																</td>
																<td>${v.bAddress}</td>
																<td>
																	<fmt:formatDate value="${v.bDate}" pattern="yy-MM-dd HH:mm" />
																</td>
																<td>
																	<!-- aData == 이 글의 현재 매칭된 참여자가 몇명인지 applicant 배열 -->
																	<a href="#" data-toggle="modal" data-target="#exampleModal"> ${v.aCnt} / ${v.bCnt}</a>
																</td>
																<td>
																	<div class="dropdown d-inline mr-2" id="b_box">
																		<button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
																			<c:if test="${v.bAction==0}">
																		모집중
																		</c:if>
																			<c:if test="${v.bAction==1}">
																		모집완료
																		</c:if>
																			<c:if test="${v.bAction==2}">
																		지난 모임
																		</c:if>
																		</button>
																		<div class="dropdown-menu">
																			<!--<a class="dropdown-item" id="matchIng" href="updateBoardAction.do?bNum=${v.bNum}&bAction=0">모집 중</a>-->
																			<!--<a class="dropdown-item" id="matchEnd" href="updateBoardAction.do?bNum=${v.bNum}&bAction=1">모집완료</a> -->

																			<button class="dropdown-item" id="matchIng">모집 중</button>
																			<button class="dropdown-item" id="matchEnd">모집완료</button>
																		</div>
																		<!-- ajax로 구현하기 -->
																	</div>
																</td>
																<td>
																	<a href="#" class="btn btn-icon btn-primary" id="modal-5">
																		<i class="far fa-edit" id="modal-5"></i>
																	</a>
																	<button name="deleteBoard" class="btn btn-icon btn-danger" data-confirm="삭제?|정말로 삭제하실껀가요?" data-confirm-yes="location.href='deleteBoard.do?bNum=${v.bNum}'">
																		<i class="fas fa-times"></i>
																		<!-- 처리 yes 누르면 data-confirm-yes="delete()" -->
																	</button>
																</td>
															</tr>
														</c:forEach>
													</c:if>
													<!-- 나의 작성글 끝 -->

												</tbody>
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
			<form action="boardUpdate.do" class="modal-part" id="modal-login-part">
				<div class="form-group">
					<label>게임 지역</label>
					<div class="input-group">
						<select class="form-control" name="bLocal">
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
						<select class="form-control" name="bCnt">
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
						<input type="datetime-local" name="bDate" class="form-control">
					</div>
				</div>
				<div class="form-group">
					<label>게임 위치</label>
					<div class="form-group">
						<select class="form-control" name="bAddress">
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
								<input type="radio" name="bRate" value="5000" class="selectgroup-input"></input>
								<span class="selectgroup-button">초고수</span>
							</label>
							<label class="selectgroup-item">
								<input type="radio" name="bRate" value="1000" class="selectgroup-input">
								<span class="selectgroup-button">고수</span>
							</label>
							<label class="selectgroup-item">
								<input type="radio" name="bRate" value="500" class="selectgroup-input">
								<span class="selectgroup-button">초보</span>
							</label>
							<label class="selectgroup-item">
								<input type="radio" name="bRate" value="200" class="selectgroup-input">
								<span class="selectgroup-button">왕초보</span>
							</label>
						</div>
					</div>
				</div>
				<div class="form-group">
					<label>내용</label>
					<div class="input-group">
						<textarea class="form-control" name="bContent" id="editor"></textarea>
					</div>
					<script src="https://cdn.ckeditor.com/ckeditor5/29.1.0/classic/ckeditor.js"></script>
					<script>
						ClassicEditor.create(document.querySelector('#editor'));
					</script>
				</div>

			</form>
		</div>
	</div>

	<!-- Modal screen -->
	<div class="modal fade" tabindex="-1" role="dialog" id="exampleModal">
		<div class="modal-dialog" role="document" id="a_box">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">함께 참여한 회원</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<ul class="tab-applicant list-unstyled user-progress list-unstyled-border list-unstyled-noborder">

						<!--일반 참여자 el식 적용
						bNum을 넘겨서 list 받아와서 띄워주기만 하면 됌.-->
						<c:forEach items="${aDatas}" var="v">
							<li class="media">
								<img alt="image" class="mr-3 rounded-circle" width="50" src="../assets/img/avatar/${v.mImg}">
								<div class="media-body">
									<div class="media-title">${v.mId}</div>
									<div class="text-job text-muted">
										<modoo:exp score="${v.score}" />
									</div>
								</div>
								<div class="media-progressbar">
									<div class="progress-text">
										<modoo:score score="${v.score}" />
									</div>
									<div class="progress" data-height="6" style="height: 6px;">
										<div class="progress-bar bg-primary" data-width="<modoo:score score="${v.score}" />%" style="width: <modoo:score score="${v.score}" />%;"></div>
									</div>
								</div>
								<!--퇴출하기 버튼은 글 작성자에게만 보임-->
								<c:if test="${bDatas.mNum == mNum}">
									<div class="media-cta">
										<button id="kickOut" class="btn btn-outline-primary">퇴출하기</button>
									</div>
								</c:if>
							</li>
						</c:forEach>
					</ul>
				</div>
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

.modal-content {
	width: 680px;
	max-width: none;
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
	
		<script type="text/javascript">
	<!-- 퇴출하기 -->
		$(document).ready(function() {
			$('#kickOut').each(function() {
				let aNum = $(this).parent().parent().parent().prop("id");
				$(this).on('click', function(e) {
					e.preventDefault();
					console.log(aNum);
					if (confirm('퇴출하시겠습니까?')) {
						$.ajax({
							type : 'POST',
							url : 'kickOut.do',
							data : {
								aNum : aNum
							},
							success : function(result) {
								if (result == 1) {
									$('#a_box').load(location.href + ' #a_box>*');
								}
							}
						});
					}
				})
			})
		})
			<!-- 모집중 -->
		$(document).ready(function() {
			$('#matchIng').each(function() {
				let bNum = $(this).parent().parent().parent().prop("id");
				$(this).on('click', function(e) {
					e.preventDefault();
					console.log(bNum);
					if (confirm('모집중으로 변경하시겠습니까?')) {
						$.ajax({
							type : 'POST',
							url : 'updateBoardAction.do',
							data : {
								bNum : bNum,
								bAction : 0
							},
							success : function(result) {
								if (result == 1) {
									$('#b_box').load(location.href + ' #b_box>*');
								}
							}
						});
					}
				})
			})
		})
			<!-- 모집완료 -->
		$(document).ready(function() {
			$('#matchEnd').each(function() {
				let bNum = $(this).parent().parent().parent().prop("id");
				$(this).on('click', function(e) {
					e.preventDefault();
					console.log(aNum);
					if (confirm('모집완료 하시겠습니까?')) {
						$.ajax({
							type : 'POST',
							url : 'updateBoardAction.do',
							data : {
								bNum : bNum,
								bAction : 1
							},
							success : function(result) {
								if (result == 1) {
									$('#b_box').load(location.href + ' #b_box>*');
								}
							}
						});
					}
				})
			})
		})
		
	</script>

	<!-- JS Libraies -->
	<script src="../assets/modules/fullcalendar/fullcalendar.min.js"></script>
	<script src="../assets/modules/prism/prism.js"></script>
	<script src="../assets/modules/cleave-js/dist/cleave.min.js"></script>
	<script src="../assets/modules/cleave-js/dist/addons/cleave-phone.us.js"></script>
	<script src="../assets/modules/jquery-pwstrength/jquery.pwstrength.min.js"></script>
	<script src="../assets/modules/bootstrap-daterangepicker/daterangepicker.js"></script>
	<script src="../assets/modules/bootstrap-colorpicker/dist/js/bootstrap-colorpicker.min.js"></script>
	<script src="../assets/modules/bootstrap-timepicker/js/bootstrap-timepicker.min.js"></script>
	<script src="../assets/modules/bootstrap-tagsinput/dist/bootstrap-tagsinput.min.js"></script>
	<script src="../assets/modules/select2/dist/js/select2.full.min.js"></script>
	<script src="../assets/modules/jquery-selectric/jquery.selectric.min.js"></script>


	<!-- Page Specific JS File -->
	<script src="../assets/js/page/modules-calendar.js"></script>
	<script src="../assets/js/page/bootstrap-modal.js"></script>
	<script src="../assets/js/page/forms-advanced-forms.js"></script>

	<!-- Template JS File -->
	<script src="../assets/js/scripts.js"></script>
	<script src="../assets/js/custom.js"></script>
</body>
</html>