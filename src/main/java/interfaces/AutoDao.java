package interfaces;

import java.util.ArrayList;

import modelo.clases.Auto;

public interface AutoDao {
	public void registrarAuto(Auto auto);

	public void modificarAuto(int id, Auto auto);

	public void eliminarAuto(int id);

	public ArrayList<Auto> listarAutos();
	
	public Auto alquilarAuto(int id);
	
	public ArrayList<Auto> obtenerAuto(int id);
}
