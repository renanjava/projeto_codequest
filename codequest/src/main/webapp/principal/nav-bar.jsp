<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<head>
<jsp:include page="head.jsp"></jsp:include>
<jsp:include page="barra-progresso-style.jsp"></jsp:include>
<style type="text/css">
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

.respostasModal {
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

.modal-content-respostas {
    background-color: black;
    margin: 15% auto;
    padding: 20px;
    border: 1px solid #888;
    width: 80%;
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

.navigation-buttons {
    display: flex;
}

.navigation-btn {
    background-color: white;
    color: black;
    border: none;
    border-radius: 5px;
    padding: 10px 20px;
    margin-left: 10px;
    cursor: pointer;
    font-size: 13px;
    font-family: 'Courier, monospace';
    font-weight: 'bold';
}

.navigation-btn:hover {
    background-color: #007bff;
    color: white;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    transform: scale(1.1);
}
</style>
</head>
<body>
	<nav class="navbar">
        <div class="navbar-container">
        
        <div class="navigation-buttons">
    		<form action="<%= request.getContextPath()%>/TrocarFase" method="post">
		        <button class="navigation-btn" name="buttonId" value="Anterior" id="anterior" enabled>Anterior</button>
		        <button class="navigation-btn" name="buttonId" value="Proximo" id="proximo" enabled>Próximo</button>
		        <input type="hidden" id="portasAbertas" name="portasAbertas">
    		</form>
		</div>
	
	    <jsp:include page="bloquear-botoes.jsp"></jsp:include>
	    
	    
           	<div class="logo">
                <a href="#" id="tituloSala"></a>
            </div>
            
            <ul class="nav-links">
            	<li><a id="perfilLink" onclick="mostrarModal('perfilModal')">Perfil</a></li>
                <li><a id="progressoLink" onclick="mostrarModal('progressoModal')">Progresso</a></li>
                <li><a href="#">Vidas</a></li>
                <li><a href="<%= request.getContextPath() %>/Login?acao=Logout"><i
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
        		<img id="fotoPerfil" src="<%= request.getContextPath()%>/icon/fechada.png" alt="Foto de Perfil">
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
            <h2>Portas abertas: <div class="contador" id="contPortas">0</div>/160</h2>
            <div class="barra-progresso">
        		<div class="progresso" id="progressbarPortas"></div>
    		</div>
    		<h2>Respostas acertadas: <div class="contador" id="contRespostas">0</div>/40</h2>
            <div class="barra-progresso">
        		<div class="progresso" id="progressbarRespostas"></div>
    		</div>
    		<h2>Desafios resolvidos: <div class="contador" id="contDesafios">0</div>/4</h2>
            <div class="barra-progresso">
        		<div class="progresso" id="progressbarDesafios"></div>
    		</div>
    		<p style="padding: 1px;"></p>
    		<h2>Conquistas</h2>
    		<p style="padding: 1px;"></p>
    		<h2>Consultor Júnior - Respostas acertadas: <div class="contador" id="contCJunior">0</div>/10</h2>
            <div class="barra-progresso">
        		<div class="progresso" id="progressbarCJunior"></div>
       		</div>
       		<h2>Consultor Pleno - Respostas acertadas: <div class="contador" id="contCPleno">0</div>/20</h2>
            <div class="barra-progresso">
        		<div class="progresso" id="progressbarCPleno"></div>
       		</div>
       		<h2>Consultor Sênior - Respostas acertadas: <div class="contador" id="contCSenior">0</div>/40</h2>
            <div class="barra-progresso">
        		<div class="progresso" id="progressbarCSenior"></div>
       		</div>
    		<p style="padding: 1px;"></p>
    		<h2>Solucionador Júnior - Desafios resolvidos: <div class="contador" id="contSJunior">0</div>/1</h2>
            <div class="barra-progresso">
        		<div class="progresso" id="progressbarSJunior"></div>
       		</div>
       		<h2>Solucionador Pleno - Desafios resolvidos: <div class="contador" id="contSPleno">0</div>/2</h2>
            <div class="barra-progresso">
        		<div class="progresso" id="progressbarSPleno"></div>
       		</div>
       		<h2>Solucionador Sênior - Desafios resolvidos: <div class="contador" id="contSSenior">0</div>/4</h2>
            <div class="barra-progresso">
        		<div class="progresso" id="progressbarSSenior"></div>
       		</div>
        </div>
    </div>
</div>
    
   <script type="text/javascript">
    document.addEventListener("DOMContentLoaded", function() {
        var generoJogador = '<%=request.getSession().getAttribute("genero-jogador")%>';

        if (generoJogador == "masculino") 
            document.getElementById("fotoPerfil").src = "<%= request.getContextPath()%>/icon/masculino.jpg";
        else
            document.getElementById("fotoPerfil").src = "<%= request.getContextPath()%>/icon/feminino.jpg";
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