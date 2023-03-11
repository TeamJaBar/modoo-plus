<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
.navbar .nav-link.nav-link-user img {
	background-color:white;
}
</style>
<!-- 테그 연결해 보기!!!!!! -->
<div class="navbar-bg"></div>
<nav class="navbar navbar-expand-lg main-navbar">
	<!-- 해더 드롭다운 -->
	<div class="btn-group">
		<button type="button" class="btn btn-header" onclick="location.href='boardList.do?sortBy=1'">
			<img class="mr-3 rounded" src="../assets/img/favicon.png">
			모두의 매칭
		</button>
		<button type="button" class="btn btn-header dropdown-toggle dropdown-toggle-split" data-toggle="dropdown">
			<span class="sr-only">Toggle Dropdown</span>
		</button>
		<div class="dropdown-menu">
			<%--<c:if test="${not empty mId}">--%>
				<c:choose>
					<c:when test="${mId == 'admin'}">
						<a class="dropdown-item" href="adPlusMain.do">글 관리</a>
						<a class="dropdown-item" href="adMoveSue.do">신고 관리</a>
					</c:when>
					<c:otherwise>
						<a class="dropdown-item" href="createBoard.do">매칭 게시글 작성</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="mypage.do?sortBy=1">내가 작성한 글</a>
						<a class="dropdown-item" href="myBoard.do?sortBy=1">내가 매칭한 목록</a>
					</c:otherwise>
				</c:choose>
			<%--</c:if>--%>
			<div class="dropdown-divider"></div>
			<a class="dropdown-item" href="main.do">모두의 보드</a>
			<div class="dropdown-divider"></div>
			<!--<c:if test="${param.lang == ko}">-->
			<a class="dropdown-item" href="boardList.do?sortBy=1&lang=en">ENGLISH</a>
			<!--</c:if>
			<c:if test="${param.lang == en}">-->
			<a class="dropdown-item" href="boardList.do?sortBy=1&lang=ko">한국어</a>
			<!--<</c:if>-->
		</div>
	</div>
	<!-- 검색창 -->
	<form class="form-inline ml-auto">
		<ul class="navbar-nav">
			<li>
				<a href="searchBoard.do" data-toggle="search" class="nav-link nav-link-lg d-sm-none">
					<i class="fas fa-search"></i>
				</a>
			</li>
		</ul>
		<div class="search-element">
			<input class="form-control" type="search" name="searchContent" placeholder="검색" aria-label="Search" data-width="250">
			<button class="btn" type="submit">
				<i class="fas fa-search"></i>
			</button>
			<div class="search-backdrop"></div>
		</div>
	</form>

	<!--  -->
	<ul class="navbar-nav navbar-right">
		<li class="dropdown dropdown-list-toggle">
			<a href="#" data-toggle="dropdown" class="nav-link notification-toggle nav-link-lg beep">
				<i class="far fa-bell"></i>
			</a>
			<div class="dropdown-menu dropdown-list dropdown-menu-right">
				<div class="dropdown-header">
					Notifications
					<div class="float-right">
						<a href="#">Mark All As Read</a>
					</div>
				</div>
				<div class="dropdown-list-content dropdown-list-icons">
					<a href="#" class="dropdown-item dropdown-item-unread">
						<div class="dropdown-item-icon bg-primary text-white">
							<i class="fas fa-code"></i>
						</div>
						<div class="dropdown-item-desc">
							Template update is available now!
							<div class="time text-primary">2 Min Ago</div>
						</div>
					</a>
					<a href="#" class="dropdown-item">
						<div class="dropdown-item-icon bg-info text-white">
							<i class="far fa-user"></i>
						</div>
						<div class="dropdown-item-desc">
							<b>You</b> and <b>Dedik Sugiharto</b> are now friends
							<div class="time">10 Hours Ago</div>
						</div>
					</a>
					<a href="#" class="dropdown-item">
						<div class="dropdown-item-icon bg-success text-white">
							<i class="fas fa-check"></i>
						</div>
						<div class="dropdown-item-desc">
							<b>Kusnaedi</b> has moved task <b>Fix bug header</b> to <b>Done</b>
							<div class="time">12 Hours Ago</div>
						</div>
					</a>
					<a href="#" class="dropdown-item">
						<div class="dropdown-item-icon bg-danger text-white">
							<i class="fas fa-exclamation-triangle"></i>
						</div>
						<div class="dropdown-item-desc">
							Low disk space. Let's clean it!
							<div class="time">17 Hours Ago</div>
						</div>
					</a>
					<a href="#" class="dropdown-item">
						<div class="dropdown-item-icon bg-info text-white">
							<i class="fas fa-bell"></i>
						</div>
						<div class="dropdown-item-desc">
							Welcome to Stisla template!
							<div class="time">Yesterday</div>
						</div>
					</a>
				</div>
				<div class="dropdown-footer text-center">
					<a href="#">
						View All <i class="fas fa-chevron-right"></i>
					</a>
				</div>
			</div>
		</li>

		<!-- 데이터 연결되면 주석 해제 -->

		<c:choose>
			<c:when test="${empty mId}">
				<button type="button" class="btn btn-header" onclick="location.href='login.do'">로그인</button>
			</c:when>
			<c:otherwise>
				<li class="dropdown">
					<a href="mypage.do" data-toggle="dropdown" class="nav-link dropdown-toggle nav-link-lg nav-link-user">
						<img alt="image" src="../assets/img/avatar/${mImg}" class="rounded-circle mr-1">
						<div class="d-sm-none d-lg-inline-block">${mId}</div>
					</a>
					<div class="dropdown-menu dropdown-menu-right">
						<div class="dropdown-title">안녕하세요, ${mName}님</div>
						<a href="mypage.do" class="dropdown-item has-icon">
							<i class="far fa-user"></i> 마이 페이지
						</a>
						<c:if test="${mId == 'admin'}">
							<a href="adPlusMain.do" class="dropdown-item has-icon">
								<img alt="image" src="../assets/img/favicon.png" class="rounded-circle mr-1">
								관리자 페이지
							</a>
						</c:if>
						<div class="dropdown-divider"></div>
						<a href="logout.do" class="dropdown-item has-icon text-danger">
							<i class="fas fa-sign-out-alt"></i> 로그아웃
						</a>
					</div>
				</li>
			</c:otherwise>
		</c:choose>

	</ul>
</nav>
<style>
.btn-header, .btn-header.disabled {
	box-shadow: 0 2px 6px #6777ef;
	background-color: #f9f9f9;
	border-color: #6a67efcf;
	color: #343a40;
}

.dropdown-divider {
	border-top-color: #6777ef96;
}

.navbar {
	height: 70px;
	left: 15%;
	right: 15%;
	position: absolute;
	z-index: 890;
	background-color: transparent;
}

.navbar .nav-link {
	height: 50%;
}
</style>