<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<head>
<jsp:include page="/principal/title-and-favicon.jsp"></jsp:include>
<jsp:include page="principal/style-file.jsp"></jsp:include>
<jsp:include page="principal/arte.jsp"></jsp:include>
</head>
<body>
	<div id="allthethings">
		<div id="left"></div>
		<form action="Login" method="post">
			<table><td></td></table>
			<input type="submit" value="JOGAR" id="jogar" name="botao">
			<p></p>
			<input type="submit" value="TUTORIAL" id="tutorial" name="botao">
			<p></p>
			<input type="submit" value="CRÉDITOS" id="creditos" name="botao">
		</form>
		<div id="right"></div>

		<div id="exit"></div>
		<div id="circle"></div>
	</div>
</body>
