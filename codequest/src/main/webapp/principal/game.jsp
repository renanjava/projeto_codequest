<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CodeQuest Game</title>
	<link rel="icon" href="icon/codequest.ico" type="image/x-icon">
</head>
<body>
    <img id="porta" src="icon/fechada.png" alt="Porta Fechada">

    <p></p>
    <button id="botaoPorta" onclick="alternarPorta()" enabled>Abrir Porta</button>

    <script>
        function alternarPorta() {
            document.getElementById("porta").src = "icon/aberta.png";
            document.getElementById("botaoPorta").disabled = true;
        }
    </script>
</body>
</html>