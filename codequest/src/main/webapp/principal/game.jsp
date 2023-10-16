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

.pop-up-conquista {
	display: none;
	position: fixed;
	background-color: gray;
	width: 300px;
	padding: 10px;
	text-align: center;
	border: 1px solid #ccc;
	border-radius: 10px;
	box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.1);
	top: 80px;
}

.modalDesafio {
    display: none;
    position: fixed;
    z-index: 1;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    overflow: auto;
    background-color: rgb(0, 0, 0);
    background-color: rgba(0, 0, 0, 0.4);
    padding-top: 60px;
}

.modal-content-desafio {
    background-color: black;
    margin: 5% auto;
    padding: 20px;
    border: 1px solid #888;
    width: 80%;
}

.close-desafio {
    color: #aaa;
    float: right;
    font-size: 28px;
    font-weight: bold;
}

.close-desafio:hover,
.close-desafio:focus {
    color: black;
    text-decoration: none;
    cursor: pointer;
}

</style>
</head>
<body>

	<jsp:include page="nav-bar.jsp"></jsp:include>
	<jsp:include page="portas-body-table.jsp"></jsp:include>
	<jsp:include page="portas-body-script.jsp"></jsp:include>

	<div class="pop-up-conquista" id="popUpConquista">
		<h2>Conquista Desbloqueada!</h2>
		<p id="campoConquista"></p>
	</div>

    <div id="myModalDesafio" class="modalDesafio">
        <div class="modal-content-desafio">
            <h2>Tempo: <p class="contador" id="campoHeadDesafio"></p></h2>
            <div id="buttonDesafio"></div>
        </div>
    </div>
    
    <div id="resultadoDesafio" class="modalDesafio">
        <div class="modal-content-desafio">
            <h2>Resultado: <p class="contador" id="campoResultadoDesafio"></p></h2>
        </div>
    </div>
</body>
</html>