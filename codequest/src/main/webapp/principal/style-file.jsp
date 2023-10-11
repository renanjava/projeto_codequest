<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style type="text/css">
body {
    background-color: #2C3E50;
}

p {
	padding: 1px;
}

td {
	padding: 11px
}

#exit {
	height: 30px;
	width: 30px;
	background: #3498DB;
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
	border: 3px solid #ECF0F1;
	border-top-color: transparent;
}

#exit:before {
	content: "";
	display: block;
	height: 10px;
	width: 3px;
	background: #ECF0F1;
	z-index: 70;
	position: Absolute;
	right: 13px;
	top: 6px;
}

#circle {
	height: 40px;
	width: 40px;
	background: transparent;
	border: 1px solid #ECF0F1;
	border-radius: 50px;
	position: absolute;
	top: -35px;
	z-index: 40;
	right: -20px;
}

#exit:hover {
	background: #3990C9;
	color: #E67E22;
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
	background: #3498DB;
	text-align: center;
	font-size: 30px;
	background-size: 1px 300%;
	-webkit-transition: 0.5s;
	transition: 0.5s;
	color: #ECF0F1;
	font-family: OCR A Std, monospace;
	cursor: pointer;
	border: none;
}

#jogar:hover {
	background: #3990C9;
	color: #E67E22;
	-webkit-transform: rotate(-1deg);
	transform: rotate(-2deg);
}

#tutorial:hover {
	background: #3990C9;
	color: #E67E22;
	-webkit-transform: rotate(-2deg);
	transform: rotate(-2deg);
}

#creditos:hover {
	background: #3990C9;
	color: #E67E22;
	-webkit-transform: rotate(-2deg);
	transform: rotate(-2deg);
}

#left {
	height: 100px;
	width: 600px;
	background: #2C3E50;
	position: absolute;
	z-index: 6;
	-webkit-transform: rotate(45deg);
	transform: rotate(45deg);
	top: -175px;
	right: -104px;
	border-top: 1px solid #ECF0F1;
}

#right {
	height: 100px;
	width: 600px;
	background: #2C3E50;
	position: absolute;
	top: -229px;
	-webkit-transform: rotate(-45deg);
	transform: rotate(-45deg);
	z-index: 7;
	left: -56px;
	border-top: 1px solid #ECF0F1;
}

#jogar p {
	position: relative;
	top: 2px;
	right: 4px;
}

#tutorial {
	height: 50px;
	width: 500px;
	background: #3498DB;
	position: relative;
	bottom: 345px;
	right: 250px;
	text-align: center;
	font-size: 30px;
	font-family: OCR A Std, monospace;
	color: #ECF0F1;
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
	background: #3498DB;
	position: relative;
	bottom: 360px;
	right: 200px;
	font-size: 30px;
	text-align: center;
	font-family: OCR A Std, monospace;
	color: #ECF0F1;
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