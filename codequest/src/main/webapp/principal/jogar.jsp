<!DOCTYPE html>
<html lang="pt-br">

<head>
	<jsp:include page="/principal/title-and-favicon.jsp"></jsp:include>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
	<jsp:include page="arte.jsp"></jsp:include>
    <style type="text/css">

        body {
            font-family: Arial, sans-serif;
        }

        .form-container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .card {
        	top: -23%;
            width: 100%;
            max-width: 400px;
        }

        .card-header {
            background-color: #3498DB;
            color: #FFFFFF;
        }

        .card-body {
            background-color: #2980B9;
            color: #FFFFFF;
        }
        .btn-primary{
        	background-color: black;
        	color: white;
        }
    </style>
</head>

<body>
    <div class="form-container">
        <div class="card">
            <div class="card-header">
                Entrar no Jogo
            </div>
            <div class="card-body">
                <form action="ServletIniciar" method="post">
                    <div class="mb-3">
                        <label for="nome" class="form-label">Nome:</label>
                        <input type="text" class="form-control" name="campoNome" placeholder="Digite seu nome de usuário"
                            required>
                    </div>
                    <div class="mb-3">
                        <label for="email" class="form-label">Email:</label>
                        <input type="email" class="form-control" name="campoEmail" placeholder="Digite seu email"
                            required>
                    </div>
                    <div class="mb-3">
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="campoGenero" id="masculino" value="masculino" required>
                            <label class="form-check-label" for="masculino">
                                Masculino
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="campoGenero" id="feminino" value="feminino" required>
                            <label class="form-check-label" for="feminino">
                                Feminino
                            </label>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-primary">Jogar</button>
                </form>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
