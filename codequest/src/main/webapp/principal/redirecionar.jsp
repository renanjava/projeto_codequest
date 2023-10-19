<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Redirecionando...</title>
  <script type="text/javascript">
  	var salasDisponiveis = ['estrutura-de-dados-i','programacao-orientada-a-objetos','banco-de-dados-ii','teste-e-qualidade-de-software'];
  	var salaEscolhida = salasDisponiveis.splice(Math.random() * salasDisponiveis.length, 1);
  	
    window.location.href = "salas/"+salaEscolhida+".jsp";
  </script>
</head>
<body>
  <p>Por favor, aguarde enquanto você está sendo redirecionado...</p>
</body>
</html>