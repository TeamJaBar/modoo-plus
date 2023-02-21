<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ attribute type="java.lang.Integer" name="dib" %>

<c:choose>
	<c:when test="${mId == null}">
		<div class="block2-txt-child2 flex-r p-t-3">
			<a href="login.jsp" class="dis-block pos-relative">
				<img class="icon-heart1 dis-block trans-04" src="/ModooShop/images/icons/icon-heart-01.png" alt="찜 아이콘 활성화">
			</a>
		</div>
	</c:when>
	<c:otherwise>
		<div class="block2-txt-child2 flex-r p-t-3">
			<c:if test="${dib == 1}">
				<a href="#" class="btn-addwish-b2 dis-block pos-relative js-addwish-b2 js-addedwish-b2" id="${pnum}">
			</c:if>
			<c:if test="${dib == 0 }">
				<a href="#" class="btn-addwish-b2 dis-block pos-relative js-addwish-b2" id="${pnum}">
			</c:if>
			<img class="icon-heart1 dis-block trans-04" src="/ModooShop/images/icons/icon-heart-01.png" alt="찜 아이콘 활성화">
				<img class="icon-heart2 dis-block trans-04 ab-t-l" src="/ModooShop/images/icons/icon-heart-02.png" alt="찜 아이콘 비활성화">
			</a>
		</div>
	</c:otherwise>
</c:choose>