package controlador.servlets;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import modelo.clases.Alquiler;
import modelo.clases.Auto;
import modelo.clases.Cliente;

import java.io.IOException;
import java.util.ArrayList;

import dao.AlquilarAutoDAO;
import dao.AutoDAO;
import dao.ClienteDAO;
import interfaces.AutoDao;

/**
 * Servlet implementation class AlquilarSV
 */
@WebServlet("/alquilarAuto")
public class AlquilarSV extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AlquilarSV() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String accion = request.getParameter("accion");

		switch (accion) {
		case "alquilar":
			ArrayList<Cliente> clientes = new ClienteDAO().listarClientes();
			int idAuto = Integer.parseInt(request.getParameter("id"));
			Auto auto = new AutoDAO().obtenerAuto(idAuto);
			String dispatcher = "/paginas/AlquilarAuto.jsp";

			request.setAttribute("clientes", clientes);
			request.setAttribute("auto", auto);
			request.getRequestDispatcher(dispatcher).forward(request, response);
			break;

		case "opcionAlquiler":
			idAuto = Integer.parseInt(request.getParameter("id_auto"));
			Alquiler alquiler = new AlquilarAutoDAO().obtenerAlquiler(idAuto);
			if (alquiler != null) {
				System.out.println(alquiler); // Verifica si el alquiler tiene datos válidos
				request.setAttribute("alquiler", alquiler);
				request.getRequestDispatcher("paginas/OpcionesAlquiler.jsp").forward(request, response); // sendRedirect
			} else {
				// Si no se encuentra el alquiler, redirige a un error o muestra un mensaje
				// adecuado
				response.sendRedirect("paginas/error.jsp?mensaje=No se encontró el alquiler para el auto.");
			}
			break;

		case "finalizarAlquiler":

			response.sendRedirect("paginas/FinalizarAlquiler.jsp");
			break;
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String accion = request.getParameter("accion");

		if (accion.equals("alquilar")) {

			AlquilarAutoDAO daoAlquiler = new AlquilarAutoDAO();
			AutoDao daoAuto = new AutoDAO();

			String idCliente = request.getParameter("id_cliente");
			String idAuto = request.getParameter("id_auto");
			String fechaInicioStr = request.getParameter("fecha_inicio");
			String fechaFinStr = request.getParameter("fecha_fin");
			double precioTotal = Double.parseDouble(request.getParameter("precio_total"));
			String estadoAlquiler = request.getParameter("estado_alquiler");

			// Convertir las fechas (suponiendo que están en formato "yyyy-MM-dd")
			java.sql.Date fechaInicio = java.sql.Date.valueOf(fechaInicioStr);
			java.sql.Date fechaFin = java.sql.Date.valueOf(fechaFinStr);

			System.out.println("idCliente: " + idCliente);
			System.out.println("idAuto: " + idAuto);
			System.out.println("fechaInicio: " + fechaInicio);
			System.out.println("fechaFin: " + fechaFin);
			System.out.println("precioTotal: " + precioTotal);
			System.out.println("estadoAlquiler: " + estadoAlquiler);

			// Crear un objeto de tipo Alquiler para usarlo en la inserción
			Alquiler alquiler = new Alquiler(Integer.parseInt(idAuto), Integer.parseInt(idCliente), fechaInicio,
					fechaFin, precioTotal, estadoAlquiler);

			daoAlquiler.alquilarAuto(alquiler);
			daoAuto.cambiarEstado(Integer.parseInt(idAuto), "Alquilado");

		} else {
			doPut(request, response);
		}
	}

	protected void doPut(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String accion = request.getParameter("accion");

		switch (accion) {
		case "finalizarAlquiler":
			AlquilarAutoDAO daoAlquiler = new AlquilarAutoDAO();
			AutoDao daoAuto = new AutoDAO();

			int idAlquiler = Integer.parseInt(request.getParameter("id_alquiler"));
			int idAuto = Integer.parseInt(request.getParameter("id_auto"));
			Double kmRecorridos = Double.parseDouble(request.getParameter("km_recorridos"));
			daoAlquiler.finalizarAlquiler(idAlquiler, kmRecorridos);
			daoAuto.cambiarEstado(idAuto, "Disponible");
			break;
		}
	}
}
