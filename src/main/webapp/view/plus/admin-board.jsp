<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="modoo" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport">
	  <!-- 파비콘 삽입 -->
<link rel="icon" href="../../assets/img/favicon.png">
	<title>보드매칭 &rsaquo; Admin &rsaquo; 글관리</title>

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
		function gtag() { dataLayer.push(arguments); }
		gtag('js', new Date());

		gtag('config', 'UA-94034622-3');
	</script>
	<!-- /END GA -->
	<link rel="stylesheet" href="../../assets/css/admin-board.css">
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
						<h1>글 관리</h1>
					</div>
					<div class="section-body">
						<h2 class="section-title">게시글 관리</h2>
						<div class="row">
							<div class="col-12">
								<div class="card mb-0">
									<div class="card-body">
										<ul class="nav nav-pills">
											<li class="nav-item">
												<a class="nav-link active" href="#">전체 <span
														class="badge badge-white">3</span></a>
											</li>
											<li class="nav-item">
												<a class="nav-link" href="#">모집 중 <span
														class="badge badge-primary">1</span></a>
											</li>
											<li class="nav-item">
												<a class="nav-link" href="#">모집 완료 <span
														class="badge badge-primary">1</span></a>
											</li>
											<li class="nav-item">
												<a class="nav-link" href="#">지난 모임 <span
														class="badge badge-primary">1</span></a>
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
										<h4>All Posts</h4>
									</div>
									<div class="card-body">
										<div class="float-left">
											<select class="form-control selectric">
												<option>제목</option>
												<option>작성자</option>
												<option>내용</option>
											</select>
										</div>
										<div class="float-right">
											<form>
												<div class="input-group">
													<input type="text" class="form-control" placeholder="검색">
													<div class="input-group-append">
														<button class="btn btn-primary"><i
																class="fas fa-search"></i></button>
													</div>
												</div>
											</form>
										</div>

										<div class="clearfix mb-3"></div>

										<div class="table-responsive">
											<table class="table table-striped">
												<tr>
													<th width="5%" class="text-center pt-2">
														<div
															class="custom-checkbox custom-checkbox-table custom-control">
															<input type="checkbox" data-checkboxes="mygroup"
																data-checkbox-role="dad" class="custom-control-input"
																id="checkbox-all">
															<label for="checkbox-all"
																class="custom-control-label">&nbsp;</label>
														</div>
													</th>
													<th width="7%">글번호</th>
													<th width="30%">제목</th>
													<th width="10%">작성자</th>
													<th width="15%">모임날짜</th>
													<th width="10%">상태</th>
													<th width="8%">삭제</th>
												</tr>
												<tr>
													<td style="text-align: center;">
														<div class="custom-checkbox custom-control">
															<input type="checkbox" data-checkboxes="mygroup"
																class="custom-control-input" id="checkbox-1" name="chk">
															<label for="checkbox-1"
																class="custom-control-label">&nbsp;</label>
														</div>
													</td>
													<td class="bNum" name="bNum" id="101">
														101
													</td>
													<td class="bTitle" name="bTitle">
														놀고 싶다!!
													</td>
													<td>
														<div>이성훈</div>
													</td>
													<td class="bDate" name="bDate">2023-02-20 12:30</td>
													<td>
														<div class="badge badge-primary btn-status">모집 중</div>
													</td>
													<td>
														<a href="#" class="btn btn-primary btn-delete">삭제하기</a>
													</td>
												</tr>
												<tr>
													<td style="text-align: center;">
														<div class="custom-checkbox custom-control">
															<input type="checkbox" data-checkboxes="mygroup"
																class="custom-control-input" id="checkbox-2" name="chk">
															<label for="checkbox-2"
																class="custom-control-label">&nbsp;</label>
														</div>
													</td>
													<td class="bNum" name="bNum">
														102
													</td>
													<td class="bTitle" name="bTitle">
														3팀 회식
													</td>
													<td>
														<div>김효경</div>
													</td>
													<td class="bDate" name="bDate">2023-02-22 18:00</td>
													<td>
														<div class="badge badge-warning btn-status">모집 완료</div>
													</td>
													<td>
														<a href="#" class="btn btn-primary btn-delete">삭제하기</a>
													</td>
												</tr>
												<tr>
													<td style="text-align: center;">
														<div class="custom-checkbox custom-control">
															<input type="checkbox" data-checkboxes="mygroup"
																class="custom-control-input" id="checkbox-3" name="chk">
															<label for="checkbox-3"
																class="custom-control-label">&nbsp;</label>
														</div>
													</td>
													<td class="bNum" name="bNum">
														103
													</td>
													<td class="bTitle" name="bTitle">
														허접들은 가셈 (콩 제공)
													</td>
													<td>
														<div>김시하</div>
													</td>
													<td class="bDate" name="bDate">2023-02-18 18:00</td>
													<td>
														<div class="badge badge-danger btn-status">지난 모임</div>
													</td>
													<td>
														<a href="#" class="btn btn-primary btn-delete">삭제하기</a>
													</td>
												</tr>

											</table>
										</div>
										<div class="float-right">
											<nav>
												<ul class="pagination">
													<li class="page-item disabled">
														<a class="page-link" href="#" aria-label="Previous">
															<span aria-hidden="true">&laquo;</span>
															<span class="sr-only">Previous</span>
														</a>
													</li>
													<li class="page-item active">
														<a class="page-link" href="#">1</a>
													</li>
													<li class="page-item">
														<a class="page-link" href="#">2</a>
													</li>
													<li class="page-item">
														<a class="page-link" href="#">3</a>
													</li>
													<li class="page-item">
														<a class="page-link" href="#" aria-label="Next">
															<span aria-hidden="true">&raquo;</span>
															<span class="sr-only">Next</span>
														</a>
													</li>
												</ul>
											</nav>
										</div>
										<div class="float-right">
											<button class="btn btn-primary" onclick="del()">선택한 글 삭제하기</button>
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
					Copyright &copy; 2018 <div class="bullet"></div> Design By <a href="https://nauval.in/">Muhamad
						Nauval
						Azhar</a>
				</div>
				<div class="footer-right">

				</div>
			</footer>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
	<script>
		// 단일 삭제
		/* $('.btn-delete').each(function () {
			let aNum = $(this).parent().parent().children(".bNum").prop("id");
			$(this).on('click', function (e) {
				e.preventDefault();
				if (confirm('정말 삭제하시겠습니까?')) {
					alert('삭제되었습니다.');
					location.href = 'addrsDelete.do?aNum=' + aNum;
				} else {
					alert('취소되었습니다.');
				}
			});
		}); */

		// 선택 삭제
		/* function del() {
			console.log('삭제');
			var arDel = new Array();

			$("input[name='chk']:checked").each(function () {
				var item = $(this).val();
				console.log(item);
				arDel.push(item);
			})

			console.log('arDel: ' + arDel);

			if (arDel.length < 1) {
				alert("선택한 상품이 없습니다.");
				return;
			} else {
				if (confirm("정말 삭제하시겠습니까?")) {
					$.ajax({
						type: 'POST',
						url: 'boardDelete',
						traditional: true,
						data: {
							arDel: arDel
						},
						success: function (result) {
							if (result == 1) {
								// location.href + ' 선택자' : 경로와 선택자 사이에 공백 필수!
								$('.table-responsive').load(location.href + ' .table-responsive > *');
								alert("삭제되었습니다.");
							}
						}
					});
				} else {
					alert("취소되었습니다.");
				}
			}
		} */

		//
	</script>
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
	<script src="../../assets/modules/jquery-selectric/jquery.selectric.min.js"></script>

	<!-- Page Specific JS File -->
	<script src="../../assets/js/page/features-posts.js"></script>

	<!-- Template JS File -->
	<script src="../../assets/js/scripts.js"></script>
	<script src="../../assets/js/custom.js"></script>
</body>

</html>