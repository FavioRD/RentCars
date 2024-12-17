package controlador.servlets;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import modelo.clases.Usuario;

import java.io.IOException;

import dao.AlquilarAutoDAO;
import dao.AutoDAO;

/**
 * Servlet implementation class Controlador
 */
@WebServlet(name = "controlador", urlPatterns = { "/controlador" })
public class Controlador extends HttpServlet {
	private static final long serialVersionUID = 1L;
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

		HttpSession sesion = request.getSession();
		Usuario usuario = (Usuario) sesion.getAttribute("usuario");

		if (usuario == null) {
			response.sendRedirect("paginas/login.jsp");
		} else {

			String action = request.getParameter("action");
			String dispatcher = "";
			// Redirige según el valor de "action"
			switch (action != null ? action : "") {

			case "volverInicio":
				AutoDAO autoDAO = new AutoDAO();
				int cantidadAutosTotales = autoDAO.obtenerCantidadAutos();
				
				AlquilarAutoDAO alquilarDAO = new AlquilarAutoDAO();
				double totalAlquileres = alquilarDAO.obtenerSumaTotalAlquileres();
				
				int cantidadAutosAlquilados = autoDAO.listarAlquilados().size();
				
				request.setAttribute("totalAlquileres", totalAlquileres);
				request.setAttribute("cantidadAutosTotales", cantidadAutosTotales);
				request.setAttribute("cantidadAutosAlquilados", cantidadAutosAlquilados);
				
				RequestDispatcher dispatcher1 = request.getRequestDispatcher("/paginas/Home.jsp");
				dispatcher1.forward(request, response);
				break;
			case "cerrarSesion":
				sesion.invalidate();
				usuario = null;
				response.sendRedirect("paginas/login.jsp");
				break;
			default:
				// Si no coincide ninguna acción, redirige a una página de error o al inicio
				request.getRequestDispatcher("index.jsp").forward(request, response);
				break;

			}

		}

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
