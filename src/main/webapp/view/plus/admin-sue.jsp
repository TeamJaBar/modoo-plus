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
  <title>보드매칭 &rsaquo; 신고 게시판</title>

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
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-94034622-3');
</script>
<!-- /END GA --></head>

<body>
  <div id="app">
    <div class="main-wrapper main-wrapper-1">
    
    	<!--  header -->
    	<modoo:header id="${member.memberId}" name="${member.memberName}" />
    	

      <!-- Main Content -->
      <div class="main-content">
        <section class="section">
          <div class="section-header">
            <h1>신고 게시글</h1>
          </div>
          <div class="section-body">
            <h2 class="section-title">신고 게시글 처리 현황</h2>

            <div class="row">
              <div class="col-12">
                <div class="card mb-0">
                  <div class="card-body">
                    <ul class="nav nav-pills">
                      <li class="nav-item">
                        <a class="nav-link active" href="admin-sue.do">전체 <span class="badge badge-white">5
                        <c:out value="${sueTotal}" /></span></a>
                      </li>
                      <!-- ajax 사용해서 비동기로 목록 출력 -->
                      <li class="nav-item">
                        <a class="nav-link" href="admin-sue.do?">미처리 <span class="badge badge-primary">2
                        <c:out value="${presue}" /> </span></a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link" href="admin-sue.do?">처리완료 <span class="badge badge-primary">3
                        <c:out value="${ressue}" /> </span></a>
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
                    <h4>전체 신고글</h4>
                  </div>
                  <div class="card-body">
                    <div class="float-left">
                      <select class="form-control selectric">
                        <option>전체 신고글</option>
                        <option>미처리 신고글</option>
                        <option>삭제 완료 신고글</option>
                      </select>
                    </div>
                    <div class="float-right">
                      <form action="searchBoard.do">
                        <div class="input-group">
                          <input type="text" class="form-control" name="searchContent" placeholder="검색">
                          <div class="input-group-append">                                            
                            <button class="btn btn-primary"><i class="fas fa-search"></i></button>
                          </div>
                        </div>
                      </form>
                    </div>

                    <div class="clearfix mb-3"></div>

                    <div class="table-responsive">
                      <table class="table table-striped">
                        <tr>
                          <th>
                            글 번호
                          </th>
                          <th>제목</th>
                          <th>작성자</th>
                          <th>작성날짜</th>
                          <th>처리상태</th>
                        </tr>
                        <!-- 신고 게시글 목록 -->
                        <c:forEach items="${board}" var="v">
                        <c:if test="${v.bstatus != 0}">
                        <c:set var="sueTotal" value="${sueTotal + 1}" />
                        <tr>
                          <td>
                            ${v.bNum}
                          </td>
                          <td><a href="sue-detail.do?bNum=${v.bNum}">${v.btitle}</a></td>
                          <td>
                            <a href="#">
                              <img alt="image" src="../../assets/img/avatar/avatar-5.png" class="rounded-circle" width="35" data-toggle="title" title=""> 
                              <div class="d-inline-block ml-1">${v.mid}</div>
                            </a>
                          </td>
                          <td> ${v.bwdate}</td><td>
                          <c:choose>
                          	<c:when test="${v.bwhether == 0}">
                          	<c:set var="presue" value="${presue +1}"/>
                          		<div class="badge badge-danger">미처리</div>
                          	</c:when>
                          	<c:otherwise>
                          	<c:set var="ressue" value="${ressue +1}"/>
                          		<div class="badge badge-primary">처리완료</div>
                          	</c:otherwise>
                          </c:choose>
                          </td>
                        </tr>
                        </c:if>
                        </c:forEach>
                        <!-- 신고 게시글 목록 -->
                        <tr>
                          <td>
                            101
                          </td>
                          <td><a href="sue-detail.jsp">내일 게임 하실분~</a></td>
                          <td>
                            <a href="#">
                              <img alt="image" src="../../assets/img/avatar/avatar-5.png" class="rounded-circle" width="35" data-toggle="title" title=""> <div class="d-inline-block ml-1">김시하</div>
                            </a>
                          </td>
                          <td>2018-01-20</td>
                          <td><div class="badge badge-primary">처리완료</div></td>
                        </tr>
                        <tr>
                          <td>
                            102
                          </td>
                          <td><a href="sue-detail.jsp">강남에서 보드게임 하실분 구합니다</a></td>
                          <td>
                            <a href="#">
                              <img alt="image" src="../../assets/img/avatar/avatar-5.png" class="rounded-circle" width="35" data-toggle="title" title=""> <div class="d-inline-block ml-1">박가연</div>
                            </a>
                          </td>
                          <td>2018-01-20</td>
                          <td><div class="badge badge-primary">처리완료</div></td>
                        </tr>
                        <tr>
                          <td>
                            103
                          </td>
                          <td><a href="sue-detail.jsp">시하님이 좋아하는 사다리게임</a></td>
                          <td>
                            <a href="#">
                              <img alt="image" src="../../assets/img/avatar/avatar-5.png" class="rounded-circle" width="35" data-toggle="title" title=""> <div class="d-inline-block ml-1">김민수</div>
                            </a>
                          </td>
                          <td>2018-01-20</td>
                          <td><div class="badge badge-primary">처리완료</div></td>
                        </tr>
                        <tr>
                          <td>
                            104
                          </td>
                          <td><a href="sue-detail.jsp">언제까지 어깨춤을 추게 할거야~</a></td>
                          <td>
                            <a href="#">
                              <img alt="image" src="../../assets/img/avatar/avatar-5.png" class="rounded-circle" width="35" data-toggle="title" title=""> <div class="d-inline-block ml-1">윤석환</div>
                            </a>
                          </td>
                          <td>2018-01-20</td>
                          <td><div class="badge badge-danger">미처리</div></td>
                        </tr>
                        <tr>
                          <td>
                            105
                          </td>
                          <td><a href="sue-detail.jsp">콩먹은 용만이 찾기 게임</a></td>
                          <td>
                            <a href="#">
                              <img alt="image" src="../../assets/img/avatar/avatar-5.png" class="rounded-circle" width="35" data-toggle="title" title=""> <div class="d-inline-block ml-1">서석지</div>
                            </a>
                          </td>
                          <td>2018-01-20</td>
                          <td><div class="badge badge-warning">재검토</div></td>
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
                  </div>
                </div>
              </div>
            </div>
          </div>
        </section>
      </div>
      <footer class="main-footer">
        <div class="footer-left">
          Copyright &copy; 2023 <div class="bullet"></div> Design By <a href="https://nauval.in/">Team jabar</a>
        </div>
        <div class="footer-right">
          
        </div>
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
  <script src="../../assets/modules/jquery-selectric/jquery.selectric.min.js"></script>

  <!-- Page Specific JS File -->
  <script src="../../assets/js/page/features-posts.js"></script>
  
  <!-- Template JS File -->
  <script src="../../assets/js/scripts.js"></script>
  <script src="../../assets/js/custom.js"></script>
</body>
</html>