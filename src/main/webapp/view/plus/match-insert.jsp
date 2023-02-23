<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="modoo" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport">
  <!-- 파비콘 삽입 -->
<link rel="icon" href="../../assets/img/favicon.png">
<title>보드매칭 &rsaquo; 매칭 작성 페이지</title>

<style type="text/css">
select option[disabled] {
	display: none;
}
</style>

<!-- General CSS Files -->
<link rel="stylesheet" href="../../assets/modules/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="../../assets/modules/fontawesome/css/all.min.css">

<!-- CSS Libraries -->
<link rel="stylesheet" href="../../assets/modules/bootstrap-daterangepicker/daterangepicker.css">
<link rel="stylesheet" href="../../assets/modules/bootstrap-colorpicker/dist/css/bootstrap-colorpicker.min.css">
<link rel="stylesheet" href="../../assets/modules/select2/dist/css/select2.min.css">
<link rel="stylesheet" href="../../assets/modules/jquery-selectric/selectric.css">
<link rel="stylesheet" href="../../assets/modules/bootstrap-timepicker/css/bootstrap-timepicker.min.css">
<link rel="stylesheet" href="../../assets/modules/bootstrap-tagsinput/dist/bootstrap-tagsinput.css">

<!-- Template CSS -->
<link rel="stylesheet" href="../../assets/css/style.css">
<link rel="stylesheet" href="../../assets/css/components.css">
<!-- Start GA -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-94034622-3"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
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
						<h1>매치 작성</h1>
					</div>

						<div class="card">
							<div class="card-body">
								<div class="section-title mt-0">경기 지역</div>
								<div class="form-group">
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
								<div class="section-title">매치 방식</div>
								<div class="form-group">
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
								<div class="section-title">날짜/시간</div>
								<input type="text" class="form-control datetimepicker">
								<div class="section-title">장소</div>
								<div class="input-group">
									<input type="text" id="address" class="form-control" placeholder="장소를 입력해 주세요">
									<div class="input-group-append">
										<button class="btn btn-primary">지도 검색</button>
									</div>
								</div>
								<div class="section-title">참가비</div>
								<div class="input-group">
									<input type="text" id="address" class="form-control" placeholder="금액을 입력해주세요.">
									<div class="input-group-append">
										<button class="btn btn-primary">입력</button>
									</div>
								</div>
								<div class="section-title">실력</div>
								<div class="form-group">
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
								<div class="section-title">내용</div>
								<div class="form-group">
									<form action="" method="POST">
										<textarea name="text" id="editor"></textarea>
										<center>
											<button class="btn btn-primary mt-4">작성 완료</button>
										</center>
									</form>
								</div>
							</div>
						</div>
					</div>
					<script src="https://cdn.ckeditor.com/ckeditor5/29.1.0/classic/ckeditor.js"></script>
					<script>
      					ClassicEditor.create( document.querySelector( '#editor' ) );
					</script>
				</section>
			</div>
			<footer class="main-footer">
				<div class="footer-left">
					Copyright &copy; 2023
					<div class="bullet"></div>
					Design By
					<a href="https://nauval.in/">Team jabar</a>
				</div>
				<div class="footer-right"></div>
			</footer>
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
	<script src="../../assets/modules/cleave-js/dist/cleave.min.js"></script>
	<script src="../../assets/modules/cleave-js/dist/addons/cleave-phone.us.js"></script>
	<script src="../../assets/modules/jquery-pwstrength/jquery.pwstrength.min.js"></script>
	<script src="../../assets/modules/bootstrap-daterangepicker/daterangepicker.js"></script>
	<script src="../../assets/modules/bootstrap-colorpicker/dist/js/bootstrap-colorpicker.min.js"></script>
	<script src="../../assets/modules/bootstrap-timepicker/js/bootstrap-timepicker.min.js"></script>
	<script src="../../assets/modules/bootstrap-tagsinput/dist/bootstrap-tagsinput.min.js"></script>
	<script src="../../assets/modules/select2/dist/js/select2.full.min.js"></script>
	<script src="../../assets/modules/jquery-selectric/jquery.selectric.min.js"></script>
	<!-- Page Specific JS File -->
	<script src="../../assets/js/page/forms-advanced-forms.js"></script>
	
	<!-- Template JS File -->
	<script src="../../assets/js/scripts.js"></script>
	<script src="../../assets/js/custom.js"></script>
</body>
</html>