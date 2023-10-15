<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	let contadorPortas = 0;
	let contadorRespostas = 0;	
	let contadorDesafios = 0;
	let numerosDesafioED = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
	
        function alternarPorta(id) {
            document.getElementById("porta"+id).src = "icon/aberta.png";
            document.getElementById("botao"+id).disabled = true;
            
            contadorPortas++;
            atualizarProgresso(contadorPortas, 160, 'Portas');
            
            if(verificarIdPortaSorteada(id))
            	if(id == 19){
            		mostrarModal('myModalDesafio');
            		
            		var modal = document.getElementById("myModalDesafio");
            	    var buttonContainer = document.getElementById("buttonDesafio");
            	    
            	    modal.style.textAlign = 'center';

            	    for (var i = 1; i <= 20; i++) {
            	        var button = document.createElement("button");
            	        button.style.fontSize = '20px';
            	        button.style.padding = '15px 30px';
            	        button.style.width = '150px';
            	        button.style.height = '50px'
            	        button.style.fontFamily = 'Courier, monospace';
            	        button.style.fontWeight = 'bold';
            	        
            	        do
            	        	var indiceArray = Math.floor(Math.random() * 20);
            	        while(numerosDesafioED[indiceArray] == 99)

            	        button.innerText = numerosDesafioED[indiceArray];
            	        buttonContainer.appendChild(button);
            	        numerosDesafioED[indiceArray] = 99;

            	        if (i % 5 === 0) {
            	            buttonContainer.appendChild(document.createElement("br"));
            	        }
            	        var cont = 15;
            	        iniciarContagem(cont);

            	        function atualizarCampo(cont) {
            	            return new Promise(function(resolve, reject) {
            	            	document.querySelector('#campoHeadDesafio').textContent = 
        	                    	(cont < 10 ? '0:0' + cont.toString() : '0:' + cont.toString());
            	            	
            	                setTimeout(function() {
            	                    resolve();
            	                }, 1000);
            	            });
            	        }

            	        function iniciarContagem(cont) {
            	            if (cont >= 0) {
            	                atualizarCampo(cont).then(function() {
            	                    iniciarContagem(cont-1);
            	                });
            	            }else
            	            	fecharModal('myModalDesafio')
            	        }
            	        	
            	        
            	    }
            	}else
            		mostrarModal('respostasModal');
        }

    	function mostrarConquista(mensagem){
    		document.getElementById('popUpConquista').style.display = 'block';
    		document.querySelector('#campoConquista').textContent = 'Agora você é um '+mensagem;
    		setTimeout(function() {
    			document.getElementById('popUpConquista').style.display = "none";
    			}, 2000);
    	}
        
        function calcularPorcentagem(numero, total) {
            return ((numero / total) * 100);
        }
        
        function verificarIdPortaSorteada(id){
        	if(id == 20 || id == 19)
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
        			mostrarConquista('Consultor Júnior');
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