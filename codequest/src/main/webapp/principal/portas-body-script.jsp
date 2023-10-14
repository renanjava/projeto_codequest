<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	let contadorPortas = 0;
	let contadorRespostas = 0;	
	let contadorDesafios = 0;
	
        function alternarPorta(id) {
            document.getElementById("porta"+id).src = "icon/aberta.png";
            document.getElementById("botao"+id).disabled = true;
            
            contadorPortas++;
            atualizarProgresso(contadorPortas, 160, 'Portas');
            
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
        		
        		if(contadorRespostas == 1){
        			atualizarProgresso(contadorRespostas, 1, 'CJunior');
        			atualizarProgresso(contadorRespostas, 20, 'CPleno');
        			atualizarProgresso(contadorRespostas, 40, 'CSenior');
                }
        		
        		atualizarProgresso(contadorRespostas, 40, 'Respostas');
                
                
        	}
        	fecharModal('respostasModal');
        }
 
        function atualizarProgresso(cont, valorMaximoPorcentagem, id){
        	document.querySelector('#cont'+id).textContent = cont;
            
            document.querySelector('#progressbar'+id).textContent = calcularPorcentagem(cont, valorMaximoPorcentagem)+"%";
            
            var progressoRespostasElement = document.querySelector('#progressbar'+id);
            var valorPorcentagem = parseFloat(progressoRespostasElement.textContent);
            document.getElementById('progressbar'+id).style.width = valorPorcentagem + "%";
        }

</script>