package interfaces;

import modelo.clases.Alquiler;


public interface IAlquilarAuto {
	public void alquilarAuto(Alquiler alquiler);
	
	public void finalizarAlquiler(int idAlquiler, double kmRecorridos);
	
	public Alquiler obtenerAlquiler(int idAlquiler);
}
