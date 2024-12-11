package modelo.clases;

import java.sql.Date;

public class Alquiler {

    // Atributos
    private int idAlquiler;
    private int idAuto;
    private int idCliente;
    private Date fechaInicio;
    private Date fechaFin;
    private double precioTotal;
    private String estadoAlquiler;

    // Constructor vacío
    public Alquiler() {
    }

    // Constructor con todos los atributos
    public Alquiler(int idAlquiler, int idAuto, int idCliente, Date fechaInicio, Date fechaFin, double precioTotal, String estadoAlquiler) {
        this.idAlquiler = idAlquiler;
        this.idAuto = idAuto;
        this.idCliente = idCliente;
        this.fechaInicio = fechaInicio;
        this.fechaFin = fechaFin;
        this.precioTotal = precioTotal;
        this.estadoAlquiler = estadoAlquiler;
    }

    // Constructor sin el idAlquiler (para cuando no está disponible aún)
    public Alquiler(int idAuto, int idCliente, Date fechaInicio, Date fechaFin, double precioTotal, String estadoAlquiler) {
        this.idAuto = idAuto;
        this.idCliente = idCliente;
        this.fechaInicio = fechaInicio;
        this.fechaFin = fechaFin;
        this.precioTotal = precioTotal;
        this.estadoAlquiler = estadoAlquiler;
    }

    // Getters y setters

    public int getIdAlquiler() {
        return idAlquiler;
    }

    public void setIdAlquiler(int idAlquiler) {
        this.idAlquiler = idAlquiler;
    }

    public int getIdAuto() {
        return idAuto;
    }

    public void setIdAuto(int idAuto) {
        this.idAuto = idAuto;
    }

    public int getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(int idCliente) {
        this.idCliente = idCliente;
    }

    public Date getFechaInicio() {
        return fechaInicio;
    }

    public void setFechaInicio(Date fechaInicio) {
        this.fechaInicio = fechaInicio;
    }

    public Date getFechaFin() {
        return fechaFin;
    }

    public void setFechaFin(Date fechaFin) {
        this.fechaFin = fechaFin;
    }

    public double getPrecioTotal() {
        return precioTotal;
    }

    public void setPrecioTotal(double precioTotal) {
        this.precioTotal = precioTotal;
    }

    public String getEstadoAlquiler() {
        return estadoAlquiler;
    }

    public void setEstadoAlquiler(String estadoAlquiler) {
        this.estadoAlquiler = estadoAlquiler;
    }

    @Override
    public String toString() {
        return "Alquiler{" +
                "idAlquiler=" + idAlquiler +
                ", idAuto=" + idAuto +
                ", idCliente=" + idCliente +
                ", fechaInicio=" + fechaInicio +
                ", fechaFin=" + fechaFin +
                ", precioTotal=" + precioTotal +
                ", estadoAlquiler='" + estadoAlquiler + '\'' +
                '}';
    }
}
