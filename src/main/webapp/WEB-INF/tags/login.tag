<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<ul class="right-top-bar-menu">
	<c:choose>
		<c:when test="${mNum == null}">
			<li>
				<a href="about.jsp">ABOUT US</a>
			</li>
			<li>
				<a href="login.jsp">LOGIN</a>
			</li>
			<li>
				<a href="join.jsp">JOIN</a>
			</li>
			<li>
				<a href="login.jsp">MYPAGE</a>
			</li>
		</c:when>
		<c:when test="${mId == 'admin'}">
			<li>
				<a href="about.jsp">ABOUT US</a>
			</li>
			<li>
				<a href="logout.do">LOGOUT</a>
			</li>
			<li>
				<a href="admin-main.do">ADMIN</a>
			</li>
		</c:when>
		<c:otherwise>
			<li>
				<span>안녕하세요, ${mName}님</span>
			</li>
			<li>
				<a href="about.jsp">ABOUT US</a>
			</li>
			<li>
				<a href="logout.do">LOGOUT</a>
			</li>
			<li class="active-menu">
				<a href="changeInfo.do">MYPAGE</a>
				<ul class="sub-menu">
					<li>
						<a href="orderSelect.do">주문조회</a>
					</li>
					<li>
						<a href="changeInfo.do">내정보수정</a>
					</li>
					<li>
						<a href="dibList.do">찜리스트</a>
					</li>
				</ul>
			</li>
		</c:otherwise>
	</c:choose>
</ul>
