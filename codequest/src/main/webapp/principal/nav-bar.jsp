<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<head>
<jsp:include page="head.jsp"></jsp:include>
<jsp:include page="barra-progresso-style.jsp"></jsp:include>
<style type="text/css">

.contador {
	display: inline;
}

</style>
</head>
<body>
	<nav class="navbar">
        <div class="navbar-container">
            <div class="logo">
                <a href="#">Sala de Programação Orientada a Objetos</a>
            </div>
            <ul class="nav-links">
                <li><a id="progressoLink" onclick="mostrarModal('progressoModal')">Progresso</a></li>
                <li><a id="perfilLink" onclick="mostrarModal('perfilModal')">Perfil</a></li>
                <li><a href="#">Vidas</a></li>
                <li><a href="<%= request.getContextPath() %>/ServletPrincipal?acao=Logout"><i
						class="ti-layout-sidebar-left"></i>Logout</a></li>
            </ul>
        </div>
    </nav>

    
    
    <div id="progressoModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="fecharModal('progressoModal')">&times;</span>
            <h2>Progresso</h2>
            
            <h2>Portas Abertas: <div class="contador">0</div>/160</h2>
            <div class="barra-progresso">
        		<div class="progresso" id="progressbar"></div>
    		</div>
        </div>
    </div>
    
    <div id="perfilModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="fecharModal('perfilModal')">&times;</span>
            <h2>Perfil</h2>
            <h2>Nome: <%= request.getSession().getAttribute("nome-jogador") %></h2>
            <h2>Email: <%= request.getSession().getAttribute("email-jogador") %></h2>
            <h2>Gênero: <%= request.getSession().getAttribute("genero-jogador") %></h2>
        </div>
    </div>

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