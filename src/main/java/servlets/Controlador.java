package servlets;

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
 * Servlet implementation class Controlador
 */
@WebServlet(name = "controlador", urlPatterns = { "/controlador" })
public class Controlador extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private AutoDAO autoDAO = new AutoDAO();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Controlador() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		String dispatcher = "";
		// Redirige según el valor de "action"
		switch (action != null ? action : "") {
		case "verAutos":
			ArrayList<Auto> autos = autoDAO.listarAutos();
			request.setAttribute("autos", autos);

			dispatcher = "/paginas/verAutos.jsp";

			break;
		case "agregarAuto":
			dispatcher = "/paginas/AgregarAuto.jsp";
			break;
		case "borrarAuto":
			dispatcher = "/paginas/BorrarAuto.jsp";
			break;
		case "modificarAuto":
			dispatcher = "/paginas/ModificarAuto.jsp";
			break;
		case "verAlquilados":
			dispatcher = "/paginas/verAlquilados.jsp";
			break;
		case "alquilarAuto":
			dispatcher = "/paginas/AlquilarAuto.jsp";
			break;
		default:
			// Si no coincide ninguna acción, redirige a una página de error o al inicio
			request.getRequestDispatcher("index.jsp").forward(request, response);
			break;
		}
		request.getRequestDispatcher(dispatcher).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
