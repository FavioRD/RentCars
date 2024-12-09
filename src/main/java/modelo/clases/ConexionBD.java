package modelo.clases;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConexionBD {
	private final static String url = "jdbc:mysql://localhost:3306/rentcar";
	private final static String user = "root";
	private final static String password = "0800jeremias";

	public static Connection getConnection() throws SQLException {
        try {
            // Cargamos el driver de MySQL (esto puede ser innecesario si usas JDBC 4.0+)
            Class.forName("com.mysql.cj.jdbc.Driver");
            return DriverManager.getConnection(url, user, password);
        } catch (ClassNotFoundException e) {
            throw new SQLException("Driver no encontrado", e);
        }
    }
	
}
