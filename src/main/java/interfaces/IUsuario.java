package interfaces;

import java.util.ArrayList;

import modelo.clases.Usuario;

public interface IUsuario {
	public ArrayList<Usuario> listarUsuarios(); 
	public ArrayList<Usuario> obtenerUsuario(String usuario);
	public void modificarUsuario(Usuario usuario);
	public void eliminarUsuario(int id);
	public Usuario iniciarSesion(String usuario, String contrasena);
}
