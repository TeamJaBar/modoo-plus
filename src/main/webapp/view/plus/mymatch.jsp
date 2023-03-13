<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="modoo" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport">
<!-- 파비콘 삽입 -->
<link rel="icon" href="../assets/img/favicon.png">
<title>보드매칭 &rsaquo; 매칭 목록</title>

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

<style>
@font-face {
	font-family: 'GmarketSansMedium';
	src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
	font-weight: normal;
	font-style: normal;
}

.fc-day-grid-event {
	background-color: #0188CB;
	text-align: left;
}

.fc-day-grid-event .fc-time {
	color: white;
}

.fc-title {
	color: yellow;
}

.fc-center {
	display: flex;
	justify-content: space-between;
}

body {
	font-family: 'GmarketSansMedium';
}

.calendar {
	margin: 0 auto;
}

.main-content {
	padding-left: 15%;
	padding-right: 15%;
	min-width: 40%;
}

#modal-box>tr>td>input[type="text"] {
	border: none;
	background: transparent;
}

#modal-box2>tr>td>input[type="text"] {
	border: none;
	background: transparent;
}

#modal-box>tr>td>input[type="radio"] {
	vertical-align: middle;
	appearance: none;
	border: max(2px, 0.1em) solid #BCBCBC;
	border-radius: 50%;
	width: 1.0em;
	height: 1.0em;
	transition: border 0.2s ease-in-out;
}

#modal-box>tr>td>input[type="radio"]:hover {
	box-shadow: 0 0 0 max(4px, 0.2em) lightgray;
	cursor: pointer;
}

#modal-box>tr>td>input[type="radio"]:checked {
	border: 0.3em #0188CB solid;
}

#modal-box>tr>td>input[type="text"]:focus {
	outline: none;
}
</style>
</head>

<body>
	<script>
		var json = '${calendar}';
		var data = JSON.parse(json);
		var num = JSON.parse(json).length;
		console.log(num);
		var calendar = new Array();

		for (var i = 0; i < num; i++) {
			console.log(i);
			var obj = data[i];
			console.log(obj);
			obj.title = obj.bTitle;
			obj.start = obj.bDate;
			delete obj.bTitle;
			delete obj.bTitle;
			delete obj.bDate;
			delete obj.aCnt;
			delete obj.aNum;
			delete obj.amount;
			delete obj.apply;
			delete obj.bCnt;
			delete obj.bMscore;
			delete obj.mNum;
			delete obj.bNum;
			delete obj.pageNum;
			delete obj.sortBy;
			delete obj.sue;
			calendar.push(obj);
		}

		console.log(dates);
		const str = JSON.stringify(dates);
		console.log(str);
	</script>
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
						<h2 class="section-title">매칭 목록</h2>
						<div class="row">
							<div class="col-12 calendar">
								<div class="card">
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
										<h4>내가 매칭 신청한 게시글 목록</h4>
									</div>

									<!-- el식 적용 -->
									<div class="card-body p-0">
										<div class="table-responsive">
											<table class="table table-striped" id="a_box">
												<tbody>
													<tr class="text-center">
														<th>
															<div class="sort-handler">
																<i class="fas fa-th"></i>
															</div>
														</th>
														<th>제목</th>
														<th>장소</th>
														<th>인원</th>
														<th>날짜</th>
														<th>신청 / 평가</th>
													</tr>
													<!-- 매치 없을때 -->
													<c:if test="${fn:length(bDatas) == 0 }">
														<tr class="text-center" id="a_box">
															<td>
																<div class="sort-handler">
																	<i class="fas fa-th"></i>
																</div>
															</td>
															<td></td>
															<td>게시글이 없습니다.</td>
															<td></td>
															<td>
																<button class="btn btn-primary" type="button" onclick="location.href='boardList.do'">매치하러 가기</button>
															</td>
														</tr>
													</c:if>
													<!-- 매치 없을때 -->

													<!-- 매치있을때 -->
													<c:set var="mNum" value="${mNum}" />
													<c:if test="${fn:length(bDatas) != 0 }">
														<c:forEach items="${bDatas}" var="v" varStatus="i">
															<input type="hidden" name="aNum" id="aNum${v.bNum}" value="${v.aNum}" />
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
																	<a href="#" class="modal-btn2" data-bNum="${v.bNum}" data-toggle="modal" data-target="#exampleModal2">${v.aCnt}/${v.bCnt}</a>
																</td>
																<td>
																	<fmt:formatDate value="${v.bDate}" pattern="yy-MM-dd HH:mm" />
																</td>
																<c:choose>
																	<c:when test="${v.bAction == 2}">
																		<td>
																			<c:if test="${v.aChk != 1}">
																				<button class="btn btn-primary modal-btn" value="${v.bNum}" data-toggle="modal" data-target="#exampleModal">평가하기</button>
																			</c:if>
																			<c:if test="${v.aChk == 1}">
																				<button class="btn btn-primary" disabled="disabled">평가완료</button>
																			</c:if>
																		</td>
																	</c:when>
																	<c:otherwise>
																		<td>
																			<button name="myEntryDelete" id="cancleBtn" value="${v.aNum}" class="btn btn-icon btn-danger">취소하기</button>
																		</td>
																	</c:otherwise>
																</c:choose>
															</tr>
														</c:forEach>
														<%-- ajax 식으로 하기 전 
																			<button name="myEntryDelete" id="cancleBtn-${i.index}" class="btn btn-icon btn-danger" data-confirm="취소?|정말로 취소하실껀가요?"
																				data-confirm-yes="location.href='myEntryDelete.do?aNum=${v.aNum}'">취소하기</button>--%>
													</c:if>
												</tbody>
											</table>
										</div>
										<div class="card-footer text-center">
											<nav class="d-inline-block">
												<ul class="pagination mb-0">
													<c:if test="${pageVO.prev}">
														<li class="page-item disabled">
															<a class="page-link" href="myBoard.do?pageNum=${pageVO.startPage - 1}" aria-label="Previous">
																<span aria-hidden="true">&laquo;</span>
																<span class="sr-only">Previous</span>
															</a>
														</li>
													</c:if>
													<!-- 1. 페이지번호 처리 -->
													<c:forEach var="num" begin="${pageVO.startPage}" end="${pageVO.endPage}">
														<li class="page-item active">
															<a class="page-link" href="myBoard.do?pageNum=${num}">${num}</a>
														</li>
													</c:forEach>
													<!-- <li class="page-item">
														<a class="page-link" href="#">2</a>
													</li> -->
													<c:if test="${pageVO.next}">
														<li class="page-item">
															<a class="page-link" href="myBoard.do?pageNum=${pageVO.endPage + 1}" aria-label="Next">
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
							<tbody id="modal-box">
								<tr>
									<th>선택</th>
									<th>프로필</th>
									<th>아이디</th>
								</tr>
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

	<!-- Modal screen2 -->
	<div class="modal fade" tabindex="-1" role="dialog" id="exampleModal2">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">참여인원</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<table class="table table-striped">
						<tbody id="modal-box2">
						</tbody>
					</table>
				</div>
				<div class="modal-footer bg-whitesmoke br">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
				</div>
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
	<script type="text/javascript">
		// 평가하기 모달창
		$(document).ready(
				function() {
					$('#exampleModal').on('show.bs.modal', function() {
						$('#modal-box').empty(); // 모달창 초기화
					});

					$('.modal-btn').each(
							function() {
								$(this).on(
										'click',
										function(e) {
											var bNum = $(this).val();
											var id = "aNum" + bNum;
											var aNum = $('#' + id).val();
											console.log("bNum [" + bNum + "]");
											console.log("aNum : " + aNum);
											e.preventDefault();
											$.ajax({
												type : 'POST',
												url : 'showApplicant.do',
												data : {
													bNum : bNum
												},
												success : function(result) {
													console.log(result);
													console.log("왔다");
													var $list = $("#modal-box");

													// 추가: result가 비어있지 않을 때만 <tr><th> ... </th></tr> 추가
													if (result.length > 0) {
														var $tr_header = $("<tr>").attr("class", "text-center");
														var $th1 = $("<th>").text("선택");
														var $th2 = $("<th>").text("프로필");
														var $th3 = $("<th>").text("아이디");
														$tr_header.append($th1).append($th2).append($th3);
														$list.append($tr_header);
													}

													$.each(result, function(index, value) {
														var $aNum = $("<input>").attr("type", "hidden").attr("name", "aNum").attr("value", aNum);
														var $radio = $("<input>").attr("type", "radio").attr("name", "mNum").attr("value", value.mNum);
														var $img = $("<img>").attr("alt", "image").attr("src", "../assets/img/avatar/" + value.mImg).addClass("rounded-circle").attr("width", 35).attr(
																"data-toggle", "tooltip").attr("title", "").attr("data-original-title", value.mId);
														var $text = $("<input>").attr("class", "text-center").attr("type", "text").attr("name", "mId").attr("value", value.mId).attr("id", "mId").attr(
																"disabled", "true");
														var $td1 = $("<td>").append($radio);
														var $td2 = $("<td>").append($img);
														var $td3 = $("<td>").append($text);
														var $tr = $("<tr>").attr("class", "text-center");
														$tr.append($td1).append($td2).append($td3).append($aNum);
														$list.append($tr);
													});
												},
												error : function(jqXHR, textStatus, errorThrown) {
													// 실패했을 때 실행될 콜백 함수
													console.log(textStatus + ": 데이터를 불러오지 못했습니다." + errorThrown);
												}
											});
										});
							});

					// 취소하기버튼
					$('#cancleBtn').each(function() {
						$(this).on('click', function(e) {
							var aNum = $(this).val();
							e.preventDefault();
							console.log(aNum);
							if (confirm('취소 하시겠습니까?')) {
								$.ajax({
									type : 'POST',
									url : 'myEntryDelete.do',
									data : {
										aNum : aNum
									},
									success : function(result) {
										if (result == 1) {
											$('#a_box').load(location.href + ' #a_box > *');
										}
									}
								});
							}
						})
					})

				})
		$(document).on(
				'click',
				'.modal-btn2',
				function(e) {
					$('#exampleModal2').on('show.bs.modal', function() {
						$('#modal-box2').empty(); // 모달창 초기화
					});
					var bNum = $(this).attr("data-bNum");
					console.log("bNum [" + bNum + "]");
					e.preventDefault();
					$.ajax({
						type : 'POST',
						url : 'showApplicant.do',
						data : {
							bNum : bNum
						},
						success : function(result) {
							console.log(result);
							console.log("와따리");
							var $list = $("#modal-box2");

							// 추가: result가 비어있지 않을 때만 <tr><th> ... </th></tr> 추가
							if (result.length > 0) {
								var $tr_header = $("<tr>").attr("class", "text-center");
								var $th2 = $("<th>").text("프로필");
								var $th3 = $("<th>").text("아이디");
								$tr_header.append($th2).append($th3);
								$list.append($tr_header);
							}

							$.each(result, function(index, value) {
								var $img = $("<img>").attr("alt", "image").attr("src", "../assets/img/avatar/" + value.mImg).addClass("rounded-circle").attr("width", 35)
										.attr("data-toggle", "tooltip").attr("title", "").attr("data-original-title", value.mId);
								var $text = $("<input>").attr("class", "text-center").attr("type", "text").attr("name", "mId").attr("value", value.mId).attr("id", "mId").attr("disabled", "true");
								var $td2 = $("<td>").append($img);
								var $td3 = $("<td>").append($text);
								var $tr = $("<tr>").attr("class", "text-center");
								$tr.append($td2).append($td3);
								$list.append($tr);
							});
						},
						error : function(jqXHR, textStatus, errorThrown) {
							// 실패했을 때 실행될 콜백 함수
							console.log(textStatus + ": 데이터를 불러오지 못했습니다." + errorThrown);
						}
					});
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
	<script src="../assets/modules/fullcalendar/locale/ko.js"></script>

	<!-- Page Specific JS File -->
	<script src="../assets/js/page/modules-calendar.js"></script>
	<script src="../assets/js/page/bootstrap-modal.js"></script>
	<script src="../assets/js/page/forms-advanced-forms.js"></script>

	<!-- Template JS File -->
	<script src="../assets/js/scripts.js"></script>
	<script src="../assets/js/custom.js"></script>
</body>
</html>