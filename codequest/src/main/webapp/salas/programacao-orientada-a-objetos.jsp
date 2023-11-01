<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
<jsp:include page="/principal/title-and-favicon.jsp"></jsp:include>
<jsp:include page="/principal/portas-head.jsp"></jsp:include>
<jsp:include page="/principal/conquista-and-html_body.jsp"></jsp:include>
<style type="text/css">

.modalDesafio {
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

.modal-content-desafio {
    background-color: black;
    margin: 5% auto;
    padding: 20px;
    border: 1px solid #888;
    width: 80%;
}

.roleta {
    width: 300px;
    height: 300px;
    border: 16px solid #333;
    border-radius: 50%;
    position: relative;
    overflow: hidden;
}

.slot {
    position: absolute;
    width: 0;
    height: 0;
    border-left: 150px solid transparent;
    border-right: 150px solid transparent;
    border-bottom: 150px solid var(--slot-color);
    transform: rotate(calc(var(--slot-index) * 72deg));
    transform-origin: bottom center;
}

.slot:nth-child(1) {
    background-color: blue;
    transform: rotate(0deg);
}

.slot:nth-child(2) {
    background-color: green;
    transform: rotate(60deg);
}

.slot:nth-child(3) {
    background-color: yellow;
    transform: rotate(120deg);
}

.slot:nth-child(4) {
    background-color: orange;
    transform: rotate(180deg);
}

.slot:nth-child(5) {
    background-color: red;
    transform: rotate(240deg);
}

</style>
</head>
<body>

	<jsp:include page="/principal/nav-bar.jsp"></jsp:include>
	<jsp:include page="/principal/portas-body-table.jsp"></jsp:include>
	<jsp:include page="/principal/portas-body-script.jsp"></jsp:include>
	<jsp:include page="/principal/popup-and-instrucoes.jsp"></jsp:include>

    <div id="modalDesafio" class="modalDesafio">
        <div class="modal-content-desafio">
            <div class="roleta">
                <div class="slot" style="--slot-index: 0;"></div>
                <div class="slot" style="--slot-index: 1;"></div>
                <div class="slot" style="--slot-index: 2;"></div>
                <div class="slot" style="--slot-index: 3;"></div>
                <div class="slot" style="--slot-index: 4;"></div>
            </div>
            <button id="girarRoleta">GIRAR</button>
        </div>
    </div>
    
    <jsp:include page="/principal/resultado-desafio.jsp"></jsp:include>
    <jsp:include page="/principal/perguntas-and-respostas.jsp"></jsp:include>
    
    <script type="text/javascript">
    	persistirProgresso("Java");
    	
    	document.querySelector('#tituloSala').textContent = 'Sala de Programação Orientada a Objetos';
    	document.body.style.background = 'linear-gradient(to bottom, #CC6633, #CC5532)';
    </script>
</body>
</html>