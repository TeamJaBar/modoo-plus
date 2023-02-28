<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
	$(document).ready(function() {
		var title = "<c:out value='${sweet.title}' />";
		var msg = "<c:out value='${sweet.msg}' />";
		var url = "<c:out value='${sweet.url}' />";

		swal({
			title : title,
			icon : "warning",
			text : msg,
		}).then(function() {
			location.href = url;
		})
	});
</script>