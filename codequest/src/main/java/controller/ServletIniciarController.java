package controller;

import java.io.IOException;
import java.util.concurrent.atomic.AtomicInteger;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import listas.ListaSalas;
import model.ModelJogador;

@WebServlet(urlPatterns = {"/IniciaGame"})
public class ServletIniciarController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
       
    public ServletIniciarController() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ModelJogador jogador = new ModelJogador();
		jogador.setNome(request.getParameter("campoNome"));
		jogador.setEmail(request.getParameter("campoEmail"));
		jogador.setGenero(request.getParameter("campoGenero"));
		
		request.getSession().setAttribute("nome-jogador", jogador.getNome());
		request.getSession().setAttribute("email-jogador", jogador.getEmail());
		request.getSession().setAttribute("genero-jogador", jogador.getGenero());
		
		request.getSession().setAttribute("portas-jogador", 0);
		request.getSession().setAttribute("respostas-jogador", 0);
		request.getSession().setAttribute("desafios-jogador", 0);
		
		ListaSalas lista = new ListaSalas();
		AtomicInteger contador = new AtomicInteger(1);
		 
		lista.getSalasExistentes()
		.stream()
		.forEach((e) -> 
			{
			request.getSession().setAttribute("endereco-"+(contador.get()), e);
			contador.incrementAndGet();
			});
		
		request.getSession().setAttribute("endereco-destino", lista.getEnderecos()[0]);
		
		
		RequestDispatcher redireciona = request.getRequestDispatcher("principal/redirecionar.jsp");
		redireciona.forward(request, response);
	}

}
