package controller;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import listas.ListaSalas;

@WebServlet(urlPatterns = {"/TrocarFase"})
public class ServletTrocarFaseController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
       
    public ServletTrocarFaseController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String enderecoAtual = (String)request.getSession().getAttribute("endereco-destino");
		String buttonId = request.getParameter("buttonId");
		
		if("Proximo".equals(buttonId)) {
			if(request.getSession().getAttribute("endereco-1") == enderecoAtual)
				request.getSession().setAttribute("endereco-destino",request.getSession().getAttribute("endereco-2"));
			else if(request.getSession().getAttribute("endereco-2") == enderecoAtual)
				request.getSession().setAttribute("endereco-destino",request.getSession().getAttribute("endereco-3"));
			else if(request.getSession().getAttribute("endereco-3") == enderecoAtual)
				request.getSession().setAttribute("endereco-destino",request.getSession().getAttribute("endereco-4"));	
		}else{
			if(request.getSession().getAttribute("endereco-4") == enderecoAtual)
				request.getSession().setAttribute("endereco-destino",request.getSession().getAttribute("endereco-3"));
			else if(request.getSession().getAttribute("endereco-3") == enderecoAtual)
				request.getSession().setAttribute("endereco-destino",request.getSession().getAttribute("endereco-2"));
			else if(request.getSession().getAttribute("endereco-2") == enderecoAtual)
				request.getSession().setAttribute("endereco-destino",request.getSession().getAttribute("endereco-1"));	
		}
		

		RequestDispatcher redireciona = request.getRequestDispatcher("principal/redirecionar.jsp");
		redireciona.forward(request, response);
	}

}
