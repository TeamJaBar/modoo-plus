<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ attribute type="java.lang.Integer" name="score" %>

<c:choose>
	<c:when test="${score<200}">${(score/200)*100}</c:when>
	<c:when test="${score<500 && score>199}">(score/500)*100}</c:when>
	<c:when test="${score<1000 && score>499}">(score/1000)*100}</c:when>
	<c:when test="${score>5000}">(score/5000)*100}</c:when>
</c:choose>