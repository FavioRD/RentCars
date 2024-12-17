package controlador.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import modelo.clases.Cliente;
import modelo.clases.Usuario;
import dao.ClienteDAO;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/cliente")
public class ClientesSV extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ClienteDAO clienteDAO = new ClienteDAO();

	public ClientesSV() {
		super();
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ClienteDAO clienteDAO = new ClienteDAO();

		HttpSession sesion = request.getSession();
		Usuario usuario = (Usuario) sesion.getAttribute("usuario");

		if (usuario == null) {
			response.sendRedirect("paginas/login.jsp");
		} else {
			if (usuario.getRol().equals("administrador") || usuario.getRol().equals("Administrador")) {
				String action = request.getParameter("action");
				String dispatcher = "";

				try {
					switch (action != null ? action : "") {
					case "agregarCliente":
						dispatcher = "/paginas/AgregarCliente.jsp";
						break;

					case "modificarCliente":
						int id = Integer.parseInt(request.getParameter("id"));
						Cliente cliente = clienteDAO.obtenerClientePorId(id);
						request.setAttribute("cliente", cliente);
						dispatcher = "/paginas/ModificarCliente.jsp";
						break;

					case "listarCliente":
					default:
						List<Cliente> listaClientes = clienteDAO.listarClientes();
						request.setAttribute("clientes", listaClientes);
						dispatcher = "/paginas/MostrarClientes.jsp";
						break;

					case "borrarCliente":
						int idCliente = Integer.parseInt(request.getParameter("id"));
						clienteDAO.borrarCliente(idCliente);
						response.sendRedirect("cliente?action=listarCliente");
						return;
					
					case "reporteClientes":
						ArrayList<Cliente> listaClientesReporte = clienteDAO.obtenerReporteClientes();
						request.setAttribute("clientes", listaClientesReporte);
						dispatcher = "/paginas/ReporteClientesAlquileres.jsp";
						break;
					
					}
					
					if (dispatcher != null) {
						request.getRequestDispatcher(dispatcher).forward(request, response);
					}
				} catch (Exception e) {
					e.printStackTrace();
					response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR,
							"Ocurrió un error procesando la solicitud: " + e.getMessage());
				}
			}
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");

		switch (action != null ? action : "") {
		case "agregarCliente":
			Cliente nuevoCliente = recuperarParametrosCliente(request);
			clienteDAO.agregarCliente(nuevoCliente);
			response.sendRedirect("cliente?action=listarCliente");
			break;

		case "modificarCliente":
			Cliente clienteModificado = recuperarParametrosCliente(request);
			clienteDAO.modificarCliente(clienteModificado);
			response.sendRedirect("cliente?action=listarCliente");
			break;

		case "borrarCliente":
			doDelete(request, response);
			break;
		default:

		}
	}

	private Cliente recuperarParametrosCliente(HttpServletRequest request) {
		int id = Integer.parseInt(request.getParameter("id"));
		String nombre = request.getParameter("nombre");
		String documento = request.getParameter("documento");
		String direccion = request.getParameter("direccion");
		String telefono = request.getParameter("telefono");
		String correo = request.getParameter("correo");

		return new Cliente(id, nombre, documento, direccion, telefono, correo);
	}

	@Override
	protected void doPut(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.sendError(HttpServletResponse.SC_NOT_IMPLEMENTED, "Método PUT no implementado.");
	}

	@Override
	protected void doDelete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.sendError(HttpServletResponse.SC_NOT_IMPLEMENTED, "Método DELETE no implementado.");
	}
}
