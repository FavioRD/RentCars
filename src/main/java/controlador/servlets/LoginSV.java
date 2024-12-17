package controlador.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import modelo.clases.Usuario;

import java.io.IOException;

import dao.UsuarioDao;

/**
 * Servlet implementation class LoginSV
 */
@WebServlet(name = "login", urlPatterns = { "/login" })
public class LoginSV extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginSV() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String usuario = request.getParameter("usuario");
		String contrasena = request.getParameter("clave");

		UsuarioDao usuarioDao = new UsuarioDao();
		Usuario usuarioEncontrado = usuarioDao.iniciarSesion(usuario, contrasena);

		if (usuarioEncontrado != null) {
			System.out.println("Usuario logueado");
			HttpSession sesion = request.getSession(true);
			sesion.setAttribute("usuario", usuarioEncontrado);
			
			
			response.sendRedirect("controlador?action=volverInicio");
			
		} else {
			System.out.println("Usuario o contrasena incorrectos");
			response.sendRedirect("paginas/login.jsp");
		}
		
	}

}
