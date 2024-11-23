package servlets;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

import clases.Auto;
import dao.AutoDAO;

/**
 * Servlet implementation class AutosSV
 */
@WebServlet(name = "verAutos", urlPatterns = { "/verAutos" })
public class AutosSV extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private AutoDAO autoDAO = new AutoDAO();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AutosSV() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Auto> autos = autoDAO.listarAutos();
		
		for (Auto auto : autos) {
			System.out.println(auto.getMarca());
		}
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		 request.setAttribute("autos", autos);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/paginas/verAutos.jsp");
        dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	/**
	 * @see HttpServlet#doPut(HttpServletRequest, HttpServletResponse)
	 */
	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doDelete(HttpServletRequest, HttpServletResponse)
	 */
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		autoDAO.eliminarAuto(id);
		response.getWriter().append("Auto eliminado");
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/paginas/verAutos.jsp");
		dispatcher.forward(request, response);
		
	}

}
