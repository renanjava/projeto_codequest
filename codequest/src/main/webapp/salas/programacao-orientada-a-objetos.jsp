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
    padding-top: 30px;
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

.slot-conceito{
    width: 200px;
    margin-bottom: 10px;
    background-color: white;
    font-size: 20px;
    margin: 5px;
    padding: 10px 20px;
    border: 1px solid black;
    text-align: center;
    border-radius: 10px;
    box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.3);
    transition: all 0.3s ease-in-out;
}

.slot-botao{
	width: 200px;
    margin-bottom: 10px;
    background-color: black;
    font-size: 20px;
    margin: 5px;
    padding: 10px 20px;
    border: 1px solid white;
    text-align: center;
    border-radius: 10px;
    color: white;
    transition: all 0.3s ease-in-out;
}

.botaoGirar {
  font-family: 'Courier, monospace';
  margin-top: 20px;
  padding: 10px 20px;
  font-size: 23px;
  background-color: black;
  border-radius: 5px;
  color: white;
  border: 1px solid white;
  transition: background-color 0.3s ease-in-out, color 0.3s ease-in-out;
}

#botaoGirar:hover{
	background-color: white;
    color: black;
}

.slot-botao:hover {
  background-color: gray;
  border: 1px solid #2980b9;
}

.slot-escolhido {
    transform: scale(1.05);
    transition: transform 0.3s ease-in-out;
    color: white;
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
  				<button class="botaoGirar" id="botaoGirar">SORTEAR</button>
			</div>
	        <div class="roleta" style="display: flex; flex-direction: row; align-items: center;">
	            <div class="slot-conceito" id="slotConceito1"></div>
	            <div class="slot-conceito" id="slotConceito2"></div>
	            <div class="slot-conceito" id="slotConceito3"></div>
	            <div class="slot-conceito" id="slotConceito4"></div>
	            <div class="slot-conceito" id="slotConceito5"></div>
	        </div>
	        <div class="roleta" style="display: flex; flex-direction: row; align-items: center; justify-content: space-between; margin-top: 120px;">
	            <button class="slot-botao" id="slotBotao1" disabled></button>
	            <button class="slot-botao" id="slotBotao2" disabled></button>
	            <button class="slot-botao" id="slotBotao3" disabled></button>
	            <button class="slot-botao" id="slotBotao4" disabled></button>
	            <button class="slot-botao" id="slotBotao5" disabled></button>
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
    
    let corConceitosSlots = ["teal",
    						 "rebeccapurple",
    						 "#FFD700",
    						 "#0B7000",
    						 "#FF4500"];

	let botoesSlots = ["Semelhante ao conceito de Header onde só tem a assinatura do método", 
					   "Métodos com o mesmo nome, porém, com comportamentos diferentes", 
					   "Nos possibilita tratar falhas inesperadas em tempo de execução", 
					   "Diminui a repetição de código por declarar os mesmo atributos",
					   "São constantes que podemos associar comportamentos com métodos"];

    var slots = Array.from(document.querySelectorAll('.slot-conceito'));
    inserirTextoAleatorio(conceitosSlots,botoesSlots);
    
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
    		document.getElementById('slotConceito'+i).style.backgroundColor = corConceitosSlots[posicoesAleatoriasConceitos[i-1]-1];
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
        	var slotEscolhido;
            if (slots.length >= 1) {
            	if(slots.length == 1){
            		slotEscolhido = slots[0];
            		rodadaAtual = rodadasTotais-1;
            	}else{
            		somRoleta.play();
                    var indiceSlotAleatorio = Math.floor(Math.random() * slots.length);
                    slotEscolhido = slots[indiceSlotAleatorio];  
            	}
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
            }else
            	setTimeout(function() {slotEscolhido.classList.remove('slot-escolhido')}, 200);
            
        }, 200);
        
        function botaoOnOff(botao, ligar){
        	if(ligar == false){
        		botao.disabled = true;
            	botao.style.pointerEvents = 'none';
        	}else{
        		botao.disabled = false;
            	botao.style.pointerEvents = 'auto';
        	}
        	
        	return botao;
        }
        
        function imprimeResultadoAtualizaList(slotEscolhido, ligarBotao){
        	conceito = slotEscolhido.textContent;
        	alert("Selecione a definição do conceito: \"" +conceito+ "\""); 
        	slotEscolhido.classList.add('disabled');
        	botaoGirar.disabled = true;
            atualizarSlotsDisponiveis();
            slotEscolhido.classList.add('slot-escolhido');
            cor = slotEscolhido.style.backgroundColor;
            
            for(i = 1; i <= 5; i++){
            	botao = document.getElementById('slotBotao'+i);
            	estilo = window.getComputedStyle(botao);
            	corBotao = estilo.backgroundColor;
            	
            	if(corBotao == 'rgb(0, 0, 0)')
            		botao.disabled = false;
            	
            	console.log("cor: "+corBotao);
            	
            	if(corBotao != 'rgb(0, 0, 0)')
            		continue;
            	
            	botao.addEventListener('click', (function(cor, botao, ligarBotao, slotEscolhido) {
                    return function() {
                        botao.style.backgroundColor = cor;
                        botao.style.color = 'black';
                        botao.disabled = true;
                        botaoGirar = botaoOnOff(botaoGirar, ligarBotao);
                        slotEscolhido.classList.remove('slot-escolhido');
                        
                        cont = 0;
                        do{
                        	cont++;
                        	botaoBloquear = document.getElementById('slotBotao'+cont);
                        	if(botaoBloquear.disabled == true)
                        		continue;
                        	else
                        		botaoBloquear.disabled = true;
                        }while(cont != 5);
                    };
                })(cor, botao, ligarBotao, slotEscolhido));
            }
        }
    }
	
    var botaoGirar = document.getElementById('botaoGirar');
    botaoGirar.addEventListener('click', girarRoleta);
    </script>
</body>
</html>