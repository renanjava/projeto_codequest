<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
<jsp:include page="/principal/title-and-favicon.jsp"></jsp:include>
<jsp:include page="portas-head.jsp"></jsp:include>
<style type="text/css">
html, body {
	height: 100%;
	margin: 0;
	padding: 0;
}

body {
	background: linear-gradient(to bottom, #2c3e50, #0d2959);
}
</style>
</head>
<body>

	<jsp:include page="nav-bar.jsp"></jsp:include>
	<jsp:include page="portas-body-table.jsp"></jsp:include>
	<jsp:include page="portas-body-script.jsp"></jsp:include>
</body>
</html>