package dao;

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
	    
	    try (Connection conn = ConexionBD.getConexion(); 
	         PreparedStatement stmn = conn.prepareStatement(sql)) {
	        
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

        try (Connection conn = ConexionBD.getConexion();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

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

        try (Connection conn = ConexionBD.getConexion();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

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
        Cliente cliente = null;
        String sql = "SELECT * FROM clientes WHERE id = ?";

        try (Connection conn = ConexionBD.getConexion();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    String nombre = rs.getString("nombre");
                    String documento = rs.getString("documento");
                    String direccion = rs.getString("direccion");
                    String telefono = rs.getString("telefono");
                    String correo = rs.getString("correo");

                    cliente = new Cliente(id, nombre, documento, direccion, telefono, correo);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return cliente;
    }
}

