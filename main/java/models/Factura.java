package models;

import java.util.ArrayList;
import java.util.List;

public class Factura {
    private int numeroFactura;
    private int idCliente;
    private String fecha;
    private List<Articulo> articulos;

    public Factura( int numeroFactura, int idCliente, String fecha) {
        this.numeroFactura = numeroFactura;
        this.idCliente = idCliente;
        this.fecha = fecha;
        this.articulos = new ArrayList<Articulo>();
    }

	public void agregarArticulo(Articulo articulo) {
        articulos.add(articulo);
    }

    public int getNumeroFactura() {
        return numeroFactura;
    }

    public String getFecha() {
        return fecha;
    }

    public List<Articulo> getArticulos() {
        return articulos;
    }

    public int getIdCliente() {
		return idCliente;
	}

	public void setIdCliente(int idCliente) {
		this.idCliente = idCliente;
	}

	public double getTotalFactura() {
        double total = 0;
        for (Articulo articulo : articulos) {
            total += articulo.getTotal();
        }
        return total;
    }
}
