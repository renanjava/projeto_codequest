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

</style>
</head>
<body>

	<jsp:include page="/principal/nav-bar.jsp"></jsp:include>
	<jsp:include page="/principal/portas-body-table.jsp"></jsp:include>
	<jsp:include page="/principal/portas-body-script.jsp"></jsp:include>
	<jsp:include page="/principal/popup-and-instrucoes.jsp"></jsp:include>

    <div id="modalDesafio" class="modalDesafio">
        <div class="modal-content-desafio">
            <h2>Tempo: <p class="contador" id="campoHeadDesafio"></p></h2>
            <div id="buttonDesafio"></div>
        </div>
    </div>
    
    <jsp:include page="/principal/resultado-desafio.jsp"></jsp:include>
    <jsp:include page="/principal/perguntas-and-respostas.jsp"></jsp:include>
   
    <script type="text/javascript">
    	persistirProgresso("Estrutura");
    	document.querySelector('#campoHeadInstrucoes').textContent = 
			'Instruções: Você deve ordenar os números em '+
			'ordem crescente antes do tempo acabar';
    	
		document.querySelector('#tituloSala').textContent = 'Sala de Estrutura de Dados I';
		document.body.style.background = 'linear-gradient(to bottom, #2c3e50, #0d2959)';
    </script>
</body>
</html>