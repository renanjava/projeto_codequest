<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style type="text/css">
body {
	margin: 0;
	padding: 0;
	font-family: Arial, sans-serif;
}

h2{
	color: white;
}

.modal {
	display: none;
	position: fixed;
	z-index: 1;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgba(0, 0, 0, 0.4);
	padding-top: 60px;
}

.modal-content {
	background-color: black;
	margin: 5% auto;
	padding: 20px;
	border: 1px solid #888;
	width: 80%;
}

.close {
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: orange;
	text-decoration: none;
	cursor: pointer;
}

.navbar {
	background-color: black;
	color: white;
	padding: 10px 0;
}

.navbar-container {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin: 0 auto;
	max-width: 1200px;
	padding: 0 20px;
}

.logo a {
	color: white;
	text-decoration: none;
	font-size: 24px;
	font-weight: bold;
}

.nav-links {
	list-style: none;
	display: flex;
}

.nav-links li {
	margin: 0 15px;
}

.nav-links li a {
	color: white;
	text-decoration: none;
}

.nav-links li a:hover {
	text-decoration: underline;
}
</style>