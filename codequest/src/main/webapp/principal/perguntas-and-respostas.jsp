<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<body>
	<div id="respostasModal" class="respostasModal">
    <div class="modal-content-respostas">
        <h2>Pergunta: <p id="campoPergunta"></p></h2>
        <div class="options">
            <button id="resposta1" class="optionBtn" onclick="verificarResposta(id)" enabled><h2 id="campoResposta1"></h2></button>
            <button id="resposta2" class="optionBtn" onclick="verificarResposta(id)" enabled><h2 id="campoResposta2"></h2></button>
            <button id="resposta3" class="optionBtn" onclick="verificarResposta(id)" enabled><h2 id="campoResposta3"></h2></button>
            <button id="resposta4" class="optionBtn" onclick="verificarResposta(id)" enabled><h2 id="campoResposta4"></h2></button>
            <button id="resposta5" class="optionBtn" onclick="verificarResposta(id)" enabled><h2 id="campoResposta5"></h2></button>
        </div>
    </div>
</body>