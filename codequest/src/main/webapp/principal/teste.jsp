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

#spinButton {
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

#spinButton:hover {
  background-color: #2980b9;
}

.slot:hover {
  background-color: #f1f1f1;
}

</style>
</head>
<body>
    <div class="roleta">
        <div class="slot" enabled>Interface</div>
        <div class="slot" enabled>Enum</div>
        <div class="slot" enabled>Exception</div>
        <div class="slot" enabled>Herança</div>
        <div class="slot" enabled>Polimorfismo</div>
    </div>
    	<button id="spinButton">Girar</button>

    <audio id="rouletteSound" src="<%= request.getContextPath() %>/audio/roulette_sound.mp3"></audio>

    <script>

    var slots = Array.from(document.querySelectorAll('.slot'));

    function atualizarSlotsDisponiveis() {
        slots = slots.filter(function(slot) {
            return !slot.classList.contains('disabled') && !slot.disabled;
        });
    }

    function spinRoulette() {
        var spinButton = document.getElementById('spinButton');
        var rouletteSound = document.getElementById('rouletteSound');
        spinButton = botaoOnOff(spinButton, false);

        var rounds = 15; // Número de rounds antes de parar
        var currentRound = 0;

        var spinInterval = setInterval(function() {
            slots.forEach(function(slot) {
                slot.style.backgroundColor = '#fff'; // Reinicia a cor de fundo de todos os slots
            });
            

            if (slots.length >= 1) {
            	if(slots.length == 1){
            		var selectedSlot = slots[0];
            		currentRound = rounds-1;
            	}else{
            		rouletteSound.play(); // Toca o som da roleta
                    var randomSlotIndex = Math.floor(Math.random() * slots.length);
                    var selectedSlot = slots[randomSlotIndex];
            	}
                selectedSlot.style.backgroundColor = '#3498db'; // Destaca o slot selecionado
            }else	
            	spinButton = botaoOnOff(spinButton, false);
            

            currentRound++;

            if (currentRound === rounds) {
                clearInterval(spinInterval);
                rouletteSound.pause(); // Pausa o som da roleta
                if(slots.length > 1){
                	if(slots.length != 1)
                		setTimeout(function() {imprimeResultadoAtualizaList(selectedSlot, true)}, 500);
                	else
                		imprimeResultadoAtualizaList(selectedSlot, true);
                }else
                	setTimeout(function() {imprimeResultadoAtualizaList(selectedSlot, false)}, 500);
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
        
        function imprimeResultadoAtualizaList(selectedSlot, ligarBotao){
        	alert("Resultado: " + selectedSlot.textContent); 
        	selectedSlot.style.backgroundColor = 'gray';
            selectedSlot.classList.add('disabled');
            atualizarSlotsDisponiveis();
            spinButton = botaoOnOff(spinButton, ligarBotao);
        }
    }

    var spinButton = document.getElementById('spinButton');
    spinButton.addEventListener('click', spinRoulette);
    </script>
</body>
</html>
