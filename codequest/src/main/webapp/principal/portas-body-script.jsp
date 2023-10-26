
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><script>
	let contadorPortas = <%= session.getAttribute("portas-jogador") %>;
	let contadorRespostas = <%= session.getAttribute("respostas-jogador") %>;	
	let contadorDesafios = <%= session.getAttribute("desafios-jogador") %>;
	let portaDesafio = <%= session.getAttribute("id-desafio-destino") %>;
	let perguntasSala = "<%= session.getAttribute("perguntas-destino") %>";
	let respostasSala = "<%= session.getAttribute("respostas-destino") %>"
	let listaIdPortas = [];
	let posicoesPortas;
	let botoesClicadosDesafio = 0;
	let numerosDesafioED = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
	let numerosAuxiliar = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
	let respostaCerta = '';
	
	function atualizarDadosHidden(){
		document.getElementById("idPortas").value = listaIdPortas.join(",");
	}
	
   function persistirProgresso(){
	   perguntasSala = perguntasSala.split(",");
	   console.log("perguntas:" + perguntasSala);
	   
	   respostasSala = respostasSala.replace("[","");
	   respostasSala = respostasSala.replace("]","");
	   console.log("respostas:" + respostasSala);
      	document.getElementById("portasAbertas").value = contadorPortas;
      	document.getElementById("respostasCertas").value = contadorRespostas;
      	document.getElementById("desafiosResolvidos").value = contadorDesafios;
      	
      	persistirPortasAbertas = "<%= session.getAttribute("id-portas-destino") %>";
      	posicoesPortas = "<%= session.getAttribute("sorteio-destino") %>"
      	posicoesPortas = posicoesPortas.replace("[","");
      	posicoesPortas = posicoesPortas.replace("]","");
      	posicoesPortas = posicoesPortas.replaceAll(" ","");
      	posicoesPortas = posicoesPortas.split(",");
      	console.log(posicoesPortas)
      	console.log(persistirPortasAbertas)
      	console.log('desafio: '+portaDesafio)
      	
      	if(persistirPortasAbertas != " "){
      		persistirPortasAbertas = persistirPortasAbertas.split(",");
      		for(i = 0; i < persistirPortasAbertas.length; i++){
      			if(persistirPortasAbertas[i] != ""){
      				console.log(persistirPortasAbertas[i])
          			document.getElementById("porta"+persistirPortasAbertas[i]).src = "<%= request.getContextPath()%>/icon/aberta.png";
               		document.getElementById("botao"+persistirPortasAbertas[i]).disabled = true;
      			}
      		}
      			
      	}
      		      	
		if(contadorPortas > 0)
	       	atualizarProgresso(contadorPortas, 160, 'Portas');
		
		if(contadorRespostas > 0){
			atualizarProgresso(contadorRespostas, 40, 'Respostas');
			barraProgressoConquistasConsultor(false);
		}
			
		if(contadorDesafios > 0){
			atualizarProgresso(contadorDesafios, 4, 'Desafios');
			barraProgressoConquistasSolucionador(false);
		}
   }
	
   function alternarPorta(id) {
       	document.getElementById("porta"+id).src = "<%= request.getContextPath()%>/icon/aberta.png";
       	document.getElementById("botao"+id).disabled = true;
       	
       	listaIdPortas.push(id);
       
       	contadorPortas++;
       	atualizarProgresso(contadorPortas, 160, 'Portas');
       	document.getElementById("portasAbertas").value = contadorPortas;
       
		if(verificarPortaSorteada(id)){
			if(portaDesafio == id){
				mostrarModal('myModalInstrucoes');
				document.getElementById("campoHeadInstrucoes").style.color = 'white';
				document.querySelector('#campoHeadInstrucoes').textContent = 
					'Instruções: Você deve ordenar os números em '+
					'ordem crescente antes do tempo acabar';
					
				var botaoComecar = document.getElementById("botaoComecar");
				botaoComecar = estruturaBotao(botaoComecar);
				
				botaoComecar.addEventListener("click", function() {
					fecharModal('myModalInstrucoes');
		       		mostrarModal('myModalDesafio');
		       		
		       		var modal = document.getElementById("myModalDesafio");
		       	    var buttonContainer = document.getElementById("buttonDesafio");
		       	    
		       	    modal.style.textAlign = 'center';
		
		       	    for (var i = 1; i <= 20; i++) {
		       	    	(function(i) {
			       	        var button = document.createElement("button");
			       	        button.id = 'botaoDesafio' + i;
			       	     	button = estruturaBotao(button);
			       	        
			       	        do
			       	        	var indiceArray = Math.floor(Math.random() * 20);
			       	        while(numerosAuxiliar[indiceArray] == 99)
			
			       	        button.innerText = numerosAuxiliar[indiceArray];
			       	        buttonContainer.appendChild(button);
			       	        numerosAuxiliar[indiceArray] = 99;
			
			       	        if (i % 5 === 0) 
			       	            buttonContainer.appendChild(document.createElement("br"));
			       	        
			       	        button.addEventListener("click", function() {
			       	        	var verificaIndiceVazio = 0;
			       	        	
			       	        	while(numerosAuxiliar[verificaIndiceVazio] != 99)
			       	        		verificaIndiceVazio++;
			       	        	
			       	        	numerosAuxiliar[verificaIndiceVazio] = document.getElementById("botaoDesafio"+i).innerText;
			       	        	
			       	        		
			       	        	botoesClicadosDesafio++;
			       	        	document.getElementById("botaoDesafio"+i).disabled = true;
			       			});
		       			})(i);
		       			}
					var cont = 15;
		       		iniciarContagem(cont);
				});
			}else{
				var perguntaEscolhida = parseInt(Math.random() * 10);
				var pergunta = perguntasSala[perguntaEscolhida];
				var respostas = respostasSala.split(",");
				
				respostaCerta = respostas[0];
				atribuirRandomizarCampos(pergunta, respostas);
	    		mostrarModal('respostasModal');	
			}
		}
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

	function iniciarContagem(cont) {
		
		if (cont >= 0 && botoesClicadosDesafio < 20) {
		    atualizarCampo(cont).then(function() {
		        iniciarContagem(cont-1);
		    });
		}else{
			fecharModal('myModalDesafio');
			mostrarModal('resultadoDesafio');
			document.getElementById('campoResultadoDesafio').style.color = 'black';
    	            	
	  	if(verificaVetores()){
	  		document.querySelector('#campoResultadoDesafio').textContent = 'Certo!';
	      	document.getElementById('campoResultadoDesafio').style.backgroundColor = 'green';
	      	
	      	contadorDesafios++;
	      	atualizarProgresso(contadorDesafios, 4, 'Desafios');
	      	document.getElementById("desafiosResolvidos").value = contadorDesafios;

	      	barraProgressoConquistasSolucionador(true);
	  	}else{
	  		document.querySelector('#campoResultadoDesafio').textContent = 'Errado!';
	  		document.getElementById('campoResultadoDesafio').style.backgroundColor = 'red';
	  	}
	  	
	  	setTimeout(function() {
	  		fecharModal('resultadoDesafio');
		}, 2000);
		}
    }

	function verificaVetores(){
	   	var contValoresIguais = 0;
	   	
	   	for(i = 0;i < 20;i++){
	   		if(numerosAuxiliar[i] == numerosDesafioED[i])
	   			contValoresIguais++;
	   	}
	   	
	   	if(contValoresIguais == 20) 
	   		return true;
	   	else
	   		return false;
   }
	
	function barraProgressoConquistasConsultor(conquista){
		
		if(contadorRespostas < 11){
			
			if(contadorRespostas == 10 && conquista == true)
				mostrarConquista('Consultor Júnior');
			
			atualizarProgresso(contadorRespostas, 10, 'CJunior');
			atualizarProgresso(contadorRespostas, 20, 'CPleno');
			atualizarProgresso(contadorRespostas, 40, 'CSenior');
		
		}else if(contadorRespostas > 10 && contadorRespostas < 21){
			
			if(contadorRespostas == 20 && conquista == true)
				mostrarConquista('Consultor Pleno');
			
			atualizarProgresso(10, 10, 'CJunior');
			atualizarProgresso(contadorRespostas, 20, 'CPleno');
			atualizarProgresso(contadorRespostas, 40, 'CSenior');
			
		}else{
			
			if(contadorRespostas == 40 && conquista == true)
				mostrarConquista('Consultor Sênior');
			
			atualizarProgresso(10, 10, 'CJunior');
			atualizarProgresso(20, 20, 'CPleno');
			atualizarProgresso(contadorRespostas, 40, 'CSenior');
		}
	}
	
	function barraProgressoConquistasSolucionador(conquista){
		
		if(contadorDesafios == 1 || contadorDesafios == 2){
			
			if(contadorDesafios == 1 && conquista == true)
				setTimeout(function() {
					mostrarConquista('Solucionador Júnior');
		        }, 2000);		
			if(contadorDesafios == 2 && conquista == true)
				setTimeout(function() {
					mostrarConquista('Solucionador Pleno');
		        }, 2000);
			
			atualizarProgresso(1, 1, 'SJunior');
			atualizarProgresso(contadorDesafios, 2, 'SPleno');
			atualizarProgresso(contadorDesafios, 4, 'SSenior');
			
		}else{
			
			if(contadorDesafios == 4 && conquista == true)
				setTimeout(function() {
					mostrarConquista('Solucionador Sênior');
		        }, 2000);
			
			atualizarProgresso(1, 1, 'SJunior');
			atualizarProgresso(2, 2, 'SPleno');
			atualizarProgresso(contadorDesafios, 4, 'SSenior');
			
		}
	}

	function mostrarConquista(mensagem){
		document.getElementById('popUpConquista').style.display = 'block';
		document.querySelector('#campoConquista').textContent = 'Agora você é um '+mensagem;
		setTimeout(function() {
			document.getElementById('popUpConquista').style.display = 'none';
			}, 2000);
	}
   
	function calcularPorcentagem(numero, total) {
    	return ((numero / total) * 100);
	}
   
	function verificarPortaSorteada(id) {
		for(var i = 0; i < posicoesPortas.length; i++){
			if(posicoesPortas[i] == id){
				posicoesPortas[i] = 99;
				return true;
			}
		}
		return false;
	}
   
	function verificarResposta(id){
		
		var querySelector = document.querySelector('#'+id).textContent;
	   	
		for(var i = 1; i <= 5; i++){
			document.getElementById("resposta"+i).style.backgroundColor = (document.querySelector('#resposta'+i).textContent == respostaCerta ? 'green' : 'red');
	       	document.getElementById("resposta"+i).disabled = true;
		}
	   	setTimeout(function() {
	   		if(querySelector == respostaCerta){
		   		
		   		contadorRespostas++;
		   		atualizarProgresso(contadorRespostas, 40, 'Respostas');
		      	document.getElementById("respostasCertas").value = contadorRespostas;
		   		
		      	barraProgressoConquistasConsultor(true);
		   	}
			fecharModal('respostasModal');
			for(var i = 1; i <= 5; i++){
				document.getElementById("resposta"+i).style.backgroundColor = 'blue';
		       	document.getElementById("resposta"+i).disabled = false;
			}
		}, 2000);
	}

	function atualizarProgresso(cont, valorMaximoPorcentagem, id){
	   	document.querySelector('#cont'+id).textContent = cont;
	       
	    document.querySelector('#progressbar'+id).textContent = calcularPorcentagem(cont, valorMaximoPorcentagem)+"%";
	       
	    var progressoRespostasElement = document.querySelector('#progressbar'+id);
	    var valorPorcentagem = parseFloat(progressoRespostasElement.textContent);
	    document.getElementById('progressbar'+id).style.width = valorPorcentagem + "%";
	}
	
	function estruturaBotao(botao){
		botao.style.fontSize = '20px';
	    botao.style.padding = '15px 30px';
	    botao.style.width = '150px';
	    botao.style.height = '50px'
	    botao.style.fontFamily = 'Courier, monospace';
	    botao.style.fontWeight = 'bold';
	   	
	    return botao;
	}
	
	function atribuirRandomizarCampos(pergunta, respostas){
		var posicoesAleatorias = [];
		document.querySelector('#campoPergunta').textContent = pergunta;
		
		while(posicoesAleatorias.length < respostas.length){
			var posicao = 0;
			
			do
				posicao = parseInt(Math.random() * 5)+1;
			while(posicoesAleatorias.includes(posicao));
			posicoesAleatorias.push(posicao);
		}
		
		for(var i = 1; i < posicoesAleatorias.length + 1; i++){
			document.querySelector('#campoResposta' + i).textContent = respostas[posicoesAleatorias[i - 1] - 1];
		}
	}
</script>