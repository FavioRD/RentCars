package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import clases.Auto;
import clases.ConexionBD;
import interfaces.AutoDao;

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
		try (Connection conn = ConexionBD.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
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
		try (Connection conn = ConexionBD.getConnection();
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

}
