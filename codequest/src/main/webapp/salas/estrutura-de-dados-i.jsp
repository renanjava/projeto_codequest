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
    	persistirProgresso();
    	document.querySelector('#campoHeadInstrucoes').textContent = 
			'Instruções: Você deve ordenar os números em '+
			'ordem crescente antes do tempo acabar';
    	
		document.querySelector('#tituloSala').textContent = 'Sala de Estrutura de Dados I';
		document.body.style.background = 'linear-gradient(to bottom, #2c3e50, #0d2959)';
    </script>
    
    <script>
    var cont = 15;
    var botoesClicadosDesafio = 0;
	var numerosDesafioED = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
	var numerosEsperados = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
	
	var modal = document.getElementById("modalDesafio");
	var buttonContainer = document.getElementById("buttonDesafio");
	document.getElementById("botaoComecar").addEventListener('click', () => {
	    iniciarContagem(cont);
	});
	    
	    modal.style.textAlign = 'center';

	    for (var i = 1; i <= 20; i++) {
	    	(function(i) {
	   	        var button = document.createElement("button");
	   	        button.id = 'botaoDesafio' + i;
	   	     	button = estruturaBotao(button);
	   	        
	   	        do
	   	        	var indiceArray = Math.floor(Math.random() * 20);
	   	        while(numerosEsperados[indiceArray] == 99)
	
	   	        button.innerText = numerosEsperados[indiceArray];
	   	        buttonContainer.appendChild(button);
	   	        numerosEsperados[indiceArray] = 99;
	
	   	        if (i % 5 === 0) 
	   	            buttonContainer.appendChild(document.createElement("br"));
	   	        
	   	        button.addEventListener("click", function() {
	   	        	var verificaIndiceVazio = 0;
	   	        	
	   	        	while(numerosEsperados[verificaIndiceVazio] != 99)
	   	        		verificaIndiceVazio++;
	   	        	
	   	        	numerosEsperados[verificaIndiceVazio] = document.getElementById("botaoDesafio"+i).innerText;
	   	        	
	   	        		
	   	        	botoesClicadosDesafio++;
	   	        	document.getElementById("botaoDesafio"+i).disabled = true;
   				});
			})(i);
		}
	    
		function iniciarContagem(cont) {
			console.log(cont)
			if (cont >= 0 && botoesClicadosDesafio < 20) {
			    atualizarCampo(cont).then(function() {
			        iniciarContagem(cont-1);
			    });
			}else
				mostrarResultadoDesafio(verificaRespostaEstrutura());
	    }
		
		function verificaRespostaEstrutura(){
		   	var contValoresIguais = 0;
		   	
		   	for(i = 0;i < 20;i++){
		   		if(numerosEsperados[i] == numerosDesafioED[i])
		   			contValoresIguais++;
		   	}
		   	
		   	if(contValoresIguais == 20) 
		   		return true;
		   	else
		   		return false;
	   }
		
		function atualizarCampo(cont) {
		    return new Promise(function(resolve, reject) {
		    	document.querySelector('#campoHeadDesafio').textContent = 
		        	(cont < 10 ? '0:0' + cont.toString() : '0:' + cont.toString());
		    	
		        setTimeout(function() {
		            resolve();
		        }, 1000);
		    });
		}
    </script>
</body>
</html>