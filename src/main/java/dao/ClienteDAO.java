package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import modelo.clases.Cliente;
import modelo.clases.ConexionBD;

public class ClienteDAO {

    public ArrayList<Cliente> listarClientes() {
        ArrayList<Cliente> clientes = new ArrayList<>();
        String sql = "SELECT * FROM clientes";

        try (Connection conn = ConexionBD.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                int id = rs.getInt("id");
                String nombre = rs.getString("nombre");
                String documento = rs.getString("documento");
                String direccion = rs.getString("direccion");
                int telefono = rs.getInt("telefono");
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

        try (Connection conn = ConexionBD.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    String nombre = rs.getString("nombre");
                    String documento = rs.getString("documento");
                    String direccion = rs.getString("direccion");
                    int telefono = rs.getInt("telefono");
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

