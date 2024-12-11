package modelo.clases;

public class Cliente {
	private int id;
	private String Nombre;
	private String Documento;
	private String  Direccion;
	private int Telefono;
	private String Correo;
	
	public Cliente(int id, String nombre, String documento, String direccion, int telefono, String correo) {
		super();
		this.id = id;
		Nombre = nombre;
		Documento = documento;
		Direccion = direccion;
		Telefono = telefono;
		Correo = correo;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNombre() {
		return Nombre;
	}

	public void setNombre(String nombre) {
		Nombre = nombre;
	}

	public String getDocumento() {
		return Documento;
	}

	public void setDocumento(String documento) {
		Documento = documento;
	}

	public String getDireccion() {
		return Direccion;
	}

	public void setDireccion(String direccion) {
		Direccion = direccion;
	}

	public int getTelefono() {
		return Telefono;
	}

	public void setTelefono(int telefono) {
		Telefono = telefono;
	}

	public String getCorreo() {
		return Correo;
	}

	public void setCorreo(String correo) {
		Correo = correo;
	}
	

}
