package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import interfaces.IAlquilarAuto;
import modelo.clases.Alquiler;
import modelo.clases.ConexionBD;

// Auto, Alquiler, Cliente
public class AlquilarAutoDAO implements IAlquilarAuto {

	@Override
	public void alquilarAuto(Alquiler alquiler) {

		String sql = "INSERT INTO alquileres(id_auto,id_cliente,fecha_inicio,fecha_fin,precio_total,estado_alquiler) VALUES (?, ?, ?, ?, ?, ?)";
		try (Connection conn = ConexionBD.getConexion(); PreparedStatement ps = conn.prepareStatement(sql);

		) {
			ps.setInt(1, alquiler.getIdAuto()); // Asignar el valor para id_auto
			ps.setInt(2, alquiler.getIdCliente()); // Asignar el valor para id_cliente
			ps.setDate(3, alquiler.getFechaInicio()); // Asignar el valor para fecha_inicio
			ps.setDate(4, alquiler.getFechaFin()); // Asignar el valor para fecha_fin
			ps.setDouble(5, alquiler.getPrecioTotal());
			ps.setString(6, alquiler.getEstadoAlquiler());

			ps.executeUpdate();

			System.out.println("Auto alquilado con exito");

		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}

	}

}
