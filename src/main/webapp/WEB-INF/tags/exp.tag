<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ attribute type="java.lang.Integer" name="score"%>

<c:choose>
	<c:when test="${score<200}">
		왕초보
	</c:when>
	<c:when test="${score<500 && score>199}">초보</c:when>
	<c:when test="${score<1000 && score>499}">고수</c:when>
	<c:when test="${score>5000}">빡고수</c:when>
</c:choose>