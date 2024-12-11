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

	}

	@Override
	public void modificarAuto(int id, Auto auto) {
		// TODO Auto-generated method stub

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

				Auto auto = new Auto(id, marca, modelo, anio, color, matricula, precioDia, estado, img);
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

				auto = new Auto(id_auto, marca, modelo, anio, color, matricula, precioDia, estado, img);
				
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
