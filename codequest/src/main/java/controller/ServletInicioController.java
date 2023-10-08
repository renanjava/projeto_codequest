package controller;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = { "/ServletInicio" })
public class ServletInicioController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    public ServletInicioController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(request.getParameter("botao"));
		
		RequestDispatcher redireciona = null;
		
		switch(request.getParameter("botao")) {
		case "JOGAR": redireciona = request.getRequestDispatcher("principal/jogar.jsp"); break;
		case "TUTORIAL": redireciona = request.getRequestDispatcher("principal/tutorial.jsp"); break;
		case "CRÉDITOS": redireciona = request.getRequestDispatcher("principal/creditos.jsp"); break;
		default: redireciona = request.getRequestDispatcher("principal/erro.jsp"); break;
		}

		redireciona.forward(request, response);
	}

}
