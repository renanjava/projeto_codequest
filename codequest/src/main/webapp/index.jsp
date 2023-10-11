<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<head>
<title>CodeQuest Game</title>
<link rel="icon" href="icon/codequest.ico" type="image/x-icon">
<jsp:include page="principal/style-file.jsp"></jsp:include>
</head>
<body>
	<div id="allthethings">
		<div id="left"></div>
		<form action="ServletPrincipal" method="post">
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
