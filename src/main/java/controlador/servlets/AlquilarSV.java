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
//		Listar clientes
		ArrayList<Cliente> clientes = new ClienteDAO().listarClientes();
//		Recuperar el id del auto
		int idAuto = Integer.parseInt(request.getParameter("id"));

//		 Obtener el auto con el id especifico
		Auto auto = new AutoDAO().obtenerAuto(idAuto);

//		 Enviar los datos a la vista
		String dispatcher = "/paginas/AlquilarAuto.jsp";

		request.setAttribute("clientes", clientes);
		request.setAttribute("auto", auto);
		request.getRequestDispatcher(dispatcher).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

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
		Alquiler alquiler = new Alquiler(Integer.parseInt(idAuto), Integer.parseInt(idCliente), fechaInicio, fechaFin,
				precioTotal, estadoAlquiler);

		daoAlquiler.alquilarAuto(alquiler);
		daoAuto.cambiarEstado(Integer.parseInt(idAuto), "Alquilado");

	}

}
