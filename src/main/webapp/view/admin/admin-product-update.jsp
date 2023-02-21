<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>상품 변경</title>
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
<link href="/ModooShop/css/styles.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/29.1.0/classic/ckeditor.js"></script>
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
					<h1 class="mt-4">상품 변경</h1>
					<ol class="breadcrumb mb-4">
						<li class="breadcrumb-item">상품 변경</li>
					</ol>
					<div class="card mb-4">
						<div class="card-header">
							<i class="fas fa-table me-1"></i>
							상품 변경
						</div>
						<div class="card-body">
							<div class="control-group">
								<form action="prUpdate.do" id="prUpdate" name="pr-update" method="post">
									<input type="hidden" value="${infoproduct.cateNum}" name="cateNum"/>
									<input type="hidden" value="${infoproduct.pNum}" name="pNum"/>
									<label class="control-label" for="typeahead">브랜드</label>
									<div class="controls">
										<input type="text" class="form-control" id="brand" name="brand" value="${infoproduct.brand}">
										<p></p>
									</div>
									<div class="control-group">
										<label class="control-label" for="typeahead">상품명</label>
										<div class="controls">
											<input type="text" class="form-control" id="name" name="pName" value="${infoproduct.pName}">
											<p></p>
										</div>
									</div>
									<div class="control-group">
										<label class="control-label" for="typeahead">정가</label>
										<div class="controls">
											<input type="text" class="form-control" id="price" name="fixPrice" value="${infoproduct.fixPrice}">
											<p></p>
										</div>
									</div>
									<div class="control-group">
										<label class="control-label" for="typeahead">판매가</label>
										<div class="controls">
											<input type="text" class="form-control" id="price" name="selPrice" value="${infoproduct.selPrice}">
											<p></p>
										</div>
									</div>
									<div class="control-group">
										<label class="control-label" for="typeahead">게임연령</label>
										<div class="controls">
											<input type="text" class="form-control" id="game-age" name="reAge" value="${infoproduct.reAge}">
											<p></p>
										</div>
									</div>
									<div class="control-group">
										<label class="control-label" for="typeahead">게임인원</label>
										<div class="controls">
											<input type="text" class="form-control" id="game-count" name="rePerson" value="${infoproduct.rePerson}">
											<p></p>
										</div>
									</div>
									<div class="control-group">
										<label class="control-label" for="typeahead">재고</label>
										<div class="controls">
											<input type="text" class="form-control" id="product-count" name="productCnt" value="${infoproduct.productCnt}">
											<p></p>
										</div>
									</div>
									<%--
									<div class="control-group">
										<label class="control-label" for="textarea2">상품상세설명</label>
										<div class="controls">
											<textarea class="form-control textarea" id="classic" name="infoImg">${infoproduct.infoImg}</textarea>
											<p></p>
										</div>
										 <div class="control-group">
											<label class="control-label" for="select01">카테고리</label>
											<div class="controls">
												<select id="lageSelect">
													<option value=0>대분류</option>
													<c:forEach var="lCate" items="${lcList}">
													<c:if test="${lCate.cateNum/100 == cateNum/100}"><option value='${lCate.cateNum}' selected>${lCate.cateL}</option></c:if>
													<c:if test="${lCate.cateNum/100 != cateNum/100}"><option value='${lCate.cateNum}' >${lCate.cateL}</option></c:if>
													</c:forEach>
												</select>
												<p></p>
											</div>
											<div class="controls">
												<select id="middleSelect">
													<c:forEach var="mCate" items="${mcList}">
													<c:if test="${mCate.cateNum==cateNum}"><option value="${mCate.cateNum}" class="${mCate.cateNum}" selected="selected">${mCate.cateM}</option></c:if>
													<c:if test="${mCate.cateNum!=cateNum}"><option value="${mCate.cateNum}" class="${mCate.cateNum}" >${mCate.cateM}</option></c:if>
														
													</c:forEach>
												</select>
												<p></p>
											</div>
										</div>
										<div class="control-group">
											<label class="control-label" for="fileInput">상품이미지등록</label>
											<div class="controls">
												<input class="input-file uniform_on" id="fileInput" type="file" name="pImg" value="${infoproduct.pImg}" />
												<P></P>
											</div>
										</div>
									</div>
									--%>
									<p></p>
									<div class="mt-4 mb-0">
										<div class="d-grid">
											<button class="btn btn-primary btn-block" type="submit">상품 변경</button>
										</div>
									</div>
									<div class="mt-4 mb-0">
										<div class="d-grid">
											<a class="btn btn-danger btn-block" onClick="return con()" href="prSelectAll.do">등록 취소</a>
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
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script>
    function confirms(){
        let brand = $("#brand").val();
        let name = $("#name").val();
        let price = $("#price").val();
        let detail = $("#detail").val();
        let product-num = $("#product-num").val();
        let cartegory-num = $("#cartegory-num").val();

            if(brand==""||name==""||price==""||detail==""){
                alert("빈 칸 없이 모두입력해주세요.");
                return false
            } else{
                alert("등록이 완료되었습니다!");
                return true;    
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
<script>
        ClassicEditor
            .create( document.querySelector( '#classic' ))
            .catch( error => {
                console.error( error );
            } );
    </script>
<script type="text/javascript">
var malls = false;

function update_selected() {
  $("#middleSelect").val(0);
  $("#middleSelect").find("option[value%100!=0]").detach();

  $("#middleSelect").append(malls.filter($(this).val()));
}

$(function() {
  malls = $("#middleSelect").find("option[value%100!=0]");
  malls.detach();

  $("#lageSelect").change(update_selected);
  $("#lageSelect").trigger("change");
});
    </script>
</html>