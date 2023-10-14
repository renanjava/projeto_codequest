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
            document.querySelector('#contPortas').textContent = contadorPortas;
            
            document.querySelector('#progressbarPortas')
            	.textContent = calcularPorcentagem(contadorPortas, 160)+"%";
            
            var progressoPortasElement = document.querySelector('#progressbarPortas');
            var valorPorcentagem = parseFloat(progressoPortasElement.textContent);
            document.getElementById("progressbarPortas").style.width = valorPorcentagem + "%";
            
            if(verificarIdPortaSorteada(id))
            	mostrarModal('respostasModal');
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
                document.querySelector('#contRespostas').textContent = contadorRespostas;
                
                document.querySelector('#progressbarRespostas')
                	.textContent = calcularPorcentagem(contadorRespostas, 40)+"%";
                
                var progressoRespostasElement = document.querySelector('#progressbarRespostas');
                var valorPorcentagem = parseFloat(progressoRespostasElement.textContent);
                document.getElementById("progressbarRespostas").style.width = valorPorcentagem + "%";
        	}
        	fecharModal('respostasModal');
        }
</script>