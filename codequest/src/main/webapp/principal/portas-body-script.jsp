
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><script>
	let contadorPortas = <%= session.getAttribute("portas-jogador") %>;
	let contadorRespostas = <%= session.getAttribute("respostas-jogador") %>;	
	let contadorDesafios = <%= session.getAttribute("desafios-jogador") %>;
	let portaDesafio = "<%= session.getAttribute("id-desafio-destino") %>";
	let perguntasSala = "<%= session.getAttribute("perguntas-destino") %>";
	let respostasSala = "<%= session.getAttribute("respostas-destino") %>";
	let listaIdPortas = [];
	let posicoesPortas;
	let respostaCerta = '';
	
	function atualizarDadosHidden(){
		document.getElementById("idPortas").value = listaIdPortas.join(",");
	}
	
   function persistirProgresso(){
	   perguntasSala = perguntasSala.split(",");
	   console.log(perguntasSala);
	   
	   respostasSala = respostasSala.split("|");
	   console.log(respostasSala);

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
				mostrarModal('modalInstrucoes');
				document.getElementById("campoHeadInstrucoes").style.color = 'white';
					
				var botaoComecar = document.getElementById("botaoComecar");
				botaoComecar = estruturaBotao(botaoComecar);
				
				botaoComecar.addEventListener("click", function() {
					fecharModal('modalInstrucoes');
		       		mostrarModal('modalDesafio');

				});
			}else{	
				var perguntaEscolhida = parseInt(Math.random() * perguntasSala.length);
				var pergunta = removerElemento(perguntaEscolhida, perguntasSala);
				console.log(respostasSala)
				var respostas = removerElemento(perguntaEscolhida, respostasSala);
				console.log(respostasSala)

				respostas = respostas.split(",");
				for(i = 0; i < respostas.length; i++)
			   		respostas[i] = respostas[i].replaceAll('-', ',');
				
				respostaCerta = respostas[0];
				atribuirRandomizarCampos(pergunta, respostas);
	    		mostrarModal('respostasModal');	
			}
		}
	}
   
   function removerElemento(perguntaEscolhida, destino) {
	    elementoRemovido = destino[perguntaEscolhida];
	    var listaAuxiliar = destino.slice(); 
	    listaAuxiliar.splice(perguntaEscolhida, 1); 
	    
	    if(destino == perguntasSala)
	    	perguntasSala = listaAuxiliar;
	    else
	    	respostasSala = listaAuxiliar;
	    
	    return elementoRemovido;
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
		let porcentagem = ((numero / total) * 100).toFixed(2);
	    return parseFloat(porcentagem);
	}
   
	function verificarPortaSorteada(id) {
		if(id == portaDesafio)
			return true;
		
		for(i = 0; i < posicoesPortas.length; i++){
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
		
		for(var i = 1; i < 5 + 1; i++){
			console.log(respostas[posicoesAleatorias[i - 1] - 1])
			document.querySelector('#campoResposta' + i).textContent = respostas[posicoesAleatorias[i - 1] - 1];
		}
	}
</script>