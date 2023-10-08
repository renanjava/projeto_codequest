<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<head>


<style type="text/css">
@import url(https://fonts.googleapis.com/css?family=Shadows+Into+Light);

body {
	background: gray;
}

p{
	padding: 1px;
}

td{
	padding: 11px
}

#exit {
	height: 30px;
	width: 30px;
	background: orange;
	border: 1px solid black;
	border-radius: 50px;
	position: Absolute;
	top: -30px;
	z-index: 50;
	right: -15px;
	-webkit-transition: 0.5s;
	transition: 0.5s;
	cursor: pointer;
}

#exit:after {
	content: "";
	display: block;
	height: 15px;
	width: 15px;
	background: transparent;
	border-radius: 50px;
	position: absolute;
	top: 5px;
	left: 5px;
	border: 3px solid white;
	border-top-color: transparent;
}

#exit:before {
	content: "";
	display: block;
	height: 10px;
	width: 3px;
	background: white;
	z-index: 70;
	position: Absolute;
	right: 13px;
	top: 6px;
}

#circle {
	height: 40px;
	width: 40px;
	background: transparent;
	border: 1px solid white;
	border-radius: 50px;
	position: absolute;
	top: -35px;
	z-index: 40;
	right: -20px;
}

#exit:hover {
	background: #7A0000;
}

#allthethings {
	width: 0px;
	height: 0px;
	border-left: 150px solid transparent;
	border-right: 150px solid transparent;
	border-top: 150px solid transparent;
	border-radius: px;
	position: relative;
	margin: auto;
	top: 5px;
	top: 25%;
	left: 2px;
}

#jogar {
	position: relative;
	bottom: 330px;
	right: 305px;
	height: 50px;
	width: 600px;
	background: orange;
	text-align: center;
	font-size: 30px;
	background-size: 1px 300%;
	-webkit-transition: 0.5s;
	transition: 0.5s;
	color: white;
	font-family: OCR A Std, monospace;
	cursor: pointer;
	border: none;
}

#jogar:hover {
	background: #7A0000;
	color: white;
	-webkit-transform: rotate(-1deg);
	transform: rotate(-2deg);
}

#tutorial:hover {
	background: #7A0000;
	color: white;
	-webkit-transform: rotate(-2deg);
	transform: rotate(-2deg);
}

#creditos:hover {
	background: #7A0000;
	color: white;
	-webkit-transform: rotate(-2deg);
	transform: rotate(-2deg);
}

#left {
	height: 100px;
	width: 600px;
	background: gray;
	position: absolute;
	z-index: 6;
	-webkit-transform: rotate(45deg);
	transform: rotate(45deg);
	top: -175px;
	right: -104px;
	border-top: 1px solid white;
}

#right {
	height: 100px;
	width: 600px;
	background: gray;
	position: absolute;
	top: -229px;
	-webkit-transform: rotate(-45deg);
	transform: rotate(-45deg);
	z-index: 7;
	left: -56px;
	border-top: 1px solid white;
}

#jogar p {
	position: relative;
	top: 2px;
	right: 4px;
}

#tutorial {
	height: 50px;
	width: 500px;
	background: orange;
	position: relative;
	bottom: 345px;
	right: 250px;
	text-align: center;
	font-size: 30px;
	font-family: OCR A Std, monospace;
	color: white;
	-webkit-transition: 0.5s;
	transition: 0.5s;
	cursor: pointer;
	border: none;
}

#tutorial p {
	position: relative;
	top: 0px;
	right: 9px;
}

#creditos {
	height: 50px;
	width: 400px;
	background: orange;
	position: relative;
	bottom: 360px;
	right: 200px;
	font-size: 30px;
	text-align: center;
	font-family: OCR A Std, monospace;
	color: white;
	-webkit-transition: 0.5s;
	transition: 0.5s;
	cursor: pointer;
	border: none;
}

#creditos p {
	position: relative;
	top: 0px;
	right: 4px;
}
</style>

</head>

<body>
	<div id="allthethings">
		<div id="left"></div>
		<form action="ServletInicio" method="post">
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
