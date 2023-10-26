package controller;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

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
		
		String fixIdPortas1 = (String.valueOf(request.getSession().getAttribute("id-portas-1"))).replace(" ", "");
		String fixIdPortas2 = (String.valueOf(request.getSession().getAttribute("id-portas-2"))).replace(" ", "");
		String fixIdPortas3 = (String.valueOf(request.getSession().getAttribute("id-portas-3"))).replace(" ", "");
		String fixIdPortas4 = (String.valueOf(request.getSession().getAttribute("id-portas-4"))).replace(" ", "");
		
		String novasPortas = request.getParameter("idPortas");

		System.out.println(fixIdPortas1+" "+fixIdPortas2+" "+fixIdPortas3+" "+fixIdPortas4);
		
		if("Proximo".equals(buttonId)) {
			if(request.getSession().getAttribute("endereco-1") == enderecoAtual) {
				request.getSession().setAttribute("endereco-destino",request.getSession().getAttribute("endereco-2"));
				request.getSession().setAttribute("sorteio-destino",request.getSession().getAttribute("sorteio-portas-2"));
				request.getSession().setAttribute("id-desafio-destino",request.getSession().getAttribute("id-desafio-2"));
				request.getSession().setAttribute("id-portas-destino",request.getSession().getAttribute("id-portas-2"));
				request.getSession().setAttribute("id-portas-1",(novasPortas.length() > 0 ? fixIdPortas1+","+novasPortas : fixIdPortas1));
			}
			else if(request.getSession().getAttribute("endereco-2") == enderecoAtual) {
				request.getSession().setAttribute("endereco-destino",request.getSession().getAttribute("endereco-3"));
				request.getSession().setAttribute("sorteio-destino",request.getSession().getAttribute("sorteio-portas-3"));
				request.getSession().setAttribute("id-desafio-destino",request.getSession().getAttribute("id-desafio-3"));
				request.getSession().setAttribute("id-portas-destino",request.getSession().getAttribute("id-portas-3"));
				request.getSession().setAttribute("id-portas-2",(novasPortas.length() > 0 ? fixIdPortas2+","+novasPortas : fixIdPortas2));
			}
			else if(request.getSession().getAttribute("endereco-3") == enderecoAtual) {
				request.getSession().setAttribute("endereco-destino",request.getSession().getAttribute("endereco-4"));	
				request.getSession().setAttribute("sorteio-destino",request.getSession().getAttribute("sorteio-portas-4"));
				request.getSession().setAttribute("id-desafio-destino",request.getSession().getAttribute("id-desafio-4"));
				request.getSession().setAttribute("id-portas-destino",request.getSession().getAttribute("id-portas-4"));
				request.getSession().setAttribute("id-portas-3",(novasPortas.length() > 0 ? fixIdPortas3+","+novasPortas : fixIdPortas3));
			}
		}else{
			if(request.getSession().getAttribute("endereco-4") == enderecoAtual) {
				request.getSession().setAttribute("endereco-destino",request.getSession().getAttribute("endereco-3"));
				request.getSession().setAttribute("sorteio-destino",request.getSession().getAttribute("sorteio-portas-3"));
				request.getSession().setAttribute("id-desafio-destino",request.getSession().getAttribute("id-desafio-3"));
				request.getSession().setAttribute("id-portas-destino",request.getSession().getAttribute("id-portas-3"));
				request.getSession().setAttribute("id-portas-4",(novasPortas.length() > 0 ? fixIdPortas4+","+novasPortas : fixIdPortas4));
			}
			else if(request.getSession().getAttribute("endereco-3") == enderecoAtual) {
				request.getSession().setAttribute("endereco-destino",request.getSession().getAttribute("endereco-2"));
				request.getSession().setAttribute("sorteio-destino",request.getSession().getAttribute("sorteio-portas-2"));
				request.getSession().setAttribute("id-desafio-destino",request.getSession().getAttribute("id-desafio-2"));
				request.getSession().setAttribute("id-portas-destino",request.getSession().getAttribute("id-portas-2"));
				request.getSession().setAttribute("id-portas-3",(novasPortas.length() > 0 ? fixIdPortas3+","+novasPortas : fixIdPortas3));
			}
			else if(request.getSession().getAttribute("endereco-2") == enderecoAtual) {
				request.getSession().setAttribute("endereco-destino",request.getSession().getAttribute("endereco-1"));	
				request.getSession().setAttribute("sorteio-destino",request.getSession().getAttribute("sorteio-portas-1"));
				request.getSession().setAttribute("id-desafio-destino",request.getSession().getAttribute("id-desafio-1"));
				request.getSession().setAttribute("id-portas-destino",request.getSession().getAttribute("id-portas-1"));
				request.getSession().setAttribute("id-portas-2",(novasPortas.length() > 0 ? fixIdPortas2+","+novasPortas : fixIdPortas2));
			}
		}
		

		RequestDispatcher redireciona = request.getRequestDispatcher("principal/redirecionar.jsp");
		redireciona.forward(request, response);
	}

}
