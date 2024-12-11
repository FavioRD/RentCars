package controlador.servlets;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import modelo.clases.Auto;
import modelo.clases.Usuario;

import java.io.IOException;
import java.util.ArrayList;

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

		HttpSession sesion = request.getSession();
		Usuario usuario = (Usuario) sesion.getAttribute("usuario");
		
		if (usuario == null) {
			response.sendRedirect("paginas/login.jsp");
		} else {
			if (usuario.getRol().equals("administrador")) {
				String action = request.getParameter("action");
				String dispatcher = "";
				// Redirige según el valor de "action"
				switch (action != null ? action : "") {
				case "verAutos":
					ArrayList<Auto> autos = autoDAO.listarAutos();
					request.setAttribute("autos", autos);

					dispatcher = "/paginas/verAutos.jsp";
					request.getRequestDispatcher(dispatcher).forward(request, response);
					break;
				case "verAuto":
					ArrayList<Auto> auto = autoDAO.obtenerAuto(request.getParameter("id"));
					request.setAttribute("auto", auto);

					dispatcher = "/paginas/verAutos.jsp";
					request.getRequestDispatcher(dispatcher).forward(request, response);
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
					dispatcher = "alquilarAuto";
					response.sendRedirect(dispatcher);
					break;
				case "volverInicio":
//					dispatcher = "/WEB-INF/paginas/Home.jsp";
					RequestDispatcher dispatcher1= request.getRequestDispatcher("/WEB-INF/paginas/Home.jsp");
					dispatcher1.forward( request, response );
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
