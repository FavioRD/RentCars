package modelo.clases;

public class Auto {
	private int id;
	private String marca;
	private String modelo;
	private String anio;
	private String color;
	private String matricula;
	private double precio_dia;
	private String estado;
	private String img;
	public Auto(int id, String marca, String modelo, String anio, String color, String matricula, double precio_dia,
			String estado , String img) {
		super();
		this.id = id;
		this.marca = marca;
		this.modelo = modelo;
		this.anio = anio;
		this.color = color;
		this.matricula = matricula;
		this.precio_dia = precio_dia;
		this.estado = estado;
		this.img = img;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getMarca() {
		return marca;
	}
	public void setMarca(String marca) {
		this.marca = marca;
	}
	public String getModelo() {
		return modelo;
	}
	public void setModelo(String modelo) {
		this.modelo = modelo;
	}
	public String getAnio() {
		return anio;
	}
	public void setAnio(String anio) {
		this.anio = anio;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String getMatricula() {
		return matricula;
	}
	public void setMatricula(String matricula) {
		this.matricula = matricula;
	}
	public double getPrecio_dia() {
		return precio_dia;
	}
	public void setPrecio_dia(double precio_dia) {
		this.precio_dia = precio_dia;
	}
	public String getEstado() {
		return estado;
	}
	public void setEstado(String estado) {
		this.estado = estado;
	}
	
	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}
	
	public String toString() {
        return "Auto{" +
               "id=" + id +
               ", marca='" + marca + '\'' +
               ", modelo='" + modelo + '\'' +
               ", anio=" + anio +
               ", matricula='" + matricula + '\'' +
               ", color='" + color + '\'' +
               ", estado='" + estado + '\'' +
               ", precioPorDia=" + precio_dia +
               '}';
    }
	
}
