<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	let contador = 0;
	let progresso = 0;
	
        function alternarPorta(id) {
            document.getElementById("porta"+id).src = "icon/aberta.png";
            document.getElementById("botao"+id).disabled = true;
            
            contador++;
            document.querySelector('.contador').textContent = contador;
            
            document.querySelector('.progresso')
            	.textContent = calcularPorcentagem(contador, 160)+"%";
            
            var progressoElement = document.querySelector('.progresso');
            var valorPorcentagem = parseFloat(progressoElement.textContent);
            document.getElementById("progressbar").style.width = valorPorcentagem + "%";
        }
        
        function calcularPorcentagem(numero, total) {
            return ((numero / total) * 100);
        }
</script>