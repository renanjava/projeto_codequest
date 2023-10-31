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

.roleta {
    width: 200px;
    height: 200px;
    border: 5px solid black;
    border-radius: 50%;
    position: relative;
}

.girar {
    transform: rotate(1800deg);
}

.slot {
    width: 100%;
    height: 50px;
    background-color: red;
    position: absolute;
    top: 50%;
    transform: translateY(-50%);
}

#slot1 {
    background-color: red;
    transform: translateY(-150%);
}

#slot2 {
    background-color: orange;
    transform: translateY(-100%);
}

#slot3 {
    background-color: yellow;
    transform: translateY(-50%);
}

#slot4 {
    background-color: green;
}

#slot5 {
    background-color: blue;
    transform: translateY(50%);
}

#slot6 {
    background-color: purple;
    transform: translateY(100%);
}

@keyframes girar-animation {
    0% {
        transform: rotate(0deg);
    }
    100% {
        transform: rotate(1800deg);
    }
}

.girar-animation {
    animation: girar-animation 5s ease-in-out;
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
	            <div class="slot" id="slot1"></div>
	            <div class="slot" id="slot2"></div>
	            <div class="slot" id="slot3"></div>
	            <div class="slot" id="slot4"></div>
	            <div class="slot" id="slot5"></div>
	            <div class="slot" id="slot6"></div>
        	</div>
        	<button id="giraRoleta">GIRAR</button>
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