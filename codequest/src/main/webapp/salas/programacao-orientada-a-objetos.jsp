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
  display: flex;
  justify-content: space-between;
  background-color: black;
  padding: 30px;
  box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
}

.slot, .slot-button {
    width: 200px;
    margin-bottom: 10px;
    background-color: white;
    font-size: 20px;
    margin: 5px;
    padding: 10px 20px;
    border: 1px solid black;
    text-align: center;
    border-radius: 10px;
}


.botaoGirar {
  margin-top: 20px;
  padding: 10px 20px;
  font-size: 23px;
  background-color: lightblue;
  border: none;
  color: black;
  border-radius: 5px;
  cursor: pointer;
  transition: background-color 0.3s ease-in-out;
}

#botaoGirar:hover, .slot-button:hover {
  background-color: #2980b9;
}
</style>
</head>
<body>

	<jsp:include page="/principal/nav-bar.jsp"></jsp:include>
	<jsp:include page="/principal/portas-body-table.jsp"></jsp:include>
	<jsp:include page="/principal/portas-body-script.jsp"></jsp:include>
	<jsp:include page="/principal/popup-and-instrucoes.jsp"></jsp:include>

	<div id="modalDesafio" class="modalDesafio">
	    <div class="modal-content-desafio" style="height: 80%;">
	        <div style="display: flex; justify-content: center; margin-top: 20px;">
  				<button class="botaoGirar" id="botaoGirar">Sortear</button>
			</div>
	        <div class="roleta" style="display: flex; flex-direction: row; align-items: center;">
	            <div class="slot" id="slotConceito1"></div>
	            <div class="slot" id="slotConceito2"></div>
	            <div class="slot" id="slotConceito3"></div>
	            <div class="slot" id="slotConceito4"></div>
	            <div class="slot" id="slotConceito5"></div>
	        </div>
	        <div class="roleta" style="display: flex; flex-direction: row; align-items: center; justify-content: space-between; margin-top: 180px;">
	            <button class="slot-button" id="slotBotao1"></button>
	            <button class="slot-button" id="slotBotao2"></button>
	            <button class="slot-button" id="slotBotao3"></button>
	            <button class="slot-button" id="slotBotao4"></button>
	            <button class="slot-button" id="slotBotao5"></button>
	        </div>
	    </div>
	</div>



    
    <audio id="somRoleta" src="<%= request.getContextPath() %>/audio/roulette_sound.mp3"></audio>
    
    <jsp:include page="/principal/resultado-desafio.jsp"></jsp:include>
    <jsp:include page="/principal/perguntas-and-respostas.jsp"></jsp:include>
    
    <script type="text/javascript">
    	persistirProgresso();
    	document.querySelector('#campoHeadInstrucoes').textContent = 
			'Instruções: Você deve ligar os slots '+
			'na definição do seu respectivo conceito';
    	
    	document.querySelector('#tituloSala').textContent = 'Sala de Programação Orientada a Objetos';
    	document.body.style.background = 'linear-gradient(to bottom, #CC6633, #CC5532)';
    </script>
    
    <script>
    let conceitosSlots = ["Interface", 
		  "Enum", 
		  "Exception", 
		  "Herança", 
		  "Polimorfismo"];

	let botoesSlots = ["Semelhante ao conceito de Header onde só tem a assinatura do método", 
		   "Métodos com o mesmo nome, porém, com comportamentos diferentes", 
		   "Nos possibilita tratar falhas inesperadas em tempo de execução", 
		   "Diminui a repetição de código por declarar os mesmo atributos",
		   "São constantes que podemos associar comportamentos com métodos"];
	
    inserirTextoAleatorio(conceitosSlots,botoesSlots);
    var slots = Array.from(document.querySelectorAll('.slot'));
    
    function inserirTextoAleatorio(conceitosSlots,botoesSlots){
    	
    	var posicoesAleatoriasConceitos = [];
    	var posicoesAleatoriasBotoes = [];

    	while(posicoesAleatoriasConceitos.length < 5){
			var posicao = 0;
			
			posicoesAleatoriasConceitos.push(encontrarPosicao(posicao,posicoesAleatoriasConceitos));
			posicoesAleatoriasBotoes.push(encontrarPosicao(posicao,posicoesAleatoriasBotoes));
		}
    	for(i = 1; i < 6; i++){
    		document.querySelector('#slotConceito'+i).textContent = conceitosSlots[posicoesAleatoriasConceitos[i-1]-1];
    		document.querySelector('#slotBotao'+i).textContent = botoesSlots[posicoesAleatoriasBotoes[i-1]-1];
    	}
    }
    
    function encontrarPosicao(posicao,posicoes){
    	
    	do
			posicao = parseInt(Math.random() * 5)+1;
		while(posicoes.includes(posicao));
    	
		return posicao;
    }

    function atualizarSlotsDisponiveis() {
        slots = slots.filter(function(slot) {
            return !slot.classList.contains('disabled') && !slot.disabled;
        });
    }

    function girarRoleta() {
        var botaoGirar = document.getElementById('botaoGirar');
        var somRoleta = document.getElementById('somRoleta');
        botaoGirar = botaoOnOff(botaoGirar, false);

        var rodadasTotais = 15;
        var rodadaAtual = 0;

        var intervaloGiro = setInterval(function() {
            slots.forEach(function(slot) {
                slot.style.backgroundColor = '#fff';
            });
            

            if (slots.length >= 1) {
            	if(slots.length == 1){
            		var slotEscolhido = slots[0];
            		rodadaAtual = rodadasTotais-1;
            	}else{
            		somRoleta.play();
                    var indiceSlotAleatorio = Math.floor(Math.random() * slots.length);
                    var slotEscolhido = slots[indiceSlotAleatorio];
            	}
                slotEscolhido.style.backgroundColor = '#3498db';
            }else	
            	botaoGirar = botaoOnOff(botaoGirar, false);
            

            rodadaAtual++;

            if (rodadaAtual === rodadasTotais) {
                clearInterval(intervaloGiro);
                somRoleta.pause();
                if(slots.length > 1){
                	if(slots.length != 1)
                		setTimeout(function() {imprimeResultadoAtualizaList(slotEscolhido, true)}, 500);
                	else
                		imprimeResultadoAtualizaList(slotEscolhido, true);
                }else
                	setTimeout(function() {imprimeResultadoAtualizaList(slotEscolhido, false)}, 500);
            }
        }, 200);
        
        function botaoOnOff(botao, ligar){
        	if(ligar == false){
        		botao.disabled = true;
            	botao.style.pointerEvents = 'none';
            	botao.style.background = 'gray';
        	}else{
        		botao.disabled = false;
            	botao.style.pointerEvents = 'auto';
            	botao.style.background = '#3498db';
        	}
        	
        	return botao;
        }
        
        function imprimeResultadoAtualizaList(slotEscolhido, ligarBotao){
        	alert("Resultado: " + slotEscolhido.textContent); 
        	slotEscolhido.style.backgroundColor = 'gray';
            slotEscolhido.classList.add('disabled');
            atualizarSlotsDisponiveis();
            botaoGirar = botaoOnOff(botaoGirar, ligarBotao);
        }
    }

    var botaoGirar = document.getElementById('botaoGirar');
    botaoGirar.addEventListener('click', girarRoleta);
    </script>
</body>
</html>