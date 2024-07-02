package models;

public class ventas {
    private int id;
    private String cliente;
    private String articulo;
    private int cantidad;
    private double precioTotal;

    public ventas(int id, String cliente, String articulo, int cantidad, double precioTotal) {
        this.id = id;
        this.cliente = cliente;
        this.articulo = articulo;
        this.cantidad = cantidad;
        this.precioTotal = precioTotal;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCliente() {
        return cliente;
    }

    public String getArticulo() {
        return articulo;
    }

    public int getCantidad() {
        return cantidad;
    }

    public double getPrecioTotal() {
        return precioTotal;
    }

    @Override
    public String toString() {
        return "Venta [ID=" + id + ", Cliente=" + cliente + ", Articulo=" + articulo + ", Cantidad=" + cantidad + ", Precio Total=" + precioTotal + "]";
    }
}
