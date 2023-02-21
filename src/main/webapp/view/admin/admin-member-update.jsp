<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>계정 변경</title>
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
<link href="/ModooShop/css/styles.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>

</head>

<body class="sb-nav-fixed">
	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
		<!-- Navbar Brand-->
		<a class="navbar-brand ps-3" href="admin-main.do">관리자 페이지</a>
		<!-- Sidebar Toggle-->
		<button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!">
			<i class="fas fa-bars"></i>
		</button>

		<!-- Navbar-->
		<ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
			<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
					<i class="fas fa-user fa-fw"></i>
				</a>
				<ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
					<li>
						<a class="dropdown-item" href="/ModooShop/view/main.jsp">로그아웃</a>
					</li>
				</ul>
			</li>
		</ul>
	</nav>
	<div id="layoutSidenav">
				<div id="layoutSidenav_nav">
			<nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
				<div class="sb-sidenav-menu">
					<div class="nav">
						<div class="sb-sidenav-menu-heading">홈</div>
						<a class="nav-link" href="admin-main.do">
							<div class="sb-nav-link-icon">
								<i class="fas fa-tachometer-alt"></i>
							</div>
							홈 화면
						</a>
						<div class="sb-sidenav-menu-heading">사이트 관리</div>
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
							<div class="sb-nav-link-icon">
								<i class="fas fa-columns"></i>
							</div>
							사용자 관리
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
								<a class="nav-link" href="adMemberMain.do">사용자 목록</a>
							</nav>
						</div>
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapsePages" aria-expanded="false" aria-controls="collapsePages">
							<div class="sb-nav-link-icon">
								<i class="fas fa-book-open"></i>
							</div>
							상품 관리
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<!-- 
						<div class="collapse" id="collapsePages" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
								<a class="nav-link" href="admin-product-insert.jsp">상품 등록</a>
							</nav>
						</div> -->
						<div class="collapse" id="collapsePages" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
								<a class="nav-link" href="prSelectAll.do">상품 목록</a>
							</nav>
						</div>
					</div>
				</div>
				<div class="sb-sidenav-footer">
					<div class="small">Product by:</div>
					3조 Team jaBar
				</div>
			</nav>
		</div>
		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
					<h1 class="mt-4">계정 변경</h1>
					<ol class="breadcrumb mb-4">
						<li class="breadcrumb-item">계정 변경</li>
					</ol>
					<div class="card mb-4">
						<div class="card-header">
							<i class="fas fa-table me-1"></i>
							사용자 계정 변경
						</div>
						<div class="card-body">
							<div class="card-body">
								<form action="memUpdate.do" id="memUpdate.do" name="memUpdate.do" method="post" onsubmit="return ch();">
									<input type="hidden" value="${infomember.mNum}" name="mNum" />
									아이디
									<div class="form-floating mb-3">
										<input readonly class="form-control" id="id" type="text" placeholder="Enter your id" value="${infomember.mId}" required="required" name="mId" />
										<label for="inputName">${infomember.mId}</label>
									</div>
									비밀번호
									<div class="form-floating mb-3">
										<input class="form-control" id="pw" type="password" placeholder="Enter your password" value="${infomember.mPw}" required="required" name="mPw" />
										<label for="inputName">${infomember.mPw}</label>
									</div>
									이름
									<div class="form-floating mb-3">
										<input class="form-control" id="Name" type="text" placeholder="Enter your name" value="${infomember.mName}" required="required" name="mName" />
										<label for="inputName">${infomember.mName}</label>
									</div>
									이메일
									<div class="form-floating mb-3">
										<input class="form-control" id="Email" type="email" placeholder="name@example.com" value="${infomember.mEmail}" required="required" name="mEmail" />
										<label for="inputEmail">${infomember.mEmail}</label>
									</div>
									전화번호
									<div class="form-floating mb-3">
										<input class="form-control" id="Phone" type="text" name="mTel" placeholder="Enter your phone" value="${infomember.mTel}" onKeyup="this.value=this.value.replace(/[^-0-9]/g,'');"
											required="required" />
										<label for="inputPhone">${infomember.mTel}</label>
									</div>
									주소
									<div class="d-flex align-items-center justify-content-between mt-1 mb-2">
										<a onclick="sample3_execDaumPostcode()" class="btn btn-primary">우편번호 찾기</a>
									</div>
									<div id="wrapPost" style="display: none; border: 1px solid; max-width: 500px; height: 300px; margin: 5px 0; position: relative">
										<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor: pointer; position: absolute; right: 0px; top: -1px; z-index: 1" onclick="foldDaumPostcode()"
											alt="접기 버튼">
									</div>
									<div class="form-floating mb-3">
										<input class="form-control" id="sample3_postcode" name="zipCode" type="text" placeholder="우편번호" value="${infomember.zipCode}" required />
										<label for="inputAdd">${infomember.zipCode}</label>
									</div>
									<div class="form-floating mb-3">
										<input class="form-control" name="userAddr" id="sample3_address" type="text" placeholder="주소" value="${infomember.userAddr}" required />
										<label for="inputAdd">${infomember.userAddr}</label>
									</div>
									<div class="form-floating mb-3">
										<input class="form-control" name="detailAddr" id="sample3_detailAddress" type="text" placeholder="상세주소" value="${infomember.detailAddr}" required />
										<label for="inputAdd">${infomember.detailAddr}</label>
									</div>
									포인트
									<div class="form-floating mb-3">
										<input class="form-control" id="Point" type="text" name="mPoint" placeholder="Enter your point" value="${infomember.mPoint}" onKeyup="this.value=this.value.replace(/[^-0-9]/g,'');"
											required="required" />
										<label for="inputPoint">${infomember.mPoint}</label>
									</div>
									<div class="mt-4 mb-0">
										<div class="d-grid">
											<button class="btn btn-primary btn-block" type="submit">변경 완료</button>
										</div>
									</div>
									<div class="mt-4 mb-0">
										<div class="d-grid">
											<a class="btn btn-danger btn-block" href="adMemberMain.do" onclick="return con();">변경 취소</a>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</main>
			<footer class="py-4 bg-light mt-auto">
				<div class="container-fluid px-4">
					<div class="d-flex align-items-center justify-content-between small">
						<div class="text-muted">Copyright &copy; https://github.com/임시/임시 all rights reserved.</div>
					</div>
				</div>
			</footer>
		</div>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
	<script src="/ModooShop/js/scripts.js"></script>
	<script src="/ModooShop/js/datatables-simple-demo.js"></script>
</body>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
									// 우편번호 찾기 찾기 화면을 넣을 element
									var element_wrap = document
										.getElementById('wrapPost');

									function foldDaumPostcode() {
										// iframe을 넣은 element를 안보이게 한다.
										element_wrap.style.display = 'none';
									}

									function sample3_execDaumPostcode() {
										// 현재 scroll 위치를 저장해놓는다.
										var currentScroll = Math
											.max(
												document.body.scrollTop,
												document.documentElement.scrollTop);
										new daum.Postcode(
											{
												oncomplete: function (data) {
													// 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

													// 각 주소의 노출 규칙에 따라 주소를 조합한다.
													// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
													var addr = ''; // 주소 변수
													var extraAddr = ''; // 참고항목 변수
												

													//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
													if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
														addr = data.roadAddress;
													} else { // 사용자가 지번 주소를 선택했을 경우(J)
														addr = data.jibunAddress;
													}

													// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
													if (data.userSelectedType === 'R') {
														// 법정동명이 있을 경우 추가한다. (법정리는 제외)
														// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
														if (data.bname !== ''
															&& /[동|로|가]$/g
																.test(data.bname)) {
															extraAddr += data.bname;
														}
														// 건물명이 있고, 공동주택일 경우 추가한다.
														if (data.buildingName !== ''
															&& data.apartment === 'Y') {
															extraAddr += (extraAddr !== '' ? ', '
																+ data.buildingName
																: data.buildingName);
														}
														// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
														if (extraAddr !== '') {
															extraAddr = ' ('
																+ extraAddr
																+ ')';
														}
														// 조합된 참고항목을 해당 필드에 넣는다.
														//document.getElementById("sample3_extraAddress").value = extraAddr;

													} else {
														//document.getElementById("sample3_extraAddress").value = '';
													}

													// 우편번호와 주소 정보를 해당 필드에 넣는다.
													document
														.getElementById('sample3_postcode').value = data.zonecode;
													document
														.getElementById("sample3_address").value = addr;
													// 커서를 상세주소 필드로 이동한다.
													document
														.getElementById("sample3_detailAddress")
														.focus();

													// iframe을 넣은 element를 안보이게 한다.
													// (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
													element_wrap.style.display = 'none';

													// 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
													document.body.scrollTop = currentScroll;
												},
												// 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
												onresize: function (size) {
													element_wrap.style.height = size.height
														+ 'px';
												},
												width: '100%',
												height: '100%'
											}).embed(element_wrap);

										// iframe을 넣은 element를 보이게 한다.
										element_wrap.style.display = 'block';
									}
								</script>

<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script>
    function ch(){
        let id = $("#id").val();
        let pw = $("#pw").val();
        let name = $("#Name").val();
        let email = $("#Email").val();
        let phone = $("#Phone").val();
        let add = $("#Add").val();
        let point = $("#Point").val();

        let number = pw.search(/[0-9]/g);
        let english = pw.search(/[a-z]/ig);
        let spece = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
        let reg = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;

        if(id!=""){
        if (pw.length < 8 || pw.length > 20) {
            alert("8자리 ~ 20자리 이내로 입력해주세요.");
            return false;

        } else if (pw.search(/\s/) != -1) {
            alert("비밀번호는 공백 없이 입력해주세요.");
            return false;

        } else if (number < 0 || english < 0 || spece < 0) {
            alert("영문,숫자,특수문자를 혼합하여 입력해주세요.");
            return false;

        } else if ((number < 0 && english < 0) || (english < 0 && spece < 0) || (spece < 0 && number < 0)) {
            alert("영문,숫자, 특수문자 중 2가지 이상을 혼합하여 입력해주세요.");
            return false;

        } else if (/(\w)\1\1\1/.test(pw)) {
            alert('같은 문자를 4번 이상 사용하실 수 없습니다.');
            return false;

        } else if (pw.search(id) > -1) {
            alert("비밀번호에 아이디가 포함되었습니다.");
            return false;
        } else {
            if(name==""||email==""||phone==""||add==""||point==""){
                alert("빈 칸 없이 모두입력해주세요.");
                return false
            } else{
                alert("변경이 완료되었습니다!");
                return true;    
            }
            
        }

        if (false === reg.test(pw)) {
            alert('비밀번호는 8자 이상이어야 하며, 숫자/대문자/소문자/특수문자를 모두 포함해야 합니다.');
            return false;
        } else {
            if(name==""||email==""||phone==""||add==""||point==""){
                alert("빈 칸 없이 모두입력해주세요.");
                return false
            } else{
                alert("변경이 완료되었습니다!");
                return true;    
            }
        }
    } else {
        alert("빈 칸 없이 모두입력해주세요.");
        return false
    }
}

    function con(){
        var result = confirm("정말 취소하시겠습니까?");

        if(result){
            alert("취소합니다!")
            return true;
        } else {
            return false;
        }
    }
</script>

</html>