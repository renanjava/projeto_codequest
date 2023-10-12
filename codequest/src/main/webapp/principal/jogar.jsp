<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CodeQuest Game</title>
	<link rel="icon" href="/icon/codequest.ico" type="image/x-icon">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
	<jsp:include page="arte.jsp"></jsp:include>
    <style type="text/css">
        :root {
            --cor-primaria: #3498db;
            --cor-secundaria: #2ecc71;
            --cor-texto: #ffffff;
            --cor-fundo: #34495e;
        }

        body {
            font-family: Arial, sans-serif;
            background-color: var(--cor-fundo);
            color: var(--cor-texto);
        }

        .form-container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .card {
        	top: 1px;
            width: 100%;
            max-width: 400px; /* Defina o tamanho máximo do card conforme necessário */
        }

        .card-header {
            background-color: #3498DB;
            color: #FFFFFF;
        }

        .card-body {
            background-color: #2980B9;
            color: #FFFFFF;
        }
    </style>
</head>

<body>
    <div class="form-container">
        <div class="card">
            <div class="card-header">
                Início CodeQuest
            </div>
            <div class="card-body">
                <form action="ServletIniciar" method="post">
                    <div class="mb-3">
                        <label for="nome" class="form-label">Nome:</label>
                        <input type="text" class="form-control" id="nome" placeholder="Digite seu nome de usuário"
                            required>
                    </div>
                    <div class="mb-3">
                        <label for="email" class="form-label">Email:</label>
                        <input type="email" class="form-control" id="email" placeholder="Digite seu email"
                            required>
                    </div>
                    <button type="submit" class="btn btn-primary">Jogar</button>
                </form>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>