package modelo.clases;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConexionBD {
	private final static String url = "jdbc:mysql://localhost:3306/rentcar";
	private final static String user = "root";
	private final static String password = "0800jeremias";

	public static Connection getConexion() {
		System.out.println("User: " + user);
		Connection conexion = null;
		try {
			// Cargar el driver JDBC
			Class.forName("com.mysql.cj.jdbc.Driver");

			// Establecer la conexión
			conexion = DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException e) {
			System.out.println("Error: No se encontró el driver JDBC.");
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("Error al conectar con la base de datos.");
			e.printStackTrace();
		}
		return conexion;
	}
}
