<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="msg"%>
<style>
.navbar .nav-link.nav-link-user img {
	background-color: white;
}
</style>
<!-- 테그 연결해 보기!!!!!! -->
<div class="navbar-bg"></div>
<nav class="navbar navbar-expand-lg main-navbar">
	<!-- 해더 드롭다운 -->
	<div class="btn-group">
		<button type="button" class="btn btn-header" onclick="location.href='boardList.do'">
			<img class="mr-3 rounded" src="../assets/img/favicon.png">
			<msg:message code="message.header.header"/>
		</button>
		<button type="button" class="btn btn-header dropdown-toggle dropdown-toggle-split" data-toggle="dropdown">
			<span class="sr-only">Toggle Dropdown</span>
		</button>
		<div class="dropdown-menu">
			<c:if test="${not empty mId}">
			<c:choose>
				<c:when test="${mId == 'admin'}">
					<a class="dropdown-item" href="adPlusMain.do"><msg:message code="message.header.adBoard"/></a>
					<a class="dropdown-item" href="adMoveSue.do"><msg:message code="message.header.adSue"/></a>
				</c:when>
				<c:otherwise>
					<a class="dropdown-item" href="createBoard.do"><msg:message code="message.header.createBoard"/></a>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="mypage.do?sortBy=1"><msg:message code="message.header.mypage"/></a>
					<a class="dropdown-item" href="myBoard.do?sortBy=1"><msg:message code="message.header.mymatch"/></a>
				</c:otherwise>
			</c:choose>
			</c:if>
			<div class="dropdown-divider"></div>
			<a class="dropdown-item" href="main.do"><msg:message code="message.header.main"/></a>
			<div class="dropdown-divider"></div>
			<a class="dropdown-item" href="createBoard.do?lang=en">ENGLISH</a>
			<a class="dropdown-item" href="createBoard.do?lang=ko">한국어</a>
		</div>
	</div>
	<!-- 검색창 -->
	<form class="form-inline ml-auto" action="searchHeader.do" method="get">
		<ul class="navbar-nav">
			<li>
				<a href="board-list.do" class="nav-link nav-link-lg d-sm-none">
					<i class="fas fa-search"></i>
				</a>
			</li>
		</ul>
		<div class="search-element">
			<input class="form-control" type="search" name="searchContent" placeholder="<msg:message code="message.header.search"/>" aria-label="Search" data-width="250">
			<button class="btn" type="submit">
				<i class="fas fa-search"></i>
			</button>
			<div class="search-backdrop"></div>
		</div>
	</form>

	<!--  -->
	<ul class="navbar-nav navbar-right">
		<li class="dropdown dropdown-list-toggle">
		</li>

		<!-- 데이터 연결되면 주석 해제 -->

		<c:choose>
			<c:when test="${empty mId}">
				<button type="button" class="btn btn-header" onclick="location.href='login.do'" style="margin-left:10px"><msg:message code="message.header.login"/></button>
			</c:when>
			<c:otherwise>
				<li class="dropdown">
					<a href="mypage.do" data-toggle="dropdown" class="nav-link dropdown-toggle nav-link-lg nav-link-user">
						<img alt="image" src="../assets/img/avatar/${mImg}" class="rounded-circle mr-1">
						<div class="d-sm-none d-lg-inline-block">${mId}</div>
					</a>
					<div class="dropdown-menu dropdown-menu-right">
						<div class="dropdown-title">${mName}, <msg:message code="message.header.hello"/></div>
						<a href="mypage.do" class="dropdown-item has-icon">
							<i class="far fa-user"></i> <msg:message code="message.header.loginMypage"/>
						</a>
						<c:if test="${mId == 'admin'}">
							<a href="adPlusMain.do" class="dropdown-item has-icon">
								<img alt="image" src="../assets/img/favicon.png" class="rounded-circle mr-1">
								<msg:message code="message.header.adPage"/>
							</a>
						</c:if>
						<div class="dropdown-divider"></div>
						<a href="logout.do" class="dropdown-item has-icon text-danger">
							<i class="fas fa-sign-out-alt"></i> <msg:message code="message.header.logout"/>
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