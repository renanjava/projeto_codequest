<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	let contadorPortas = 0;
	let progressoPortas = 0;
	let contadorRespostas = 0;
	let progressoRespostas = 0;
	
        function alternarPorta(id) {
            document.getElementById("porta"+id).src = "icon/aberta.png";
            document.getElementById("botao"+id).disabled = true;
            
            contadorPortas++;
            document.querySelector('.contador').textContent = contadorPortas;
            
            document.querySelector('.progresso')
            	.textContent = calcularPorcentagem(contadorPortas, 160)+"%";
            
            var progressoPortasElement = document.querySelector('.progresso');
            var valorPorcentagem = parseFloat(progressoPortasElement.textContent);
            document.getElementById("progressbarPortas").style.width = valorPorcentagem + "%";
            
            if(verificarIdPortaSorteada(id))
            	mostrarModal('perguntasModal');
        }
        
        function calcularPorcentagem(numero, total) {
            return ((numero / total) * 100);
        }
        
        function verificarIdPortaSorteada(id){
        	if(id == 20)
        		return true;	
        	return false;
        }
        
        function verificarResposta(id){
        	if(id == "resposta3"){
        		contadorRespostas++;
                document.querySelector('.contadorPerguntas').textContent = contadorRespostas;
                
                document.querySelector('.progressoPerguntas')
                	.textContent = calcularPorcentagem(contadorRespostas, 160)+"%";
                
                var progressoRespostasElement = document.querySelector('.progressoPerguntas');
                var valorPorcentagem = parseFloat(progressoRespostasElement.textContent);
                document.getElementById("progressbarPerguntas").style.width = valorPorcentagem + "%";
        	}
        	fecharModal('perguntasModal');
        }
</script>