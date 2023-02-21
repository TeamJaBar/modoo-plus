<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에러 페이지</title>
</head>
<body>

처리중이었던 URI : ${pageContext.errorData.requestURI} <br>
에러 상태 코드 : ${pageContext.errorData.statusCode} <br>
예외 메세지 : ${pageContext.errorData.throwable}

</body>
</html>