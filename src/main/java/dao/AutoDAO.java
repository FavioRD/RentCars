package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import interfaces.AutoDao;
import modelo.clases.Auto;
import modelo.clases.ConexionBD;

public class AutoDAO implements AutoDao {

	@Override
	public void registrarAuto(Auto auto) {
		String sql = "INSERT INTO autos (marca, modelo, anio, color, matricula, precio_por_dia, estado, img, kilometraje) "
				+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

		try (Connection conn = ConexionBD.getConexion();) {
			PreparedStatement stmt = conn.prepareStatement(sql);
			// Prepara la sentencia
			stmt = conn.prepareStatement(sql);

			// Asigna los valores de la entidad `auto` a los parámetros de la sentencia
			stmt.setString(1, auto.getMarca()); // Marca
			stmt.setString(2, auto.getModelo()); // Modelo
			stmt.setString(3, auto.getAnio()); // Año
			stmt.setString(4, auto.getColor()); // Color
			stmt.setString(5, auto.getMatricula()); // Matrícula
			stmt.setDouble(6, auto.getPrecio_dia()); // Precio por día
			stmt.setString(7, auto.getEstado()); // Estado
			stmt.setString(8, auto.getImg()); // Imagen
			stmt.setDouble(9, auto.getKilometraje()); // Kilometra

			// Ejecuta el INSERT
			stmt.executeUpdate();

			System.out.println("Auto agregado correctamente");
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	@Override
	public void modificarAuto(int id, Auto auto) {
		String sql = "UPDATE autos SET marca = ?, modelo = ?, anio = ?, color = ?, matricula = ?, precio_por_dia = ?, estado = ?, img = ?, kilometraje = ? WHERE id_auto = ?";
		try (Connection conn = ConexionBD.getConexion(); PreparedStatement stmt = conn.prepareStatement(sql)) {
			stmt.setString(1, auto.getMarca());
			stmt.setString(2, auto.getModelo());
			stmt.setString(3, auto.getAnio());
			stmt.setString(4, auto.getColor());
			stmt.setString(5, auto.getMatricula());
			stmt.setDouble(6, auto.getPrecio_dia());
			stmt.setString(7, auto.getEstado());
			stmt.setString(8, auto.getImg());
			stmt.setDouble(9, auto.getKilometraje());
			stmt.setInt(10, id);
			
			stmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("Error al modificar auto");
			System.out.println(e.getMessage());
		}

	}

	@Override
	public void eliminarAuto(int id) {
		String sql = "DELETE FROM autos WHERE id_auto = ?";
		try (Connection conn = ConexionBD.getConexion(); PreparedStatement stmt = conn.prepareStatement(sql)) {
			stmt.setInt(1, id);
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@Override
	public ArrayList<Auto> listarAutos() {
		ArrayList<Auto> autos = new ArrayList<Auto>();
		String sql = "SELECT * FROM autos";
		try (Connection conn = ConexionBD.getConexion();
				PreparedStatement stmt = conn.prepareStatement(sql);
				ResultSet rs = stmt.executeQuery()) {

			while (rs.next()) {
				int id = rs.getInt("id_auto");
				String marca = rs.getString("marca");
				String modelo = rs.getString("modelo");
				String anio = rs.getString("anio");
				String color = rs.getString("color");
				String matricula = rs.getString("matricula");
				double precioDia = rs.getDouble("precio_por_dia");
				String estado = rs.getString("estado");
				String img = rs.getString("img");
				double kilometraje = rs.getDouble("kilometraje");
				
				Auto auto = new Auto(id, marca, modelo, anio, color, matricula, precioDia, estado, img, kilometraje);
				autos.add(auto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		// TODO Auto-generated method stub
		return autos;
	}

	public Auto obtenerAuto(int id) {
		Auto auto = null;
		String sql = "SELECT * FROM autos WHERE id_auto = ?";
		try (Connection conn = ConexionBD.getConexion(); PreparedStatement stmt = conn.prepareStatement(sql)) {
			stmt.setInt(1, id);
			ResultSet rs = stmt.executeQuery();

			if (rs.next()) {
				int id_auto = rs.getInt("id_auto");
				String marca = rs.getString("marca");
				String modelo = rs.getString("modelo");
				String anio = rs.getString("anio");
				String color = rs.getString("color");
				String matricula = rs.getString("matricula");
				double precioDia = rs.getDouble("precio_por_dia");
				String estado = rs.getString("estado");
				String img = rs.getString("img");
				double kilometraje = rs.getDouble("kilometraje");
				auto = new Auto(id_auto, marca, modelo, anio, color, matricula, precioDia, estado, img, kilometraje);

			}
			return auto;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}

	public void cambiarEstado(int id, String estado) {
		String sql = "UPDATE autos SET estado = ? WHERE id_auto = ?";
		try (Connection conn = ConexionBD.getConexion(); PreparedStatement stmt = conn.prepareStatement(sql)) {
			stmt.setString(1, estado);
			stmt.setInt(2, id);
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
