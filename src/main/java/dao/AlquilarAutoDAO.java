package dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import interfaces.IAlquilarAuto;
import modelo.clases.Alquiler;
import modelo.clases.Auto;
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

	@Override
	public void finalizarAlquiler(int idAlquiler, double kmRecorridos) {
		CallableStatement stmt = null;
		boolean resultado = false;
		Connection connection = ConexionBD.getConexion();
		try {
			String sql = "{CALL ActualizarEstadoAlquiler(?, ?)}"; // Llamada al procedimiento con parámetro
			stmt = connection.prepareCall(sql);

			// Establecemos el valor del parámetro
			stmt.setInt(1, idAlquiler);
			stmt.setDouble(2, kmRecorridos);

			// Ejecutamos la llamada
			int rowsAffected = stmt.executeUpdate();

			if (rowsAffected > 0) {
				resultado = true;
			}

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}

	public Alquiler obtenerAlquiler(int idAuto) {
		Alquiler alquiler = null;

		String sql = "SELECT au.matricula, au.marca, au.modelo , al.*\n" + "FROM autos au\n"
				+ "INNER JOIN alquileres al ON au.id_auto = al.id_auto\n"
				+ "WHERE au.id_auto = ? AND al.estado_alquiler = 'Activo';";
		try (Connection conn = ConexionBD.getConexion(); PreparedStatement ps = conn.prepareStatement(sql);) {
			ps.setInt(1, idAuto);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				alquiler = new Alquiler(rs.getInt("id_alquiler"), rs.getInt("id_auto"), rs.getInt("id_cliente"),
						rs.getDate("fecha_inicio"), rs.getDate("fecha_fin"), rs.getDouble("precio_total"),
						rs.getString("estado_alquiler"));

			}

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return alquiler;
	}

	public double obtenerSumaTotalAlquileres() {
		double sumaTotal = 0;
		String sql = "{CALL obtenerSumaTotalesAlquileres()}";
		try (Connection conn = ConexionBD.getConexion(); CallableStatement stmt = conn.prepareCall(sql);) {
			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {
				sumaTotal = rs.getDouble("total_ultimos_30_dias");
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return sumaTotal;
	}
}
