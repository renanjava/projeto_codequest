package controller;

import java.io.IOException;
import java.util.Arrays;
import java.util.Random;
import java.util.concurrent.atomic.AtomicInteger;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.ModelJogador;
import preparador.PreparaSalas;

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
		request.getSession().setAttribute("id-portas", 0);
		
		PreparaSalas preparaSalas = new PreparaSalas();
		AtomicInteger cont = new AtomicInteger(1);
		 
		preparaSalas.getPosicoesSorteadas()
		.stream()
		.limit(4)
		.forEach((e) -> 
			{
			request.getSession().setAttribute("endereco-"+(cont.get()), 
					preparaSalas.getSalasExistentes().get(e));
			
			request.getSession().setAttribute("sorteio-portas-"+(cont.get()),
					Arrays.toString(preparaSalas.getEventosIdPortasSalas().get(e)));
			
			request.getSession().setAttribute("id-desafio-"+cont.get(),preparaSalas.getIdPortaDesafio(cont.get()));
			request.getSession().setAttribute("id-portas-"+cont.get()," ");
			cont.incrementAndGet();
			});
		
		request.getSession().setAttribute("endereco-destino", preparaSalas.getEnderecos()[0]);
		request.getSession().setAttribute("sorteio-destino", Arrays.toString(preparaSalas.getEventosIdPortasSalas().get(0)));
		request.getSession().setAttribute("id-desafio-destino", request.getSession().getAttribute("id-desafio-"+preparaSalas.getPosicoesSorteadas().get(0)));
		request.getSession().setAttribute("id-portas-destino"," ");
		
		
		RequestDispatcher redireciona = request.getRequestDispatcher("principal/redirecionar.jsp");
		redireciona.forward(request, response);
	}

}
