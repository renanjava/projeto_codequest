<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<head>
<jsp:include page="head.jsp"></jsp:include>
<jsp:include page="barra-progresso-style.jsp"></jsp:include>
<style type="text/css">
.contadorPerguntas,
.contador {
	display: inline;
}

.perfil {
    width: 130px;
    height: 130px;
    overflow: hidden;
    border-radius: 50%;
}

#fotoPerfil {
    width: 100%;
    height: 100%;
    object-fit: cover;
    display: inline;
}

.perguntasModal {
    display: none;
    position: fixed;
    z-index: 1;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    overflow: auto;
    background-color: rgba(0,0,0,0.4);
}

.modal-content-perguntas {
    background-color: black;
    margin: 15% auto;
    padding: 20px;
    border: 1px solid #888;
    width: 80%;
}

.closePerguntas {
    color: #aaa;
    float: right;
    font-size: 28px;
    font-weight: bold;
}

.closePerguntas:hover,
.closePerguntas:focus {
    color: black;
    text-decoration: none;
    cursor: pointer;
}

.options {
    margin-top: 20px;
}

.optionBtn {
    display: block;
    width: 100%;
    padding: 10px;
    margin-bottom: 10px;
    background-color: blue;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
}

.optionBtn:hover {
    background-color: gray;
}

</style>
</head>
<body>
	<nav class="navbar">
        <div class="navbar-container">
            <div class="logo">
                <a href="#">Sala de Estrutura de Dados</a>
            </div>
            <ul class="nav-links">
            	<li><a id="perfilLink" onclick="mostrarModal('perfilModal')">Perfil</a></li>
                <li><a id="progressoLink" onclick="mostrarModal('progressoModal')">Progresso</a></li>
                <li><a href="#">Vidas</a></li>
                <li><a href="<%= request.getContextPath() %>/ServletPrincipal?acao=Logout"><i
						class="ti-layout-sidebar-left"></i>Logout</a></li>
            </ul>
        </div>
    </nav>
    
    <div id="perfilModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="fecharModal('perfilModal')">&times;</span>
            <h2>Perfil</h2>
            <p style="padding: 1px;"></p>
            <div class="perfil" id="perfil">
        		<img id="fotoPerfil" src="icon/fechada.png" alt="Foto de Perfil">
    		</div>
            <h2>Nome: <%= request.getSession().getAttribute("nome-jogador") %></h2>
            <h2>Email: <%= request.getSession().getAttribute("email-jogador") %></h2>
        </div>
    </div>
    
    <div id="progressoModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="fecharModal('progressoModal')">&times;</span>
            <h2>Progresso</h2>
            <p style="padding: 1px;"></p>
            <h2>Portas abertas: <div class="contador">0</div>/160</h2>
            <div class="barra-progresso">
        		<div class="progresso" id="progressbarPortas"></div>
    		</div>
    		<h2>Perguntas acertadas: <div class="contadorPerguntas">0</div>/40</h2>
            <div class="barra-progresso">
        		<div class="progressoPerguntas" id="progressbarPerguntas"></div>
    		</div>
    		<h2>Desafios resolvidos: <div class="contador">0</div>/4</h2>
            <div class="barra-progresso">
        		<div class="progresso" id="progressbarDesafios"></div>
    		</div>
        </div>
    </div>
    
    <div id="perguntasModal" class="perguntasModal">
    <div class="modal-content-perguntas">
        <span class="closePerguntas" onclick="fecharModal('perguntasModal')">&times;</span>
        <h2>Pergunta:</h2>
        <p>Qual é a sua resposta?</p>
        <div class="options">
            <button id="resposta1" class="optionBtn" onclick="verificarResposta(id)">Resposta 1</button>
            <button id="resposta2" class="optionBtn" onclick="verificarResposta(id)">Resposta 2</button>
            <button id="resposta3" class="optionBtn" onclick="verificarResposta(id)">Resposta 3</button>
            <button id="resposta4" class="optionBtn" onclick="verificarResposta(id)">Resposta 4</button>
            <button id="resposta5" class="optionBtn" onclick="verificarResposta(id)">Resposta 5</button>
        </div>
    </div>
</div>
    
   <script type="text/javascript">
    document.addEventListener("DOMContentLoaded", function() {
        var generoJogador = '<%=request.getSession().getAttribute("genero-jogador")%>';
        
        console.log(generoJogador);

        if (generoJogador == "masculino") {
            document.getElementById("fotoPerfil").src = "<%= request.getContextPath()%>/icon/masculino.jpg";
        } else if (generoJogador.toLowerCase() == "feminino") {
            document.getElementById("fotoPerfil").src = "<%= request.getContextPath()%>/icon/feminino.jpg";
        } else {
        	document.getElementById("fotoPerfil").src = "<%= request.getContextPath()%>/icon/feminino.jpg";
        }
    });
</script>

    <script>
        function mostrarModal(id) {
            var modal = document.getElementById(id);
            modal.style.display = 'block';
        }

        function fecharModal(id) {
            var modal = document.getElementById(id);
            modal.style.display = 'none';
        }

        window.onclick = function(event) {
            var modais = document.getElementsByClassName('modal');
            for (var i = 0; i < modais.length; i++) {
                if (event.target === modais[i]) {
                    modais[i].style.display = 'none';
                }
            }
        }
    </script>
</body>