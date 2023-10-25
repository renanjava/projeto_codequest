package controller;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import preparador.PreparaSalas;

@WebServlet(urlPatterns = {"/TrocarFase"})
public class ServletTrocarFaseController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
       
    public ServletTrocarFaseController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.getSession().setAttribute("portas-jogador",request.getParameter("portasAbertas"));
		request.getSession().setAttribute("respostas-jogador",request.getParameter("respostasCertas"));
		request.getSession().setAttribute("desafios-jogador",request.getParameter("desafiosResolvidos"));
		
		String enderecoAtual = (String)request.getSession().getAttribute("endereco-destino");
		String buttonId = request.getParameter("buttonId");
		
		String fixIdPortas1 = (String.valueOf(request.getSession().getAttribute("id-portas-1"))).replace("0", "");
		String fixIdPortas2 = (String.valueOf(request.getSession().getAttribute("id-portas-1"))).replace("0", "");
		String fixIdPortas3 = (String.valueOf(request.getSession().getAttribute("id-portas-1"))).replace("0", "");
		String fixIdPortas4 = (String.valueOf(request.getSession().getAttribute("id-portas-1"))).replace("0", "");
		
		if("Proximo".equals(buttonId)) {
			if(request.getSession().getAttribute("endereco-1") == enderecoAtual) {
				request.getSession().setAttribute("endereco-destino",request.getSession().getAttribute("endereco-2"));
				request.getSession().setAttribute("sorteio-destino",request.getSession().getAttribute("sorteio-portas-2"));
				request.getSession().setAttribute("id-portas-destino",request.getSession().getAttribute("id-portas-2"));
				request.getSession().setAttribute("id-portas-1",fixIdPortas1+request.getParameter("idPortas"));
			}
			else if(request.getSession().getAttribute("endereco-2") == enderecoAtual) {
				request.getSession().setAttribute("endereco-destino",request.getSession().getAttribute("endereco-3"));
				request.getSession().setAttribute("sorteio-destino",request.getSession().getAttribute("sorteio-portas-3"));
				request.getSession().setAttribute("id-portas-destino",request.getSession().getAttribute("id-portas-3"));
				request.getSession().setAttribute("id-portas-2",fixIdPortas2+request.getParameter("idPortas"));
			}
			else if(request.getSession().getAttribute("endereco-3") == enderecoAtual) {
				request.getSession().setAttribute("endereco-destino",request.getSession().getAttribute("endereco-4"));	
				request.getSession().setAttribute("sorteio-destino",request.getSession().getAttribute("sorteio-portas-4"));
				request.getSession().setAttribute("id-portas-destino",request.getSession().getAttribute("id-portas-4"));
				request.getSession().setAttribute("id-portas-3",fixIdPortas3+request.getParameter("idPortas"));
			}
		}else{
			if(request.getSession().getAttribute("endereco-4") == enderecoAtual) {
				request.getSession().setAttribute("endereco-destino",request.getSession().getAttribute("endereco-3"));
				request.getSession().setAttribute("sorteio-destino",request.getSession().getAttribute("sorteio-portas-3"));
				request.getSession().setAttribute("id-portas-destino",request.getSession().getAttribute("id-portas-3"));
				request.getSession().setAttribute("id-portas-4",fixIdPortas4+request.getParameter("idPortas"));
			}
			else if(request.getSession().getAttribute("endereco-3") == enderecoAtual) {
				request.getSession().setAttribute("endereco-destino",request.getSession().getAttribute("endereco-2"));
				request.getSession().setAttribute("sorteio-destino",request.getSession().getAttribute("sorteio-portas-2"));
				request.getSession().setAttribute("id-portas-destino",request.getSession().getAttribute("id-portas-2"));
				request.getSession().setAttribute("id-portas-3",fixIdPortas3+request.getParameter("idPortas"));
			}
			else if(request.getSession().getAttribute("endereco-2") == enderecoAtual) {
				request.getSession().setAttribute("endereco-destino",request.getSession().getAttribute("endereco-1"));	
				request.getSession().setAttribute("sorteio-destino",request.getSession().getAttribute("sorteio-portas-1"));
				request.getSession().setAttribute("id-portas-destino",request.getSession().getAttribute("id-portas-1"));
				request.getSession().setAttribute("id-portas-2",fixIdPortas2+request.getParameter("idPortas"));
			}
		}
		

		RequestDispatcher redireciona = request.getRequestDispatcher("principal/redirecionar.jsp");
		redireciona.forward(request, response);
	}

}
