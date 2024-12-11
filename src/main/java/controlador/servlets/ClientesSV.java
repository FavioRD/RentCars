package controlador.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import modelo.clases.Cliente;
import dao.ClienteDAO;

import java.io.IOException;
import java.util.List;

@WebServlet("/cliente")
public class ClientesSV extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public ClientesSV() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ClienteDAO clienteDAO = new ClienteDAO();

        try {
            List<Cliente> listaClientes = clienteDAO.listarClientes();
            request.setAttribute("clientes", listaClientes); 
            request.getRequestDispatcher("paginas/MostrarClientes.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Ocurrió un error al obtener la lista de clientes.");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendError(HttpServletResponse.SC_NOT_IMPLEMENTED, "Método PUT no implementado.");
    }

    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendError(HttpServletResponse.SC_NOT_IMPLEMENTED, "Método DELETE no implementado.");
    }
}
