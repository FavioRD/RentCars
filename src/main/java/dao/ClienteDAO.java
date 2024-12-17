package dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import modelo.clases.Cliente;
import modelo.clases.ConexionBD;

public class ClienteDAO {

	public void agregarCliente(Cliente cliente) {
		String sql = "INSERT INTO clientes(nombre, documento_identidad, direccion, telefono, correo) "
				+ "VALUES(?, ?, ?, ?, ?)";

		try (Connection conn = ConexionBD.getConexion(); PreparedStatement stmn = conn.prepareStatement(sql)) {

			stmn.setString(1, cliente.getNombre());
			stmn.setString(2, cliente.getDocumento());
			stmn.setString(3, cliente.getDireccion());
			stmn.setString(4, cliente.getTelefono());
			stmn.setString(5, cliente.getCorreo());

			stmn.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void modificarCliente(Cliente cliente) {
		String sql = "UPDATE clientes SET nombre = ?, documento_identidad = ?, direccion = ?, telefono = ?, correo = ? WHERE id_cliente = ?";

		try (Connection conn = ConexionBD.getConexion(); PreparedStatement stmt = conn.prepareStatement(sql)) {

			stmt.setString(1, cliente.getNombre());
			stmt.setString(2, cliente.getDocumento());
			stmt.setString(3, cliente.getDireccion());
			stmt.setString(4, cliente.getTelefono());
			stmt.setString(5, cliente.getCorreo());
			stmt.setInt(6, cliente.getId());

			stmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void borrarCliente(int id) {
		String sql = "DELETE FROM clientes WHERE id_cliente = ?";

		try (Connection conn = ConexionBD.getConexion(); PreparedStatement stmt = conn.prepareStatement(sql)) {

			stmt.setInt(1, id);
			stmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<Cliente> listarClientes() {
		ArrayList<Cliente> clientes = new ArrayList<>();
		String sql = "SELECT * FROM clientes";

		try (Connection conn = ConexionBD.getConexion();
				PreparedStatement stmt = conn.prepareStatement(sql);
				ResultSet rs = stmt.executeQuery()) {

			while (rs.next()) {
				int id = rs.getInt("id_cliente");
				String nombre = rs.getString("nombre");
				String documento = rs.getString("documento_identidad");
				String direccion = rs.getString("direccion");
				String telefono = rs.getString("telefono");
				String correo = rs.getString("correo");

				Cliente cliente = new Cliente(id, nombre, documento, direccion, telefono, correo);
				clientes.add(cliente);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return clientes;
	}

	public Cliente obtenerClientePorId(int id) {
	    String query = "SELECT * FROM clientes WHERE id_cliente = ?";

	    // Usamos try-with-resources para asegurar que los recursos se cierren automáticamente
	    try (Connection con = ConexionBD.getConexion();
	         PreparedStatement stmt = con.prepareStatement(query)) {

	        // Establecer el parámetro en la consulta
	        stmt.setInt(1, id);

	        // Ejecutar la consulta y obtener el resultado
	        try (ResultSet rs = stmt.executeQuery()) {
	            // Verificar si hay resultados
	            if (rs.next()) {
	                int idCliente = rs.getInt("id_cliente");
	                String nombre = rs.getString("nombre");
	                String documento = rs.getString("documento_identidad");
	                String direccion = rs.getString("direccion");
	                String telefono = rs.getString("telefono");
	                String correo = rs.getString("correo");

	                return new Cliente(idCliente, nombre, documento, direccion, telefono, correo);
	            }
	        }
	    } catch (SQLException e) {
	        // Manejo de errores en caso de fallo en la conexión o la consulta
	        System.out.println("Error al obtener el cliente por ID: " + e.getMessage());
	        e.printStackTrace();
	    }
	    // Retornar null si no se encuentra el cliente o si ocurre un error
	    return null;
	}


	public ArrayList<Cliente> obtenerReporteClientes() {
		ArrayList<Cliente> clientes = new ArrayList<>();
		try (Connection conn = ConexionBD.getConexion();
				CallableStatement stmt = conn.prepareCall("{CALL obtenerCantidadAlquileresCliente()}");
				ResultSet rs = stmt.executeQuery()) {

			while (rs.next()) {
				int id = rs.getInt("id_cliente");
				String nombre = rs.getString("nombre");
				String documento = rs.getString("documento_identidad");
				String telefono = rs.getString("telefono");
				int cantidadVecesAlquilado = rs.getInt("veces_alquilado");

				Cliente cliente = new Cliente(id, nombre, documento, telefono, cantidadVecesAlquilado);
				clientes.add(cliente);

			}
			return clientes;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}

	}
}
