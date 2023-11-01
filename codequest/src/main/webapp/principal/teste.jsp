<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Roleta de Texto</title>
<style type="text/css">
body {
  font-family: Arial, sans-serif;
  background-color: #f2f2f2;
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh;
  margin: 0;
}

.roleta {
  display: flex;
  background-color: #fff;
  padding: 20px;
  border-radius: 10px;
  box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
  cursor: pointer; /* Adicione este estilo para indicar a seleção */
}

.slot {
  font-size: 24px;
  margin: 10px;
  padding: 10px 20px;
  border: 1px solid #ccc;
  border-radius: 5px;
  text-align: center;
  transition: background-color 0.3s ease-in-out;
}

#botaoGirar {
  margin-top: 20px;
  padding: 10px 20px;
  font-size: 18px;
  background-color: #3498db;
  border: none;
  color: #fff;
  border-radius: 5px;
  cursor: pointer;
  transition: background-color 0.3s ease-in-out;
}

#botaoGirar:hover {
  background-color: #2980b9;
}

.slot:hover {
  background-color: #f1f1f1;
}

</style>
</head>
<body>
    <div class="roleta">
        <div class="slot">Interface</div>
        <div class="slot">Enum</div>
        <div class="slot">Exception</div>
        <div class="slot">Herança</div>
        <div class="slot">Polimorfismo</div>
    </div>
    	<button id="botaoGirar">Girar</button>

    <audio id="somRoleta" src="<%= request.getContextPath() %>/audio/roulette_sound.mp3"></audio>

    <script>

    var slots = Array.from(document.querySelectorAll('.slot'));

    function atualizarSlotsDisponiveis() {
        slots = slots.filter(function(slot) {
            return !slot.classList.contains('disabled') && !slot.disabled;
        });
    }

    function spinRoulette() {
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
            		somRoleta.play(); // Toca o som da roleta
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
    botaoGirar.addEventListener('click', spinRoulette);
    </script>
</body>
</html>
