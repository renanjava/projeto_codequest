package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = {"/TrocarFase"})
public class ServletTrocarFaseController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ServletTrocarFaseController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher redireciona = request.getRequestDispatcher("principal/redirecionar.jsp");
		redireciona.forward(request, response);
	}

}
