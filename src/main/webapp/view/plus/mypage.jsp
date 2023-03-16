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
<style>
.table:not(.table-sm):not(.table-md):not(.dataTable) td, .table:not(.table-sm):not(.table-md):not(.dataTable) th {
	padding: 0 10px;
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

.modal-content {
	width: 680px;
	max-width: none;
}

.empty {
	padding-top: 30px !important;
}

.empty>p {
	font-size: 15px;
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
						<h1>마이페이지</h1>
					</div>

					<div class="section-body">
						<h2 class="section-title">나의 보드</h2>
						<div class="row mt-4">
							<div class="col-12">
								<div class="card">
									<div class="card-header">
										<h4>나의 작성 글</h4>
									</div>
									<div class="card-body" id="c_body">
										<div class="table-responsive">
											<table class="table table-striped" id="sortable-table">
												<tbody>
													<tr class="text-center">
														<th width="5%">
															<i class="fas fa-th"></i>
														</th>
														<th width="20%">제목</th>
														<th width="15%">장소</th>
														<th width="13%">모임일자</th>
														<th width="10%">인원</th>
														<th width="10%">상태</th>
														<th width="13%">수정/삭제</th>
													</tr>

													<!-- 작성글 없을때 -->
													<c:if test="${fn:length(bDatas) == 0 }">
														<tr class="text-center">
															<td class="empty" colspan="8">
																<p>게시글이 없습니다.</p>
																<button class="btn btn-primary" type="button" onclick="location.href='createBoard.do'">글쓰러 가기</button>
															</td>
														</tr>
													</c:if>

													<!-- 나의 작성 글 el식 적용 -->
													<c:if test="${fn:length(bDatas) != 0 }">
														<c:forEach items="${bDatas}" var="v">
															<tr class="text-center">
																<td width="5%">
																	<div class="sort-handler">
																		<i class="fas fa-th"></i>
																	</div>
																</td>
																<td width="20%">
																	<a href="boardDetail.do?bNum=${v.bNum}">${v.bTitle}</a>
																</td>
																<td width="15%">${v.bAddress}</td>
																<td width="13%">
																	<fmt:formatDate value="${v.bDate}" pattern="yy-MM-dd HH:mm" />
																</td>
																<td width="10%">
																	<!-- aData == 이 글의 현재 매칭된 참여자가 몇명인지 applicant 배열 -->
																	<a href="#" class="modal-btn" data-toggle="modal" data-bNum="${v.bNum}" data-target="#exampleModal"> ${v.aCnt} / ${v.bCnt}</a>
																</td>
																<c:choose>
																	<c:when test="${v.bAction!=2}">
																		<td width="10%">
																			<div class="dropdown d-inline mr-2" id="b_box">
																				<button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
																					<c:if test="${v.bAction==0}">
																		모집중
																		</c:if>
																					<c:if test="${v.bAction==1}">
																		모집완료
																		</c:if>

																				</button>
																				<div class="dropdown-menu">
																					<a href="#" class="dropdown-item" data-bNum="${v.bNum}" id="matchIng">모집 중</a>
																					<a href="#" class="dropdown-item" data-bNum="${v.bNum}" id="matchEnd">모집완료</a>
																				</div>
																			</div>
																		</td>
																		<td width="13%">
																			<a href="updateBoard.do?bNum=${v.bNum}" class="btn btn-icon btn-primary">
																				<i class="far fa-edit"></i>
																			</a>
																			<button name="deleteBoard" class="btn btn-icon btn-danger" data-confirm="삭제?|정말로 삭제하실껀가요?" data-confirm-yes="location.href='boardDelete.do?bNum=${v.bNum}'">
																				<i class="fas fa-times"></i>
																			</button>
																		</td>
																	</c:when>
																	<c:otherwise>
																		<td width="10%">
																			<div class="dropdown d-inline mr-2" id="b_box">
																				<button class="btn btn-secondary" disabled="disabled">지난 모임</button>
																			</div>
																		</td>
																		<td width="13%">
																			<button class="btn btn-icon btn-secondary" disabled="disabled">
																				<i class="far fa-edit"></i>
																			</button>
																			<button class="btn btn-icon btn-secondary" disabled="disabled">
																				<i class="fas fa-times"></i>
																			</button>
																		</td>
																	</c:otherwise>
																</c:choose>
															</tr>
														</c:forEach>
													</c:if>
													<!-- 나의 작성글 끝 -->

												</tbody>
											</table>
										</div>
										<input type="hidden" name="pageNum" id="pageNum" value="${param.pageNum}">
										<c:if test="${fn:length(bDatas) != 0}">
											<div class="card-footer text-center">
												<nav class="d-inline-block">
													<ul class="pagination mb-0">
														<c:if test="${pageVO.prev}">
															<li class="page-item">
																<a class="page-link" href="mypage.do?pageNum=${pageVO.startPage - 1}" aria-label="Previous">
																	<span aria-hidden="true">&laquo;</span>
																	<span class="sr-only">Previous</span>
																</a>
															</li>
														</c:if>
														<!-- 1. 페이지번호 처리 -->
														<c:forEach var="num" begin="${pageVO.startPage}" end="${pageVO.endPage}">
															<li class="page-item ${param.pageNum == num || param.pageNum == null ? 'active' : ''}">
																<a class="page-link" href="mypage.do?pageNum=${num}">${num}</a>
															</li>
														</c:forEach>
														<!-- <li class="page-item">
														<a class="page-link" href="#">2</a>
													</li> -->
														<c:if test="${pageVO.next}">
															<li class="page-item">
																<a class="page-link" href="mypage.do?pageNum=${pageVO.endPage + 1}" aria-label="Next">
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
					<ul class="tab-applicant list-unstyled user-progress list-unstyled-border list-unstyled-noborder" id="modal-box">
					</ul>
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

	<script type="text/javascript">
		$(document).on(
				'click',
				'.modal-btn',
				function(e) {
					$('#exampleModal').on('show.bs.modal', function() {
						$('#modal-box').empty(); // 모달창 초기화
					});
					var bNum = $(this).attr("data-bNum");
					console.log("bNum = " + bNum);
					e.preventDefault();
					function updateModal(result) {
						console.log(result);
						var html = '';
						function score(score) {
							var tmpScore = 0;
							if (score < 200) {
								tmpScore = (score / 200) * 100;
							}
							if (score<500 && score>199) {
								tmpScore = (score / 500) * 100;
							}
							if (score<1000 && score>499) {
								tmpScore = (score / 1000) * 100;
							}
							if (score > 5000) {
								tmpScore = (score / 5000) * 100;
							}
							return tmpScore;
						}
						function exp(score) {
							var exp = '';
							if (score < 200) {
								exp = '왕초보';
							}
							if (score<500 && score>199) {
								exp = '초보';
							}
							if (score<1000 && score>499) {
								exp = '고수';
							}
							if (score > 5000) {
								exp = '초고수';
							}
							return exp;
						}
						// result가 비어있지 않을 때만 추가
						if (result.length > 0) {
							$.each(result, function(i, item) {
								html += '<li class="media">' + '<img class="mr-3 rounded-circle" src="../assets/img/avatar/' + item.mImg + '" alt="image" width="50">' + '<div class="media-body">'
										+ '<div class="media-title">'
										+ item.mId
										+ '</div>'
										+ '<div class="text-job text-muted">'
										+ exp(item.score)
										+ '</div>'
										+ '</div>'
										+ '<div class="media-progressbar">'
										+ '<div class="progress-text">'
										+ score(item.score)
										+ ' 점'
										+ '</div>'
										+ '<div class="progress" data-height="6" style="height: 6px;">'
										+ '<div class="progress-bar bg-primary" data-width="'
										+ score(item.score)
										+ '%" style="width: '
										+ score(item.score)
										+ '%;"></div>'
										+ '</div>'
										+ '</div>'
										+ '<div class="media-cta">' + '<button class="btn btn-outline-primary" id="kickOut" value="' + item.aNum + '">퇴출하기</button>' + '</div>' + '</li>';
							});
						} else {
							html += '<li>참여한 회원이 없습니다.</li>';
						}
						$('#modal-box').html(html); // 리스트 추가
						$('#exampleModal').modal('show'); // 모달창 보여주기
					}

					$.ajax({
						type : 'POST',
						url : 'showApplicant.do',
						data : {
							bNum : bNum
						},
						success : updateModal
					});
				});

		/* 퇴출하기 */
		$(document).on('click', '#kickOut', function(e) {
			var aNum = $(this).val();
			console.log("aNum=" + aNum);
			var pageNum = '${param.pageNum}';
			e.preventDefault();
			if (confirm('퇴출하시겠습니까?')) {
				$.ajax({
					type : 'POST',
					url : 'kickOut.do',
					data : {
						aNum : aNum,
						pageNum : pageNum
					},
					success : function(result) {
						if (result == 1) {
							$('#c_body').load(location.href + ' #c_body>*', function() {
								$('#exampleModal').modal('hide');
							});
						}
					}
				});
			}
		});

		/* 드롭다운 - 모집중으로 변경 */
		$(document).on('click', '#matchIng', function(e) {
			var bNum = $(this).attr("data-bNum");
			//var pageNum = '${param.pageNum}';
			e.preventDefault();
			console.log("bNum = " + bNum);
			//console.log("pageNum = " + pageNum);
			$.ajax({
				type : 'POST',
				url : 'updateBoardAction.do',
				data : {
					bNum : bNum,
					bAction : 0
				},
				success : function(result) {
					$('#c_body').load(location.href + ' #c_body>*');
				}
			})
		});

		/* 드롭다운 - 모집완료로 변경 */
		$(document).on('click', '#matchEnd', function(e) {
			var bNum = $(this).attr("data-bNum");
			//var pageNum = '${param.pageNum}';
			e.preventDefault();
			console.log("bNum = " + bNum);
			//console.log("pageNum = " + pageNum);
			$.ajax({
				type : 'POST',
				url : 'updateBoardAction.do',
				data : {
					bNum : bNum,
					bAction : 1
				},
				success : function(result) {
					$('#c_body').load(location.href + ' #c_body>*');
				}
			})
		});
	</script>

	<!-- Page Specific JS File -->
	<script src="../assets/js/page/modules-calendar.js"></script>
	<script src="../assets/js/page/bootstrap-modal.js"></script>
	<script src="../assets/js/page/forms-advanced-forms.js"></script>

	<!-- Template JS File -->
	<script src="../assets/js/scripts.js"></script>
	<script src="../assets/js/custom.js"></script>
</body>
</html>