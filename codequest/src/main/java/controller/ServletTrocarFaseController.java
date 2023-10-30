package controller;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

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
		
		List<String> listaIdFix = Arrays.asList(
				fixIdPortas1, fixIdPortas2, fixIdPortas3, fixIdPortas4
				);
		
		String novasPortas = request.getParameter("idPortas");

		System.out.println(fixIdPortas1+" "+fixIdPortas2+" "+fixIdPortas3+" "+fixIdPortas4);
		
		int cont;
		boolean controle;
		if("Proximo".equals(buttonId)) {
			cont = 1;
			controle = false;
			while(cont != 4 || controle != true){
				if(request.getSession().getAttribute("endereco-"+cont) == enderecoAtual) {
					controle = true;
					request.getSession().setAttribute("endereco-destino",request.getSession().getAttribute("endereco-"+(cont+1)));
					request.getSession().setAttribute("sorteio-destino",request.getSession().getAttribute("sorteio-portas-"+(cont+1)));
					request.getSession().setAttribute("perguntas-destino", request.getSession().getAttribute("perguntas-sala-"+(cont+1)));
					request.getSession().setAttribute("respostas-destino", request.getSession().getAttribute("respostas-sala-"+(cont+1)));
					request.getSession().setAttribute("id-desafio-destino",request.getSession().getAttribute("id-desafio-"+(cont+1)));
					request.getSession().setAttribute("id-portas-destino",request.getSession().getAttribute("id-portas-"+(cont+1)));
					request.getSession().setAttribute("id-portas-"+cont,(novasPortas.length() > 0 ? listaIdFix.get(cont-1)+","+novasPortas : listaIdFix.get(cont-1)));
				}
				cont++;
			}
		}else{
			cont = 4;
			controle = false;
			while(cont != 1 || controle != true){
				if(request.getSession().getAttribute("endereco-"+cont) == enderecoAtual) {
					controle = true;
					request.getSession().setAttribute("endereco-destino",request.getSession().getAttribute("endereco-"+(cont-1)));
					request.getSession().setAttribute("sorteio-destino",request.getSession().getAttribute("sorteio-portas-"+(cont-1)));
					request.getSession().setAttribute("perguntas-destino", request.getSession().getAttribute("perguntas-sala-"+(cont-1)));
					request.getSession().setAttribute("respostas-destino", request.getSession().getAttribute("respostas-sala-"+(cont-1)));
					request.getSession().setAttribute("id-desafio-destino",request.getSession().getAttribute("id-desafio-"+(cont-1)));
					request.getSession().setAttribute("id-portas-destino",request.getSession().getAttribute("id-portas-"+(cont-1)));
					request.getSession().setAttribute("id-portas-"+cont,(novasPortas.length() > 0 ? listaIdFix.get(cont-1)+","+novasPortas : listaIdFix.get(cont-1)));
				}
				cont--;
			}
		}
		
		RequestDispatcher redireciona = request.getRequestDispatcher("principal/redirecionar.jsp");
		redireciona.forward(request, response);
	}

}
