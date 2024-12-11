package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import interfaces.IUsuario;
import modelo.clases.ConexionBD;
import modelo.clases.Usuario;

public class UsuarioDao implements IUsuario {

	@Override
	public ArrayList<Usuario> listarUsuarios() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Usuario> obtenerUsuario(String usuario) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void modificarUsuario(Usuario usuario) {
		// TODO Auto-generated method stub

	}

	@Override
	public void eliminarUsuario(int id) {
		// TODO Auto-generated method stub

	}

	@Override
	public Usuario iniciarSesion(String usuario, String contrasena) {
		// TODO Auto-generated method stub
		try {

			Connection conn = ConexionBD.getConnection();
			String sql = "SELECT * FROM usuarios WHERE usuario = ? AND contrasena = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, usuario);
			ps.setString(2, contrasena);
			ResultSet rs = ps.executeQuery();

			Usuario usuarioLogueado = null;
			if (rs.next()) {
				String usuarioBD = rs.getString("usuario");
				String contrasenaBD = rs.getString("contrasena");
				String nombre = rs.getString("nombre");
				String apellido = rs.getString("apellido");
				String email = rs.getString("email");
				String telefono = rs.getString("telefono");
				String direccion = rs.getString("direccion");
				String rol = rs.getString("rol");
				String dni = rs.getString("dni");
				Date fechaNacimiento = rs.getDate("fechaNacimiento");
				
				usuarioLogueado = new Usuario(usuarioBD, contrasenaBD, nombre, apellido, email, telefono, direccion, rol, dni, fechaNacimiento);
			}

			conn.close();
			return usuarioLogueado;

		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("Error al iniciar sesion: " + e.getMessage());
			return null;
		}

	}

}
